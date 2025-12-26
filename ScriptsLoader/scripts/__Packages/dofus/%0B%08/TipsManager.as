class dofus.§\x0b\b§.TipsManager extends ank.§\x1e\n\x07§.§\x1e\x15\x11§
{
   var api;
   var _aTipsList;
   var _aTipsStates;
   var _soTips;
   var _aInterfaceTriggers;
   var _aMapsTriggers;
   static var TIP_START_POPUP = 3;
   static var TIP_GAIN_LEVEL = 19;
   static var TIP_FIGHT_PLACEMENT = 5;
   static var TIP_FIGHT_START = 7;
   static var TIP_FIGHT_ENDMOVE = 8;
   static var TIP_FIGHT_ENDATTACK = 10;
   static var TIP_FIGHT_ENDFIGHT = 12;
   static var TIP_QUEST_WALKTHOUGH = 31;
   static var TIP_FINAL_COUNTDOWN = 34;
   static var INDICATOR_SHOWUP_TIME = 5;
   static var TRIGGER_TYPE_MAP = 1;
   static var TRIGGER_TYPE_GUI = 2;
   static var _sSelf = null;
   var _aIndicatorTimers = new Array();
   var _nIndicatorIndex = 0;
   function TipsManager(oAPI)
   {
      super();
      dofus["\x0b\b"].TipsManager._sSelf = this;
      this.initialize(oAPI);
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].TipsManager._sSelf;
   }
   function initialize(oAPI)
   {
      this.api = oAPI;
      this._aTipsList = new Array();
      this.addToQueue({object:this,method:this.loadTipsStates});
   }
   function showNewTip(§\x1e\x1b\x17§)
   {
      if(!this.getIsDisplayingFreshTips())
      {
         this.setHasBeenDisplayed(_loc2_);
      }
      else if(!this.getHasBeenDisplayed(_loc2_))
      {
         var _loc3_ = dofus["\r\x14"].gapi.controls.Helper.getCurrentHelper();
         if(_loc3_ == null)
         {
            return undefined;
         }
         _loc3_.onNewTip();
         this.addTipToList(_loc2_);
         this.setHasBeenDisplayed(_loc2_);
      }
   }
   function displayNextTips()
   {
      if(!this.hasNewTips())
      {
         return undefined;
      }
      var _loc2_ = this.getTipToDisplay();
      this.showFloatingTips(_loc2_);
      var _loc3_ = dofus["\r\x14"].gapi.controls.Helper.getCurrentHelper();
      if(_loc3_ == null)
      {
         return undefined;
      }
      _loc3_.onRemoveTip();
   }
   function hasNewTips()
   {
      return this._aTipsList.length > 0;
   }
   function resetDisplayedTipsList()
   {
      this._aTipsStates = new Array();
      this.saveTipsStates();
   }
   function pointGUI(§\x1e\x13\x15§, §\x1e\x1b§)
   {
      var _loc4_ = this.api.ui.getUIComponent(_loc2_);
      var _loc5_ = _loc3_[0];
      var _loc6_ = _loc4_[_loc5_];
      var _loc7_ = 1;
      while(_loc7_ < _loc3_.length)
      {
         _loc5_ = String(_loc3_[_loc7_]);
         if(_loc6_[_loc5_] == undefined)
         {
            break;
         }
         _loc6_ = _loc6_[_loc5_];
         _loc7_ = _loc7_ + 1;
      }
      if(_loc6_ == undefined)
      {
         return undefined;
      }
      var _loc8_ = _loc6_.getBounds();
      var _loc9_ = _loc8_.xMax - _loc8_.xMin;
      var _loc10_ = _loc8_.yMax - _loc8_.yMin;
      var _loc11_ = _loc9_ / 2 + _loc6_._x + _loc8_.xMin;
      var _loc12_ = _loc10_ / 2 + _loc6_._y + _loc8_.yMin;
      var _loc13_ = {x:_loc11_,y:_loc12_};
      _loc6_._parent.localToGlobal(_loc13_);
      _loc11_ = _loc13_.x;
      _loc12_ = _loc13_.y;
      var _loc14_ = Math.sqrt(Math.pow(_loc9_,2) + Math.pow(_loc10_,2)) / 2;
      this.api.ui.loadUIComponent("Indicator","Indicator" + this._nIndicatorIndex,{coordinates:[_loc11_,_loc12_],offset:_loc14_},{bAlwaysOnTop:true});
      this._aIndicatorTimers[this._nIndicatorIndex] = _global.setInterval(this,"onIndicatorHide",dofus["\x0b\b"].TipsManager.INDICATOR_SHOWUP_TIME * 1000,this._nIndicatorIndex++);
   }
   function pointCell(§\x03\x0b§, §\x07\x12§, §\x02\x02§)
   {
      if(this.api.datacenter.Basics.aks_current_map_id == _loc2_ || _loc2_ == -1)
      {
         var _loc5_ = this.api.gfx.mapHandler.getCellData(_loc3_).mc;
         if(_loc5_ == undefined)
         {
            return undefined;
         }
         var _loc6_ = {x:_loc5_._x,y:_loc5_._y};
         _loc5_._parent.localToGlobal(_loc6_);
         var _loc7_ = _loc6_.x;
         var _loc8_ = _loc6_.y;
         this.api.ui.loadUIComponent("Indicator","Indicator" + this._nIndicatorIndex,{coordinates:[_loc7_,_loc8_],offset:_loc4_,rotate:false},{bAlwaysOnTop:true});
         this._aIndicatorTimers[this._nIndicatorIndex] = _global.setInterval(this,"onIndicatorHide",dofus["\x0b\b"].TipsManager.INDICATOR_SHOWUP_TIME * 1000,this._nIndicatorIndex++);
      }
      return undefined;
   }
   function pointSprite(§\x03\x0b§, §\x04\x19§)
   {
      if(this.api.datacenter.Basics.aks_current_map_id == _loc2_ || _loc2_ == -1)
      {
         var _loc4_ = this.api.gfx.spriteHandler.getSprites().getItems();
         for(var k in _loc4_)
         {
            if(_loc4_[k].gfxFile == dofus.Constants.CLIPS_PERSOS_PATH + _loc3_ + ".swf")
            {
               var _loc5_ = {x:_loc4_[k].mc._x,y:_loc4_[k].mc._y};
               _loc4_[k].localToGlobal(_loc5_);
               var _loc6_ = _loc5_.x;
               var _loc7_ = _loc5_.y;
               var _loc8_ = _loc4_[k].mc._height;
               this.api.ui.loadUIComponent("Indicator","Indicator" + this._nIndicatorIndex,{coordinates:[_loc6_,_loc7_],offset:_loc8_,rotate:false},{bAlwaysOnTop:true});
               this._aIndicatorTimers[this._nIndicatorIndex] = _global.setInterval(this,"onIndicatorHide",dofus["\x0b\b"].TipsManager.INDICATOR_SHOWUP_TIME * 1000,this._nIndicatorIndex++);
            }
         }
      }
      return undefined;
   }
   function pointPicto(§\x03\x0b§, §\x01\x10§)
   {
      if(this.api.datacenter.Basics.aks_current_map_id == _loc2_ || _loc2_ == -1)
      {
         var _loc4_ = this.api.gfx.mapHandler.getCellsData();
         for(var k in _loc4_)
         {
            if(_loc4_[k].layerObject1Num != undefined && (!_global.isNaN(_loc4_[k].layerObject1Num) && _loc4_[k].layerObject1Num > 0))
            {
               if(_loc4_[k].layerObject1Num == _loc3_)
               {
                  this.pointCell(_loc2_,_loc4_[k].num,_loc4_[k].mcObject1._height);
               }
            }
            if(_loc4_[k].layerObject2Num != undefined && (!_global.isNaN(_loc4_[k].layerObject2Num) && _loc4_[k].layerObject2Num > 0))
            {
               if(_loc4_[k].layerObject2Num == _loc3_)
               {
                  this.pointCell(_loc2_,_loc4_[k].num,_loc4_[k].mcObject2._height);
               }
            }
         }
      }
      return undefined;
   }
   function getTipToDisplay()
   {
      var _loc2_ = Number(this._aTipsList.pop());
      return _loc2_;
   }
   function showFloatingTips(§\x1e\x1b\x17§)
   {
      var _loc3_ = this.api.kernel.OptionsManager.getOption("FloatingTipsCoord");
      var _loc4_ = this.api.ui.loadUIComponent("FloatingTips","FloatingTips",{tip:_loc2_,position:_loc3_},{bStayIfPresent:true,bAlwaysOnTop:true});
   }
   function addTipToList(§\x1e\x1b\x17§)
   {
      this._aTipsList.push(_loc2_);
      this.saveTipsList();
   }
   function getHasBeenDisplayed(§\x1e\x1b\x17§)
   {
      return this._aTipsStates[_loc2_] == true;
   }
   function setHasBeenDisplayed(§\x1e\x1b\x17§, §\x1b\x04§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = true;
      }
      if(this._aTipsStates[_loc2_] != _loc3_)
      {
         this._aTipsStates[_loc2_] = _loc3_;
         this.saveTipsStates();
      }
   }
   function getIsDisplayingFreshTips()
   {
      if(this.api.datacenter.Player.isAuthorized)
      {
         return false;
      }
      if(this.api.config.isExpo)
      {
         return true;
      }
      return this.api.kernel.OptionsManager.getOption("DisplayingFreshTips");
   }
   function setIsDisplayingFreshTips(§\x1b\x03§)
   {
      this.api.kernel.OptionsManager.setOption("DisplayingFreshTips",_loc2_);
   }
   function getTipsSharedObject()
   {
      if(this._soTips == undefined)
      {
         this._soTips = SharedObject.getLocal(dofus.Constants.GLOBAL_SO_TIPS_NAME);
      }
      return this._soTips;
   }
   function loadTipsStates()
   {
      if(this.api.config.isExpo)
      {
         this._aTipsStates = new Array();
      }
      else
      {
         var _loc2_ = this.getTipsSharedObject();
         this._aTipsStates = _loc2_.data.TIPSSTATES;
         if(this._aTipsStates == undefined)
         {
            this._aTipsStates = new Array();
            _loc2_.flush();
         }
      }
   }
   function saveTipsStates()
   {
      if(!this.api.config.isExpo)
      {
         var _loc2_ = this.getTipsSharedObject();
         _loc2_.data.TIPSSTATES = this._aTipsStates;
         _loc2_.flush();
      }
   }
   function saveTipsList()
   {
      var _loc2_ = this.getTipsSharedObject();
      _loc2_.data.TIPSLIST = this._aTipsList;
      _loc2_.flush();
   }
   function getInterfaceTriggers()
   {
      if(this._aInterfaceTriggers != undefined)
      {
         return this._aInterfaceTriggers;
      }
      var _loc2_ = this.api.lang.getKnownledgeBaseTriggers();
      if(_loc2_ == undefined)
      {
         return new Array();
      }
      this._aInterfaceTriggers = new Array();
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(_loc2_[_loc3_].t == dofus["\x0b\b"].TipsManager.TRIGGER_TYPE_GUI)
         {
            this._aInterfaceTriggers["GUI" + _loc2_[_loc3_].v] = _loc2_[_loc3_].d;
         }
         _loc3_ = _loc3_ + 1;
      }
      return this._aInterfaceTriggers;
   }
   function getMapsTriggers()
   {
      if(this._aMapsTriggers != undefined)
      {
         return this._aMapsTriggers;
      }
      var _loc2_ = this.api.lang.getKnownledgeBaseTriggers();
      if(_loc2_ == undefined)
      {
         return new Array();
      }
      this._aMapsTriggers = new Array();
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(_loc2_[_loc3_].t == dofus["\x0b\b"].TipsManager.TRIGGER_TYPE_MAP)
         {
            var _loc4_ = _loc2_[_loc3_].v;
            var _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               if(this._aMapsTriggers["MAP" + _loc4_[_loc5_]] != undefined)
               {
                  this._aMapsTriggers["MAP" + _loc4_[_loc5_]] = this._aMapsTriggers["MAP" + _loc4_[_loc5_]] + "|" + _loc2_[_loc3_].d;
               }
               else
               {
                  this._aMapsTriggers["MAP" + _loc4_[_loc5_]] = _loc2_[_loc3_].d;
               }
               _loc5_ = _loc5_ + 1;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      return this._aMapsTriggers;
   }
   function onIndicatorHide(§\x04\t§)
   {
      _global.clearInterval(this._aIndicatorTimers[_loc2_]);
      this.api.ui.unloadUIComponent("Indicator" + _loc2_);
   }
   function onNewMap(§\x03\x0b§)
   {
      var _loc3_ = String(this.getMapsTriggers()["MAP" + _loc2_]);
      if(_loc3_ != undefined && _loc3_.length > 0)
      {
         var _loc4_ = _loc3_.split("|");
         var _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            if(_loc4_[_loc5_] != undefined && !_global.isNaN(_loc4_[_loc5_]))
            {
               this.showNewTip(Number(_loc4_[_loc5_]));
            }
            _loc5_ = _loc5_ + 1;
         }
      }
   }
   function onNewInterface(§\x1e\x10\r§)
   {
      var _loc3_ = this.getInterfaceTriggers()["GUI" + _loc2_];
      if(_loc3_ != undefined && !_global.isNaN(_loc3_))
      {
         this.showNewTip(_loc3_);
      }
   }
   function onLink(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.params.split(",");
      switch(_loc3_[0])
      {
         case "CellIndicator":
            var _loc4_ = Number(_loc3_[1]);
            var _loc5_ = Number(_loc3_[2]);
            var _loc6_ = Number(_loc3_[3]);
            this.addToQueue({object:this,method:this.pointCell,params:[_loc4_,_loc5_,_loc6_]});
            break;
         case "UiIndicator":
            var _loc7_ = _loc3_[1];
            var _loc8_ = new Array();
            var _loc9_ = 2;
            while(_loc9_ < _loc3_.length)
            {
               _loc8_.push(_loc3_[_loc9_]);
               _loc9_ = _loc9_ + 1;
            }
            this.addToQueue({object:this,method:this.pointGUI,params:[_loc7_,_loc8_]});
            break;
         case "SpriteIndicator":
            var _loc10_ = Number(_loc3_[1]);
            var _loc11_ = Number(_loc3_[2]);
            this.addToQueue({object:this,method:this.pointSprite,params:[_loc10_,_loc11_]});
            break;
         case "PictoIndicator":
            var _loc12_ = Number(_loc3_[1]);
            var _loc13_ = Number(_loc3_[2]);
            this.addToQueue({object:this,method:this.pointPicto,params:[_loc12_,_loc13_]});
            break;
         case "PointCompass":
            var _loc14_ = Number(_loc3_[1]);
            var _loc15_ = Number(_loc3_[2]);
            this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.updateCompass,params:[_loc14_,_loc15_,true]});
            break;
         case "KnownledgeBase":
            var _loc16_ = Number(_loc3_[1]);
            this.addToQueue({object:this.api.ui,method:this.api.ui.loadUIComponent,params:["KnownledgeBase","KnownledgeBase",{article:_loc16_}]});
      }
   }
}
