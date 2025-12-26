class dofus.§\r\x14§.gapi.ui.Inventory extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oOverItem;
   var _itvItemViewer;
   var _eaDataProvider;
   var _winPreview;
   var _svCharacterViewer;
   var _mcItemSetViewerPlacer;
   var _mcBottomPlacer;
   var _isvItemSetViewer;
   var _livItemViewer;
   var _winLivingItems;
   var _winBg;
   var _ctrShield;
   var _ctr15;
   var _ctrWeapon;
   var _ctr1;
   var _ctrMount;
   var _ctr16;
   var _mcTwoHandedLink;
   var _mcTwoHandedCrossLeft;
   var _mcTwoHandedCrossRight;
   var _mcMountCross;
   var _cgGrid;
   var _btnFilterEquipement;
   var _btnFilterNonEquipement;
   var _btnFilterRessoureces;
   var _btnFilterQuest;
   var _btnClose;
   var _cbTypes;
   var _lblWeight;
   var _lblFilter;
   var _lblNoItem;
   var _aSelectedSuperTypes;
   var _btnSelectedFilterButton;
   var _mcItvDescBg;
   var _mcItvIconBg;
   var _lblKama;
   var _mcArrowAnimation;
   static var CLASS_NAME = "Inventory";
   static var CONTAINER_BY_TYPE = {type1:["_ctr0"],type2:["_ctr1"],type3:["_ctr2","_ctr4"],type4:["_ctr3"],type5:["_ctr5"],type6:["_ctrMount"],type8:["_ctr1"],type9:["_ctr8","_ctrMount"],type10:["_ctr6"],type11:["_ctr7"],type12:["_ctr8","_ctr16"],type13:["_ctr9","_ctr10","_ctr11","_ctr12","_ctr13","_ctr14"],type7:["_ctr15"]};
   static var SUPERTYPE_NOT_EQUIPABLE = [9,14,15,16,17,18,6,19,21,20,8,22];
   static var FILTER_EQUIPEMENT = [false,true,true,true,true,true,false,true,true,false,true,true,true,true,false];
   static var FILTER_NONEQUIPEMENT = [false,false,false,false,false,false,true,false,false,false,false,false,false,false,false];
   static var FILTER_RESSOURECES = [false,false,false,false,false,false,false,false,false,true,false,false,false,false,false];
   static var FILTER_QUEST = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,true];
   var _nSelectedTypeID = 0;
   function Inventory()
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
   function showCharacterPreview(§\x15\x0e§)
   {
      if(_loc2_)
      {
         this._winPreview._visible = true;
         this._svCharacterViewer._visible = true;
         this._mcItemSetViewerPlacer._x = this._mcBottomPlacer._x;
         this._mcItemSetViewerPlacer._y = this._mcBottomPlacer._y;
         this._isvItemSetViewer._x = this._mcBottomPlacer._x;
         this._isvItemSetViewer._y = this._mcBottomPlacer._y;
      }
      else
      {
         this._winPreview._visible = false;
         this._svCharacterViewer._visible = false;
         this._mcItemSetViewerPlacer._x = this._winPreview._x;
         this._mcItemSetViewerPlacer._y = this._winPreview._y;
         this._isvItemSetViewer._x = this._winPreview._x;
         this._isvItemSetViewer._y = this._winPreview._y;
      }
   }
   function showLivingItems(§\x15\x0e§)
   {
      this._livItemViewer._visible = _loc2_;
      this._winLivingItems._visible = _loc2_;
      if(_loc2_)
      {
         this._winPreview._visible = false;
         this._svCharacterViewer._visible = false;
         this._mcItemSetViewerPlacer._x = this._mcBottomPlacer._x;
         this._mcItemSetViewerPlacer._y = this._mcBottomPlacer._y;
         this._isvItemSetViewer._x = this._mcBottomPlacer._x;
         this._isvItemSetViewer._y = this._mcBottomPlacer._y;
      }
      else
      {
         this.showCharacterPreview(this.api.kernel.OptionsManager.getOption("CharacterPreview"));
      }
   }
   function showItemInfos(§\x1e\x19\x03§)
   {
      if(_loc2_ == undefined)
      {
         this.hideItemViewer(true);
         this.hideItemSetViewer(true);
      }
      else
      {
         this.hideItemViewer(false);
         var _loc3_ = _loc2_.clone();
         if(_loc3_.realGfx)
         {
            _loc3_.gfx = _loc3_.realGfx;
         }
         this._itvItemViewer.itemData = _loc3_;
         if(_loc2_.isFromItemSet)
         {
            var _loc4_ = this.api.datacenter.Player.ItemSets.getItemAt(_loc2_.itemSetID);
            if(_loc4_ == undefined)
            {
               _loc4_ = new dofus.datacenter.ItemSet(_loc2_.itemSetID,"",[]);
            }
            this.hideItemSetViewer(false);
            this._isvItemSetViewer.itemSet = _loc4_;
         }
         else
         {
            this.hideItemSetViewer(true);
         }
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Inventory.CLASS_NAME);
      this.gapi.getUIComponent("Banner").shortcuts.setCurrentTab("Items");
      this.showCharacterPreview(this.api.kernel.OptionsManager.getOption("CharacterPreview"));
      this.showLivingItems(false);
   }
   function destroy()
   {
      this.gapi.hideTooltip();
      if(this.api.datacenter.Game.isFight)
      {
         this.gapi.getUIComponent("Banner").shortcuts.setCurrentTab("Spells");
      }
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this._winBg.onRelease = function()
      {
      };
      this._winBg.useHandCursor = false;
      this._winLivingItems.onRelease = function()
      {
      };
      this._winLivingItems.useHandCursor = false;
      this.addToQueue({object:this,method:this.hideEpisodicContent});
      this.addToQueue({object:this,method:this.initFilter});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.hideItemViewer(true);
      this.hideItemSetViewer(true);
      this._ctrShield = this._ctr15;
      this._ctrWeapon = this._ctr1;
      this._ctrMount = this._ctr16;
      this._mcTwoHandedLink._visible = false;
      this._mcTwoHandedLink.stop();
      this._mcTwoHandedCrossLeft._visible = false;
      this._mcTwoHandedCrossRight._visible = false;
      Mouse.addListener(this);
      this.api.datacenter.Player.addEventListener("kamaChanged",this);
      this.api.datacenter.Player.addEventListener("mountChanged",this);
      this.api.datacenter.Player.addEventListener("nameChanged",this);
      this.addToQueue({object:this,method:this.kamaChanged,params:[{value:this.api.datacenter.Player.Kama}]});
      this.addToQueue({object:this,method:this.mountChanged});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      this.addToQueue({object:this,method:this.setSubComponentsStyle,params:[_loc2_]});
   }
   function setSubComponentsStyle(§\x1e\x17\x10§)
   {
      this._itvItemViewer.styleName = _loc2_.itenviewerstyle;
   }
   function hideEpisodicContent()
   {
      if(this.api.datacenter.Basics.aks_current_regional_version < 20)
      {
         this._ctrMount._visible = false;
         this._mcMountCross._visible = false;
      }
      else
      {
         this._ctrMount._visible = true;
      }
   }
   function addListeners()
   {
      this._cgGrid.addEventListener("dropItem",this);
      this._cgGrid.addEventListener("dragItem",this);
      this._cgGrid.addEventListener("selectItem",this);
      this._cgGrid.addEventListener("overItem",this);
      this._cgGrid.addEventListener("outItem",this);
      this._cgGrid.addEventListener("dblClickItem",this);
      this._cgGrid.multipleContainerSelectionEnabled = false;
      this._btnFilterEquipement.addEventListener("click",this);
      this._btnFilterNonEquipement.addEventListener("click",this);
      this._btnFilterRessoureces.addEventListener("click",this);
      this._btnFilterQuest.addEventListener("click",this);
      this._btnFilterEquipement.addEventListener("over",this);
      this._btnFilterNonEquipement.addEventListener("over",this);
      this._btnFilterRessoureces.addEventListener("over",this);
      this._btnFilterQuest.addEventListener("over",this);
      this._btnFilterEquipement.addEventListener("out",this);
      this._btnFilterNonEquipement.addEventListener("out",this);
      this._btnFilterRessoureces.addEventListener("out",this);
      this._btnFilterQuest.addEventListener("out",this);
      this._btnClose.addEventListener("click",this);
      this._itvItemViewer.addEventListener("useItem",this);
      this._itvItemViewer.addEventListener("destroyItem",this);
      this._itvItemViewer.addEventListener("destroyMimibiote",this);
      this._itvItemViewer.addEventListener("targetItem",this);
      this._cbTypes.addEventListener("itemSelected",this);
      for(var a in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE)
      {
         var _loc2_ = dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE[a];
         var _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            var _loc4_ = this[_loc2_[_loc3_]];
            _loc4_.addEventListener("over",this);
            _loc4_.addEventListener("out",this);
            if(_loc4_.toolTipText == undefined)
            {
               _loc4_.toolTipText = this.api.lang.getText(_loc4_ != this._ctrMount ? "INVENTORY_" + a.toUpperCase() : "MOUNT");
            }
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function initTexts()
   {
      this._lblWeight.text = this.api.lang.getText("WEIGHT");
      this._winPreview.title = this.api.lang.getText("CHARACTER_PREVIEW",[this.api.datacenter.Player.Name]);
      this._winBg.title = this.api.lang.getText("INVENTORY");
      this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
      this._lblNoItem.text = this.api.lang.getText("SELECT_ITEM");
      this._winLivingItems.title = this.api.lang.getText("MANAGE_ITEM");
   }
   function initFilter()
   {
      switch(this.api.datacenter.Basics.inventory_filter)
      {
         case "nonequipement":
            this._btnFilterNonEquipement.selected = true;
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_NONEQUIPEMENT;
            this._btnSelectedFilterButton = this._btnFilterNonEquipement;
            break;
         case "resources":
            this._btnFilterRessoureces.selected = true;
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_RESSOURECES;
            this._btnSelectedFilterButton = this._btnFilterRessoureces;
            break;
         case "quest":
            this._btnFilterQuest.selected = true;
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_QUEST;
            this._btnSelectedFilterButton = this._btnFilterQuest;
            break;
         case "equipement":
         default:
            this._btnFilterEquipement.selected = true;
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_EQUIPEMENT;
            this._btnSelectedFilterButton = this._btnFilterEquipement;
      }
   }
   function initData()
   {
      this._svCharacterViewer.zoom = 250;
      this.refreshSpriteViewer();
      this.dataProvider = this.api.datacenter.Player.Inventory;
   }
   function refreshSpriteViewer()
   {
      var _loc2_ = ank.battlefield.datacenter["\x1e\x0e\x10"](this.api.datacenter.Player.data);
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      var _loc3_ = new ank.battlefield.datacenter["\x1e\x0e\x10"]("viewer",ank.battlefield.mc["\x1e\x0e\x10"],_loc2_.gfxFile,undefined,5);
      _loc3_.color1 = _loc2_.color1;
      _loc3_.color2 = _loc2_.color2;
      _loc3_.color3 = _loc2_.color3;
      _loc3_.accessories = _loc2_.accessories;
      _loc3_.mount = _loc2_.mount;
      this._svCharacterViewer.sourceSpriteData = _loc2_;
      this._svCharacterViewer.spriteData = _loc3_;
   }
   function enabledFromSuperType(§\x1e\x19\x03§)
   {
      var _loc3_ = _loc2_.superType;
      if(_loc3_ != undefined)
      {
         for(var k in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE)
         {
            for(var i in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE[k])
            {
               var _loc4_ = this[dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE[k][i]];
               _loc4_.enabled = false;
               _loc4_.selected = false;
            }
         }
         var _loc5_ = this.api.lang.getItemSuperTypeText(_loc3_);
         if(_loc5_)
         {
            for(var i in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_])
            {
               var _loc6_ = this[dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_][i]];
               if(!(_loc3_ == 9 && _loc6_.contentPath == ""))
               {
                  _loc6_.enabled = true;
                  _loc6_.selected = true;
               }
            }
         }
         else
         {
            for(var i in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_])
            {
               var _loc8_ = this[dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_][i]];
               if(_loc8_.contentData == undefined)
               {
                  var _loc7_ = _loc8_;
               }
               else if(_loc8_.contentData.unicID == _loc2_.unicID)
               {
                  return undefined;
               }
            }
            if(_loc7_ != undefined)
            {
               _loc7_.enabled = true;
               _loc7_.selected = true;
            }
         }
         if(_loc2_.needTwoHands)
         {
            this._mcTwoHandedCrossLeft._visible = true;
            this._mcTwoHandedCrossRight._visible = false;
            this._ctrShield.content._alpha = 30;
            this._mcTwoHandedLink.play();
            this._mcTwoHandedLink._visible = true;
         }
         if(_loc3_ == 7 && this.api.datacenter.Player.weaponItem.needTwoHands)
         {
            this._mcTwoHandedCrossLeft._visible = false;
            this._mcTwoHandedCrossRight._visible = true;
            this._ctrWeapon.content._alpha = 30;
            this._mcTwoHandedLink.play();
            this._mcTwoHandedLink._visible = true;
         }
      }
      else
      {
         for(var k in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE)
         {
            for(var i in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE[k])
            {
               var _loc9_ = this[dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE[k][i]];
               _loc9_.enabled = true;
               if(_loc9_.selected)
               {
                  _loc9_.selected = false;
               }
            }
         }
         if(this.api.datacenter.Player.weaponItem.needTwoHands)
         {
            this._mcTwoHandedLink.gotoAndStop(1);
            this._mcTwoHandedLink._visible = true;
            this._mcTwoHandedCrossLeft._visible = true;
         }
      }
   }
   function updateData(§\x16\x1b§)
   {
      var _loc3_ = this.api.datacenter.Basics[dofus["\r\x14"].gapi.ui.Inventory.CLASS_NAME + "_subfilter_" + this._btnSelectedFilterButton._name];
      this._nSelectedTypeID = _loc3_ != undefined ? _loc3_ : 0;
      var _loc4_ = new Object();
      if(!_loc2_)
      {
         for(var k in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE)
         {
            for(var i in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE[k])
            {
               _loc4_[dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE[k][i]] = true;
            }
         }
      }
      var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc7_ = new Object();
      for(var k in this._eaDataProvider)
      {
         var _loc8_ = this._eaDataProvider[k];
         var _loc9_ = _loc8_.position;
         if(_loc9_ != -1)
         {
            if(!_loc2_)
            {
               var _loc10_ = this["_ctr" + _loc9_];
               _loc10_.contentData = _loc8_;
               delete _loc4_[_loc10_._name];
            }
         }
         else if(this._aSelectedSuperTypes[_loc8_.superType])
         {
            if(_loc8_.type == this._nSelectedTypeID || this._nSelectedTypeID == 0)
            {
               _loc5_.push(_loc8_);
            }
            var _loc11_ = _loc8_.type;
            if(_loc7_[_loc11_] != true)
            {
               _loc6_.push({label:this.api.lang.getItemTypeText(_loc11_).n,id:_loc11_});
               _loc7_[_loc11_] = true;
            }
         }
      }
      _loc6_.sortOn("label");
      _loc6_.splice(0,0,{label:this.api.lang.getText("WITHOUT_TYPE_FILTER"),id:0});
      this._cbTypes.dataProvider = _loc6_;
      this.setType(this._nSelectedTypeID);
      this._cgGrid.dataProvider = _loc5_;
      if(!_loc2_)
      {
         for(var k in _loc4_)
         {
            if(this[k] != this._ctrMount)
            {
               this[k].contentData = undefined;
            }
         }
      }
      this.resetTwoHandClip();
   }
   function resetTwoHandClip()
   {
      this._ctrShield.content._alpha = 100;
      this._ctrWeapon.content._alpha = 100;
      this._mcTwoHandedLink.gotoAndStop(1);
      if(this.api.datacenter.Player.weaponItem.needTwoHands)
      {
         this._mcTwoHandedLink._visible = true;
         this._mcTwoHandedCrossLeft._visible = true;
         this._mcTwoHandedCrossRight._visible = false;
      }
      else
      {
         this._mcTwoHandedLink._visible = false;
         this._mcTwoHandedCrossLeft._visible = false;
         this._mcTwoHandedCrossRight._visible = false;
      }
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
   function canMoveItem()
   {
      var _loc2_ = this.api.datacenter.Game.isRunning;
      var _loc3_ = this.api.datacenter.Exchange != undefined;
      if(_loc2_ || _loc3_)
      {
         this.gapi.loadUIComponent("AskOk","AskOkInventory",{title:this.api.lang.getText("INFORMATIONS"),text:this.api.lang.getText("CANT_MOVE_ITEM")});
      }
      return !(_loc2_ || _loc3_);
   }
   function askDestroy(§\x1e\x19\x03§, §\x01\x01§)
   {
      if(_loc2_.Quantity == 1)
      {
         var _loc4_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoDestroy",{title:this.api.lang.getText("QUESTION"),text:this.api.lang.getText("DO_U_DESTROY",[_loc3_,_loc2_.name]),params:{item:_loc2_,quantity:_loc3_}});
         _loc4_.addEventListener("yes",this);
      }
      else
      {
         this.api.network.Items.destroy(_loc2_.ID,_loc3_);
      }
   }
   function hideItemViewer(§\x19\t§)
   {
      this._itvItemViewer._visible = !_loc2_;
      this._mcItvDescBg._visible = !_loc2_;
      this._mcItvIconBg._visible = !_loc2_;
   }
   function hideItemSetViewer(§\x19\t§)
   {
      if(_loc2_)
      {
         this._isvItemSetViewer.removeMovieClip();
      }
      else if(this._isvItemSetViewer == undefined)
      {
         this.attachMovie("ItemSetViewer","_isvItemSetViewer",this.getNextHighestDepth(),{_x:this._mcItemSetViewerPlacer._x,_y:this._mcItemSetViewerPlacer._y});
      }
   }
   function nameChanged(§\x1e\x19\x0e§)
   {
      this._winPreview.title = this.api.lang.getText("CHARACTER_PREVIEW",[_loc2_.value]);
   }
   function kamaChanged(§\x1e\x19\x0e§)
   {
      this._lblKama.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   }
   function click(§\x1e\x19\x0e§)
   {
      if(_loc2_.target == this._btnClose)
      {
         this.callClose();
         return undefined;
      }
      if(this._mcArrowAnimation._visible)
      {
         this._mcArrowAnimation._visible = false;
      }
      if(_loc2_.target != this._btnSelectedFilterButton)
      {
         this.api.sounds.events.onInventoryFilterButtonClick();
         this._btnSelectedFilterButton.selected = false;
         this._btnSelectedFilterButton = _loc2_.target;
         switch(_loc2_.target._name)
         {
            case "_btnFilterEquipement":
               this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_EQUIPEMENT;
               this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
               this.api.datacenter.Basics.inventory_filter = "equipement";
               break;
            case "_btnFilterNonEquipement":
               this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_NONEQUIPEMENT;
               this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
               this.api.datacenter.Basics.inventory_filter = "nonequipement";
               break;
            case "_btnFilterRessoureces":
               this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_RESSOURECES;
               this._lblFilter.text = this.api.lang.getText("RESSOURECES");
               this.api.datacenter.Basics.inventory_filter = "resources";
               break;
            case "_btnFilterQuest":
               this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_QUEST;
               this._lblFilter.text = this.api.lang.getText("QUEST_OBJECTS");
               this.api.datacenter.Basics.inventory_filter = "quest";
         }
         this.updateData(true);
      }
      else
      {
         _loc2_.target.selected = true;
      }
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      switch(_loc2_.eventName)
      {
         case "updateOne":
         case "updateAll":
      }
      this.updateData(false);
      this.hideItemViewer(true);
      this.hideItemSetViewer(true);
      this.showLivingItems(false);
   }
   function onMouseUp()
   {
      this.addToQueue({object:this,method:this.enabledFromSuperType});
   }
   function dragItem(§\x1e\x19\x0e§)
   {
      this.gapi.removeCursor();
      if(!this.canMoveItem())
      {
         return undefined;
      }
      if(_loc2_.target.contentData == undefined)
      {
         return undefined;
      }
      if(_loc2_.target.contentData.isCursed)
      {
         return undefined;
      }
      this.enabledFromSuperType(_loc2_.target.contentData);
      this.gapi.setCursor(_loc2_.target.contentData);
   }
   function dropItem(§\x1e\x19\x0e§)
   {
      if(!this.canMoveItem())
      {
         return undefined;
      }
      var _loc3_ = this.gapi.getCursor();
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      if(_loc2_.target._parent == this)
      {
         var _loc4_ = Number(_loc2_.target._name.substr(4));
      }
      else
      {
         if(_loc3_.position == -1)
         {
            this.resetTwoHandClip();
            return undefined;
         }
         _loc4_ = -1;
      }
      if(_loc3_.position == _loc4_)
      {
         this.resetTwoHandClip();
         return undefined;
      }
      this.gapi.removeCursor();
      if(_loc3_.Quantity > 1 && (_loc4_ == -1 || _loc4_ == 16))
      {
         var _loc5_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:_loc3_.Quantity,max:_loc3_.Quantity,params:{type:"move",position:_loc4_,item:_loc3_}});
         _loc5_.addEventListener("validate",this);
      }
      else
      {
         this.api.network.Items.movement(_loc3_.ID,_loc4_);
      }
   }
   function selectItem(§\x1e\x19\x0e§)
   {
      if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc2_.target.contentData != undefined)
      {
         this.api.kernel.GameManager.insertItemInChat(_loc2_.target.contentData);
      }
      else
      {
         this.showItemInfos(_loc2_.target.contentData);
         this.showLivingItems(_loc2_.target.contentData.skineable == true);
         if(_loc2_.target.contentData.skineable)
         {
            this._livItemViewer.itemData = _loc2_.target.contentData;
         }
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
      if(!this.canMoveItem())
      {
         return undefined;
      }
      var _loc3_ = _loc2_.target.contentData;
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      if(_loc3_.position == -1)
      {
         if(_loc3_.canUse && this.api.datacenter.Player.canUseObject)
         {
            this.api.network.Items.use(_loc3_.ID);
         }
         else if(this.api.lang.getConfigText("DOUBLE_CLICK_TO_EQUIP"))
         {
            this.equipItem(_loc3_);
         }
      }
      else
      {
         this.api.network.Items.movement(_loc3_.ID,-1);
      }
   }
   function getFreeSlot(§\x1e\x19\x03§)
   {
      var _loc3_ = _loc2_.superType;
      for(var i in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_])
      {
         if(dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_][i] != "_ctr16")
         {
            if(this[dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_][i]].contentData == undefined)
            {
               return this[dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_][i]];
            }
         }
      }
      return undefined;
   }
   function equipItem(§\x1e\x19\x03§)
   {
      if(_loc2_.position != -1)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.superType;
      if(_loc2_.type != 83)
      {
         var _loc4_ = 0;
         while(_loc4_ < dofus["\r\x14"].gapi.ui.Inventory.SUPERTYPE_NOT_EQUIPABLE.length)
         {
            if(dofus["\r\x14"].gapi.ui.Inventory.SUPERTYPE_NOT_EQUIPABLE[_loc4_] == _loc3_)
            {
               return undefined;
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      var _loc5_ = this.getFreeSlot(_loc2_);
      if(_loc5_ != undefined)
      {
         var _loc6_ = Number(_loc5_._name.substr(4));
         this.cleanRideIfNecessary(_loc3_);
         this.api.network.Items.movement(_loc2_.ID,_loc6_);
      }
      else
      {
         var _loc8_ = this.api.lang.getSlotsFromSuperType(_loc2_.superType);
         var _loc9_ = getTimer();
         var _loc10_ = 0;
         while(_loc10_ < _loc8_.length)
         {
            if(this.api.kernel.GameManager.getLastModified(_loc8_[_loc10_]) < _loc9_)
            {
               _loc9_ = this.api.kernel.GameManager.getLastModified(_loc8_[_loc10_]);
               var _loc7_ = _loc8_[_loc10_];
            }
            _loc10_ = _loc10_ + 1;
         }
         if(this["_ctr" + _loc7_].contentData.ID == undefined || _global.isNaN(this["_ctr" + _loc7_].contentData.ID))
         {
            return undefined;
         }
         if(_loc7_ == undefined || _global.isNaN(_loc7_))
         {
            return undefined;
         }
         this.cleanRideIfNecessary(_loc3_);
         this.api.network.Items.movement(this["_ctr" + _loc7_].contentData.ID,-1);
         this.api.network.Items.movement(_loc2_.ID,_loc7_);
      }
   }
   function cleanRideIfNecessary(§\x1e\x1c\x10§)
   {
      if(_loc2_ == 12 && (!this.api.datacenter.Game.isFight && this.api.datacenter.Player.isRiding))
      {
         this.api.network.Mount.ride();
      }
   }
   function dropDownItem()
   {
      if(!this.canMoveItem())
      {
         return undefined;
      }
      var _loc2_ = this.gapi.getCursor();
      if(!_loc2_.canDrop)
      {
         this.gapi.loadUIComponent("AskOk","AskOkCantDrop",{title:this.api.lang.getText("IMPOSSIBLE"),text:this.api.lang.getText("CANT_DROP_ITEM")});
         return undefined;
      }
      this.gapi.removeCursor();
      if(_loc2_.Quantity > 1)
      {
         var _loc3_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc2_.Quantity,params:{type:"drop",item:_loc2_}});
         _loc3_.addEventListener("validate",this);
      }
      else if(this.api.kernel.OptionsManager.getOption("ConfirmDropItem"))
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CONFIRM_DROP_ITEM"),"CAUTION_YESNO",{name:"ConfirmDropOne",params:{item:_loc2_},listener:this});
      }
      else
      {
         this.api.network.Items.drop(_loc2_.ID,1);
      }
   }
   function validate(§\x1e\x19\x0e§)
   {
      switch(_loc2_.params.type)
      {
         case "destroy":
            if(_loc2_.value > 0 && !_global.isNaN(Number(_loc2_.value)))
            {
               var _loc3_ = Math.min(_loc2_.value,_loc2_.params.item.Quantity);
               this.askDestroy(_loc2_.params.item,_loc3_);
            }
            break;
         case "drop":
            this.gapi.removeCursor();
            if(_loc2_.value > 0 && !_global.isNaN(Number(_loc2_.value)))
            {
               if(this.api.kernel.OptionsManager.getOption("ConfirmDropItem"))
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CONFIRM_DROP_ITEM"),"CAUTION_YESNO",{name:"ConfirmDrop",params:{item:_loc2_.params.item,minValue:_loc2_.value},listener:this});
               }
               else
               {
                  this.api.network.Items.drop(_loc2_.params.item.ID,Math.min(_loc2_.value,_loc2_.params.item.Quantity));
               }
            }
            break;
         case "move":
            if(_loc2_.value > 0 && !_global.isNaN(Number(_loc2_.value)))
            {
               this.api.network.Items.movement(_loc2_.params.item.ID,_loc2_.params.position,Math.min(_loc2_.value,_loc2_.params.item.Quantity));
               break;
            }
      }
   }
   function useItem(§\x1e\x19\x0e§)
   {
      if(!_loc2_.item.canUse || !this.api.datacenter.Player.canUseObject)
      {
         return undefined;
      }
      this.api.network.Items.use(_loc2_.item.ID);
   }
   function destroyItem(§\x1e\x19\x0e§)
   {
      if(_loc2_.item.Quantity > 1)
      {
         var _loc3_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc2_.item.Quantity,params:{type:"destroy",item:_loc2_.item}});
         _loc3_.addEventListener("validate",this);
      }
      else
      {
         this.askDestroy(_loc2_.item,1);
      }
   }
   function destroyMimibiote(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.item;
      var _loc4_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoDestroyMimibiote",{title:this.api.lang.getText("QUESTION"),text:this.api.lang.getText("DO_U_DESTROY_MIMIBIOTE",[_loc3_.name]),params:{item:_loc3_}});
      _loc4_.addEventListener("yes",this);
   }
   function targetItem(§\x1e\x19\x0e§)
   {
      if(!_loc2_.item.canTarget || !this.api.datacenter.Player.canUseObject)
      {
         return undefined;
      }
      this.api.kernel.GameManager.switchToItemTarget(_loc2_.item);
      this.callClose();
   }
   function yes(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "AskYesNoConfirmDropOne":
            this.api.network.Items.drop(_loc2_.target.params.item.ID,1);
            break;
         case "AskYesNoConfirmDrop":
            this.api.network.Items.drop(_loc2_.params.item.ID,Math.min(_loc2_.params.minValue,_loc2_.params.item.Quantity));
            break;
         case "AskYesNoDestroyMimibiote":
            this.api.network.Items.destroyMimibiote(_loc2_.target.params.item.ID);
            break;
         default:
            this.api.network.Items.destroy(_loc2_.target.params.item.ID,_loc2_.target.params.quantity);
      }
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "_cbTypes")
      {
         this._nSelectedTypeID = this._cbTypes.selectedItem.id;
         this.api.datacenter.Basics[dofus["\r\x14"].gapi.ui.Inventory.CLASS_NAME + "_subfilter_" + this._btnSelectedFilterButton._name] = this._nSelectedTypeID;
         this.updateData();
      }
   }
   function mountChanged(§\x1e\x19\x0e§)
   {
      var _loc3_ = this.api.datacenter.Player.mount;
      if(_loc3_ != undefined)
      {
         this._ctrMount.contentPath = "UI_InventoryMountIcon";
         this._mcMountCross._visible = false;
      }
      else
      {
         this._ctrMount.contentPath = "";
         this._mcMountCross._visible = true;
      }
      this.hideEpisodicContent();
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
            break;
         case this._btnFilterQuest:
            this.api.ui.showTooltip(this.api.lang.getText("QUEST_OBJECTS"),_loc2_.target,-20);
            break;
         default:
            this.api.ui.showTooltip(_loc2_.target.toolTipText,_loc2_.target,-20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.api.ui.hideTooltip();
   }
}
