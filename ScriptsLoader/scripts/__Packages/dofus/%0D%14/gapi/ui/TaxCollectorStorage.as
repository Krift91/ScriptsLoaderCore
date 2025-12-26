class dofus.§\r\x14§.gapi.ui.TaxCollectorStorage extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _livInventory;
   var _livInventory2;
   var _itvItemViewer;
   var _btnGetItem;
   var _btnClose;
   var _winInventory;
   var _winInventory2;
   var _ldrArtwork;
   var _sGetItemText;
   var _oSelectedItem;
   var _mcBuyArrow;
   var _winItemViewer;
   static var CLASS_NAME = "TaxCollectorStorage";
   function TaxCollectorStorage()
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
      super.init(false,dofus["\r\x14"].gapi.ui.TaxCollectorStorage.CLASS_NAME);
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
      this.setGetItemMode(false);
   }
   function addListeners()
   {
      this._livInventory.addEventListener("selectedItem",this);
      this._livInventory2.addEventListener("selectedItem",this);
      this._livInventory2.addEventListener("rollOverItem",this);
      this._livInventory2.addEventListener("rollOutItem",this);
      this._livInventory2.lstInventory.multipleSelection = true;
      this._btnGetItem.addEventListener("click",this);
      this._btnClose.addEventListener("click",this);
      if(this._oData != undefined)
      {
         this._oData.addEventListener("modelChanged",this);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[TaxCollectorShop] il n\'y a pas de data");
      }
   }
   function initTexts()
   {
      this.refreshGetItemButton();
      this._winInventory.title = this.api.datacenter.Player.data.name;
      this._winInventory2.title = this._oData.name;
   }
   function initData()
   {
      this._livInventory.dataProvider = this.api.datacenter.Player.Inventory;
      this._ldrArtwork.contentPath = dofus.Constants.ARTWORKS_BIG_PATH + this._oData.gfx + ".swf";
      this.modelChanged();
   }
   function refreshGetItemButton(§\x1e\x1c\n§)
   {
      var _loc3_ = this.api.datacenter.Player.guildInfos.playerRights;
      var _loc4_ = _loc3_.canCollect;
      if(!_loc4_)
      {
         this._btnGetItem._visible = false;
         return undefined;
      }
      if(_loc2_ == undefined)
      {
         _loc2_ = this._livInventory2.lstInventory.getSelectedItems().length;
      }
      if(this._sGetItemText == undefined)
      {
         this._sGetItemText = this.api.lang.getText("GET_ITEM");
      }
      this._btnGetItem.enabled = _loc2_ != undefined && (_loc2_ <= 1 && (this._oSelectedItem != undefined && this._mcBuyArrow._visible) || _loc2_ > 1);
      if(_loc2_ == undefined || _loc2_ <= 1)
      {
         this._btnGetItem.label = this._sGetItemText;
      }
      else
      {
         this._btnGetItem.label = this._sGetItemText + " (" + _loc2_ + ")";
      }
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
   function setGetItemMode(§\x1c\x19§)
   {
      this._mcBuyArrow._visible = _loc2_;
   }
   function askQuantity(§\x01\x01§, §\x1e\x18\x0b§)
   {
      var _loc4_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:_loc2_,max:_loc2_,params:_loc3_});
      _loc4_.addEventListener("validate",this);
   }
   function validateGetItems(§\x1d\x0e§)
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
      this.hideItemViewer(true);
      this.setGetItemMode(false);
   }
   function validateGetItem(§\x01\x01§)
   {
      if(_loc2_ <= 0)
      {
         return undefined;
      }
      _loc2_ = Math.min(this._oSelectedItem.Quantity,_loc2_);
      this.api.network.Exchange.movementItem(false,this._oSelectedItem,_loc2_);
      this.hideItemViewer(true);
      this.setGetItemMode(false);
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      this._livInventory2.dataProvider = this._oData.inventory;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnGetItem":
            var _loc3_ = this._livInventory2.lstInventory.getSelectedItems();
            if(_loc3_.length > 1)
            {
               this.validateGetItems(_loc3_);
               break;
            }
            if(this._oSelectedItem == undefined)
            {
               break;
            }
            if(this._oSelectedItem.Quantity > 1)
            {
               this.askQuantity(this._oSelectedItem.Quantity);
            }
            else
            {
               this.validateGetItem(1);
            }
            break;
         case "_btnClose":
            this.callClose();
      }
   }
   function rollOverItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.targets.length;
      this.refreshGetItemButton(_loc3_);
   }
   function rollOutItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.targets.length;
      this.refreshGetItemButton(_loc3_);
   }
   function selectedItem(§\x1e\x19\x0e§)
   {
      if(_loc2_.item == undefined)
      {
         this.hideItemViewer(true);
         this.setGetItemMode(false);
      }
      else
      {
         this._oSelectedItem = _loc2_.item;
         this.hideItemViewer(false);
         this._itvItemViewer.itemData = _loc2_.item;
         switch(_loc2_.target._name)
         {
            case "_livInventory":
               this.setGetItemMode(false);
               this._livInventory2.setFilter(this._livInventory.currentFilterID);
               this.refreshGetItemButton();
               break;
            case "_livInventory2":
               this.setGetItemMode(true);
               this._livInventory.setFilter(this._livInventory2.currentFilterID);
               var _loc3_ = _loc2_.targets.length;
               this.refreshGetItemButton(_loc3_);
         }
      }
   }
   function validate(§\x1e\x19\x0e§)
   {
      this.validateGetItem(_loc2_.value);
   }
}
