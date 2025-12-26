if(!dofus["\r\x14"].gapi.ui.ForgemagusCraft)
{
   if(!dofus)
   {
      _global.dofus = new Object();
   }
   if(!dofus["\r\x14"])
   {
      _global.dofus["\r\x14"] = new Object();
   }
   if(!dofus["\r\x14"].gapi)
   {
      _global.dofus["\r\x14"].gapi = new Object();
   }
   if(!dofus["\r\x14"].gapi.ui)
   {
      _global.dofus["\r\x14"].gapi.ui = new Object();
   }
   dofus["\r\x14"].gapi.ui.ForgemagusCraft = function()
   {
      super();
      this._cgLocal._visible = false;
      this._cgDistant._visible = false;
   } extends dofus["\r\x14"].gapi.core["\x10\x19"];
   var _loc1_ = dofus["\r\x14"].gapi.ui.ForgemagusCraft = function()
   {
      super();
      this._cgLocal._visible = false;
      this._cgDistant._visible = false;
   }.prototype;
   _loc1_.__get__currentOverItem = function __get__currentOverItem()
   {
      return this._oOverItem;
   };
   _loc1_.__get__itemViewer = function __get__itemViewer()
   {
      return this._itvItemViewer;
   };
   _loc1_.__set__maxItem = function __set__maxItem(§\x03\x02§)
   {
      this._nMaxItem = Number(_loc2_);
      return this.maxItem;
   };
   _loc1_.__set__skillId = function __set__skillId(§\x1e\x1d\x0b§)
   {
      this._nSkillId = Number(_loc2_);
      this._nForgemagusItemType = _global.API.lang.getSkillForgemagus(this._nSkillId);
      return this.skillId;
   };
   _loc1_.__set__dataProvider = function __set__dataProvider(§\x10\x0b§)
   {
      this._eaDataProvider.removeEventListener("modelChanged",this);
      this._eaDataProvider = _loc2_;
      this._eaDataProvider.addEventListener("modelChanged",this);
      this.modelChanged();
      return this.dataProvider;
   };
   _loc1_.__set__localDataProvider = function __set__localDataProvider(§\x10\x04§)
   {
      this._eaLocalDataProvider.removeEventListener("modelChanged",this);
      this._eaLocalDataProvider = _loc2_;
      this._eaLocalDataProvider.addEventListener("modelChanged",this);
      this.modelChanged();
      return this.localDataProvider;
   };
   _loc1_.__set__distantDataProvider = function __set__distantDataProvider(§\x10\n§)
   {
      this._eaDistantDataProvider.removeEventListener("modelChanged",this);
      this._eaDistantDataProvider = _loc2_;
      this._eaDistantDataProvider.addEventListener("modelChanged",this);
      this.modelChanged();
      return this.distantDataProvider;
   };
   _loc1_.init = function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.ForgemagusCraft.CLASS_NAME);
      this.api.datacenter.Basics.aks_exchange_isForgemagus = true;
   };
   _loc1_.destroy = function destroy()
   {
      this.gapi.hideTooltip();
      this.api.datacenter.Basics.aks_exchange_isForgemagus = false;
   };
   _loc1_.callClose = function callClose()
   {
      this.api.network.Exchange.leave();
      return true;
   };
   _loc1_.createChildren = function createChildren()
   {
      this._bMakeAll = false;
      this._mcPlacer._visible = false;
      this.addToQueue({object:this,method:this.addListeners});
      this._btnSelectedFilterButton = this._btnFilterRessoureces;
      this.addToQueue({object:this,method:this.initData});
      this.hideItemViewer(true);
      this.addToQueue({object:this,method:this.initTexts});
   };
   _loc1_.addListeners = function addListeners()
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
      this._ctrItem.addEventListener("dblClick",this);
      this._ctrItem.addEventListener("drag",this);
      this._ctrItem.addEventListener("drop",this);
      this._ctrItem.addEventListener("click",this);
      this._ctrSignature.addEventListener("dblClick",this);
      this._ctrSignature.addEventListener("drag",this);
      this._ctrSignature.addEventListener("drop",this);
      this._ctrSignature.addEventListener("click",this);
      this._ctrRune.addEventListener("dblClick",this);
      this._ctrRune.addEventListener("drag",this);
      this._ctrRune.addEventListener("drop",this);
      this._ctrRune.addEventListener("click",this);
      this._cgDistant.addEventListener("selectItem",this);
      this._cgDistant.addEventListener("overItem",this);
      this._cgDistant.addEventListener("outItem",this);
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
      this._btnOneShot.addEventListener("click",this);
      this._btnLoop.addEventListener("click",this);
      this.api.datacenter.Exchange.addEventListener("localKamaChange",this);
      this.api.datacenter.Exchange.addEventListener("distantKamaChange",this);
      this.api.datacenter.Player.addEventListener("kamaChanged",this);
      this.addToQueue({object:this,method:this.kamaChanged,params:[{value:this.api.datacenter.Player.Kama}]});
      this._cbTypes.addEventListener("itemSelected",this);
      this._cgDistant.multipleContainerSelectionEnabled = false;
      this._cgGrid.multipleContainerSelectionEnabled = false;
      this._cgLocal.multipleContainerSelectionEnabled = false;
      this._cgLocalSave.multipleContainerSelectionEnabled = false;
   };
   _loc1_.initTexts = function initTexts()
   {
      this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
      this._winInventory.title = this.api.datacenter.Player.data.name;
      this._lblNewObject.text = this.api.lang.getText("CRAFTED_ITEM");
      this._lblSkill.text = this.api.lang.getText("SKILL") + " : " + this.api.lang.getSkillText(this._nSkillId).d;
      this._lblItemTitle.text = this.api.lang.getText("FM_CRAFT_ITEM");
      this._lblRuneTitle.text = this.api.lang.getText("FM_CRAFT_RUNE");
      this._lblSignatureTitle.text = this.api.lang.getText("FM_CRAFT_SIGNATURE");
      this._btnOneShot.label = this.api.lang.getText("APPLY_ONE_RUNE");
      this._btnLoop.label = this.api.lang.getText("APPLY_MULTIPLE_RUNES");
   };
   _loc1_.initData = function initData()
   {
      this.dataProvider = this.api.datacenter.Exchange.inventory;
      this.localDataProvider = this.api.datacenter.Exchange.localGarbage;
      this.distantDataProvider = this.api.datacenter.Exchange.distantGarbage;
   };
   _loc1_.updateData = function updateData()
   {
      if(this._bIsLooping)
      {
         return undefined;
      }
      var _loc2_ = this.api.datacenter.Basics[dofus["\r\x14"].gapi.ui.ForgemagusCraft.CLASS_NAME + "_subfilter_" + this._btnSelectedFilterButton._name];
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
   };
   _loc1_.setType = function setType(§\x1e\x1b\x12§)
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
   };
   _loc1_.updateLocalData = function updateLocalData()
   {
      this._cgLocal.dataProvider = this._eaLocalDataProvider;
      this._ctrItem.contentData = this._ctrRune.contentData = this._ctrSignature.contentData = undefined;
      var _loc2_ = 0;
      while(_loc2_ < this._eaLocalDataProvider.length)
      {
         var _loc3_ = false;
         var _loc4_ = 0;
         while(_loc4_ < dofus["\r\x14"].gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE.length)
         {
            if(dofus["\r\x14"].gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE[_loc4_] == this._eaLocalDataProvider[_loc2_].unicID)
            {
               this._ctrSignature.contentData = this._eaLocalDataProvider[_loc2_];
               _loc3_ = true;
               break;
            }
            _loc4_ = _loc4_ + 1;
         }
         var _loc5_ = 0;
         while(_loc5_ < dofus["\r\x14"].gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT.length)
         {
            if(dofus["\r\x14"].gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT[_loc5_] == this._eaLocalDataProvider[_loc2_].type)
            {
               this._ctrRune.contentData = this._eaLocalDataProvider[_loc2_];
               _loc3_ = true;
               break;
            }
            _loc5_ = _loc5_ + 1;
         }
         if(!_loc3_)
         {
            this._ctrItem.contentData = this._eaLocalDataProvider[_loc2_];
            if(this._ctrItem.contentData != undefined)
            {
               this.hideItemViewer(false);
               this._itvItemViewer.itemData = this._ctrItem.contentData;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   };
   _loc1_.updateDistantData = function updateDistantData()
   {
      this._cgDistant.dataProvider = this._eaDistantDataProvider;
      var _loc2_ = this._cgDistant.getContainer(0).contentData;
      if(_loc2_ != undefined)
      {
         this.hideItemViewer(false);
         this._itvItemViewer.itemData = _loc2_;
      }
      this._bInvalidateDistant = true;
   };
   _loc1_.hideItemViewer = function hideItemViewer(§\x19\t§)
   {
      this._itvItemViewer._visible = !_loc2_;
      this._winItemViewer._visible = !_loc2_;
   };
   _loc1_.validateDrop = function validateDrop(§\x1e\f\x1c§, §\x1e\x19\x03§, §\x1e\x1b\n§)
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
            break;
         case "_ctrItem":
         case "_ctrRune":
         case "_ctrSignature":
            var _loc5_ = false;
            var _loc6_ = false;
            switch(_loc2_)
            {
               case "_ctrItem":
                  if(this._nForgemagusItemType != _loc3_.type || !_loc3_.enhanceable)
                  {
                     return undefined;
                  }
                  var _loc7_ = 0;
                  while(_loc7_ < this._eaLocalDataProvider.length)
                  {
                     var _loc8_ = false;
                     var _loc9_ = 0;
                     while(_loc9_ < dofus["\r\x14"].gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE.length)
                     {
                        if(dofus["\r\x14"].gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE[_loc9_] == this._eaLocalDataProvider[_loc7_].unicID)
                        {
                           _loc8_ = true;
                        }
                        _loc9_ = _loc9_ + 1;
                     }
                     var _loc10_ = 0;
                     while(_loc10_ < dofus["\r\x14"].gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT.length)
                     {
                        if(dofus["\r\x14"].gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT[_loc10_] == this._eaLocalDataProvider[_loc7_].type)
                        {
                           _loc8_ = true;
                        }
                        _loc10_ = _loc10_ + 1;
                     }
                     if(!_loc8_)
                     {
                        this.api.network.Exchange.movementItem(false,this._eaLocalDataProvider[_loc7_],this._eaLocalDataProvider[_loc7_].Quantity);
                     }
                     _loc7_ = _loc7_ + 1;
                  }
                  _loc5_ = true;
                  break;
               case "_ctrRune":
                  var _loc11_ = 0;
                  while(_loc11_ < this._eaLocalDataProvider.length)
                  {
                     var _loc12_ = 0;
                     while(_loc12_ < dofus["\r\x14"].gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT.length)
                     {
                        if(dofus["\r\x14"].gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT[_loc12_] == this._eaLocalDataProvider[_loc11_].type && this._eaLocalDataProvider[_loc11_].unicID != _loc3_.unicID)
                        {
                           this.api.network.Exchange.movementItem(false,this._eaLocalDataProvider[_loc11_],this._eaLocalDataProvider[_loc11_].Quantity);
                        }
                        _loc12_ = _loc12_ + 1;
                     }
                     _loc11_ = _loc11_ + 1;
                  }
                  break;
               case "_ctrSignature":
                  var _loc13_ = 0;
                  while(_loc13_ < this._eaLocalDataProvider.length)
                  {
                     var _loc14_ = 0;
                     while(_loc14_ < dofus["\r\x14"].gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE.length)
                     {
                        if(dofus["\r\x14"].gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE[_loc14_] == this._eaLocalDataProvider[_loc13_].unicID)
                        {
                           this.api.network.Exchange.movementItem(false,this._eaLocalDataProvider[_loc13_],this._eaLocalDataProvider[_loc13_].Quantity);
                        }
                        _loc14_ = _loc14_ + 1;
                     }
                     _loc13_ = _loc13_ + 1;
                  }
                  if(this.getCurrentCraftLevel() < 100)
                  {
                     _loc6_ = true;
                     this.api.kernel.showMessage(undefined,this.api.lang.getText("CRAFT_LEVEL_DOESNT_ALLOW_A_SIGNATURE"),"ERROR_CHAT");
                  }
                  _loc5_ = true;
            }
            if(!_loc6_)
            {
               this.api.network.Exchange.movementItem(true,_loc3_,!_loc5_ ? _loc4_ : 1);
               break;
            }
      }
      if(this._bInvalidateDistant)
      {
         this.api.datacenter.Exchange.clearDistantGarbage();
         this._bInvalidateDistant = false;
      }
   };
   _loc1_.getCurrentCraftLevel = function getCurrentCraftLevel()
   {
      var _loc2_ = this.api.datacenter.Player.Jobs;
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc4_ = 0;
         while(_loc4_ < _loc2_[_loc3_].skills.length)
         {
            if(dofus.datacenter["\x1e\x10\x1d"](dofus.datacenter.Job(_loc2_[_loc3_]).skills[_loc4_]).id == this._nSkillId)
            {
               return dofus.datacenter.Job(_loc2_[_loc3_]).level;
            }
            _loc4_ = _loc4_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      return 0;
   };
   _loc1_.setReady = function setReady()
   {
      if(this.api.datacenter.Exchange.localGarbage.length == 0)
      {
         return undefined;
      }
      this.api.network.Exchange.ready();
   };
   _loc1_.canDropInGarbage = function canDropInGarbage(§\x1e\x19\x03§)
   {
      var _loc3_ = this.api.datacenter.Exchange.localGarbage.findFirstItem("ID",_loc2_.ID);
      var _loc4_ = this.api.datacenter.Exchange.localGarbage.length;
      if(_loc3_.index == -1 && _loc4_ >= this._nMaxItem)
      {
         return false;
      }
      return true;
   };
   _loc1_.recordGarbage = function recordGarbage()
   {
      this._aGarbageMemory = new Array();
      var _loc2_ = 0;
      while(_loc2_ < this._eaLocalDataProvider.length)
      {
         var _loc3_ = this._eaLocalDataProvider[_loc2_];
         this._aGarbageMemory.push({id:_loc3_.ID,quantity:_loc3_.Quantity});
         _loc2_ = _loc2_ + 1;
      }
   };
   _loc1_.cleanGarbage = function cleanGarbage()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._eaLocalDataProvider.length)
      {
         var _loc3_ = this._eaLocalDataProvider[_loc2_];
         this.api.network.Exchange.movementItem(false,_loc3_,_loc3_.Quantity);
         _loc2_ = _loc2_ + 1;
      }
   };
   _loc1_.recallGarbageMemory = function recallGarbageMemory()
   {
      if(this._aGarbageMemory == undefined || this._aGarbageMemory.length == 0)
      {
         return false;
      }
      this.cleanGarbage();
      var _loc2_ = 0;
      while(_loc2_ < this._aGarbageMemory.length)
      {
         var _loc3_ = this._aGarbageMemory[_loc2_];
         var _loc4_ = this._eaDataProvider.findFirstItem("ID",_loc3_.id);
         if(_loc4_.index == -1)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CRAFT_NO_RESOURCE"),"ERROR_BOX",{name:"NotEnougth"});
            return false;
         }
         if(_loc4_.item.Quantity < _loc3_.quantity)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CRAFT_NOT_ENOUGHT",[_loc4_.item.name]),"ERROR_BOX",{name:"NotEnougth"});
            return false;
         }
         this.api.network.Exchange.movementItem(true,_loc4_.item,_loc3_.quantity);
         _loc2_ = _loc2_ + 1;
      }
      return true;
   };
   _loc1_.nextCraft = function nextCraft()
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"doNextCraft",this,this.doNextCraft,250);
   };
   _loc1_.doNextCraft = function doNextCraft()
   {
      if(this.recallGarbageMemory() == false)
      {
         this.stopMakeAll();
      }
   };
   _loc1_.stopMakeAll = function stopMakeAll()
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"doNextCraft");
      this._bMakeAll = false;
      this._cgLocal.dataProvider = this.api.datacenter.Exchange.localGarbage;
      this.updateData();
      this.updateDistantData();
   };
   _loc1_.kamaChanged = function kamaChanged(§\x1e\x19\x0e§)
   {
      this._lblKama.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   };
   _loc1_.modelChanged = function modelChanged(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._eaLocalDataProvider:
            if(this._bMakeAll)
            {
               if(this._eaLocalDataProvider.length == 0)
               {
                  this.nextCraft();
               }
               else if(this._aGarbageMemory.length != undefined && this._aGarbageMemory.length == this._eaLocalDataProvider.length)
               {
                  this.setReady();
               }
            }
            else
            {
               this.updateLocalData();
            }
            break;
         case this._eaDistantDataProvider:
            if(!this._bMakeAll && !this._bIsLooping)
            {
               this.updateDistantData();
            }
            break;
         case this._eaDataProvider:
            if(!this._bMakeAll && !this._bIsLooping)
            {
               this.updateData();
            }
            break;
         default:
            if(!this._bMakeAll && !this._bIsLooping)
            {
               this.updateData();
               this.updateLocalData();
               this.updateDistantData();
               break;
            }
      }
   };
   _loc1_.over = function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnFilterEquipement:
            this.api.ui.showTooltip(this.api.lang.getText("EQUIPEMENT"),_loc2_.target,-20);
            break;
         case this._btnFilterNonEquipement:
            §§push(-20);
            §§push(_loc2_.target);
            §§push(this.api.lang.getText("NONEQUIPEMENT"));
            §§push(3);
            §§push(this);
            §§push("api");
         default:
            §§pop()[§§pop()].ui.showTooltip();
            break;
         case this._btnFilterRessoureces:
            this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),_loc2_.target,-20);
      }
   };
   _loc1_.out = function out(§\x1e\x19\x0e§)
   {
      this["\x04\x01\b4{invalid_utf8=150}\x03"]["\x01"]["\'{invalid_utf8=157}\x02"]();
   };
   _loc1_["\x12{invalid_utf8=157}\x02"] = function §\x12{invalid_utf8=157}\x02§()
   {
      this[""] = false;
      this["2{invalid_utf8=255}<N{invalid_utf8=150}\x02"] = 1;
      this["2{invalid_utf8=157}\x02"][""] = this["\x04\x01\b4{invalid_utf8=150}\x03"]["{invalid_utf8=153}\x02"]("\x04\x01\b{invalid_utf8=190}4{invalid_utf8=157}\x02");
      this["\b"]["\b\x04N{invalid_utf8=150}\x02"] = true;
   };
   _loc1_["\b{invalid_utf8=152}N{invalid_utf8=150}\x02"] = function §\b{invalid_utf8=152}N{invalid_utf8=150}\x02§()
   {
      var _loc2_ = this["\x07"]["\x03\x17{invalid_utf8=150}\x03"]["{invalid_utf8=130}"] - 1;
      if(_loc2_ <= 1)
      {
         return undefined;
      }
      this[""] = true;
      this["\x04\x01\b4{invalid_utf8=150}\x03"]["\x17{invalid_utf8=150}\x04"]["\x04\x01\b~N\x12\x12{invalid_utf8=157}\x02"]["\b{invalid_utf8=152}N{invalid_utf8=150}\x02"](_loc2_);
      this["2{invalid_utf8=157}\x02"][""] = this["\x04\x01\b4{invalid_utf8=150}\x03"]["{invalid_utf8=153}\x02"]("\x04\bN{invalid_utf8=150}\x04");
      this["\b"]["\b\x04N{invalid_utf8=150}\x02"] = false;
   };
   _loc1_["\x04\x03\b{invalid_utf8=137}NI\x12{invalid_utf8=157}\x02"] = function §\x04\x03\b{invalid_utf8=137}NI\x12{invalid_utf8=157}\x02§()
   {
      if(this["{invalid_utf8=147}{invalid_utf8=255}\"N{invalid_utf8=150}\x02"]["\x03\x17{invalid_utf8=150}\x03"] == undefined || this["\x07"]["\x03\x17{invalid_utf8=150}\x03"] == undefined)
      {
         this["\x04\x01\b4{invalid_utf8=150}\x03"]["\b\x03N{invalid_utf8=150}\x02"]["\b\x04N{invalid_utf8=150}\x02"](this["\x04\x01\b4{invalid_utf8=150}\x03"]["{invalid_utf8=153}\x02"]("\bL{invalid_utf8=135}\x01"),this["\x04\x01\b4{invalid_utf8=150}\x03"]["{invalid_utf8=153}\x02"]("&\x01{invalid_utf8=150}\x02"),"\x06\x17{invalid_utf8=153}\x02");
         return true;
      }
      return false;
   };
   _loc1_["\b{invalid_utf8=146}NI\x12{invalid_utf8=157}\x02"] = function §\b{invalid_utf8=146}NI\x12{invalid_utf8=157}\x02§(§\x1e\x19\x0e§)
   {
      switch(_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"])
      {
         case this[""]:
            this["\n"]();
            break;
         case this["\b"]:
            if(this["\x04\x03\b{invalid_utf8=137}NI\x12{invalid_utf8=157}\x02"]())
            {
               return undefined;
            }
            this["\x05"]();
            this["\b"]();
            break;
         case this["2{invalid_utf8=157}\x02"]:
            if(this[""])
            {
               this["\x04\x01\b4{invalid_utf8=150}\x03"]["\x17{invalid_utf8=150}\x04"]["\x04\x01\b~N\x12\x12{invalid_utf8=157}\x02"]["\x06{invalid_utf8=150}\x02"]();
               return undefined;
            }
            if(this["\x04\x03\b{invalid_utf8=137}NI\x12{invalid_utf8=157}\x02"]())
            {
               return undefined;
            }
            this["\x05"]();
            this["\b"]();
            this[":\x01{invalid_utf8=150}\x04"]({:this,:this["\b{invalid_utf8=152}N{invalid_utf8=150}\x02"]});
            break;
         case this["{invalid_utf8=147}{invalid_utf8=255}\"N{invalid_utf8=150}\x02"]:
         case this["\x07"]:
         case this["{invalid_utf8=182}{invalid_utf8=255}{invalid_utf8=150}\t"]:
            if(_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"] == undefined)
            {
               this["\x0e"](true);
            }
            else
            {
               if(eval("\x11\x01#N{invalid_utf8=150}\x02")["\b\x03N{invalid_utf8=150}\x02"](eval("{invalid_utf8=150}\x05")["\x05"]["\x12{invalid_utf8=157}\x02"]))
               {
                  this["\x04\x01\b4{invalid_utf8=150}\x03"]["\b\x03N{invalid_utf8=150}\x02"]["\b\x04N{invalid_utf8=150}\x02"]["\b{invalid_utf8=152}N{invalid_utf8=150}\x02"](_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"]);
                  return undefined;
               }
               this["\x0e"](false);
               this["n\x01{invalid_utf8=150}\x06"]["\x03>{invalid_utf8=150}\x04"] = _loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"];
            }
            break;
         default:
            if(_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"] != this["\x04\x01\b4N\x12L\x12{invalid_utf8=150}\x02"])
            {
               this["\x04\x01\b4N\x12L\x12{invalid_utf8=150}\x02"]["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"] = false;
               this["\x04\x01\b4N\x12L\x12{invalid_utf8=150}\x02"] = _loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"];
               switch(_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"][""])
               {
                  case "":
                     this[""] = eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["\x18{invalid_utf8=255}{invalid_utf8=150}\x02"];
                     this.o["{invalid_utf8=150}\t"] = this["\x04\x01\b4{invalid_utf8=150}\x03"]["{invalid_utf8=153}\x02"]("\x07");
                     break;
                  case "":
                     this[""] = eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["\x05"];
                     this.o["{invalid_utf8=150}\t"] = this["\x04\x01\b4{invalid_utf8=150}\x03"]["{invalid_utf8=153}\x02"]("\x04\x06\x03I{invalid_utf8=150}\x02");
                     break;
                  case "\x05\x01{invalid_utf8=157}\x02":
                     this[""] = eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["\x12{invalid_utf8=157}\x02"];
                     this.o["{invalid_utf8=150}\t"] = this["\x04\x01\b4{invalid_utf8=150}\x03"]["{invalid_utf8=153}\x02"]("\x05");
               }
               this["\x07"](true);
               break;
            }
            _loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"] = true;
            break;
      }
   };
   _loc1_["\x05\x01{invalid_utf8=157}\x02"] = function §\x05\x01{invalid_utf8=157}\x02§(§\x1e\x19\x0e§)
   {
      _loc2_["\x05{invalid_utf8=255}#{invalid_utf8=153}\x02"] = this[""];
      this["\x07"](_loc2_);
   };
   _loc1_["\b{invalid_utf8=146}N{invalid_utf8=150}\x04"] = function §\b{invalid_utf8=146}N{invalid_utf8=150}\x04§(§\x1e\x19\x0e§)
   {
      this(_loc2_);
   };
   _loc1_["\x04\x01\b\"N{invalid_utf8=150}\x02"] = function §\x04\x01\b"N{invalid_utf8=150}\x02§(§\x1e\x19\x0e§)
   {
      var _loc3_ = this["cD{invalid_utf8=136}\x04"]["\x0b"]();
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      this["cD{invalid_utf8=136}\x04"]["{invalid_utf8=150}\x02"]();
      if(_loc3_[""] == -2)
      {
         return undefined;
      }
      if(!this["\b\x01N{invalid_utf8=150}\x02"](_loc3_))
      {
         return undefined;
      }
      var _loc4_ = false;
      var _loc5_ = false;
      switch(_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"])
      {
         case this["{invalid_utf8=147}{invalid_utf8=255}\"N{invalid_utf8=150}\x02"]:
            _loc4_ = _loc5_ = true;
            var _loc6_ = 0;
            while(_loc6_ < eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["{invalid_utf8=150}\x01"]["{invalid_utf8=171}\x02{invalid_utf8=150}\x04"])
            {
               if(eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["{invalid_utf8=150}\x01"][_loc6_] == _loc3_[""])
               {
                  _loc4_ = false;
               }
               _loc6_ = _loc6_ + 1;
            }
            var _loc7_ = 0;
            while(_loc7_ < eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["\x04\x03\x03I\x12{invalid_utf8=157}\x02"]["{invalid_utf8=171}\x02{invalid_utf8=150}\x04"])
            {
               if(eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["\x04\x03\x03I\x12{invalid_utf8=157}\x02"][_loc7_] == _loc3_["\x05"])
               {
                  _loc4_ = false;
               }
               _loc7_ = _loc7_ + 1;
            }
            break;
         case this["\x07"]:
            var _loc8_ = 0;
            while(_loc8_ < eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["{invalid_utf8=150}\x01"]["{invalid_utf8=171}\x02{invalid_utf8=150}\x04"])
            {
               if(eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["{invalid_utf8=150}\x01"][_loc8_] == _loc3_[""])
               {
                  _loc4_ = true;
               }
               _loc8_ = _loc8_ + 1;
            }
            break;
         case this["{invalid_utf8=182}{invalid_utf8=255}{invalid_utf8=150}\t"]:
            var _loc9_ = 0;
            while(_loc9_ < eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["\x04\x03\x03I\x12{invalid_utf8=157}\x02"]["{invalid_utf8=171}\x02{invalid_utf8=150}\x04"])
            {
               if(eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["\x04\x03\x03I\x12{invalid_utf8=157}\x02"][_loc9_] == _loc3_["\x05"])
               {
                  _loc4_ = true;
               }
               _loc9_ = _loc9_ + 1;
            }
            _loc5_ = true;
      }
      if(!_loc4_)
      {
         return undefined;
      }
      if(!_loc5_ && _loc3_["{invalid_utf8=130}"] > 1)
      {
         var _loc10_ = this["cD{invalid_utf8=136}\x04"]["\b\x02{invalid_utf8=150}\x02"]("\b\x01N{invalid_utf8=150}\x02","\b\x01N{invalid_utf8=150}\x02",{§{invalid_utf8=191}{invalid_utf8=255}\x17{invalid_utf8=150}\x04§:1,§\x04\bP{invalid_utf8=135}\x01§:_loc3_["{invalid_utf8=130}"],§\x03I\x12L\x12{invalid_utf8=157}\x02§:{§\b\x17{invalid_utf8=150}\x04§:"{invalid_utf8=150}\x02",§\x04\b\b§:_loc3_,§\x1c{invalid_utf8=150}\x02§:_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"][""]}});
         _loc10_["\x17{invalid_utf8=150}\x04"]("\x05\x01{invalid_utf8=157}\x02",this);
      }
      else
      {
         this["{invalid_utf8=223}\x01\'\x12{invalid_utf8=157}\x02"](_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"][""],_loc3_,1);
      }
   };
   _loc1_["{invalid_utf8=166}{invalid_utf8=255}#{invalid_utf8=135}\x01"] = function §{invalid_utf8=166}{invalid_utf8=255}#{invalid_utf8=135}\x01§(§\x1e\x19\x03§)
   {
      var _loc3_ = new eval("")[""]["4P{invalid_utf8=157}\x02"]();
      _loc3_(_loc2_);
      this[""] = _loc3_;
   };
   _loc1_["\n\x01{invalid_utf8=150}\x04"] = function §\n\x01{invalid_utf8=150}\x04§(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"];
      _loc3_["\x0b"](_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"],_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"]["\x07\x17{invalid_utf8=153}\x02"]);
      this["{invalid_utf8=150}\x04"] = _loc3_;
   };
   _loc1_["\x04\x01\b4N\x12L\x12{invalid_utf8=150}\x02"] = function §\x04\x01\b4N\x12L\x12{invalid_utf8=150}\x02§(§\x1e\x19\x0e§)
   {
      this["cD{invalid_utf8=136}\x04"]["\'{invalid_utf8=157}\x02"]();
      this["{invalid_utf8=150}\x04"] = undefined;
   };
   _loc1_["\x07"] = function §\x07§(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"];
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      var _loc4_ = _loc3_["{invalid_utf8=130}"];
      var _loc5_ = _loc2_["\x05{invalid_utf8=255}#{invalid_utf8=153}\x02"][""];
      switch(_loc5_)
      {
         case "":
            if(this["\b\x01N{invalid_utf8=150}\x02"](_loc3_))
            {
               var _loc6_ = undefined;
               var _loc7_ = 0;
               while(_loc7_ < eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["\x04\x03\x03I\x12{invalid_utf8=157}\x02"]["{invalid_utf8=171}\x02{invalid_utf8=150}\x04"] && _loc6_ == undefined)
               {
                  if(eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["\x04\x03\x03I\x12{invalid_utf8=157}\x02"][_loc7_] == _loc3_["\x05"])
                  {
                     _loc6_ = "{invalid_utf8=182}{invalid_utf8=255}{invalid_utf8=150}\t";
                  }
                  _loc7_ = _loc7_ + 1;
               }
               var _loc8_ = 0;
               while(_loc8_ < eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["{invalid_utf8=150}\x01"]["{invalid_utf8=171}\x02{invalid_utf8=150}\x04"] && _loc6_ == undefined)
               {
                  if(eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["{invalid_utf8=150}\x01"][_loc8_] == _loc3_[""])
                  {
                     _loc6_ = "\x07";
                  }
                  _loc8_ = _loc8_ + 1;
               }
               if(_loc6_ == undefined)
               {
                  _loc6_ = "{invalid_utf8=147}{invalid_utf8=255}\"N{invalid_utf8=150}\x02";
               }
               this["{invalid_utf8=223}\x01\'\x12{invalid_utf8=157}\x02"](_loc6_,_loc3_,_loc4_);
            }
            break;
         case "":
            this["{invalid_utf8=223}\x01\'\x12{invalid_utf8=157}\x02"]("",_loc3_,_loc4_);
      }
   };
   _loc1_[""] = function §§(§\x1e\x19\x0e§)
   {
      this["cD{invalid_utf8=136}\x04"]["{invalid_utf8=150}\x02"]();
      if(_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"] == undefined)
      {
         return undefined;
      }
      this["cD{invalid_utf8=136}\x04"]["{invalid_utf8=150}\x02"](_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"]);
   };
   _loc1_[""] = function §§(§\x1e\x19\x0e§)
   {
      var _loc3_ = this["cD{invalid_utf8=136}\x04"]["\x0b"]();
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      this["cD{invalid_utf8=136}\x04"]["{invalid_utf8=150}\x02"]();
      var _loc4_ = _loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x04\x07P{invalid_utf8=135}\x01"]["\x04\x07P{invalid_utf8=135}\x01"][""];
      switch(_loc4_)
      {
         case "":
            if(_loc3_[""] == -1)
            {
               return undefined;
            }
            break;
         case "":
            if(_loc3_[""] == -2)
            {
               return undefined;
            }
            if(!this["\b\x01N{invalid_utf8=150}\x02"](_loc3_))
            {
               return undefined;
            }
            break;
      }
      if(_loc3_["{invalid_utf8=130}"] > 1)
      {
         var _loc5_ = this["cD{invalid_utf8=136}\x04"]["\b\x02{invalid_utf8=150}\x02"]("\b\x01N{invalid_utf8=150}\x02","\b\x01N{invalid_utf8=150}\x02",{§{invalid_utf8=191}{invalid_utf8=255}\x17{invalid_utf8=150}\x04§:1,§\x04\bP{invalid_utf8=135}\x01§:_loc3_["{invalid_utf8=130}"],§\x03I\x12L\x12{invalid_utf8=157}\x02§:{§\b\x17{invalid_utf8=150}\x04§:"{invalid_utf8=150}\x02",§\x04\b\b§:_loc3_,§\x1c{invalid_utf8=150}\x02§:_loc4_}});
         _loc5_["\x17{invalid_utf8=150}\x04"]("\x05\x01{invalid_utf8=157}\x02",this);
      }
      else
      {
         this["{invalid_utf8=223}\x01\'\x12{invalid_utf8=157}\x02"](_loc4_,_loc3_,1);
      }
   };
   _loc1_["\x04\x01\b{invalid_utf8=148}R\x17{invalid_utf8=153}\x02"] = function §\x04\x01\b{invalid_utf8=148}R\x17{invalid_utf8=153}\x02§(§\x1e\x19\x0e§)
   {
      if(_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"] == undefined)
      {
         this["\x0e"](true);
      }
      else
      {
         if(eval("\x11\x01#N{invalid_utf8=150}\x02")["\b\x03N{invalid_utf8=150}\x02"](eval("{invalid_utf8=150}\x05")["\x05"]["\x12{invalid_utf8=157}\x02"]))
         {
            this["\x04\x01\b4{invalid_utf8=150}\x03"]["\b\x03N{invalid_utf8=150}\x02"]["\b\x04N{invalid_utf8=150}\x02"]["\b{invalid_utf8=152}N{invalid_utf8=150}\x02"](_loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"]);
            return undefined;
         }
         this["\x0e"](false);
         this["n\x01{invalid_utf8=150}\x06"]["\x03>{invalid_utf8=150}\x04"] = _loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"]["\x03\x17{invalid_utf8=150}\x03"];
      }
   };
   _loc1_["\x05\x01{invalid_utf8=157}\x02"] = function §\x05\x01{invalid_utf8=157}\x02§(§\x1e\x19\x0e§)
   {
      switch(_loc2_["\x03I\x12L\x12{invalid_utf8=157}\x02"]["\b\x17{invalid_utf8=150}\x04"])
      {
         case "{invalid_utf8=150}\x02":
            this["{invalid_utf8=223}\x01\'\x12{invalid_utf8=157}\x02"](_loc2_["\x03I\x12L\x12{invalid_utf8=157}\x02"]["\x1c{invalid_utf8=150}\x02"],_loc2_["\x03I\x12L\x12{invalid_utf8=157}\x02"]["\x04\b\b"],_loc2_["{invalid_utf8=191}{invalid_utf8=255}\x17{invalid_utf8=150}\x04"]);
            break;
         case "\x07\x17{invalid_utf8=150}\x04":
            var _loc3_ = Number(_loc2_["{invalid_utf8=191}{invalid_utf8=255}\x17{invalid_utf8=150}\x04"]);
            if(_loc3_ < 1 || (_loc3_ == undefined || O["\x04\x07\b"](_loc3_)))
            {
               _loc3_ = 1;
            }
            this["2{invalid_utf8=255}<N{invalid_utf8=150}\x02"] = _loc3_;
      }
   };
   _loc1_["{invalid_utf8=154}{invalid_utf8=255}$N\x12L\x12{invalid_utf8=157}\x02"] = function §{invalid_utf8=154}{invalid_utf8=255}$N\x12L\x12{invalid_utf8=157}\x02§(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_["\b{invalid_utf8=146}NHL\x12{invalid_utf8=157}\x02"][""]) === "\n")
      {
         this["\x04\x01\b{invalid_utf8=154}R\x17{invalid_utf8=153}\x02"] = this["\n"]["\x1c{invalid_utf8=150}\x02"]["0\x0e\"{invalid_utf8=142}\r"];
         this["\x04\x01\b4{invalid_utf8=150}\x03"][""]["\b"][eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["v\x01{invalid_utf8=150}\x04"] + "" + this["\x04\x01\b4N\x12L\x12{invalid_utf8=150}\x02"][""]] = this["\x04\x01\b{invalid_utf8=154}R\x17{invalid_utf8=153}\x02"];
         this["\x07"]();
      }
   };
   _loc1_["\b\x01N{invalid_utf8=150}\x02"]("",function()
   {
   }
   ,_loc1_[""]);
   _loc1_["\b\x01N{invalid_utf8=150}\x02"]("e{invalid_utf8=255}iR\x17{invalid_utf8=150}\t",function()
   {
   }
   ,_loc1_["\x05"]);
   _loc1_["\b\x01N{invalid_utf8=150}\x02"]("\b\x02N{invalid_utf8=150}\x02",function()
   {
   }
   ,_loc1_["{invalid_utf8=150}\x06"]);
   _loc1_["\b\x01N{invalid_utf8=150}\x02"]("\b\x03{invalid_utf8=150}\x02",function()
   {
   }
   ,_loc1_["\x04"]);
   _loc1_["\b\x01N{invalid_utf8=150}\x02"]("\x05\x01{invalid_utf8=157}\x02",_loc1_["\x04\x01\b\"Nf{invalid_utf8=157}\x02"],function()
   {
   }
   );
   _loc1_["\b\x01N{invalid_utf8=150}\x02"]("\x07{invalid_utf8=255}O{invalid_utf8=150}\x04",_loc1_[""],function()
   {
   }
   );
   _loc1_["\b\x01N{invalid_utf8=150}\x02"]("",function()
   {
   }
   ,_loc1_["\x0e"]);
   "\x04"(_loc1_,null,1);
   dofus["\r\x14"].gapi.ui.ForgemagusCraft = function()
   {
      super();
      this._cgLocal._visible = false;
      this._cgDistant._visible = false;
   }["v\x01{invalid_utf8=150}\x04"] = "{invalid_utf8=194}";
   dofus["\r\x14"].gapi.ui.ForgemagusCraft = function()
   {
      super();
      this._cgLocal._visible = false;
      this._cgDistant._visible = false;
   }["\x18{invalid_utf8=255}{invalid_utf8=150}\x02"] = [false,true,true,true,true,true,false,true,true,false,true,true,true,true,false];
   dofus["\r\x14"].gapi.ui.ForgemagusCraft = function()
   {
      super();
      this._cgLocal._visible = false;
      this._cgDistant._visible = false;
   }["\x05"] = [false,false,false,false,false,false,true,false,false,false,false,false,false,false,false];
   dofus["\r\x14"].gapi.ui.ForgemagusCraft = function()
   {
      super();
      this._cgLocal._visible = false;
      this._cgDistant._visible = false;
   }["\x12{invalid_utf8=157}\x02"] = [false,false,false,false,false,false,false,false,false,true,false,false,false,false,false];
   dofus["\r\x14"].gapi.ui.ForgemagusCraft = function()
   {
      super();
      this._cgLocal._visible = false;
      this._cgDistant._visible = false;
   }["\b\x07f{invalid_utf8=157}\x02"] = 38;
   dofus["\r\x14"].gapi.ui.ForgemagusCraft = function()
   {
      super();
      this._cgLocal._visible = false;
      this._cgDistant._visible = false;
   }["{invalid_utf8=150}\x01"] = [26,78];
   dofus["\r\x14"].gapi.ui.ForgemagusCraft = function()
   {
      super();
      this._cgLocal._visible = false;
      this._cgDistant._visible = false;
   }["\x04\x03\x03I\x12{invalid_utf8=157}\x02"] = [7508];
   _loc1_["\t"] = false;
   _loc1_[""] = eval("{invalid_utf8=150}\x05")["\x07<{invalid_utf8=221}|\x10Q{invalid_utf8=157}\x02"]["cD{invalid_utf8=136}\x04"]["\x01"]["{invalid_utf8=194}"]["\x12{invalid_utf8=157}\x02"];
   _loc1_["\x04\x01\b{invalid_utf8=154}R\x17{invalid_utf8=153}\x02"] = 0;
   _loc1_["2{invalid_utf8=255}<N{invalid_utf8=150}\x02"] = 1;
}
