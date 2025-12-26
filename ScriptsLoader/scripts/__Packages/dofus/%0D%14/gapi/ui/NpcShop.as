class dofus.§\r\x14§.gapi.ui.NpcShop extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _colors;
   var _livInventory;
   var _livInventory2;
   var _itvItemViewer;
   var _btnSell;
   var _btnBuy;
   var _btnClose;
   var _ldrArtwork;
   var _winInventory;
   var _winInventory2;
   var _winItemViewer;
   var _oSelectedItem;
   var _mcSellArrow;
   var _mcBuyArrow;
   static var CLASS_NAME = "NpcShop";
   function NpcShop()
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
      super.init(false,dofus["\r\x14"].gapi.ui.NpcShop.CLASS_NAME);
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
      this.setSellMode(false);
      this.setBuyMode(false);
      this.gapi.unloadLastUIAutoHideComponent();
   }
   function addListeners()
   {
      this._livInventory.addEventListener("selectedItem",this);
      this._livInventory2.addEventListener("selectedItem",this);
      this._btnSell.addEventListener("click",this);
      this._btnBuy.addEventListener("click",this);
      this._btnClose.addEventListener("click",this);
      this._ldrArtwork.addEventListener("complete",this);
      if(this._oData != undefined)
      {
         this._oData.addEventListener("modelChanged",this);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[NpcShop] il n\'y a pas de data");
      }
   }
   function initTexts()
   {
      this._btnSell.label = this.api.lang.getText("SELL");
      this._btnBuy.label = this.api.lang.getText("BUY");
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
   function setSellMode(§\x1c\x19§)
   {
      this._btnSell._visible = _loc2_;
      this._mcSellArrow._visible = _loc2_;
   }
   function setBuyMode(§\x1c\x19§)
   {
      this._btnBuy._visible = _loc2_;
      this._mcBuyArrow._visible = _loc2_;
   }
   function askQuantity(§\x1e\f\x07§, §\x01\x02§, §\x01\x07§, §\x1e\x1b\x03§)
   {
      var _loc6_ = 0;
      if(_loc2_ == "buy")
      {
         _loc6_ = Math.floor(this.api.datacenter.Player.Kama / _loc4_);
         if(_loc5_ != undefined)
         {
            var _loc7_ = this.api.datacenter.Player.maxWeight - this.api.datacenter.Player.currentWeight;
            var _loc8_ = Math.floor(_loc7_ / _loc5_);
            if(_loc6_ > _loc8_)
            {
               _loc6_ = _loc8_;
            }
         }
      }
      else
      {
         _loc6_ = _loc3_;
      }
      var _loc9_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc6_,min:1,params:{type:_loc2_}});
      _loc9_.addEventListener("validate",this);
   }
   function validateBuy(§\x01\x01§)
   {
      if(_loc2_ <= 0)
      {
         return undefined;
      }
      if(this.api.datacenter.Player.Kama < this._oSelectedItem.price * _loc2_)
      {
         this.gapi.loadUIComponent("AskOk","AskOkRich",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("NOT_ENOUGH_RICH")});
         return undefined;
      }
      this.api.network.Exchange.buy(this._oSelectedItem.unicID,_loc2_);
   }
   function validateSell(§\x01\x01§)
   {
      if(_loc2_ <= 0)
      {
         return undefined;
      }
      if(_loc2_ > this._oSelectedItem.Quantity)
      {
         _loc2_ = this._oSelectedItem.Quantity;
      }
      this.api.network.Exchange.sell(this._oSelectedItem.ID,_loc2_);
      this.hideItemViewer(true);
      this.setSellMode(false);
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
   function modelChanged(§\x1e\x19\x0e§)
   {
      this._livInventory2.dataProvider = this._oData.inventory;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnBuy":
            this.askQuantity("buy",1,this._oSelectedItem.price,this._oSelectedItem.weight);
            break;
         case "_btnSell":
            if(this._oSelectedItem.Quantity > 1)
            {
               this.askQuantity("sell",this._oSelectedItem.Quantity);
            }
            else
            {
               this.validateSell(1);
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
         this.setSellMode(false);
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
               this.setSellMode(true);
               this.setBuyMode(false);
               this._livInventory2.setFilter(this._livInventory.currentFilterID);
               break;
            case "_livInventory2":
               this.setSellMode(false);
               this.setBuyMode(true);
               this._livInventory.setFilter(this._livInventory2.currentFilterID);
         }
      }
   }
   function validate(§\x1e\x19\x0e§)
   {
      switch(_loc2_.params.type)
      {
         case "sell":
            this.validateSell(_loc2_.value);
            break;
         case "buy":
            this.validateBuy(_loc2_.value);
      }
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
