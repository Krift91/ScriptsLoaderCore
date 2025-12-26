class dofus.§\r\x14§.gapi.ui.Exchange extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oOverItem;
   var _itvItemViewer;
   var _eaDataProvider;
   var _eaLocalDataProvider;
   var _eaDistantDataProvider;
   var _eaReadyDataProvider;
   var _btnSelectedFilterButton;
   var _btnFilterEquipement;
   var _btnPrivateChat;
   var _timerExchange;
   var _cgGrid;
   var _cgLocal;
   var _cgDistant;
   var _btnFilterNonEquipement;
   var _btnFilterRessoureces;
   var _btnClose;
   var _btnValidate;
   var _cbTypes;
   var _lblFilter;
   var _winInventory;
   var _winDistant;
   var _lblKama;
   var _winLocal;
   var _winItemViewer;
   var _lblLocalKama;
   var _mcBlink;
   var _lblDistantKama;
   static var CLASS_NAME = "Exchange";
   static var FILTER_EQUIPEMENT = [false,true,true,true,true,true,false,true,true,false,true,true,true,true,false];
   static var FILTER_NONEQUIPEMENT = [false,false,false,false,false,false,true,false,false,false,false,false,false,false,false];
   static var FILTER_RESSOURECES = [false,false,false,false,false,false,false,false,false,true,false,false,false,false,false];
   static var READY_COLOR = {ra:70,rb:0,ga:70,gb:0,ba:70,bb:0};
   static var NON_READY_COLOR = {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0};
   static var DELAY_BEFORE_VALIDATE = 3000;
   var _nDistantReadyState = false;
   var _aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Exchange.FILTER_EQUIPEMENT;
   var _nSelectedTypeID = 0;
   function Exchange()
   {
      super();
   }
   function get currentOverItem()
   {
      return this._oOverItem;
   }
   function get itemViewer()
   {
      return this._itvItemViewer;
   }
   function set dataProvider(§\x10\x0b§)
   {
      this._eaDataProvider.removeEventListener("modelChanged",this);
      this._eaDataProvider = _loc2_;
      this._eaDataProvider.addEventListener("modelChanged",this);
      this.modelChanged();
   }
   function set localDataProvider(§\x10\x04§)
   {
      this._eaLocalDataProvider.removeEventListener("modelChange",this);
      this._eaLocalDataProvider = _loc2_;
      this._eaLocalDataProvider.addEventListener("modelChanged",this);
      this.modelChanged();
   }
   function set distantDataProvider(§\x10\n§)
   {
      this._eaDistantDataProvider.removeEventListener("modelChange",this);
      this._eaDistantDataProvider = _loc2_;
      this._eaDistantDataProvider.addEventListener("modelChanged",this);
      this.modelChanged();
   }
   function set readyDataProvider(§\x0f\x18§)
   {
      this._eaReadyDataProvider.removeEventListener("modelChange",this);
      this._eaReadyDataProvider = _loc2_;
      this._eaReadyDataProvider.addEventListener("modelChanged",this);
      this.modelChanged();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Exchange.CLASS_NAME);
   }
   function callClose()
   {
      this.api.network.Exchange.leave();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this._btnSelectedFilterButton = this._btnFilterEquipement;
      this.addToQueue({object:this,method:this.initData});
      this.hideItemViewer(true);
      this.addToQueue({object:this,method:this.initTexts});
      this._btnPrivateChat._visible = this.api.datacenter.Exchange.distantPlayerID > 0;
      this.gapi.unloadLastUIAutoHideComponent();
   }
   function destroy()
   {
      if(this._timerExchange == undefined)
      {
         return undefined;
      }
      _global.clearTimeout(this._timerExchange);
   }
   function addListeners()
   {
      this._cgGrid.addEventListener("dblClickItem",this);
      this._cgGrid.addEventListener("dropItem",this);
      this._cgGrid.addEventListener("dragItem",this);
      this._cgGrid.addEventListener("selectItem",this);
      this._cgGrid.addEventListener("overItem",this);
      this._cgGrid.addEventListener("outItem",this);
      this._cgLocal.addEventListener("dblClickItem",this);
      this._cgLocal.addEventListener("dropItem",this);
      this._cgLocal.addEventListener("dragItem",this);
      this._cgLocal.addEventListener("selectItem",this);
      this._cgLocal.addEventListener("overItem",this);
      this._cgLocal.addEventListener("outItem",this);
      this._cgDistant.addEventListener("selectItem",this);
      this._cgDistant.addEventListener("overItem",this);
      this._cgDistant.addEventListener("outItem",this);
      this._cgDistant.multipleContainerSelectionEnabled = false;
      this._btnFilterEquipement.addEventListener("click",this);
      this._btnFilterNonEquipement.addEventListener("click",this);
      this._btnFilterRessoureces.addEventListener("click",this);
      this._btnFilterEquipement.addEventListener("over",this);
      this._btnFilterNonEquipement.addEventListener("over",this);
      this._btnFilterRessoureces.addEventListener("over",this);
      this._btnFilterEquipement.addEventListener("out",this);
      this._btnFilterNonEquipement.addEventListener("out",this);
      this._btnFilterRessoureces.addEventListener("out",this);
      this._btnClose.addEventListener("click",this);
      this.api.datacenter.Exchange.addEventListener("localKamaChange",this);
      this.api.datacenter.Exchange.addEventListener("distantKamaChange",this);
      this._btnValidate.addEventListener("click",this);
      this._btnPrivateChat.addEventListener("click",this);
      this._cbTypes.addEventListener("itemSelected",this);
   }
   function initTexts()
   {
      this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
      this._winInventory.title = this.api.datacenter.Player.data.name;
      this._winDistant.title = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Exchange.distantPlayerID).name;
      this._btnValidate.label = this.api.lang.getText("ACCEPT");
      this._lblKama.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.Kama).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._btnPrivateChat.label = this.api.lang.getText("WISPER_MESSAGE");
   }
   function initData()
   {
      this.dataProvider = this.api.datacenter.Exchange.inventory;
      this.localDataProvider = this.api.datacenter.Exchange.localGarbage;
      this.distantDataProvider = this.api.datacenter.Exchange.distantGarbage;
      this.readyDataProvider = this.api.datacenter.Exchange.readyStates;
   }
   function updateData()
   {
      var _loc2_ = this.api.datacenter.Basics[dofus["\r\x14"].gapi.ui.Exchange.CLASS_NAME + "_subfilter_" + this._btnSelectedFilterButton._name];
      this._nSelectedTypeID = _loc2_ != undefined ? _loc2_ : 0;
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = new Object();
      for(var k in this._eaDataProvider)
      {
         var _loc6_ = this._eaDataProvider[k];
         var _loc7_ = _loc6_.position;
         if(_loc7_ == -1 && this._aSelectedSuperTypes[_loc6_.superType])
         {
            if(_loc6_.type == this._nSelectedTypeID || this._nSelectedTypeID == 0)
            {
               _loc3_.push(_loc6_);
            }
            var _loc8_ = _loc6_.type;
            if(_loc5_[_loc8_] != true)
            {
               _loc4_.push({label:this.api.lang.getItemTypeText(_loc8_).n,id:_loc8_});
               _loc5_[_loc8_] = true;
            }
         }
      }
      _loc4_.sortOn("label");
      _loc4_.splice(0,0,{label:this.api.lang.getText("WITHOUT_TYPE_FILTER"),id:0});
      this._cbTypes.dataProvider = _loc4_;
      this.setType(this._nSelectedTypeID);
      this._cgGrid.dataProvider = _loc3_;
   }
   function setType(§\x1e\x1b\x12§)
   {
      var _loc3_ = this._cbTypes.dataProvider;
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         if(_loc3_[_loc4_].id == _loc2_)
         {
            this._cbTypes.selectedIndex = _loc4_;
            return undefined;
         }
         _loc4_ = _loc4_ + 1;
      }
      this._nSelectedTypeID = 0;
      this._cbTypes.selectedIndex = this._nSelectedTypeID;
   }
   function onDataUpdated()
   {
      _global.clearTimeout(this._timerExchange);
      this._timerExchange = _global.setTimeout(this,"hideButtonValidate",dofus["\r\x14"].gapi.ui.Exchange.DELAY_BEFORE_VALIDATE,false);
   }
   function updateLocalData()
   {
      this._cgLocal.dataProvider = this._eaLocalDataProvider;
      this.hideButtonValidate(true);
      this.onDataUpdated();
   }
   function updateDistantData()
   {
      this._cgDistant.dataProvider = this._eaDistantDataProvider;
      this.hideButtonValidate(true);
      this.onDataUpdated();
   }
   function updateReadyState()
   {
      var _loc2_ = !this._eaReadyDataProvider[0] ? dofus["\r\x14"].gapi.ui.Exchange.NON_READY_COLOR : dofus["\r\x14"].gapi.ui.Exchange.READY_COLOR;
      this.setMovieClipTransform(this._winLocal,_loc2_);
      this.setMovieClipTransform(this._btnValidate,_loc2_);
      this.setMovieClipTransform(this._cgLocal,_loc2_);
      _loc2_ = !this._eaReadyDataProvider[1] ? dofus["\r\x14"].gapi.ui.Exchange.NON_READY_COLOR : dofus["\r\x14"].gapi.ui.Exchange.READY_COLOR;
      this.setMovieClipTransform(this._winDistant,_loc2_);
      this.setMovieClipTransform(this._cgDistant,_loc2_);
   }
   function hideButtonValidate(§\x19\t§)
   {
      var _loc3_ = !_loc2_ ? dofus["\r\x14"].gapi.ui.Exchange.NON_READY_COLOR : dofus["\r\x14"].gapi.ui.Exchange.READY_COLOR;
      this.setMovieClipTransform(this._btnValidate,_loc3_);
      this._btnValidate.enabled = !_loc2_;
   }
   function hideItemViewer(§\x19\t§)
   {
      this._itvItemViewer._visible = !_loc2_;
      this._winItemViewer._visible = !_loc2_;
   }
   function moveItems(§\x1e\x10§, §\x1c\x17§)
   {
      var _loc4_ = new Array();
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.length)
      {
         var _loc6_ = _loc2_[_loc5_];
         _loc4_.push({Add:_loc3_,ID:_loc6_.ID,Quantity:_loc6_.Quantity});
         _loc5_ = _loc5_ + 1;
      }
      this.api.network.Exchange.movementItems(_loc4_);
   }
   function validateDrop(§\x1e\f\x1c§, §\x1e\x19\x03§, §\x1e\x1b\n§)
   {
      if(_loc4_ < 1 || _loc4_ == undefined)
      {
         return undefined;
      }
      if(_loc4_ > _loc3_.Quantity)
      {
         _loc4_ = _loc3_.Quantity;
      }
      switch(_loc2_)
      {
         case "_cgGrid":
            this.api.network.Exchange.movementItem(false,_loc3_,_loc4_);
            break;
         case "_cgLocal":
            this.api.network.Exchange.movementItem(true,_loc3_,_loc4_);
      }
   }
   function validateKama(§\x01\x01§)
   {
      if(_loc2_ > this.api.datacenter.Player.Kama)
      {
         _loc2_ = this.api.datacenter.Player.Kama;
      }
      this.api.network.Exchange.movementKama(_loc2_);
   }
   function askKamaQuantity()
   {
      var _loc2_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:this.api.datacenter.Exchange.localKama,max:this.api.datacenter.Player.Kama,min:0,params:{targetType:"kama"}});
      _loc2_.addEventListener("validate",this);
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._eaReadyDataProvider:
            this.updateReadyState();
            break;
         case this._eaLocalDataProvider:
            this.updateLocalData();
            break;
         case this._eaDistantDataProvider:
            this.updateDistantData();
            break;
         case this._eaDataProvider:
            this.updateData();
            break;
         default:
            this.updateData();
            this.updateLocalData();
            this.updateDistantData();
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
            this.callClose();
            break;
         case "_btnValidate":
            this.api.network.Exchange.ready();
            break;
         case "_btnPrivateChat":
            if(this.api.datacenter.Exchange.distantPlayerID > 0)
            {
               this.api.kernel.GameManager.askPrivateMessage(this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Exchange.distantPlayerID).name);
            }
            break;
         default:
            if(_loc2_.target != this._btnSelectedFilterButton)
            {
               this._btnSelectedFilterButton.selected = false;
               this._btnSelectedFilterButton = _loc2_.target;
               switch(_loc2_.target._name)
               {
                  case "_btnFilterEquipement":
                     this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Exchange.FILTER_EQUIPEMENT;
                     this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
                     break;
                  case "_btnFilterNonEquipement":
                     this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Exchange.FILTER_NONEQUIPEMENT;
                     this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
                     break;
                  case "_btnFilterRessoureces":
                     this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Exchange.FILTER_RESSOURECES;
                     this._lblFilter.text = this.api.lang.getText("RESSOURECES");
               }
               this.updateData(true);
               break;
            }
            _loc2_.target.selected = true;
            break;
      }
   }
   function overItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.contentData;
      _loc3_.showStatsTooltip(_loc2_.target,_loc2_.target.contentData.style);
      this._oOverItem = _loc3_;
   }
   function outItem(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
      this._oOverItem = undefined;
   }
   function dblClickItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.contentData;
      var _loc4_ = _loc2_.targets;
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      var _loc5_ = Key.isDown(dofus.Constants.SELECT_MULTIPLE_ITEMS_KEY);
      var _loc6_ = !_loc5_ ? 1 : _loc3_.Quantity;
      var _loc7_ = _loc2_.owner._name;
      switch(_loc7_)
      {
         case "_cgGrid":
            if(_loc5_ && _loc4_.length > 1)
            {
               this.moveItems(_loc4_,true);
            }
            else
            {
               this.validateDrop("_cgLocal",_loc3_,_loc6_);
            }
            break;
         case "_cgLocal":
            if(_loc5_ && _loc4_.length > 1)
            {
               this.moveItems(_loc4_,false);
               break;
            }
            this.validateDrop("_cgGrid",_loc3_,_loc6_);
            break;
      }
   }
   function dragItem(§\x1e\x19\x0e§)
   {
      this.gapi.removeCursor();
      if(_loc2_.target.contentData == undefined)
      {
         return undefined;
      }
      this.gapi.setCursor(_loc2_.target.contentData);
   }
   function dropItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = this.gapi.getCursor();
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      this.gapi.removeCursor();
      var _loc4_ = _loc2_.target._parent._parent._name;
      switch(_loc4_)
      {
         case "_cgGrid":
            if(_loc3_.position == -1)
            {
               return undefined;
            }
            break;
         case "_cgLocal":
            if(_loc3_.position == -2)
            {
               return undefined;
            }
            break;
      }
      if(_loc3_.Quantity > 1)
      {
         var _loc5_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc3_.Quantity,params:{targetType:"item",oItem:_loc3_,targetGrid:_loc4_}});
         _loc5_.addEventListener("validate",this);
      }
      else
      {
         this.validateDrop(_loc4_,_loc3_,1);
      }
   }
   function selectItem(§\x1e\x19\x0e§)
   {
      if(_loc2_.target.contentData == undefined)
      {
         this.hideItemViewer(true);
      }
      else
      {
         if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
         {
            this.api.kernel.GameManager.insertItemInChat(_loc2_.target.contentData);
            return undefined;
         }
         this.hideItemViewer(false);
         this._itvItemViewer.itemData = _loc2_.target.contentData;
      }
   }
   function validate(§\x1e\x19\x0e§)
   {
      switch(_loc2_.params.targetType)
      {
         case "item":
            this.validateDrop(_loc2_.params.targetGrid,_loc2_.params.oItem,_loc2_.value);
            break;
         case "kama":
            this.validateKama(_loc2_.value);
      }
   }
   function localKamaChange(§\x1e\x19\x0e§)
   {
      this._lblLocalKama.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._lblKama.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.Kama - _loc2_.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this.hideButtonValidate(true);
      this.onDataUpdated();
   }
   function distantKamaChange(§\x1e\x19\x0e§)
   {
      this._mcBlink.play();
      this._lblDistantKama.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this.hideButtonValidate(true);
      this.onDataUpdated();
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "_cbTypes")
      {
         this._nSelectedTypeID = this._cbTypes.selectedItem.id;
         this.api.datacenter.Basics[dofus["\r\x14"].gapi.ui.Exchange.CLASS_NAME + "_subfilter_" + this._btnSelectedFilterButton._name] = this._nSelectedTypeID;
         this.updateData();
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnFilterEquipement:
            this.api.ui.showTooltip(this.api.lang.getText("EQUIPEMENT"),_loc2_.target,-20);
            break;
         case this._btnFilterNonEquipement:
            this.api.ui.showTooltip(this.api.lang.getText("NONEQUIPEMENT"),_loc2_.target,-20);
            break;
         case this._btnFilterRessoureces:
            this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),_loc2_.target,-20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.api.ui.hideTooltip();
   }
}
