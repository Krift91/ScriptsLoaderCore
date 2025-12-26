class dofus.§\x0b\b§.TutorialManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _oVars;
   var _oSequencer;
   var _oTutorial;
   var _oCurrentWaitingBloc;
   var _bInTutorialMode = false;
   static var _sSelf = null;
   function TutorialManager(oAPI)
   {
      super();
      dofus["\x0b\b"].TutorialManager._sSelf = this;
      this.initialize(oAPI);
   }
   function get isTutorialMode()
   {
      return this._bInTutorialMode;
   }
   function get vars()
   {
      var _loc2_ = new String();
      for(var k in this._oVars)
      {
         _loc2_ += k + ":" + this._oVars[k] + "\n";
      }
      return _loc2_;
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].TutorialManager._sSelf;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      this._oSequencer = new ank["\x1e\n\x07"]["\x1e\x12\x14"]();
   }
   function clear()
   {
      this._bInTutorialMode = false;
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"tutorial");
      this._oVars = new Object();
   }
   function start(§\x1e\x17\f§)
   {
      this._bInTutorialMode = true;
      this._oVars = new Object();
      this._oTutorial = _loc2_;
      var _loc3_ = _loc2_.getRootBloc();
      this.executeBloc(_loc3_);
      if(this._oTutorial.canCancel)
      {
         this.api.ui.loadUIComponent("Tutorial","Tutorial");
      }
   }
   function cancel()
   {
      var _loc2_ = this._oTutorial.getRootExitBloc();
      if(_loc2_ == undefined)
      {
         this.terminate(0);
      }
      else
      {
         this.executeBloc(_loc2_);
      }
   }
   function terminate(§\b\x1d§)
   {
      this.clear();
      var _loc3_ = this.api.datacenter.Player.data.cellNum;
      var _loc4_ = this.api.datacenter.Player.data.direction;
      this.api.network.Tutorial.end(_loc2_,_loc3_,_loc4_);
      this.api.ui.unloadUIComponent("Tutorial");
   }
   function forceTerminate()
   {
      this.clear();
      var _loc2_ = this.api.datacenter.Player.data.cellNum;
      var _loc3_ = this.api.datacenter.Player.data.direction;
      this.api.ui.unloadUIComponent("Tutorial");
   }
   function executeBloc(§\x1e\x1a\x05§)
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"tutorial");
      for(var i in _loc2_.params)
      {
         if(typeof _loc2_.params[i] == "string")
         {
            var _loc3_ = String(_loc2_.params[i]);
            if(_loc3_.substr(0,16) == "!LOCALIZEDSTRING" && _loc3_.substr(_loc3_.length - 1,1) == "!")
            {
               var _loc4_ = Number(_loc3_.substring(16,_loc3_.length - 1));
               if(!_global.isNaN(_loc4_))
               {
                  _loc2_.params[i] = this.api.lang.getTutorialText(_loc4_);
               }
            }
         }
         else if(typeof _loc2_.params[i] == "object")
         {
            for(var s in _loc2_.params[i])
            {
               if(typeof _loc2_.params[i][s] == "string")
               {
                  var _loc5_ = String(_loc2_.params[i][s]);
                  if(_loc5_.substr(0,16) == "!LOCALIZEDSTRING" && _loc5_.substr(_loc5_.length - 1,1) == "!")
                  {
                     var _loc6_ = Number(_loc5_.substring(16,_loc5_.length - 1));
                     if(!_global.isNaN(_loc6_))
                     {
                        _loc2_.params[i][s] = this.api.lang.getTutorialText(_loc6_);
                     }
                  }
               }
            }
         }
      }
      switch(_loc2_.type)
      {
         case dofus.datacenter["\x1e\n\x16"].TYPE_ACTION:
            if(!(_loc2_ instanceof dofus.datacenter["\x1e\n\x17"]))
            {
               ank["\x1e\n\x07"]["\x0b\f"].err("[executeBloc] le type ne correspond pas");
               return undefined;
            }
            if(!_loc2_.keepLastWaitingBloc)
            {
               delete this._oCurrentWaitingBloc;
            }
            switch(_loc2_.actionCode)
            {
               case "VAR_ADD":
                  this._oSequencer.addAction(126,false,this,this.addToVariable,_loc2_.params);
                  break;
               case "VAR_SET":
                  this._oSequencer.addAction(127,false,this,this.setToVariable,_loc2_.params);
                  break;
               case "CHAT":
                  this._oSequencer.addAction(128,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc2_.params[0],_loc2_.params[1]]);
                  break;
               case "GFX_CLEAN_MAP":
                  this._oSequencer.addAction(129,false,this.api.gfx,this.api.gfx.cleanMap,[undefined,true]);
                  break;
               case "GFX_SELECT":
                  this._oSequencer.addAction(130,false,this.api.gfx,this.api.gfx.select,[_loc2_.params[0],_loc2_.params[1]]);
                  break;
               case "GFX_UNSELECT":
                  this._oSequencer.addAction(131,false,this.api.gfx,this.api.gfx.unSelect,[_loc2_.params[0],_loc2_.params[1]]);
                  break;
               case "GFX_ALPHA":
                  this._oSequencer.addAction(132,false,this.api.gfx,this.api.gfx.setSpriteAlpha,[_loc2_.params[0],_loc2_.params[1]]);
                  break;
               case "GFX_GRID":
                  if(_loc2_.params[0] == true)
                  {
                     this._oSequencer.addAction(133,false,this.api.gfx,this.api.gfx.drawGrid,[false]);
                  }
                  else
                  {
                     this._oSequencer.addAction(134,false,this.api.gfx,this.api.gfx.removeGrid,[]);
                  }
                  break;
               case "GFX_ADD_INDICATOR":
                  var _loc7_ = this.api.gfx.mapHandler.getCellData(_loc2_.params[0]).mc;
                  if(_loc7_ == undefined)
                  {
                     ank["\x1e\n\x07"]["\x0b\f"].err("[GFX_ADD_INDICATOR] la cellule n\'existe pas");
                     break;
                  }
                  var _loc8_ = {x:_loc7_._x,y:_loc7_._y};
                  _loc7_._parent.localToGlobal(_loc8_);
                  var _loc9_ = _loc8_.x;
                  var _loc10_ = _loc8_.y;
                  this._oSequencer.addAction(135,false,this.api.ui,this.api.ui.unloadUIComponent,["Indicator"]);
                  this._oSequencer.addAction(136,false,this.api.ui,this.api.ui.loadUIComponent,["Indicator","Indicator",{coordinates:[_loc9_,_loc10_],offset:_loc2_.params[1],rotate:false},{bAlwaysOnTop:true}]);
                  break;
               case "GFX_ADD_PLAYER_SPRITE":
                  var _loc11_ = this.api.datacenter.Player.data;
                  this._oSequencer.addAction(137,false,this.api.gfx,this.api.gfx.addSprite,[_loc11_.id,_loc11_]);
                  break;
               case "GFX_ADD_SPRITE":
                  var _loc12_ = new dofus.datacenter["\x1e\x16\x13"](_loc2_.params[0],ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc2_.params[1] + ".swf",_loc2_.params[2],_loc2_.params[3],_loc2_.params[1]);
                  _loc12_.name = _loc2_.params[4] != undefined ? _loc2_.params[4] : "";
                  _loc12_.color1 = _loc2_.params[5] != undefined ? _loc2_.params[5] : -1;
                  _loc12_.color2 = _loc2_.params[6] != undefined ? _loc2_.params[6] : -1;
                  _loc12_.color3 = _loc2_.params[7] != undefined ? _loc2_.params[7] : -1;
                  this._oSequencer.addAction(138,false,this.api.gfx,this.api.gfx.addSprite,[_loc12_.id,_loc12_]);
                  break;
               case "GFX_REMOVE_SPRITE":
                  this._oSequencer.addAction(139,false,this.api.gfx,this.api.gfx.removeSprite,[_loc2_.params[0],false]);
                  break;
               case "GFX_MOVE_SPRITE":
                  var _loc13_ = this.getSpriteIDFromData(_loc2_.params[0]);
                  var _loc14_ = this.api.datacenter.Sprites.getItemAt(_loc13_);
                  var _loc15_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].pathFind(this.api,this.api.gfx.mapHandler,_loc14_.cellNum,_loc2_.params[1],{bAllDirections:false,bIgnoreSprites:true,bCellNumOnly:true,bWithBeginCellNum:true});
                  if(_loc15_ != null)
                  {
                     this.api.gfx.spriteHandler.moveSprite(_loc14_.id,_loc15_,this._oSequencer,false,undefined,false,false);
                  }
                  break;
               case "GFX_ADD_SPRITE_BUBBLE":
                  var _loc16_ = this.getSpriteIDFromData(_loc2_.params[0]);
                  this._oSequencer.addAction(140,true,this.api.gfx,this.api.gfx.removeSpriteBubble,[_loc16_],200);
                  this._oSequencer.addAction(141,false,this.api.gfx,this.api.gfx.addSpriteBubble,[_loc16_,_loc2_.params[1]]);
                  break;
               case "GFX_CLEAR_SPRITE_BUBBLES":
                  this._oSequencer.addAction(142,false,this.api.gfx.textHandler,this.api.gfx.textHandler.clear,[]);
                  break;
               case "GFX_SPRITE_DIR":
                  var _loc17_ = this.getSpriteIDFromData(_loc2_.params[0]);
                  this._oSequencer.addAction(143,false,this.api.gfx,this.api.gfx.setSpriteDirection,[_loc17_,_loc2_.params[1]]);
                  break;
               case "GFX_SPRITE_POS":
                  var _loc18_ = this.getSpriteIDFromData(_loc2_.params[0]);
                  this._oSequencer.addAction(144,false,this.api.gfx,this.api.gfx.setSpritePosition,[_loc18_,_loc2_.params[1]]);
                  break;
               case "GFX_SPRITE_VISUALEFFECT":
                  var _loc19_ = this.getSpriteIDFromData(_loc2_.params[0]);
                  var _loc20_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
                  _loc20_.file = dofus.Constants.SPELLS_PATH + _loc2_.params[1] + ".swf";
                  _loc20_.level = !_global.isNaN(Number(_loc2_.params[3])) ? Number(_loc2_.params[3]) : 1;
                  _loc20_.bInFrontOfSprite = true;
                  this._oSequencer.addAction(145,false,this.api.gfx,this.api.gfx.addVisualEffectOnSprite,[_loc19_,_loc20_,_loc2_.params[2],_loc2_.params[4]]);
                  break;
               case "GFX_SPRITE_ANIM":
                  var _loc21_ = this.getSpriteIDFromData(_loc2_.params[0]);
                  this._oSequencer.addAction(146,false,this.api.gfx,this.api.gfx.setSpriteAnim,[_loc21_,_loc2_.params[1]]);
                  break;
               case "GFX_SPRITE_EXEC_FUNCTION":
                  var _loc22_ = this.getSpriteIDFromData(_loc2_.params[0]);
                  var _loc23_ = this.api.datacenter.Sprites.getItemAt(_loc22_);
                  var _loc24_ = _loc23_[_loc2_.params[1]];
                  if(typeof _loc24_ != "function")
                  {
                     ank["\x1e\n\x07"]["\x0b\f"].err("[GFX_SPRITE_EXEC_FUNCTION] la fonction n\'existe pas");
                     break;
                  }
                  this._oSequencer.addAction(147,false,_loc23_,_loc24_,_loc2_.params[2]);
                  break;
               case "GFX_SPRITE_SET_PROPERTY":
                  var _loc25_ = this.getSpriteIDFromData(_loc2_.params[0]);
                  var _loc26_ = this.api.datacenter.Sprites.getItemAt(_loc25_);
                  this._oSequencer.addAction(148,false,this,this.setObjectPropertyValue,[_loc26_,_loc2_.params[1],_loc2_.params[2]]);
                  break;
               case "GFX_DRAW_ZONE":
                  this._oSequencer.addAction(149,false,this.api.gfx,this.api.gfx.drawZone,_loc2_.params);
                  break;
               case "GFX_CLEAR_ALL_ZONES":
                  this._oSequencer.addAction(150,false,this.api.gfx,this.api.gfx.clearAllZones,[]);
                  break;
               case "GFX_ADD_POINTER_SHAPE":
                  this._oSequencer.addAction(151,false,this.api.gfx,this.api.gfx.addPointerShape,_loc2_.params);
                  break;
               case "GFX_CLEAR_POINTER":
                  this._oSequencer.addAction(152,false,this.api.gfx,this.api.gfx.clearPointer,[]);
                  break;
               case "GFX_HIDE_POINTER":
                  this._oSequencer.addAction(153,false,this.api.gfx,this.api.gfx.hidePointer,[]);
                  break;
               case "GFX_DRAW_POINTER":
                  this._oSequencer.addAction(154,false,this.api.gfx,this.api.gfx.drawPointer,_loc2_.params);
                  break;
               case "GFX_OBJECT2_INTERACTIVE":
                  this._oSequencer.addAction(155,false,this.api.gfx,this.api.gfx.setObject2Interactive,[_loc2_.params[0],_loc2_.params[1],1]);
                  break;
               case "INTERAC_SET":
                  this._oSequencer.addAction(156,false,this.api.gfx,this.api.gfx.setInteraction,[ank.battlefield.Constants[_loc2_.params[0]]]);
                  break;
               case "INTERAC_SET_ONCELLS":
                  this._oSequencer.addAction(157,false,this.api.gfx,this.api.gfx.setInteractionOnCells,[_loc2_.params[0],ank.battlefield.Constants[_loc2_.params[1]]]);
                  break;
               case "UI_ADD_INDICATOR":
                  var _loc27_ = this.api.ui.getUIComponent(_loc2_.params[0]);
                  var _loc28_ = eval(_loc27_ + "." + _loc2_.params[1]);
                  var _loc29_ = _loc28_.getBounds();
                  var _loc30_ = _loc29_.xMax - _loc29_.xMin;
                  var _loc31_ = _loc29_.yMax - _loc29_.yMin;
                  var _loc32_ = _loc30_ / 2 + _loc28_._x + _loc29_.xMin;
                  var _loc33_ = _loc31_ / 2 + _loc28_._y + _loc29_.yMin;
                  var _loc34_ = {x:_loc32_,y:_loc33_};
                  _loc28_._parent.localToGlobal(_loc34_);
                  _loc32_ = _loc34_.x;
                  _loc33_ = _loc34_.y;
                  var _loc35_ = Math.sqrt(Math.pow(_loc30_,2) + Math.pow(_loc31_,2)) / 2;
                  this._oSequencer.addAction(158,false,this.api.ui,this.api.ui.unloadUIComponent,["Indicator"]);
                  this._oSequencer.addAction(159,false,this.api.ui,this.api.ui.loadUIComponent,["Indicator","Indicator",{coordinates:[_loc32_,_loc33_],offset:_loc35_},{bAlwaysOnTop:true}]);
                  break;
               case "UI_REMOVE_INDICATOR":
                  this._oSequencer.addAction(160,false,this.api.ui,this.api.ui.unloadUIComponent,["Indicator"]);
                  break;
               case "UI_OPEN":
                  this._oSequencer.addAction(161,false,this.api.ui,this.api.ui.loadUIComponent,[_loc2_.params[0],_loc2_.params[0],_loc2_.params[1],_loc2_.params[2]]);
                  break;
               case "UI_OPEN_AUTOHIDE":
                  this._oSequencer.addAction(162,false,this.api.ui,this.api.ui.loadUIAutoHideComponent,[_loc2_.params[0],_loc2_.params[0],_loc2_.params[1],_loc2_.params[2]]);
                  break;
               case "UI_CLOSE":
                  this._oSequencer.addAction(163,false,this.api.ui,this.api.ui.unloadUIComponent,[_loc2_.params[0]]);
                  break;
               case "UI_EXEC_FUNCTION":
                  var _loc36_ = this.api.ui.getUIComponent(_loc2_.params[0]);
                  var _loc37_ = _loc36_[_loc2_.params[1]];
                  if(typeof _loc37_ != "function")
                  {
                     ank["\x1e\n\x07"]["\x0b\f"].err("[UI_EXEC_FUNCTION] la fonction n\'existe pas");
                     break;
                  }
                  this._oSequencer.addAction(164,false,_loc36_,_loc37_,_loc2_.params[2]);
                  break;
               case "ADD_SPELL":
                  var _loc38_ = new dofus.datacenter["\x1e\x0e\x1c"](_loc2_.params[0],_loc2_.params[1],_loc2_.params[2]);
                  this._oSequencer.addAction(165,false,this.api.datacenter.Player,this.api.datacenter.Player.updateSpellPosition,[_loc38_]);
                  break;
               case "SET_SPELLS":
                  this._oSequencer.addAction(166,false,this.api.network.Spells,this.api.network.Spells.onList,[_loc2_.params.join(";")]);
                  break;
               case "REMOVE_SPELL":
                  this._oSequencer.addAction(167,false,this.api.datacenter.Player,this.api.datacenter.Player.removeSpell,_loc2_.params);
                  break;
               case "END":
                  this._oSequencer.addAction(168,false,this,this.terminate,_loc2_.params);
                  if(!this._oSequencer.isPlaying())
                  {
                     this._oSequencer.execute(true);
                  }
                  return undefined;
               default:
                  ank["\x1e\n\x07"]["\x0b\f"].err("[executeBloc] Code action " + _loc2_.actionCode + " inconnu");
                  return undefined;
            }
            this._oSequencer.addAction(169,false,this,this.callNextBloc,[_loc2_.nextBlocID]);
            if(!this._oSequencer.isPlaying())
            {
               this._oSequencer.execute(true);
            }
            break;
         case dofus.datacenter["\x1e\n\x16"].TYPE_WAITING:
            this._oCurrentWaitingBloc = _loc2_;
            if(!(_loc2_ instanceof dofus.datacenter["\x1e\n\x14"]))
            {
               ank["\x1e\n\x07"]["\x0b\f"].log("[executeBloc] le type ne correspond pas");
               return undefined;
            }
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"tutorial");
            if(_loc2_.timeout != 0)
            {
               ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"tutorial",this,this.onWaitingTimeout,_loc2_.timeout,[_loc2_]);
            }
            break;
         case dofus.datacenter["\x1e\n\x16"].TYPE_IF:
            if(!(_loc2_ instanceof dofus.datacenter["\x1e\n\x15"]))
            {
               ank["\x1e\n\x07"]["\x0b\f"].log("[executeBloc] le type ne correspond pas");
               return undefined;
            }
            var _loc39_ = this.extractValue(_loc2_.left);
            var _loc40_ = this.extractValue(_loc2_.right);
            var _loc41_ = false;
            switch(_loc2_.operator)
            {
               case "=":
                  _loc41_ = _loc39_ == _loc40_;
                  break;
               case "<":
                  _loc41_ = _loc39_ < _loc40_;
                  break;
               case ">":
                  _loc41_ = _loc39_ > _loc40_;
            }
            if(_loc41_)
            {
               this._oSequencer.addAction(170,false,this,this.callNextBloc,[_loc2_.nextBlocTrueID]);
            }
            else
            {
               this._oSequencer.addAction(171,false,this,this.callNextBloc,[_loc2_.nextBlocFalseID]);
            }
            if(!this._oSequencer.isPlaying())
            {
               this._oSequencer.execute(true);
            }
            break;
         default:
            ank["\x1e\n\x07"]["\x0b\f"].log("[executeBloc] mauvais type");
      }
   }
   function callNextBloc(§\n\x03§)
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"tutorial");
      if(typeof _loc2_ == "object")
      {
         var _loc3_ = _loc2_[random(_loc2_.length)];
      }
      else
      {
         _loc3_ = _loc2_;
      }
      this.addToQueue({object:this,method:this.executeBloc,params:[this._oTutorial.getBloc(_loc3_)]});
   }
   function callCurrentBlocDefaultCase()
   {
      var _loc2_ = this._oCurrentWaitingBloc.cases[dofus.datacenter["\x1e\n\x13"].CASE_DEFAULT];
      if(_loc2_ != undefined)
      {
         this.callNextBloc(_loc2_.nextBlocID);
      }
   }
   function setObjectPropertyValue(§\x1e\x18\x10§, §\x1e\x0e\x0b§, §\t\x06§)
   {
      if(_loc2_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setObjectPropertyValue] l\'objet n\'existe pas");
         return undefined;
      }
      _loc2_[_loc3_] = _loc4_;
   }
   function getSpriteIDFromData(§\n\x06§)
   {
      if(typeof _loc2_ == "number")
      {
         return _loc2_ != 0 ? _loc2_ : this.api.datacenter.Player.ID;
      }
      if(typeof _loc2_ == "string")
      {
         return this.api.datacenter.Map.data[_loc2_.substr(1)].spriteOnID;
      }
   }
   function setToVariable(§\x1e\x0b\x18§, §\x1e\x1b\n§)
   {
      _loc2_ = this.extractVarName(_loc2_);
      this._oVars[_loc2_] = _loc3_;
   }
   function addToVariable(§\x1e\x0b\x18§, §\x1e\x1b\n§)
   {
      _loc2_ = this.extractVarName(_loc2_);
      if(this._oVars[_loc2_] == undefined)
      {
         this._oVars[_loc2_] = _loc3_;
      }
      else
      {
         this._oVars[_loc2_] += _loc3_;
      }
   }
   function extractVarName(§\x1e\x0b\x18§)
   {
      var _loc3_ = _loc2_.split("|");
      if(_loc3_.length != 0)
      {
         _loc2_ = _loc3_[0];
         var _loc4_ = 1;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ += "_" + this._oVars[_loc3_[_loc4_]];
            _loc4_ = _loc4_ + 1;
         }
      }
      return _loc2_;
   }
   function extractValue(§\t\x05§)
   {
      if(typeof _loc2_ == "string")
      {
         return this._oVars[this.extractVarName(_loc2_)];
      }
      return _loc2_;
   }
   function onWaitingTimeout(§\x1e\x1a\x05§)
   {
      this.callNextBloc(_loc2_.cases[dofus.datacenter["\x1e\n\x13"].CASE_TIMEOUT].nextBlocID);
   }
   function onWaitingCase(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.code;
      var _loc4_ = _loc2_.params;
      var _loc5_ = this._oCurrentWaitingBloc.cases[_loc3_];
      if(_loc5_ != undefined)
      {
         switch(_loc5_.code)
         {
            case "CELL_RELEASE":
            case "CELL_OVER":
            case "CELL_OUT":
            case "SPRITE_RELEASE":
            case "SPELL_CONTAINER_SELECT":
            case "OBJECT_CONTAINER_SELECT":
               var _loc6_ = 0;
               while(_loc6_ < _loc5_.params.length)
               {
                  if(_loc4_[0] == _loc5_.params[_loc6_][0])
                  {
                     this.callNextBloc(_loc5_.nextBlocID[_loc6_] != undefined ? _loc5_.nextBlocID[_loc6_] : _loc5_.nextBlocID);
                     return undefined;
                  }
                  _loc6_ = _loc6_ + 1;
               }
               break;
            case "OBJECT_RELEASE":
               var _loc7_ = 0;
               while(_loc7_ < _loc5_.params.length)
               {
                  if(_loc4_[0] == _loc5_.params[_loc7_][0] && _loc4_[1] == _loc5_.params[_loc7_][1])
                  {
                     this.callNextBloc(_loc5_.nextBlocID[_loc7_] != undefined ? _loc5_.nextBlocID[_loc7_] : _loc5_.nextBlocID);
                     return undefined;
                  }
                  _loc7_ = _loc7_ + 1;
               }
               break;
            default:
               this.callNextBloc(_loc5_.nextBlocID);
               return undefined;
         }
         this.callCurrentBlocDefaultCase();
      }
      else
      {
         this.callCurrentBlocDefaultCase();
      }
   }
}
