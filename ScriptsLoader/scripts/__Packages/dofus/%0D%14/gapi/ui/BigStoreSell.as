class dofus.§\r\x14§.gapi.ui.BigStoreSell extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _livInventory;
   var _livInventory2;
   var _itvItemViewer;
   var _lblMiddlePrice;
   var _btnAdd;
   var _btnRemove;
   var _btnClose;
   var _btnSwitchToBuy;
   var _btnTypes;
   var _btnFilterSell;
   var _tiPrice;
   var _lblQuantity;
   var _lblPrice;
   var _lblFilterSell;
   var _winInventory;
   var _winInventory2;
   var _cbQuantity;
   var _winItemViewer;
   var _mcItemViewerDescriptionBack;
   var _srBottom;
   var _mcPrice;
   var _mcKamaSymbol;
   var _lblQuantityValue;
   var _lblTaxTime;
   var _lblTaxTimeValue;
   var _mcMiddlePrice;
   var _oSelectedItem;
   var _mcSellArrow;
   var _oDefaultButton;
   var _txtBadType;
   var _mcBuyArrow;
   var _sRemoveText;
   var _nQuantityIndex;
   var _nLastPrice;
   static var CLASS_NAME = "BigStoreSell";
   function BigStoreSell()
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
   function setMiddlePrice(§\x1e\x1b\x10§, §\x01\x07§)
   {
      if(this._itvItemViewer.itemData.unicID == _loc2_ && this._itvItemViewer.itemData != undefined)
      {
         this._lblMiddlePrice.text = this.api.lang.getText("BIGSTORE_MIDDLEPRICE",[_loc3_]);
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.BigStoreSell.CLASS_NAME);
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
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.populateComboBox});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.setAddMode,params:[false]});
      this.addToQueue({object:this,method:this.setRemoveMode,params:[false]});
      this.hideItemViewer(true);
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
      this._btnClose.addEventListener("click",this);
      this._btnSwitchToBuy.addEventListener("click",this);
      this._btnTypes.addEventListener("over",this);
      this._btnTypes.addEventListener("out",this);
      this._btnFilterSell.addEventListener("click",this);
      this._btnFilterSell.addEventListener("over",this);
      this._btnFilterSell.addEventListener("out",this);
      this._tiPrice.addEventListener("change",this);
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
      this._btnSwitchToBuy.label = this.api.lang.getText("BIGSTORE_MODE_BUY");
      this._lblQuantity.text = this.api.lang.getText("SET_QUANTITY") + " :";
      this._lblPrice.text = this.api.lang.getText("SET_PRICE") + " :";
      this._lblFilterSell.text = this.api.lang.getText("BIGSTORE_FILTER");
      this._winInventory.title = this.api.datacenter.Player.data.name;
      this._winInventory2.title = this.api.lang.getText("SHOP_STOCK");
   }
   function populateComboBox(§\x01\x01§)
   {
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      if(_loc2_ >= this._oData.quantity1)
      {
         _loc3_.push({label:"x" + this._oData.quantity1,index:1});
      }
      if(_loc2_ >= this._oData.quantity2)
      {
         _loc3_.push({label:"x" + this._oData.quantity2,index:2});
      }
      if(_loc2_ >= this._oData.quantity3)
      {
         _loc3_.push({label:"x" + this._oData.quantity3,index:3});
      }
      this._cbQuantity.dataProvider = _loc3_;
   }
   function initData()
   {
      this.enableFilter(this.api.kernel.OptionsManager.getOption("BigStoreSellFilter"));
      this._livInventory.dataProvider = this.api.datacenter.Player.Inventory;
      this._livInventory.kamasProvider = this.api.datacenter.Player;
      this.modelChanged();
   }
   function enableFilter(§\x1a\x0e§)
   {
      if(_loc2_)
      {
         var _loc3_ = new Array();
         for(var i in this._oData.typesObj)
         {
            _loc3_.push(i);
         }
         this._livInventory.customInventoryFilter = new dofus["\r\x14"].gapi.ui.bigstore.BigStoreSellFilter(Number(this._oData.maxLevel),_loc3_);
      }
      else
      {
         this._livInventory.customInventoryFilter = null;
      }
      this._btnFilterSell.selected = _loc2_;
      this.api.kernel.OptionsManager.setOption("BigStoreSellFilter",_loc2_);
   }
   function hideItemViewer(§\x19\t§)
   {
      this._itvItemViewer._visible = !_loc2_;
      this._winItemViewer._visible = !_loc2_;
      this._mcItemViewerDescriptionBack._visible = !_loc2_;
      this._srBottom._visible = !_loc2_;
      this._mcPrice._visible = !_loc2_;
      this._mcKamaSymbol._visible = !_loc2_;
      this._lblQuantity._visible = !_loc2_;
      this._lblQuantityValue._visible = !_loc2_;
      this._lblPrice._visible = !_loc2_;
      this._lblTaxTime._visible = !_loc2_;
      this._lblTaxTimeValue._visible = !_loc2_;
      this._cbQuantity._visible = !_loc2_;
      this._tiPrice._visible = !_loc2_;
      this._mcMiddlePrice._visible = !_loc2_;
      this._lblMiddlePrice._visible = !_loc2_;
      if(_loc2_)
      {
         this._oSelectedItem = undefined;
      }
   }
   function setAddMode(§\x1c\x19§)
   {
      this._btnAdd._visible = _loc2_;
      this._mcSellArrow._visible = _loc2_;
      this._mcPrice._visible = _loc2_;
      this._cbQuantity._visible = _loc2_;
      this._lblQuantityValue._visible = false;
      this._tiPrice.tabIndex = 0;
      this._tiPrice.enabled = _loc2_;
      this._oDefaultButton = this._btnAdd;
      this._mcKamaSymbol._visible = _loc2_;
      this._lblTaxTime.text = this.api.lang.getText("BIGSTORE_TAX") + " :";
      if(this._lblTaxTimeValue.text != undefined)
      {
         this._lblTaxTimeValue.text = "";
      }
      if(this._txtBadType.text != undefined)
      {
         this._txtBadType.text = "";
      }
      this._lblTaxTime._visible = _loc2_;
      this._lblQuantity._visible = _loc2_;
      this._lblPrice._visible = _loc2_;
      this._srBottom._visible = _loc2_;
      this._lblTaxTimeValue._visible = _loc2_;
      this._tiPrice._visible = _loc2_;
   }
   function setRemoveMode(§\x1c\x19§)
   {
      this._mcBuyArrow._visible = _loc2_;
      this._mcPrice._visible = false;
      this._cbQuantity._visible = false;
      this._lblQuantityValue._visible = _loc2_;
      this._tiPrice.tabIndex = 0;
      this._tiPrice.enabled = !_loc2_;
      this._oDefaultButton = this._btnRemove;
      this._mcKamaSymbol._visible = false;
      this._lblTaxTime.text = this.api.lang.getText("BIGSTORE_TIME") + " :";
      if(this._lblTaxTimeValue.text != undefined)
      {
         this._lblTaxTimeValue.text = "";
      }
      if(this._txtBadType.text != undefined)
      {
         this._txtBadType.text = "";
      }
      this._lblTaxTime._visible = _loc2_;
      this._lblQuantity._visible = _loc2_;
      this._lblPrice._visible = _loc2_;
      this._srBottom._visible = _loc2_;
      this._lblTaxTimeValue._visible = _loc2_;
      this._tiPrice._visible = _loc2_;
   }
   function setBadItemMode(§\x1e\x10\x02§)
   {
      this._mcBuyArrow._visible = false;
      this._mcPrice._visible = false;
      this._cbQuantity._visible = false;
      this._lblQuantityValue._visible = false;
      this._tiPrice.tabIndex = 0;
      this._tiPrice.enabled = false;
      this._oDefaultButton = undefined;
      this._mcKamaSymbol._visible = false;
      this._txtBadType.text = _loc2_;
      this._lblTaxTime._visible = false;
      this._lblQuantity._visible = false;
      this._lblPrice._visible = false;
      this._srBottom._visible = false;
      this._lblTaxTimeValue._visible = false;
      this._tiPrice._visible = false;
      this.refreshRemoveButton();
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
   function calculateTax()
   {
      if(this._oData.tax == 0)
      {
         this._lblTaxTimeValue.text = "0";
         return undefined;
      }
      var _loc2_ = Number(this._tiPrice.text);
      var _loc3_ = Math.max(1,Math.round(_loc2_ * this._oData.tax / 100));
      this._lblTaxTimeValue.text = String(!_global.isNaN(_loc3_) ? _loc3_ : 0);
   }
   function updateItemCount()
   {
      this._winInventory2.title = this.api.lang.getText("SHOP_STOCK") + " (" + this._oData.inventory.length + "/" + this._oData.maxItemCount + ")";
   }
   function askSell(§\x1e\x19\x03§, §\x1e\x1e\x1a§, §\x01\x07§)
   {
      var _loc5_ = this._oData["quantity" + _loc3_];
      var _loc6_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoSell",{title:this.api.lang.getText("BIGSTORE"),text:this.api.lang.getText("DO_U_SELL_ITEM_BIGSTORE",["x" + _loc5_ + " " + _loc2_.name,_loc4_]),params:{item:_loc2_,itemQuantity:_loc2_.Quantity,quantity:_loc5_,quantityIndex:_loc3_,price:_loc4_}});
      _loc6_.addEventListener("yes",this);
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
            this.setRemoveMode(false);
            this._btnAdd._visible = false;
            break;
         case "_btnAdd":
            var _loc4_ = Number(this._tiPrice.text);
            var _loc5_ = Number(this._cbQuantity.selectedItem.index);
            if(_global.isNaN(_loc4_) || _loc4_ == 0)
            {
               this.gapi.loadUIComponent("AskOk","AksOkBadPrice",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("ERROR_INVALID_PRICE")});
            }
            else if(_global.isNaN(_loc5_) || _loc5_ == 0)
            {
               this.gapi.loadUIComponent("AskOk","AksOkBadQuantity",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("ERROR_INVALID_QUANTITY")});
            }
            else
            {
               this.askSell(this._oSelectedItem,_loc5_,_loc4_);
            }
            break;
         case "_btnClose":
            this.callClose();
            break;
         case "_btnSwitchToBuy":
            this.api.network.Exchange.request(11,this._oData.npcID);
            break;
         case "_btnFilterSell":
            this.enableFilter(this._btnFilterSell.selected);
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnTypes:
            var _loc3_ = this.api.lang.getText("BIGSTORE_MAX_LEVEL") + " : " + this._oData.maxLevel;
            _loc3_ += "\n" + this.api.lang.getText("BIGSTORE_TAX") + " : " + this._oData.tax + "%";
            _loc3_ += "\n" + this.api.lang.getText("BIGSTORE_MAX_ITEM_PER_ACCOUNT") + " : " + this._oData.maxItemCount;
            _loc3_ += "\n" + this.api.lang.getText("BIGSTORE_MAX_SELL_TIME") + " : " + this._oData.maxSellTime + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("HOURS"),"m",this._oData.maxSellTime < 2);
            _loc3_ += "\n\n" + this.api.lang.getText("BIGSTORE_TYPES") + " :";
            var _loc4_ = this._oData.types;
            for(var k in _loc4_)
            {
               _loc3_ += "\n - " + this.api.lang.getItemTypeText(_loc4_[k]).n;
            }
            this.gapi.showTooltip(_loc3_,_loc2_.target,20);
            break;
         case this._btnFilterSell:
            this.gapi.showTooltip(this.api.lang.getText("BIGSTORE_SELL_FILTER_OVER"),_loc2_.target,20);
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
         this.setRemoveMode(false);
      }
      else
      {
         this._oSelectedItem = _loc2_.item;
         this.hideItemViewer(false);
         this._itvItemViewer.itemData = _loc2_.item;
         this.populateComboBox(_loc2_.item.Quantity);
         var _loc3_ = _loc2_.item.type;
         if(this._lblMiddlePrice.text != undefined)
         {
            this._lblMiddlePrice.text = "";
         }
         if(!this._oData.typesObj[_loc3_])
         {
            this.setAddMode(false);
            this.setRemoveMode(false);
            this.setBadItemMode(this.api.lang.getText("BIGSTORE_BAD_TYPE"));
         }
         else if(_loc2_.item.level > this._oData.maxLevel)
         {
            this.setAddMode(false);
            this.setRemoveMode(false);
            this.setBadItemMode(this.api.lang.getText("BIGSTORE_BAD_LEVEL"));
         }
         else
         {
            switch(_loc2_.target._name)
            {
               case "_livInventory":
                  if(this._nQuantityIndex != undefined && this._cbQuantity.dataProvider.length >= this._nQuantityIndex)
                  {
                     this._cbQuantity.selectedIndex = this._nQuantityIndex - 1;
                  }
                  else
                  {
                     this._nQuantityIndex = undefined;
                     this._cbQuantity.selectedIndex = 0;
                  }
                  this.setRemoveMode(false);
                  this.setAddMode(true);
                  if(this._tiPrice.text != undefined)
                  {
                     if(!_global.isNaN(this._nLastPrice))
                     {
                        this._tiPrice.text = String(this._nLastPrice);
                     }
                     else
                     {
                        this._tiPrice.text = "";
                     }
                  }
                  this._livInventory2.setFilter(this._livInventory.currentFilterID);
                  this._tiPrice.setFocus();
                  this.refreshRemoveButton();
                  break;
               case "_livInventory2":
                  this._lblQuantityValue.text = "x" + String(_loc2_.item.Quantity);
                  this.setAddMode(false);
                  this.setRemoveMode(true);
                  this._tiPrice.text = _loc2_.item.price;
                  this._livInventory.setFilter(this._livInventory2.currentFilterID);
                  this._lblTaxTimeValue.text = _loc2_.item.remainingHours + "h";
                  var _loc4_ = _loc2_.targets.length;
                  this.refreshRemoveButton(_loc4_);
            }
            this.api.network.Exchange.getItemMiddlePriceInBigStore(_loc2_.item.unicID);
         }
      }
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      this._livInventory2.dataProvider = this._oData.inventory;
      this.updateItemCount();
   }
   function change(§\x1e\x19\x0e§)
   {
      if(this._btnAdd._visible)
      {
         this._nLastPrice = Number(this._tiPrice.text);
         this.calculateTax();
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      this._nQuantityIndex = _loc2_.target.params.quantityIndex;
      this.api.network.Exchange.movementItem(true,_loc2_.target.params.item,_loc2_.target.params.quantityIndex,_loc2_.target.params.price);
      if(_loc2_.target.params.itemQuantity - _loc2_.target.params.quantity < _loc2_.target.params.quantity)
      {
         this.setAddMode(false);
         this.hideItemViewer(true);
      }
      else
      {
         this.populateComboBox(_loc2_.target.params.itemQuantity - _loc2_.target.params.quantity);
      }
   }
}
