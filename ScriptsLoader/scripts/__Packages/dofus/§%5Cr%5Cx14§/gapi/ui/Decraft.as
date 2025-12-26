class dofus.§\r\x14§.gapi.ui.Decraft extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _ivInventoryViewer;
   var _nMaxItem;
   var _nSkillId;
   var _btnClose;
   var _btnRecycle;
   var _cgGrid;
   var _cgDistant;
   var _eaDataProvider;
   var _oData;
   var _winInventory;
   var _winLocal;
   var _lblSkill;
   var _lblNewObject;
   var _lblNbItemsToDestroy;
   var _mcFiligrane;
   var _itvItemViewer;
   var _winItemViewer;
   var _ctrPreview;
   static var addEventListener;
   static var CLASS_NAME = "Decraft";
   function Decraft()
   {
      super();
   }
   function get currentOverItem()
   {
      if(this._ivInventoryViewer != undefined && this._ivInventoryViewer.currentOverItem != undefined)
      {
         return this._ivInventoryViewer.currentOverItem;
      }
      return undefined;
   }
   function set maxItem(_loc2_)
   {
      this._nMaxItem = Number(_loc2_);
   }
   function set skillId(_loc2_)
   {
      this._nSkillId = Number(_loc2_);
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Decraft.addEventListener.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnRecycle.addEventListener("click",this);
      this._ivInventoryViewer.addEventListener("selectedItem",this);
      this._ivInventoryViewer.addEventListener("dblClickItem",this);
      this._ivInventoryViewer.addEventListener("dropItem",this);
      this._cgGrid.addEventListener("selectItem",this);
      this._cgGrid.addEventListener("dblClickItem",this);
      this._cgGrid.addEventListener("dragItem",this);
      this._cgGrid.addEventListener("dropItem",this);
      this._cgGrid.addEventListener("overItem",this);
      this._cgGrid.addEventListener("outItem",this);
      this._cgDistant.addEventListener("selectItem",this);
      this._eaDataProvider.addEventListener("modelChanged",this);
      if(this._oData != undefined)
      {
         this._oData.addEventListener("modelChanged",this);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[Storage] il n\'y a pas de data");
      }
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   }
   function initTexts()
   {
      this._winInventory.title = this.api.datacenter.Player.data.name;
      this._winLocal.title = this.api.lang.getText("MUNSTER_CUSHER");
      this._btnRecycle.label = this.api.lang.getText("VALIDATE");
      this._lblSkill.text = this.api.lang.getText("SKILL") + " : " + this.api.lang.getSkillText(this._nSkillId).d;
      this._lblNewObject.text = this.api.lang.getText("CRAFTED_ITEM");
      this._lblNbItemsToDestroy.text = this.api.lang.getText("MUNSTER_CRUSHER_CONTENT",[0,this._nMaxItem]);
   }
   function initData()
   {
      this._btnRecycle._visible = true;
      this._btnRecycle.enabled = false;
      this._ivInventoryViewer.showKamas = false;
      this._ivInventoryViewer.hideNonEquipementFilters();
      this._ivInventoryViewer.hideItemsLinked();
      this._ivInventoryViewer.checkPlayerPods = false;
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = this.api.datacenter.Player.Inventory;
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc4_];
         _loc2_.push(_loc5_.clone());
         _loc4_ += 1;
      }
      this._ivInventoryViewer.dataProvider = _loc2_;
      var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._cgGrid.dataProvider = _loc6_;
      this.hideItemViewer(true);
      this._eaDataProvider = this.api.datacenter.Exchange.inventory;
      this._cgDistant.multipleContainerSelectionEnabled = false;
   }
   function doRecycle()
   {
      if(this._cgGrid.dataProvider.length == 0)
      {
         return undefined;
      }
      var _loc2_ = this._cgGrid.dataProvider;
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc4_ = _loc2_[_loc3_];
         this.api.network.Exchange.movementItem(true,_loc4_,_loc4_.Quantity);
         _loc3_ += 1;
      }
      this.api.network.Exchange.ready();
      this._cgGrid.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._mcFiligrane._visible = false;
   }
   function updateForgemagusResult(_loc2_)
   {
   }
   function callClose()
   {
      this.api.network.Exchange.leave();
      return true;
   }
   function hideItemViewer(_loc2_)
   {
      this._itvItemViewer._visible = !_loc2_;
      this._winItemViewer._visible = !_loc2_;
   }
   function itemSelected(_loc2_)
   {
      if(_loc2_ == undefined)
      {
         this.hideItemViewer(true);
      }
      else
      {
         if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
         {
            this.api.kernel.GameManager.insertItemInChat(_loc2_);
            return undefined;
         }
         this.hideItemViewer(false);
         this._itvItemViewer.itemData = _loc2_;
      }
   }
   function modelChanged(_loc2_)
   {
      var _loc3_ = null;
      if((_loc3_ = _loc2_.target) === this._eaDataProvider)
      {
         this._cgDistant.dataProvider = this._eaDataProvider;
         this._mcFiligrane._visible = false;
      }
   }
   function click(_loc2_)
   {
      switch(_loc2_.target)
      {
         case this._btnRecycle:
            this.doRecycle();
            break;
         case this._btnClose:
            this.callClose();
      }
   }
   function dragItem(_loc2_)
   {
      if(_loc2_.target.contentData == undefined)
      {
         return undefined;
      }
      this.gapi.removeCursor();
      this.gapi.setCursor(_loc2_.target.contentData);
   }
   function dblClickItem(_loc2_)
   {
      var _loc3_ = _loc2_.item;
      var _loc4_ = _loc2_.targets;
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      var _loc5_ = Key.isDown(dofus.Constants.SELECT_MULTIPLE_ITEMS_KEY);
      switch(_loc2_.owner._name)
      {
         case "_ivInventoryViewer":
            if(_loc5_ && _loc4_.length > 1)
            {
               this.moveItems(_loc4_,true);
            }
            else
            {
               this.moveItem(_loc3_,true,!Key.isDown(Key.CONTROL) ? 1 : _loc3_.Quantity);
            }
            break;
         case "_cgGrid":
            if(_loc5_ && _loc4_.length > 1)
            {
               this.moveItems(_loc4_,false);
               break;
            }
            this.moveItem(_loc3_,false,!Key.isDown(Key.CONTROL) ? 1 : _loc3_.Quantity);
            break;
      }
   }
   function moveItems(_loc2_, bAddToWorkshop)
   {
      var _loc4_ = [];
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.length)
      {
         var _loc6_ = _loc2_[_loc5_];
         this.moveItem(_loc6_,bAddToWorkshop,_loc6_.Quantity);
         _loc5_ += 1;
      }
   }
   function moveItem(_loc2_, bAddToWorkshop, _loc4_)
   {
      if(_loc4_ > _loc2_.Quantity)
      {
         _loc4_ = _loc2_.Quantity;
      }
      if(_loc4_ < 1)
      {
         return undefined;
      }
      var _loc5_ = this._ivInventoryViewer.dataProvider;
      var _loc6_ = this._cgGrid.dataProvider;
      if(bAddToWorkshop)
      {
         var _loc7_ = _loc5_.findFirstItem("ID",_loc2_.ID);
         if(_loc7_.item != _loc2_ || _loc7_.item.Quantity != _loc2_.Quantity)
         {
            return undefined;
         }
         if(_loc2_.isLock || (!_loc2_.canDestroy || _loc2_.isCeremonial))
         {
            return undefined;
         }
         var _loc8_ = _loc6_.findFirstItem("ID",_loc2_.ID);
         if(_loc8_.item != undefined)
         {
            _loc8_.item.Quantity += _loc4_;
            _loc6_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
            _loc6_.updateItem(_loc8_.index,_loc8_.item);
         }
         else
         {
            if(_loc6_.length >= this._nMaxItem)
            {
               return undefined;
            }
            var _loc9_ = new dofus.datacenter["\f\f"](_loc2_.ID,_loc2_.unicID,_loc4_,-2,_loc2_.compressedEffects);
            _loc6_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
            _loc6_.push(_loc9_);
         }
         _loc2_.Quantity -= _loc4_;
         if(_loc2_.Quantity < 1)
         {
            _loc5_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
            _loc5_.removeItems(_loc7_.index,1);
         }
         else
         {
            _loc5_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
            _loc5_.updateItem(_loc7_.index,_loc2_);
         }
      }
      else
      {
         var _loc10_ = _loc6_.findFirstItem("ID",_loc2_.ID);
         if(_loc10_.item != _loc2_ || _loc10_.item.Quantity != _loc2_.Quantity)
         {
            return undefined;
         }
         var _loc11_ = _loc5_.findFirstItem("ID",_loc2_.ID);
         if(_loc11_.item != undefined)
         {
            _loc11_.item.Quantity += _loc4_;
            _loc5_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
            _loc5_.updateItem(_loc11_.index,_loc11_.item);
         }
         else
         {
            var _loc12_ = new dofus.datacenter["\f\f"](_loc2_.ID,_loc2_.unicID,_loc4_,-1,_loc2_.compressedEffects);
            _loc5_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
            _loc5_.push(_loc12_);
         }
         _loc2_.Quantity -= _loc4_;
         if(_loc2_.Quantity < 1)
         {
            _loc6_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
            _loc6_.removeItems(_loc10_.index,1);
         }
         else
         {
            _loc6_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
            _loc6_.updateItem(_loc10_.index,_loc2_);
         }
      }
      this._btnRecycle.enabled = _loc6_.length > 0;
      this._mcFiligrane._visible = true;
      this._ctrPreview.contentPath = _loc6_.length <= 0 ? "" : dofus.Constants.ITEMS_PATH + "88/44.swf";
      this._lblNbItemsToDestroy.text = this.api.lang.getText("MUNSTER_CRUSHER_CONTENT",[_loc6_.length,this._nMaxItem]);
   }
   function dropItem(_loc2_)
   {
      var _loc3_ = _loc2_.item == undefined ? this.gapi.getCursor() : _loc2_.item;
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      if(_loc3_.isShortcut)
      {
         return undefined;
      }
      this.gapi.removeCursor();
      if(_loc2_.item != undefined)
      {
         this.moveItem(dofus.datacenter["\f\f"](_loc3_),false,_loc2_.quantity);
      }
      else
      {
         var _loc4_ = _loc3_.Quantity;
         if(_loc4_ <= 0)
         {
            this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("SRV_MSG_6"),"ERROR_BOX",{name:undefined});
         }
         else if(_loc4_ > 1)
         {
            var _loc5_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc4_,params:{ownerMc:_loc2_.owner,targetType:"item",oItem:_loc3_}});
            _loc5_.addEventListener("validate",this);
         }
         else
         {
            var _loc6_ = null;
            if((_loc6_ = _loc2_.owner._name) === "_cgGrid")
            {
               this.moveItem(dofus.datacenter["\f\f"](_loc3_),true,_loc4_);
            }
         }
      }
   }
   function validate(_loc2_)
   {
      var _loc3_ = null;
      if((_loc3_ = _loc2_.params.targetType) === "item")
      {
         if((_loc3_ = _loc2_.params.ownerMc._name) === "_cgGrid")
         {
            this.moveItem(_loc2_.params.oItem,true,_loc2_.value);
         }
      }
   }
   function onShortcut(_loc2_)
   {
      var _loc3_ = true;
      var _loc4_ = null;
      if((_loc4_ = _loc2_) === "MERGE_RUNE")
      {
         this.doRecycle();
         _loc3_ = false;
      }
      return _loc3_;
   }
   function overItem(_loc2_)
   {
      _loc2_ = _loc2_.target.contentData;
      _loc2_.showStatsTooltip(_loc2_.target,_loc2_.target.contentData.style);
   }
   function outItem(_loc2_)
   {
      this.gapi.hideTooltip();
   }
   function selectedItem(_loc2_)
   {
      this.itemSelected(_loc2_.item);
   }
   function selectItem(_loc2_)
   {
      this.itemSelected(_loc2_.target.contentData);
   }
}
