class dofus.§\r\x14§.gapi.ui.PlayerShop extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _colors;
   var _livInventory;
   var _livInventory2;
   var _itvItemViewer;
   var _timerSwitchMerchant;
   var _btnViewNextMerchant;
   var _btnViewPreviousMerchant;
   var _btnBuy;
   var _btnClose;
   var _ldrArtwork;
   var _winInventory;
   var _winInventory2;
   var _winItemViewer;
   var _oSelectedItem;
   var _mcBuyArrow;
   static var CLASS_NAME = "PlayerShop";
   static var DELAY_BEFORE_CAN_SWITCH_MERCHANT = 500;
   function PlayerShop()
   {
      super();
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oData = _loc2_;
   }
   function set colors(§\f§)
   {
      this._colors = _loc2_;
   }
   function get currentOverItem()
   {
      if(this._livInventory != undefined && this._livInventory.currentOverItem != undefined)
      {
         return this._livInventory.currentOverItem;
      }
      if(this._livInventory2 != undefined && this._livInventory2.currentOverItem != undefined)
      {
         return this._livInventory2.currentOverItem;
      }
      return undefined;
   }
   function get itemViewer()
   {
      return this._itvItemViewer;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.PlayerShop.CLASS_NAME);
   }
   function callClose()
   {
      this.api.network.Exchange.leave();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTexts});
      this.hideItemViewer(true);
      this.setBuyMode(false);
   }
   function destroy()
   {
      if(this._timerSwitchMerchant == undefined)
      {
         return undefined;
      }
      _global.clearTimeout(this._timerSwitchMerchant);
   }
   function activateSwitchMerchantButtons()
   {
      this._btnViewNextMerchant.enabled = true;
      this._btnViewPreviousMerchant.enabled = true;
   }
   function addListeners()
   {
      this._livInventory.addEventListener("selectedItem",this);
      this._livInventory2.addEventListener("selectedItem",this);
      this._btnBuy.addEventListener("click",this);
      this._btnViewNextMerchant.addEventListener("click",this);
      this._btnViewPreviousMerchant.addEventListener("click",this);
      this._btnClose.addEventListener("click",this);
      this._ldrArtwork.addEventListener("complete",this);
      this._ldrArtwork.addEventListener("click",this);
      if(this._oData != undefined)
      {
         this._oData.addEventListener("modelChanged",this);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[PlayerShop] il n\'y a pas de data");
      }
      this._timerSwitchMerchant = _global.setTimeout(this,"activateSwitchMerchantButtons",dofus["\r\x14"].gapi.ui.PlayerShop.DELAY_BEFORE_CAN_SWITCH_MERCHANT);
   }
   function initTexts()
   {
      this._btnBuy.label = this.api.lang.getText("BUY");
      this._btnViewNextMerchant.label = this.api.lang.getText("NEXT_WORD");
      this._btnViewPreviousMerchant.label = this.api.lang.getText("PREVIOUS_WORD");
      this._winInventory.title = this.api.datacenter.Player.data.name;
      this._winInventory2.title = this._oData.name;
   }
   function initData()
   {
      this._livInventory.dataProvider = this.api.datacenter.Player.Inventory;
      this._livInventory.kamasProvider = this.api.datacenter.Player;
      this._ldrArtwork.contentPath = dofus.Constants.ARTWORKS_BIG_PATH + this._oData.gfx + ".swf";
      this.modelChanged();
   }
   function hideItemViewer(§\x19\t§)
   {
      this._itvItemViewer._visible = !_loc2_;
      this._winItemViewer._visible = !_loc2_;
      if(_loc2_)
      {
         this._oSelectedItem = undefined;
      }
   }
   function setBuyMode(§\x1c\x19§)
   {
      this._btnBuy._visible = _loc2_;
      this._mcBuyArrow._visible = _loc2_;
   }
   function askQuantity(§\x01\x03§, §\x01\x07§)
   {
      var _loc4_ = Math.floor(this.api.datacenter.Player.Kama / _loc3_);
      if(_loc4_ > _loc2_)
      {
         _loc4_ = _loc2_;
      }
      var _loc5_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc4_,min:1});
      _loc5_.addEventListener("validate",this);
   }
   function validateBuy(§\x01\x01§)
   {
      if(_loc2_ <= 0)
      {
         return undefined;
      }
      _loc2_ = Math.min(this._oSelectedItem.Quantity,_loc2_);
      if(this.api.datacenter.Player.Kama < this._oSelectedItem.price * _loc2_)
      {
         this.gapi.loadUIComponent("AskOk","AskOkRich",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("NOT_ENOUGH_RICH")});
         return undefined;
      }
      this.api.network.Exchange.buy(this._oSelectedItem.ID,_loc2_);
      this.hideItemViewer(true);
      this.setBuyMode(false);
   }
   function applyColor(§\n\x1d§, §\x1e\t\x03§)
   {
      var _loc4_ = this._colors[_loc3_];
      if(_loc4_ == -1 || _loc4_ == undefined)
      {
         return undefined;
      }
      var _loc5_ = (_loc4_ & 0xFF0000) >> 16;
      var _loc6_ = (_loc4_ & 0xFF00) >> 8;
      var _loc7_ = _loc4_ & 0xFF;
      var _loc8_ = new Color(_loc2_);
      var _loc9_ = new Object();
      _loc9_ = {ra:0,ga:0,ba:0,rb:_loc5_,gb:_loc6_,bb:_loc7_};
      _loc8_.setTransform(_loc9_);
   }
   function switchMerchant(§\x16\x0e§)
   {
      var _loc3_ = this.api.datacenter.Temporary.Shop.id;
      var _loc4_ = new Array();
      var _loc5_ = this.api.gfx.spriteHandler.getSprites().getItems();
      for(var sID in _loc5_)
      {
         var _loc6_ = _loc5_[sID];
         if(_loc6_ instanceof dofus.datacenter["\x1e\x19\f"])
         {
            _loc4_.push({id:sID,cellNum:_loc6_.cellNum});
         }
      }
      var _loc7_ = undefined;
      if(_loc4_.length > 1)
      {
         _loc4_.sortOn(["id"],Array.NUMERIC);
         var _loc8_ = 0;
         while(_loc8_ < _loc4_.length)
         {
            var _loc9_ = _loc4_[_loc8_].id;
            if(_loc9_ == _loc3_)
            {
               if(_loc2_)
               {
                  if(_loc8_ - 1 >= 0)
                  {
                     _loc7_ = _loc4_[_loc8_ - 1];
                  }
                  else
                  {
                     _loc7_ = _loc4_[_loc4_.length - 1];
                  }
               }
               else if(_loc8_ + 1 < _loc4_.length)
               {
                  _loc7_ = _loc4_[_loc8_ + 1];
               }
               else
               {
                  _loc7_ = _loc4_[0];
               }
               break;
            }
            _loc8_ = _loc8_ + 1;
         }
      }
      if(_loc7_ == null)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("NO_OTHER_MERCHANT_ON_MAP"),"ERROR_CHAT");
         return undefined;
      }
      this._btnViewNextMerchant.enabled = false;
      this._btnViewPreviousMerchant.enabled = false;
      this.api.network.Exchange.leave();
      this.api.kernel.GameManager.startExchange(4,_loc7_.id,_loc7_.cellNum);
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      this._livInventory2.dataProvider = this._oData.inventory;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_ldrArtwork":
            this.api.kernel.GameManager.showPlayerPopupMenu(undefined,this._oData.name);
            break;
         case "_btnViewPreviousMerchant":
            this.switchMerchant(true);
            break;
         case "_btnViewNextMerchant":
            this.switchMerchant(false);
            break;
         case "_btnBuy":
            if(this._oSelectedItem.Quantity > 1)
            {
               this.askQuantity(this._oSelectedItem.Quantity,this._oSelectedItem.price);
            }
            else
            {
               this.validateBuy(1);
            }
            break;
         case "_btnClose":
            this.callClose();
      }
   }
   function selectedItem(§\x1e\x19\x0e§)
   {
      if(_loc2_.item == undefined)
      {
         this.hideItemViewer(true);
         this.setBuyMode(false);
      }
      else
      {
         this._oSelectedItem = _loc2_.item;
         this.hideItemViewer(false);
         this._itvItemViewer.itemData = _loc2_.item;
         switch(_loc2_.target._name)
         {
            case "_livInventory":
               this.setBuyMode(false);
               this._livInventory2.setFilter(this._livInventory.currentFilterID);
               break;
            case "_livInventory2":
               this.setBuyMode(true);
               this._livInventory.setFilter(this._livInventory2.currentFilterID);
         }
      }
   }
   function validate(§\x1e\x19\x0e§)
   {
      this.validateBuy(_loc2_.value);
   }
   function complete(§\x1e\x19\x0e§)
   {
      var ref = this;
      this._ldrArtwork.content.stringCourseColor = function(§\n\x1d§, §\x1e\t\x07§)
      {
         ref.applyColor(_loc2_,_loc3_);
      };
   }
}
