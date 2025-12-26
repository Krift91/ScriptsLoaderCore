class dofus.§\r\x14§.gapi.ui.BigStoreBuy extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _sFullSoulMonster;
   var _dgPrices;
   var _btnSelectedPrice;
   var _btnSelectedBuy;
   var _nSelectedPriceItemID;
   var _nSelectedPriceIndex;
   var _cbTypes;
   var _lstItems;
   var _oCurrentItem;
   var _lblPrices;
   var _btnClose;
   var _btnClose2;
   var _btnSearch;
   var _btnTypes;
   var _btnSwitchToSell;
   var _winBackground;
   var _lblItems;
   var _lblTypes;
   var _lblKamas;
   var _itvItemViewer;
   var _mcItemViewerDescriptionBack;
   var _mcSpacer;
   var _bFullSoul;
   var _mcBottomArrow;
   var _mcLeftArrow;
   var _mcLeft2Arrow;
   var _lblNoItem;
   var _mcArrowAnim;
   var _lblItemsCount;
   var _lblKamasValue;
   static var CLASS_NAME = "BigStoreBuy";
   var _sDefaultSearch = "";
   function BigStoreBuy()
   {
      super();
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oData = _loc2_;
   }
   function set defaultSearch(§\x1e\f\x12§)
   {
      this._sDefaultSearch = _loc2_;
   }
   function applyFullSoulFilter(§\x0f\x19§)
   {
      if(this._sFullSoulMonster == "")
      {
         this._dgPrices.dataProvider = _loc2_;
         return undefined;
      }
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = this._sFullSoulMonster.toUpperCase();
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.length)
      {
         var _loc6_ = _loc2_[_loc5_];
         var _loc7_ = _loc6_.item;
         var _loc8_ = _loc7_.effects;
         var _loc9_ = 0;
         while(_loc9_ < _loc8_.length)
         {
            var _loc10_ = _loc8_[_loc9_];
            if(_loc10_.type == dofus.datacenter["\f\f"].OBJECT_ACTION_SUMMON)
            {
               var _loc11_ = _loc10_.param3;
               var _loc12_ = this.api.lang.getMonstersText(_loc11_).n.toUpperCase();
               if(_loc12_.indexOf(_loc4_) != -1)
               {
                  _loc3_.push(_loc6_);
                  break;
               }
            }
            _loc9_ = _loc9_ + 1;
         }
         _loc5_ = _loc5_ + 1;
      }
      this._dgPrices.dataProvider = _loc3_;
   }
   function setButtons(§\x14\x10§, §\x14\x11§)
   {
      this._btnSelectedPrice.selected = false;
      this._btnSelectedPrice = _loc2_;
      this._btnSelectedBuy.enabled = false;
      this._btnSelectedBuy = _loc3_;
   }
   function selectPrice(§\x1e\x19\x03§, §\x1e\x1e\x1a§, §\x14\x10§, §\x14\x11§)
   {
      if(_loc4_ != this._btnSelectedPrice)
      {
         this._nSelectedPriceItemID = _loc2_.id;
         this._nSelectedPriceIndex = _loc3_;
         this.setButtons(_loc4_,_loc5_);
      }
      else
      {
         delete this._nSelectedPriceItemID;
         delete this._nSelectedPriceIndex;
         delete this._btnSelectedPrice;
         delete this._btnSelectedBuy;
      }
   }
   function isThisPriceSelected(§\x04\x06§, §\x1e\x1e\x1a§)
   {
      return _loc2_ == this._nSelectedPriceItemID && this._nSelectedPriceIndex == _loc3_;
   }
   function askBuy(§\x1e\x19\x03§, §\x1e\x1e\x1a§, §\x01\x07§)
   {
      if(_loc2_ != undefined && (_loc3_ != undefined && !_global.isNaN(_loc4_)))
      {
         if(_loc4_ > this.api.datacenter.Player.Kama)
         {
            this.gapi.loadUIComponent("AskOk","AskOkNotRich",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("NOT_ENOUGH_RICH")});
         }
         else
         {
            var _loc5_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:this.api.lang.getText("BIGSTORE"),text:this.api.lang.getText("DO_U_BUY_ITEM_BIGSTORE",["x" + this._oData["quantity" + _loc3_] + " " + _loc2_.name,_loc4_]),params:{id:_loc2_.ID,quantityIndex:_loc3_,price:_loc4_}});
            _loc5_.addEventListener("yes",this);
         }
      }
   }
   function setType(§\x1e\x1b\x13§)
   {
      var _loc3_ = this._oData.types;
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         if(_loc3_[_loc4_] == _loc2_)
         {
            this._cbTypes.selectedIndex = _loc4_;
            return undefined;
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function setItem(§\x1e\x1b\x10§)
   {
      var _loc3_ = this._oData.inventory;
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         if(_loc3_[_loc4_].unicID == _loc2_)
         {
            if(this._lstItems.selectedIndex != _loc4_)
            {
               this._lstItems.selectedIndex = _loc4_;
               this._lstItems.setVPosition(_loc4_);
            }
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      this.updateItem(new dofus.datacenter["\f\f"](0,_loc2_),true);
   }
   function askMiddlePrice(§\x1e\x19\x03§)
   {
      this.api.network.Exchange.getItemMiddlePriceInBigStore(_loc2_.unicID);
   }
   function setMiddlePrice(§\x1e\x1b\x10§, §\x01\x07§)
   {
      if(this._oCurrentItem.unicID == _loc2_ && this._oCurrentItem != undefined)
      {
         this._lblPrices.text = this.api.lang.getText("BIGSTORE_MIDDLEPRICE",[_loc3_]);
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.BigStoreBuy.CLASS_NAME);
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
      this.addToQueue({object:this,method:this.setQuantityHeader});
      this.addToQueue({object:this,method:this.updateData});
      this.hideItemViewer(true);
      this.addToQueue({object:this,method:this.showHelpSelectType,params:[true]});
      this.showArrowAnim(false);
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnClose2.addEventListener("click",this);
      this._btnSearch.addEventListener("click",this);
      this._btnTypes.addEventListener("over",this);
      this._btnTypes.addEventListener("out",this);
      this._btnSwitchToSell.addEventListener("click",this);
      this._cbTypes.addEventListener("itemSelected",this);
      this._lstItems.addEventListener("itemSelected",this);
      this._dgPrices.addEventListener("itemSelected",this);
      if(this._oData != undefined)
      {
         this._oData.addEventListener("modelChanged",this);
         this._oData.addEventListener("modelChanged2",this);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[BigStoreBuy] il n\'y a pas de data");
      }
      this.api.datacenter.Player.addEventListener("kamaChanged",this);
   }
   function initTexts()
   {
      this._winBackground.title = this.api.lang.getText("BIGSTORE") + (this._oData != undefined ? " (" + this.api.lang.getText("BIGSTORE_MAX_LEVEL") + " : " + this._oData.maxLevel + ")" : "");
      this._lblItems.text = this.api.lang.getText("BIGSTORE_ITEM_LIST");
      this._lblTypes.text = this.api.lang.getText("ITEM_TYPE");
      this._lblKamas.text = this.api.lang.getText("WALLET") + " :";
      this._btnClose2.label = this.api.lang.getText("CLOSE");
      this._btnSearch.label = this.api.lang.getText("SEARCH");
      this._btnSwitchToSell.label = this.api.lang.getText("BIGSTORE_MODE_SELL");
   }
   function updateData()
   {
      this.modelChanged();
      this.modelChanged2();
      this.kamaChanged({value:this.api.datacenter.Player.Kama});
   }
   function populateComboBox()
   {
      var _loc2_ = this._oData.types;
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.length)
      {
         var _loc5_ = Number(_loc2_[_loc4_]);
         _loc3_.push({label:this.api.lang.getItemTypeText(_loc5_).n,id:_loc5_});
         _loc4_ = _loc4_ + 1;
      }
      _loc3_.sortOn("label");
      this._oData.types = new Array();
      var _loc6_ = 0;
      while(_loc6_ < _loc2_.length)
      {
         this._oData.types.push(_loc3_[_loc6_].id);
         _loc6_ = _loc6_ + 1;
      }
      this._cbTypes.dataProvider = _loc3_;
      if(_loc3_.length > 0)
      {
         this._cbTypes.selectedIndex = 0;
         this.updateType(this._cbTypes.selectedItem.id);
      }
   }
   function setQuantityHeader()
   {
      this._dgPrices.columnsNames = ["","x" + this._oData.quantity1,"x" + this._oData.quantity2,"x" + this._oData.quantity3];
   }
   function hideItemViewer(§\x19\t§)
   {
      this._itvItemViewer._visible = !_loc2_;
      this._mcItemViewerDescriptionBack._visible = !_loc2_;
      this._mcSpacer._visible = !_loc2_;
      if(!_loc2_)
      {
         this.showHelpSelectType(false);
         this.showHelpSelectPrice(false);
         this.showHelpSelectPrice(false);
      }
   }
   function updateType(§\x1e\x1b\x12§)
   {
      this._lstItems.selectedIndex = -1;
      this.updateItem();
      this.showHelpSelectItem(true);
      this.api.network.Exchange.bigStoreType(_loc2_);
   }
   function updateItem(§\x1e\x19\x03§, §\x1a\x1b§)
   {
      this._oCurrentItem = _loc2_;
      this.hideItemViewer(true);
      this.showHelpSelectPrice(true);
      this._dgPrices.selectedIndex = -1;
      delete this._nSelectedPriceItemID;
      delete this._nSelectedPriceIndex;
      delete this._btnSelectedPrice;
      delete this._btnSelectedBuy;
      if(_loc3_ != true)
      {
         if(_loc2_ != undefined)
         {
            this.api.network.Exchange.bigStoreItemList(_loc2_.unicID);
         }
         else
         {
            this._dgPrices.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
         }
         this._bFullSoul = _loc2_.type == 85;
         this._sFullSoulMonster = "";
      }
   }
   function showHelpSelectType(§\x15\x0e§)
   {
      this._mcBottomArrow._visible = false;
      this._mcBottomArrow.stop();
      this._mcLeftArrow._visible = _loc2_;
      this._mcLeftArrow.play();
      this._mcLeft2Arrow._visible = false;
      this._mcLeft2Arrow.stop();
      this._lblNoItem.text = !_loc2_ ? "" : this.api.lang.getText("BIGSTORE_HELP_SELECT_TYPE");
   }
   function showHelpSelectPrice(§\x15\x0e§)
   {
      this._mcBottomArrow._visible = _loc2_;
      this._mcBottomArrow.play();
      this._mcLeftArrow._visible = false;
      this._mcLeftArrow.stop();
      this._mcLeft2Arrow._visible = false;
      this._mcLeft2Arrow.stop();
      this._lblNoItem.text = !_loc2_ ? "" : this.api.lang.getText("BIGSTORE_HELP_SELECT_PRICE");
   }
   function showHelpSelectItem(§\x15\x0e§)
   {
      this._mcBottomArrow._visible = false;
      this._mcBottomArrow.stop();
      this._mcLeftArrow._visible = false;
      this._mcLeftArrow.stop();
      this._mcLeft2Arrow._visible = _loc2_;
      this._mcLeft2Arrow.play();
      this._lblNoItem.text = !_loc2_ ? "" : this.api.lang.getText("BIGSTORE_HELP_SELECT_ITEM");
   }
   function showArrowAnim(§\x15\x0e§)
   {
      if(_loc2_)
      {
         this._mcArrowAnim._visible = true;
         this._mcArrowAnim.play();
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"bigstore",this,this.showArrowAnim,800,[false]);
      }
      else
      {
         this._mcArrowAnim._visible = false;
         this._mcArrowAnim.stop();
      }
   }
   function onSearchResult(§\x14\x16§)
   {
      if(_loc2_)
      {
         this.api.ui.unloadUIComponent("BigStoreSearch");
      }
      else
      {
         this.api.kernel.showMessage(this.api.lang.getText("BIGSTORE"),this.api.lang.getText("ITEM_NOT_IN_BIGSTORE"),"ERROR_BOX");
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
         case "_btnClose2":
            this.callClose();
            break;
         case "_btnSearch":
            if(this._bFullSoul)
            {
               this.api.ui.loadUIComponent("BigStoreSearchFullSoul","BigStoreSearchFullSoul",{oParent:this});
            }
            else
            {
               this.api.ui.loadUIComponent("BigStoreSearch","BigStoreSearch",{types:this._oData.types,defaultSearch:this._sDefaultSearch,oParent:this});
            }
            break;
         case "_btnSwitchToSell":
            this.api.network.Exchange.request(10,this._oData.npcID);
      }
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_cbTypes":
            this.updateType(this._cbTypes.selectedItem.id);
            break;
         case "_lstItems":
            if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc2_.row.item != undefined)
            {
               this.api.kernel.GameManager.insertItemInChat(_loc2_.row.item);
               return undefined;
            }
            if(this._lblPrices.text != undefined)
            {
               this._lblPrices.text = "";
            }
            this.askMiddlePrice(_loc2_.row.item);
            this.updateItem(_loc2_.row.item);
            break;
         case "_dgPrices":
            if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc2_.row.item.item != undefined)
            {
               this.api.kernel.GameManager.insertItemInChat(_loc2_.row.item.item);
               return undefined;
            }
            this._itvItemViewer.itemData = _loc2_.row.item.item;
            this.hideItemViewer(false);
            this.showArrowAnim(true);
            break;
      }
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._oData.inventory;
      _loc3_.bubbleSortOn("level",Array.DESCENDING);
      _loc3_.reverse();
      this._lstItems.dataProvider = _loc3_;
      if(_loc3_ != 0 && _loc3_ != undefined)
      {
         this._lblItemsCount.text = _loc3_.length + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("OBJECTS"),"m",_loc3_.length < 2);
      }
      else
      {
         this._lblItemsCount.text = this.api.lang.getText("NO_BIGSTORE_RESULT");
      }
   }
   function fullSoulItemsMovement()
   {
      if(this._bFullSoul && this._sFullSoulMonster != "")
      {
         this.modelChanged2();
      }
   }
   function modelChanged2(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.eventName != "updateOne" ? null : this._nSelectedPriceItemID;
      var _loc4_ = _loc2_.eventName != "updateOne" ? null : this._nSelectedPriceIndex;
      delete this._nSelectedPriceItemID;
      delete this._nSelectedPriceIndex;
      delete this._btnSelectedPrice;
      delete this._btnSelectedBuy;
      this._btnSelectedPrice.selected = false;
      this._btnSelectedBuy.enabled = false;
      if(_loc3_ != undefined)
      {
         var _loc5_ = this._oData.inventory2;
         var _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            if(_loc5_[_loc6_].id == _loc3_)
            {
               this._nSelectedPriceItemID = _loc3_;
               this._nSelectedPriceIndex = _loc4_;
               break;
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      if(this._nSelectedPriceItemID == undefined)
      {
         this.hideItemViewer(true);
      }
      var _loc7_ = this._oData.inventory2;
      _loc7_.bubbleSortOn("priceSet1",Array.DESCENDING);
      _loc7_.reverse();
      if(this._bFullSoul)
      {
         this.applyFullSoulFilter(_loc7_);
      }
      else
      {
         this._dgPrices.dataProvider = _loc7_;
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      this.api.network.Exchange.bigStoreBuy(_loc2_.target.params.id,_loc2_.target.params.quantityIndex,_loc2_.target.params.price);
      this.hideItemViewer(true);
      this.showHelpSelectPrice(true);
   }
   function kamaChanged(§\x1e\x19\x0e§)
   {
      this._lblKamasValue.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   }
   function over(§\x1e\x19\x0e§)
   {
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
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
}
