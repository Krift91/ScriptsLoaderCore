class dofus.§\r\x14§.gapi.ui.PlayerShopModifier extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _livInventory;
   var _livInventory2;
   var _itvItemViewer;
   var _txtQuantity;
   var _txtPrice;
   var _btnAdd;
   var _btnRemove;
   var _btnModify;
   var _btnClose;
   var _btnOffline;
   var _lblQuantity;
   var _lblPrice;
   var _winInventory;
   var _winInventory2;
   var _winItemViewer;
   var _mcQuantity;
   var _mcPrice;
   var _oSelectedItem;
   var _mcSellArrow;
   var _oDefaultButton;
   var _mcBuyArrow;
   var _sRemoveText;
   static var CLASS_NAME = "PlayerShopModifier";
   function PlayerShopModifier()
   {
      super();
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oData = _loc2_;
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
      super.init(false,dofus["\r\x14"].gapi.ui.PlayerShopModifier.CLASS_NAME);
   }
   function callClose()
   {
      this.gapi.hideTooltip();
      this.api.network.Exchange.leave();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTexts});
      this.hideItemViewer(true);
      this.setAddMode(false);
      this.setModifyMode(false);
      this._txtQuantity.restrict = "0-9";
      this._txtPrice.restrict = "0-9";
      this._txtQuantity.onSetFocus = function()
      {
         this._parent.onSetFocus();
      };
      this._txtQuantity.onKillFocus = function()
      {
         this._parent.onKillFocus();
      };
      this._txtPrice.onSetFocus = function()
      {
         this._parent.onSetFocus();
      };
      this._txtPrice.onKillFocus = function()
      {
         this._parent.onKillFocus();
      };
   }
   function addListeners()
   {
      this._livInventory.addEventListener("selectedItem",this);
      this._livInventory2.addEventListener("selectedItem",this);
      this._livInventory2.addEventListener("rollOverItem",this);
      this._livInventory2.addEventListener("rollOutItem",this);
      this._livInventory2.lstInventory.multipleSelection = true;
      this._btnAdd.addEventListener("click",this);
      this._btnRemove.addEventListener("click",this);
      this._btnModify.addEventListener("click",this);
      this._btnClose.addEventListener("click",this);
      this._btnOffline.addEventListener("click",this);
      this._btnOffline.addEventListener("over",this);
      this._btnOffline.addEventListener("out",this);
      if(this._oData != undefined)
      {
         this._oData.addEventListener("modelChanged",this);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[PlayerShop] il n\'y a pas de data");
      }
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   }
   function initTexts()
   {
      this._btnAdd.label = this.api.lang.getText("PUT_ON_SELL");
      this.refreshRemoveButton();
      this._btnModify.label = this.api.lang.getText("MODIFY");
      this._lblQuantity.text = this.api.lang.getText("QUANTITY") + " :";
      this._lblPrice.text = this.api.lang.getText("UNIT_PRICE") + " :";
      this._winInventory.title = this.api.datacenter.Player.data.name;
      this._winInventory2.title = this.api.lang.getText("SHOP_STOCK");
   }
   function initData()
   {
      this._livInventory.dataProvider = this.api.datacenter.Player.Inventory;
      this._livInventory.kamasProvider = this.api.datacenter.Player;
      this.modelChanged();
   }
   function hideItemViewer(§\x19\t§)
   {
      this._itvItemViewer._visible = !_loc2_;
      this._winItemViewer._visible = !_loc2_;
      this._mcQuantity._visible = !_loc2_;
      this._mcPrice._visible = !_loc2_;
      this._lblQuantity._visible = !_loc2_;
      this._lblPrice._visible = !_loc2_;
      this._txtQuantity._visible = !_loc2_;
      this._txtPrice._visible = !_loc2_;
      if(_loc2_)
      {
         this._oSelectedItem = undefined;
      }
   }
   function setAddMode(§\x1c\x19§)
   {
      this._btnAdd._visible = _loc2_;
      this._mcSellArrow._visible = _loc2_;
      this._mcQuantity._visible = _loc2_;
      this._txtQuantity.editable = true;
      this._txtQuantity.selectable = true;
      this._txtPrice.tabIndex = 0;
      this._txtQuantity.tabIndex = 1;
      this._oDefaultButton = this._btnAdd;
   }
   function setModifyMode(§\x1c\x19§)
   {
      this._btnModify._visible = _loc2_;
      this._mcBuyArrow._visible = _loc2_;
      this._mcQuantity._visible = false;
      this._txtQuantity.editable = false;
      this._txtQuantity.selectable = false;
      this._txtPrice.tabIndex = 0;
      this._txtQuantity.tabIndex = undefined;
      this._oDefaultButton = this._btnModify;
   }
   function addToShop(§\x1e\x19\x03§, §\x01\x01§, §\x01\x07§)
   {
      this.api.network.Exchange.movementItem(true,_loc2_,_loc3_,_loc4_);
   }
   function remove(§\x1d\x0e§)
   {
      var _loc3_ = new Array();
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.length)
      {
         var _loc5_ = _loc2_[_loc4_];
         _loc3_.push({Add:false,ID:_loc5_.ID,Quantity:_loc5_.Quantity});
         _loc4_ = _loc4_ + 1;
      }
      this.api.network.Exchange.movementItems(_loc3_);
   }
   function modify(§\x1e\x19\x03§, §\x01\x07§)
   {
      this.api.network.Exchange.movementItem(true,_loc2_,0,_loc3_);
   }
   function refreshRemoveButton(§\x1e\x1c\n§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = this._livInventory2.lstInventory.getSelectedItems().length;
      }
      if(this._sRemoveText == undefined)
      {
         this._sRemoveText = this.api.lang.getText("REMOVE");
      }
      this._btnRemove.enabled = _loc2_ != undefined && (_loc2_ == 0 && (this._oSelectedItem != undefined && this._mcBuyArrow._visible) || _loc2_ > 0);
      if(_loc2_ == undefined || _loc2_ <= 1)
      {
         this._btnRemove.label = this._sRemoveText;
      }
      else
      {
         this._btnRemove.label = this._sRemoveText + " (" + _loc2_ + ")";
      }
   }
   function onShortcut(§\x1e\r\x14§)
   {
      if(_loc2_ == "ACCEPT_CURRENT_DIALOG" && this._oSelectedItem != undefined)
      {
         this.click({target:this._oDefaultButton});
         return false;
      }
      return true;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnRemove":
            var _loc3_ = this._livInventory2.lstInventory.getSelectedItems();
            if(_loc3_.length == 0 && this._oSelectedItem == undefined)
            {
               break;
            }
            if(_loc3_.length == 0)
            {
               _loc3_.push(this._oSelectedItem);
            }
            this.remove(_loc3_);
            this.hideItemViewer(true);
            this.setModifyMode(false);
            break;
         case "_btnModify":
            var _loc4_ = Number(this._txtPrice.text);
            if(_global.isNaN(_loc4_))
            {
               this.gapi.loadUIComponent("AskOk","AksOkBadPrice",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("ERROR_INVALID_PRICE")});
            }
            else
            {
               this.modify(this._oSelectedItem,_loc4_);
               this.hideItemViewer(true);
               this.setModifyMode(false);
            }
            break;
         case "_btnAdd":
            var _loc5_ = Number(this._txtPrice.text);
            var _loc6_ = Number(this._txtQuantity.text);
            if(_global.isNaN(_loc5_))
            {
               this.gapi.loadUIComponent("AskOk","AksOkBadPrice",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("ERROR_INVALID_PRICE")});
            }
            else if(_global.isNaN(_loc6_) || _loc6_ == 0)
            {
               this.gapi.loadUIComponent("AskOk","AksOkBadQuantity",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("ERROR_INVALID_QUANTITY")});
            }
            else
            {
               _loc6_ = Math.min(this._oSelectedItem.Quantity,_loc6_);
               this.addToShop(this._oSelectedItem,_loc6_,_loc5_);
               this.hideItemViewer(true);
               this.setAddMode(false);
            }
            break;
         case "_btnClose":
            this.callClose();
            break;
         case "_btnOffline":
            this.callClose();
            this.api.kernel.GameManager.offlineExchange();
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "_btnOffline")
      {
         this.gapi.showTooltip(this.api.lang.getText("MERCHANT_MODE"),_loc2_.target,-20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function rollOverItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.targets.length;
      this.refreshRemoveButton(_loc3_);
   }
   function rollOutItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.targets.length;
      this.refreshRemoveButton(_loc3_);
   }
   function selectedItem(§\x1e\x19\x0e§)
   {
      if(_loc2_.item == undefined)
      {
         this.hideItemViewer(true);
         this.setAddMode(false);
         this.setModifyMode(false);
      }
      else
      {
         this._oSelectedItem = _loc2_.item;
         this.hideItemViewer(false);
         this._itvItemViewer.itemData = _loc2_.item;
         switch(_loc2_.target._name)
         {
            case "_livInventory":
               this._txtQuantity.text = _loc2_.item.Quantity;
               this._txtPrice.text = "";
               this.setModifyMode(false);
               this.setAddMode(true);
               this._livInventory2.setFilter(this._livInventory.currentFilterID);
               this.refreshRemoveButton();
               break;
            case "_livInventory2":
               var _loc3_ = _loc2_.targets.length;
               this._txtQuantity.text = _loc2_.item.Quantity;
               this._txtPrice.text = _loc2_.item.price;
               this.setAddMode(false);
               this.setModifyMode(true);
               this._livInventory.setFilter(this._livInventory2.currentFilterID);
               this.refreshRemoveButton(_loc3_);
         }
         Selection.setFocus(this._txtPrice);
      }
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      this._livInventory2.dataProvider = this._oData.inventory;
   }
   function onSetFocus()
   {
      fscommand("trapallkeys","false");
   }
   function onKillFocus()
   {
      fscommand("trapallkeys","true");
   }
}
