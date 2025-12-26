class dofus.aks.Game extends dofus.aks.Handler
{
   static var TYPE_SOLO = 1;
   static var TYPE_FIGHT = 2;
   var _bIsBusy = false;
   var _aGameSpriteLeftHistory = new Array();
   var nLastMapIdReceived = -1;
   function Game(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function get isBusy()
   {
      return this._bIsBusy;
   }
   function create()
   {
      this.aks.send("GC" + dofus.aks.Game.TYPE_SOLO);
   }
   function leave(§\x1e\r\x0e§)
   {
      this.aks.send("GQ" + (_loc2_ != undefined ? _loc2_ : ""));
   }
   function setPlayerPosition(§\x07\x11§)
   {
      this.aks.send("Gp" + _loc2_,true);
   }
   function ready(§\x16\f§)
   {
      this.aks.send("GR" + (!_loc2_ ? "0" : "1"));
   }
   function getMapData(§\x03\x0b§)
   {
      if(this.api.lang.getConfigText("ENABLE_CLIENT_MAP_REQUEST"))
      {
         this.aks.send("GD" + (_loc2_ == undefined ? "" : String(_loc2_)));
      }
   }
   function getExtraInformations()
   {
      this.aks.send("GI");
   }
   function turnEnd()
   {
      if(this.api.datacenter.Player.isCurrentPlayer)
      {
         this.aks.send("Gt",false);
      }
   }
   function turnOk(§\x1e\r\x0e§)
   {
      this.aks.send("GT" + (_loc2_ == undefined ? "" : _loc2_),false);
   }
   function turnOk2(§\x1e\r\x0e§)
   {
      this.aks.send("GT" + (_loc2_ == undefined ? "" : _loc2_),false);
   }
   function askDisablePVPMode()
   {
      this.aks.send("GP*",false);
   }
   function enabledPVPMode(§\x1a\r§)
   {
      this.aks.send("GP" + (!_loc2_ ? "-" : "+"),false);
   }
   function freeMySoul()
   {
      this.aks.send("GF",false);
   }
   function setFlag(§\x07\x12§)
   {
      this.aks.send("Gf" + _loc2_,false);
   }
   function showFightChallengeTarget(§\x13\x02§)
   {
      this.aks.send("Gdi" + _loc2_,false);
   }
   function onCreate(§\x14\x16§, §\x1e\x12\r§)
   {
      if(!_loc2_)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[onCreate] Impossible de créer la partie");
         return undefined;
      }
      var _loc4_ = _loc3_.split("|");
      var _loc5_ = Number(_loc4_[0]);
      if(_loc5_ != 1)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[onCreate] Type incorrect");
         return undefined;
      }
      this.api.datacenter.Game = new dofus.datacenter.Game();
      this.api.datacenter.Game.state = _loc5_;
      var _loc6_ = dofus["\r\x14"].gapi.ui.Banner(this.api.ui.getUIComponent("Banner"));
      dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(_loc6_);
      this.api.datacenter.Player.data.initAP(false);
      this.api.datacenter.Player.data.initMP(false);
      this.api.datacenter.Player.SpellsManager.clear();
      this.api.datacenter.Player.data.CharacteristicsManager.initialize();
      this.api.datacenter.Player.data.EffectsManager.initialize();
      this.api.datacenter.Player.clearSummon();
      this.api.gfx.cleanMap(1);
      this.onCreateSolo();
   }
   function onJoin(§\x1e\x12\r§)
   {
      this.api.datacenter.Player.guildInfos.defendedTaxCollectorID = undefined;
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = _loc3_[1] != "0" ? true : false;
      var _loc6_ = _loc3_[2] != "0" ? true : false;
      var _loc7_ = _loc3_[3] != "0" ? true : false;
      var _loc8_ = Number(_loc3_[4]);
      var _loc9_ = Number(_loc3_[5]);
      this.api.datacenter.Game = new dofus.datacenter.Game();
      this.api.datacenter.Game.state = _loc4_;
      this.api.datacenter.Game.fightType = _loc9_;
      var _loc10_ = this.api.ui.getUIComponent("Banner");
      _loc10_.redrawChrono();
      _loc10_.updateEye();
      this.api.datacenter.Game.isSpectator = _loc7_;
      if(!_loc7_)
      {
         this.api.datacenter.Player.data.initAP(false);
         this.api.datacenter.Player.data.initMP(false);
         this.api.datacenter.Player.SpellsManager.clear();
      }
      _loc10_.shortcuts.setCurrentTab("Spells");
      this.api.gfx.cleanMap(1);
      if(this.api.datacenter.Game.isTacticMode)
      {
         this.api.datacenter.Game.isTacticMode = true;
      }
      if(_loc6_)
      {
         this.api.ui.loadUIComponent("ChallengeMenu","ChallengeMenu",{labelReady:this.api.lang.getText("READY"),labelCancel:this.api.lang.getText("CANCEL_SMALL"),cancelButton:_loc5_,ready:false},{bStayIfPresent:true});
      }
      if(!_global.isNaN(_loc8_))
      {
         _loc10_.startTimer(_loc8_ / 1000);
      }
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_OBJECT_NONE);
      this.api.ui.unloadLastUIAutoHideComponent();
      this.api.ui.unloadUIComponent("FightsInfos");
   }
   function onPositionStart(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = _loc3_[0];
      var _loc5_ = _loc3_[1];
      var _loc6_ = Number(_loc3_[2]);
      this.api.datacenter.Basics.aks_current_team = _loc6_;
      this.api.datacenter.Basics.aks_team1_starts = new Array();
      this.api.datacenter.Basics.aks_team2_starts = new Array();
      this.api.kernel.StreamingDisplayManager.onFightStart();
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_NONE);
      this.api.datacenter.Game.setInteractionType("place");
      if(_loc6_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[onPositionStart] Impossible de trouver l\'équipe du joueur local !");
      }
      this.api.gfx.mapHandler.showFightCells(_loc4_,_loc5_);
      var _loc7_ = 0;
      while(_loc7_ < _loc4_.length)
      {
         var _loc8_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc4_.charAt(_loc7_)) << 6;
         _loc8_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc4_.charAt(_loc7_ + 1));
         this.api.datacenter.Basics.aks_team1_starts.push(_loc8_);
         if(_loc6_ == 0)
         {
            this.api.gfx.setInteractionOnCell(_loc8_,ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
         }
         _loc7_ += 2;
      }
      var _loc9_ = 0;
      while(_loc9_ < _loc5_.length)
      {
         var _loc10_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc5_.charAt(_loc9_)) << 6;
         _loc10_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc5_.charAt(_loc9_ + 1));
         this.api.datacenter.Basics.aks_team2_starts.push(_loc10_);
         if(_loc6_ == 1)
         {
            this.api.gfx.setInteractionOnCell(_loc10_,ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
         }
         _loc9_ += 2;
      }
      if(this.api.ui.getUIComponent("FightOptionButtons") == undefined)
      {
         this.api.ui.loadUIComponent("FightOptionButtons","FightOptionButtons");
      }
      this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_PLACEMENT);
   }
   function onPlayersCoordinates(§\x1e\x12\r§)
   {
      if(_loc2_ != "e")
      {
         var _loc3_ = _loc2_.split("|");
         var _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            var _loc5_ = _loc3_[_loc4_].split(";");
            var _loc6_ = _loc5_[0];
            var _loc7_ = Number(_loc5_[1]);
            this.api.gfx.setSpritePosition(_loc6_,_loc7_);
            _loc4_ = _loc4_ + 1;
         }
      }
      else
      {
         this.api.sounds.events.onError();
      }
   }
   function onReady(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.charAt(0) == "1";
      var _loc4_ = _loc2_.substr(1);
      if(_loc3_)
      {
         this.api.gfx.addSpriteExtraClip(_loc4_,dofus.Constants.READY_FILE,undefined,true);
      }
      else
      {
         this.api.gfx.removeSpriteExtraClip(_loc4_,true);
      }
   }
   function onStartToPlay()
   {
      this.api.ui.getUIComponent("Banner").stopTimer();
      this.aks.GameActions.onActionsFinish(this.api.datacenter.Player.ID);
      this.api.sounds.events.onGameStart(this.api.datacenter.Map.musics);
      this.api.kernel.StreamingDisplayManager.onFightStartEnd();
      var _loc2_ = this.api.ui.getUIComponent("Banner");
      _loc2_.showGiveUpButton(true);
      if(!this.api.datacenter.Game.isSpectator)
      {
         var _loc3_ = this.api.datacenter.Player.data;
         _loc3_.initAP();
         _loc3_.initMP();
         _loc3_.initLP();
         _loc2_.showPoints(true);
         _loc2_.showNextTurnButton(true);
         this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("GAME_LAUNCH"),background:true,timer:2000},{bForceLoad:true});
         this.api.ui.getUIComponent("FightOptionButtons").onGameRunning();
      }
      else
      {
         this.api.ui.loadUIComponent("FightOptionButtons","FightOptionButtons");
      }
      this.api.ui.loadUIComponent("Timeline","Timeline");
      this.api.ui.unloadUIComponent("ChallengeMenu");
      this.api.gfx.unSelect(true);
      this.api.gfx.mapHandler.showingFightCells = false;
      if(!this.api.gfx.gridHandler.bGridVisible)
      {
         this.api.gfx.drawGrid();
      }
      this.api.datacenter.Game.setInteractionType("move");
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_NONE);
      this.api.kernel.GameManager.signalFightActivity();
      this.api.datacenter.Game.isRunning = true;
      var _loc4_ = this.api.datacenter.Sprites.getItems();
      for(var k in _loc4_)
      {
         this.api.gfx.addSpriteExtraClip(k,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc4_[k].Team]);
      }
      if(this.api.datacenter.Game.isTacticMode)
      {
         this.api.datacenter.Game.isTacticMode = true;
      }
   }
   function onTurnStart(§\x1e\x12\r§)
   {
      if(this.api.datacenter.Game.isFirstTurn)
      {
         this.api.datacenter.Game.isFirstTurn = false;
         var _loc3_ = this.api.gfx.spriteHandler.getSprites().getItems();
         for(var sID in _loc3_)
         {
            this.api.gfx.removeSpriteExtraClip(sID,true);
         }
      }
      var _loc4_ = _loc2_.split("|");
      var _loc5_ = _loc4_[0];
      var _loc6_ = Number(_loc4_[1]) / 1000;
      var _loc7_ = Number(_loc4_[2]);
      this.api.datacenter.Game.currentTableTurn = _loc7_;
      var _loc8_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
      _loc8_.GameActionsManager.clear();
      this.api.gfx.unSelect(true);
      this.api.datacenter.Game.currentPlayerID = _loc5_;
      this.api.kernel.GameManager.cleanPlayer(this.api.datacenter.Game.lastPlayerID);
      this.api.ui.getUIComponent("Timeline").nextTurn(_loc5_);
      if(this.api.datacenter.Player.isCurrentPlayer)
      {
         this.api.electron.makeNotification(this.api.lang.getText("PLAYER_TURN",[this.api.datacenter.Player.Name]));
         if(this.api.kernel.OptionsManager.getOption("StartTurnSound"))
         {
            this.api.sounds.events.onTurnStart();
         }
         if(this.api.kernel.GameManager.autoSkip && this.api.datacenter.Game.isFight)
         {
            this.api.network.Game.turnEnd();
         }
         this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT);
         this.api.datacenter.Player.SpellsManager.nextTurn();
         this.api.ui.getUIComponent("Banner").startTimer(_loc6_);
         this.api.kernel.GameManager.startInactivityDetector();
         dofus["\x10\x16"].getInstance().forceMouseOver();
         this.api.gfx.mapHandler.resetEmptyCells();
      }
      else
      {
         this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_NONE);
         this.api.ui.getUIComponent("Timeline").startChrono(_loc6_);
         if(this.api.datacenter.Game.isSpectator && this.api.kernel.OptionsManager.getOption("SpriteInfos"))
         {
            this.api.ui.getUIComponent("Banner").showRightPanel("BannerSpriteInfos",{data:_loc8_},true);
         }
      }
      if(this.api.kernel.OptionsManager.getOption("StringCourse"))
      {
         var _loc9_ = new Array();
         _loc9_[1] = _loc8_.color1;
         _loc9_[2] = _loc8_.color2;
         _loc9_[3] = _loc8_.color3;
         this.api.ui.loadUIComponent("StringCourse","StringCourse",{gfx:_loc8_.artworkFile,name:_loc8_.name,level:this.api.lang.getText("LEVEL_SMALL") + " " + _loc8_.Level,colors:_loc9_},{bForceLoad:true});
      }
      this.api.kernel.GameManager.cleanUpGameArea(true);
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this.api.network.Ping,"GameDecoDetect",this.api.network,this.api.network.quickPing,_loc6_ * 1000);
      this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_START);
   }
   function onTurnFinish(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_;
      var _loc4_ = this.api.datacenter.Sprites.getItemAt(_loc3_);
      if(this.api.datacenter.Player.isCurrentPlayer)
      {
         this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_NONE);
         this.api.kernel.GameManager.stopInactivityDetector();
         this.api.kernel.GameManager.onTurnEnd();
      }
      this.api.datacenter.Game.lastPlayerID = this.api.datacenter.Game.currentPlayerID;
      this.api.datacenter.Game.currentPlayerID = undefined;
      this.api.ui.getUIComponent("Banner").stopTimer();
      this.api.ui.getUIComponent("Timeline").stopChrono();
      this.api.kernel.GameManager.cleanUpGameArea(true);
   }
   function onTurnlist(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      this.api.datacenter.Game.turnSequence = _loc3_;
      this.api.ui.getUIComponent("Timeline").update();
   }
   function onTurnMiddle(§\x1e\x12\r§)
   {
      if(!this.api.datacenter.Game.isRunning)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[innerOnTurnMiddle] on est pas en combat");
         return undefined;
      }
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = new Object();
      var _loc5_ = 0;
      for(; _loc5_ < _loc3_.length; _loc5_ = _loc5_ + 1)
      {
         var _loc6_ = _loc3_[_loc5_].split(";");
         if(_loc6_.length != 0)
         {
            var _loc7_ = _loc6_[0];
            var _loc8_ = _loc6_[1] != "1" ? false : true;
            var _loc9_ = Number(_loc6_[2]);
            var _loc10_ = Number(_loc6_[3]);
            var _loc11_ = Number(_loc6_[4]);
            var _loc12_ = Number(_loc6_[5]);
            var _loc13_ = Number(_loc6_[6]);
            var _loc14_ = Number(_loc6_[7]);
            _loc4_[_loc7_] = true;
            var _loc15_ = this.api.datacenter.Sprites.getItemAt(_loc7_);
            if(_loc15_ != undefined)
            {
               var _loc16_ = _loc15_.sequencer;
               if(_loc8_)
               {
                  if(_loc16_.isPlaying())
                  {
                     continue;
                  }
                  _loc15_.mc.clear();
                  this.api.gfx.removeSpriteOverHeadLayer(_loc7_,"text");
               }
               else
               {
                  _loc15_.LP = _loc9_;
                  _loc15_.LPmax = _loc14_;
                  _loc15_.AP = _loc10_;
                  _loc15_.MP = _loc11_;
                  if(_loc16_.isPlaying())
                  {
                     continue;
                  }
                  if(!_global.isNaN(_loc12_) && !_loc15_.hasCarriedParent())
                  {
                     this.api.gfx.setSpritePosition(_loc7_,_loc12_);
                  }
                  if(_loc15_.hasCarriedChild())
                  {
                     _loc15_.carriedChild.updateCarriedPosition();
                  }
               }
            }
            else
            {
               ank["\x1e\n\x07"]["\x0b\f"].err("[onTurnMiddle] le sprite n\'existe pas");
            }
         }
      }
      var _loc17_ = this.api.datacenter.Sprites.getItems();
      for(var k in _loc17_)
      {
         if(!_loc4_[k])
         {
            _loc17_[k].mc.clear();
            this.api.datacenter.Sprites.removeItemAt(k);
         }
      }
      this.api.ui.getUIComponent("Timeline").timelineControl.updateCharacters();
   }
   function prepareTurnEnd()
   {
      if(!this.api.datacenter.Game.isRunning || (!this.api.datacenter.Game.isFight || !this.api.datacenter.Player.isCurrentPlayer))
      {
         return undefined;
      }
      var _loc2_ = this.api.datacenter.Player.data.sequencer;
      if(_loc2_.containsAction(this,this.turnEnd))
      {
         return undefined;
      }
      _loc2_.addAction(24,false,this,this.turnEnd,[]);
      _loc2_.execute();
   }
   function onTurnReady(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_;
      var _loc4_ = this.api.datacenter.Sprites.getItemAt(_loc3_);
      if(_loc4_ != undefined)
      {
         var _loc5_ = _loc4_.sequencer;
         _loc5_.addAction(25,false,this,this.turnOk);
         _loc5_.execute();
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[onTurnReday] le sprite " + _loc3_ + " n\'existe pas");
         this.turnOk2();
      }
   }
   function onMapData(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = _loc3_[0];
      var _loc5_ = _loc3_[1];
      var _loc6_ = _loc3_[2];
      if(Number(_loc4_) == this.api.datacenter.Map.id)
      {
         this.api.gfx.onMapLoaded();
         return undefined;
      }
      this.api.gfx.showContainer(false);
      this.nLastMapIdReceived = _global.parseInt(_loc4_,10);
      this.api.kernel.MapsServersManager.loadMap(_loc4_,_loc5_,_loc6_);
   }
   function onMapLoaded()
   {
      this.api.gfx.showContainer(true);
      this.api.kernel.GameManager.applyCreatureMode();
      if(dofus.Constants.SAVING_THE_WORLD)
      {
         dofus["\x1e\x14\x0f"].getInstance().nextAction();
      }
   }
   function onMovement(§\x1e\x12\r§, §\x18\n§)
   {
      var _loc4_ = _loc2_.split("|");
      var _loc5_ = _loc4_.length - 1;
      for(; _loc5_ >= 0; _loc5_ = _loc5_ - 1)
      {
         var _loc6_ = _loc4_[_loc5_];
         if(_loc6_.length != 0)
         {
            var _loc7_ = false;
            var _loc8_ = false;
            var _loc9_ = _loc6_.charAt(0);
            if(_loc9_ == "+")
            {
               _loc8_ = true;
            }
            else if(_loc9_ == "~")
            {
               _loc8_ = true;
               _loc7_ = true;
            }
            else if(_loc9_ != "-")
            {
               continue;
            }
            if(_loc8_)
            {
               var _loc10_ = _loc6_.substr(1).split(";");
               var _loc11_ = _loc10_[0];
               if(_loc11_ == "-1")
               {
                  _loc11_ = String(this.api.datacenter.Player.data.cellNum);
               }
               var _loc12_ = _loc10_[1];
               var _loc13_ = Number(_loc10_[2]);
               var _loc14_ = _loc10_[3];
               var _loc15_ = _loc10_[4];
               var _loc16_ = _loc10_[5];
               var _loc17_ = _loc10_[6];
               var _loc18_ = false;
               var _loc19_ = true;
               if(_loc17_.charAt(_loc17_.length - 1) == "*")
               {
                  _loc17_ = _loc17_.substr(0,_loc17_.length - 1);
                  _loc18_ = true;
               }
               if(_loc17_.charAt(0) == "*")
               {
                  _loc19_ = false;
                  _loc17_ = _loc17_.substr(1);
               }
               var _loc20_ = _loc17_.split("^");
               var _loc21_ = _loc20_.length != 2 ? _loc17_ : _loc20_[0];
               var _loc22_ = _loc16_.split(",");
               var _loc23_ = _loc22_[0];
               var _loc24_ = _loc22_[1];
               var _loc25_ = undefined;
               if(_loc24_.length)
               {
                  var _loc26_ = _loc24_.split("*");
                  _loc25_ = new dofus.datacenter["\x1e\x0b\x01"](_global.parseInt(_loc26_[0]),_loc26_[1]);
               }
               var _loc27_ = 100;
               var _loc28_ = 100;
               if(_loc20_.length == 2)
               {
                  var _loc29_ = _loc20_[1];
                  if(_global.isNaN(Number(_loc29_)))
                  {
                     var _loc30_ = _loc29_.split("x");
                     _loc27_ = _loc30_.length != 2 ? 100 : Number(_loc30_[0]);
                     _loc28_ = _loc30_.length != 2 ? 100 : Number(_loc30_[1]);
                  }
                  else
                  {
                     _loc27_ = _loc28_ = Number(_loc29_);
                  }
               }
               if(_loc7_)
               {
                  var _loc31_ = this.api.datacenter.Sprites.getItemAt(_loc14_);
                  this.onSpriteMovement(false,_loc31_);
               }
               loop3:
               switch(_loc23_)
               {
                  case "-1":
                  case "-2":
                     var _loc33_ = new Object();
                     _loc33_.spriteType = _loc23_;
                     _loc33_.gfxID = _loc21_;
                     _loc33_.scaleX = _loc27_;
                     _loc33_.scaleY = _loc28_;
                     _loc33_.noFlip = _loc18_;
                     _loc33_.cell = _loc11_;
                     _loc33_.dir = _loc12_;
                     _loc33_.powerLevel = _loc10_[7];
                     _loc33_.color1 = _loc10_[8];
                     _loc33_.color2 = _loc10_[9];
                     _loc33_.color3 = _loc10_[10];
                     _loc33_.accessories = _loc10_[11];
                     if(this.api.datacenter.Game.isFight)
                     {
                        _loc33_.LP = _loc10_[12];
                        _loc33_.AP = _loc10_[13];
                        _loc33_.MP = _loc10_[14];
                        if(_loc10_.length > 18)
                        {
                           _loc33_.resistances = new Array(Number(_loc10_[15]),Number(_loc10_[16]),Number(_loc10_[17]),Number(_loc10_[18]),Number(_loc10_[19]),Number(_loc10_[20]),Number(_loc10_[21]));
                           _loc33_.team = _loc10_[22];
                        }
                        else
                        {
                           _loc33_.team = _loc10_[15];
                        }
                        _loc33_.summoned = _loc3_;
                     }
                     if(_loc23_ == -1)
                     {
                        _loc31_ = this.api.kernel.CharactersManager.createCreature(_loc14_,_loc15_,_loc33_);
                     }
                     else
                     {
                        _loc31_ = this.api.kernel.CharactersManager.createMonster(_loc14_,_loc15_,_loc33_);
                     }
                     break;
                  case "-3":
                     var _loc34_ = new Object();
                     _loc34_.spriteType = _loc23_;
                     _loc34_.level = _loc10_[7];
                     _loc34_.scaleX = _loc27_;
                     _loc34_.scaleY = _loc28_;
                     _loc34_.noFlip = _loc18_;
                     _loc34_.cell = Number(_loc11_);
                     _loc34_.dir = _loc12_;
                     var _loc35_ = _loc10_[8].split(",");
                     _loc34_.color1 = _loc35_[0];
                     _loc34_.color2 = _loc35_[1];
                     _loc34_.color3 = _loc35_[2];
                     _loc34_.accessories = _loc10_[9];
                     _loc34_.bonusValue = _loc13_;
                     var _loc36_ = this.sliptGfxData(_loc17_);
                     var _loc37_ = _loc36_.gfx;
                     this.splitGfxForScale(_loc37_[0],_loc34_);
                     _loc31_ = this.api.kernel.CharactersManager.createMonsterGroup(_loc14_,_loc15_,_loc34_);
                     if(this.api.kernel.OptionsManager.getOption("ViewAllMonsterInGroup") == true)
                     {
                        var _loc38_ = _loc14_;
                        var _loc39_ = 1;
                        while(_loc39_ < _loc37_.length)
                        {
                           if(_loc37_[_loc5_] != "")
                           {
                              this.splitGfxForScale(_loc37_[_loc39_],_loc34_);
                              _loc35_ = _loc10_[8 + 2 * _loc39_].split(",");
                              _loc34_.color1 = _loc35_[0];
                              _loc34_.color2 = _loc35_[1];
                              _loc34_.color3 = _loc35_[2];
                              _loc34_.dir = random(4) * 2 + 1;
                              _loc34_.accessories = _loc10_[9 + 2 * _loc39_];
                              var _loc40_ = _loc14_ + "_" + _loc39_;
                              var _loc41_ = this.api.kernel.CharactersManager.createMonsterGroup(_loc40_,undefined,_loc34_);
                              var _loc42_ = _loc38_;
                              if(random(3) != 0 && _loc39_ != 1)
                              {
                                 _loc42_ = _loc14_ + "_" + (random(_loc39_ - 1) + 1);
                              }
                              var _loc43_ = random(8);
                              this.api.gfx.addLinkedSprite(_loc40_,_loc42_,_loc43_,_loc41_);
                              if(!_global.isNaN(_loc41_.scaleX))
                              {
                                 this.api.gfx.setSpriteScale(_loc41_.id,_loc41_.scaleX,_loc41_.scaleY);
                              }
                              switch(_loc36_.shape)
                              {
                                 case "circle":
                                    _loc43_ = _loc39_;
                                    break;
                                 case "line":
                                    _loc42_ = _loc40_;
                                    _loc43_ = 2;
                              }
                           }
                           _loc39_ = _loc39_ + 1;
                        }
                     }
                     break;
                  case "-4":
                     var _loc44_ = new Object();
                     _loc44_.spriteType = _loc23_;
                     _loc44_.gfxID = _loc21_;
                     _loc44_.scaleX = _loc27_;
                     _loc44_.scaleY = _loc28_;
                     _loc44_.cell = _loc11_;
                     _loc44_.dir = _loc12_;
                     _loc44_.sex = _loc10_[7];
                     _loc44_.color1 = _loc10_[8];
                     _loc44_.color2 = _loc10_[9];
                     _loc44_.color3 = _loc10_[10];
                     _loc44_.accessories = _loc10_[11];
                     _loc44_.extraClipID = !(_loc10_[12] != undefined && !_global.isNaN(Number(_loc10_[12]))) ? -1 : Number(_loc10_[12]);
                     _loc44_.customArtwork = Number(_loc10_[13]);
                     _loc31_ = this.api.kernel.CharactersManager.createNonPlayableCharacter(_loc14_,Number(_loc15_),_loc44_);
                     break;
                  case "-5":
                     var _loc45_ = new Object();
                     _loc45_.spriteType = _loc23_;
                     _loc45_.gfxID = _loc21_;
                     _loc45_.scaleX = _loc27_;
                     _loc45_.scaleY = _loc28_;
                     _loc45_.cell = _loc11_;
                     _loc45_.dir = _loc12_;
                     _loc45_.color1 = _loc10_[7];
                     _loc45_.color2 = _loc10_[8];
                     _loc45_.color3 = _loc10_[9];
                     _loc45_.accessories = _loc10_[10];
                     _loc45_.guildName = _loc10_[11];
                     _loc45_.emblem = _loc10_[12];
                     _loc45_.offlineType = _loc10_[13];
                     _loc31_ = this.api.kernel.CharactersManager.createOfflineCharacter(_loc14_,_loc15_,_loc45_);
                     break;
                  case "-6":
                     var _loc46_ = new Object();
                     _loc46_.spriteType = _loc23_;
                     _loc46_.gfxID = _loc21_;
                     _loc46_.scaleX = _loc27_;
                     _loc46_.scaleY = _loc28_;
                     _loc46_.cell = _loc11_;
                     _loc46_.dir = _loc12_;
                     _loc46_.level = _loc10_[7];
                     if(this.api.datacenter.Game.isFight)
                     {
                        _loc46_.LP = _loc10_[8];
                        _loc46_.AP = _loc10_[9];
                        _loc46_.MP = _loc10_[10];
                        _loc46_.resistances = new Array(Number(_loc10_[11]),Number(_loc10_[12]),Number(_loc10_[13]),Number(_loc10_[14]),Number(_loc10_[15]),Number(_loc10_[16]),Number(_loc10_[17]));
                        _loc46_.team = _loc10_[18];
                     }
                     else
                     {
                        _loc46_.guildName = _loc10_[8];
                        _loc46_.emblem = _loc10_[9];
                     }
                     _loc31_ = this.api.kernel.CharactersManager.createTaxCollector(_loc14_,_loc15_,_loc46_);
                     break;
                  case "-7":
                  case "-8":
                     var _loc47_ = new Object();
                     _loc47_.spriteType = _loc23_;
                     _loc47_.gfxID = _loc21_;
                     _loc47_.scaleX = _loc27_;
                     _loc47_.scaleY = _loc28_;
                     _loc47_.cell = _loc11_;
                     _loc47_.dir = _loc12_;
                     _loc47_.sex = _loc10_[7];
                     _loc47_.powerLevel = _loc10_[8];
                     _loc47_.accessories = _loc10_[9];
                     if(this.api.datacenter.Game.isFight)
                     {
                        _loc47_.LP = _loc10_[10];
                        _loc47_.AP = _loc10_[11];
                        _loc47_.MP = _loc10_[12];
                        _loc47_.team = _loc10_[20];
                     }
                     else
                     {
                        _loc47_.emote = _loc10_[10];
                        _loc47_.emoteTimer = _loc10_[11];
                        _loc47_.restrictions = Number(_loc10_[12]);
                     }
                     if(_loc23_ == "-8")
                     {
                        _loc47_.showIsPlayer = true;
                        var _loc48_ = _loc15_.split("~");
                        _loc47_.monsterID = _loc48_[0];
                        _loc47_.playerName = _loc48_[1];
                     }
                     else
                     {
                        _loc47_.showIsPlayer = false;
                        _loc47_.monsterID = _loc15_;
                     }
                     _loc31_ = this.api.kernel.CharactersManager.createMutant(_loc14_,_loc47_);
                     break;
                  case "-9":
                     var _loc49_ = new Object();
                     _loc49_.spriteType = _loc23_;
                     _loc49_.gfxID = _loc21_;
                     _loc49_.scaleX = _loc27_;
                     _loc49_.scaleY = _loc28_;
                     _loc49_.cell = _loc11_;
                     _loc49_.dir = _loc12_;
                     _loc49_.ownerName = _loc10_[7];
                     _loc49_.level = _loc10_[8];
                     _loc49_.modelID = _loc10_[9];
                     _loc31_ = this.api.kernel.CharactersManager.createParkMount(_loc14_,_loc15_ == "" ? this.api.lang.getText("NO_NAME") : _loc15_,_loc49_);
                     break;
                  case "-10":
                     var _loc50_ = new Object();
                     _loc50_.spriteType = _loc23_;
                     _loc50_.gfxID = _loc21_;
                     _loc50_.scaleX = _loc27_;
                     _loc50_.scaleY = _loc28_;
                     _loc50_.cell = _loc11_;
                     _loc50_.dir = _loc12_;
                     _loc50_.level = _loc10_[7];
                     _loc50_.alignment = new dofus.datacenter["\x1e\f"](Number(_loc10_[9]),Number(_loc10_[8]));
                     _loc31_ = this.api.kernel.CharactersManager.createPrism(_loc14_,_loc15_,_loc50_);
                     break;
                  default:
                     var _loc52_ = new Object();
                     _loc52_.spriteType = _loc23_;
                     _loc52_.cell = _loc11_;
                     _loc52_.scaleX = _loc27_;
                     _loc52_.scaleY = _loc28_;
                     _loc52_.dir = _loc12_;
                     _loc52_.sex = _loc10_[7];
                     if(this.api.datacenter.Game.isFight)
                     {
                        _loc52_.level = _loc10_[8];
                        var _loc51_ = _loc10_[9];
                        _loc52_.color1 = _loc10_[10];
                        _loc52_.color2 = _loc10_[11];
                        _loc52_.color3 = _loc10_[12];
                        _loc52_.accessories = _loc10_[13];
                        _loc52_.LP = _loc10_[14];
                        _loc52_.AP = _loc10_[15];
                        _loc52_.MP = _loc10_[16];
                        _loc52_.resistances = new Array(Number(_loc10_[17]),Number(_loc10_[18]),Number(_loc10_[19]),Number(_loc10_[20]),Number(_loc10_[21]),Number(_loc10_[22]),Number(_loc10_[23]));
                        _loc52_.team = _loc10_[24];
                        if(_loc10_[25].indexOf(",") != -1)
                        {
                           var _loc53_ = _loc10_[25].split(",");
                           var _loc54_ = Number(_loc53_[0]);
                           var _loc55_ = _global.parseInt(_loc53_[1],16);
                           var _loc56_ = _global.parseInt(_loc53_[2],16);
                           var _loc57_ = _global.parseInt(_loc53_[3],16);
                           if(_loc55_ == -1 || _global.isNaN(_loc55_))
                           {
                              _loc55_ = this.api.datacenter.Player.color1;
                           }
                           if(_loc56_ == -1 || _global.isNaN(_loc56_))
                           {
                              _loc56_ = this.api.datacenter.Player.color2;
                           }
                           if(_loc57_ == -1 || _global.isNaN(_loc57_))
                           {
                              _loc57_ = this.api.datacenter.Player.color3;
                           }
                           if(!_global.isNaN(_loc54_))
                           {
                              var _loc58_ = new dofus.datacenter.Mount(_loc54_,Number(_loc21_));
                              _loc58_.customColor1 = _loc55_;
                              _loc58_.customColor2 = _loc56_;
                              _loc58_.customColor3 = _loc57_;
                              _loc52_.mount = _loc58_;
                           }
                        }
                        else
                        {
                           var _loc59_ = Number(_loc10_[25]);
                           if(!_global.isNaN(_loc59_))
                           {
                              _loc52_.mount = new dofus.datacenter.Mount(_loc59_,Number(_loc21_));
                           }
                        }
                     }
                     else
                     {
                        _loc51_ = _loc10_[8];
                        _loc52_.color1 = _loc10_[9];
                        _loc52_.color2 = _loc10_[10];
                        _loc52_.color3 = _loc10_[11];
                        _loc52_.accessories = _loc10_[12];
                        _loc52_.aura = _loc10_[13];
                        _loc52_.emote = _loc10_[14];
                        _loc52_.emoteTimer = _loc10_[15];
                        _loc52_.guildName = _loc10_[16];
                        _loc52_.emblem = _loc10_[17];
                        _loc52_.restrictions = _loc10_[18];
                        if(_loc10_[19].indexOf(",") != -1)
                        {
                           var _loc60_ = _loc10_[19].split(",");
                           var _loc61_ = Number(_loc60_[0]);
                           var _loc62_ = _global.parseInt(_loc60_[1],16);
                           var _loc63_ = _global.parseInt(_loc60_[2],16);
                           var _loc64_ = _global.parseInt(_loc60_[3],16);
                           if(_loc62_ == -1 || _global.isNaN(_loc62_))
                           {
                              _loc62_ = this.api.datacenter.Player.color1;
                           }
                           if(_loc63_ == -1 || _global.isNaN(_loc63_))
                           {
                              _loc63_ = this.api.datacenter.Player.color2;
                           }
                           if(_loc64_ == -1 || _global.isNaN(_loc64_))
                           {
                              _loc64_ = this.api.datacenter.Player.color3;
                           }
                           if(!_global.isNaN(_loc61_))
                           {
                              var _loc65_ = new dofus.datacenter.Mount(_loc61_,Number(_loc21_));
                              _loc65_.customColor1 = _loc62_;
                              _loc65_.customColor2 = _loc63_;
                              _loc65_.customColor3 = _loc64_;
                              _loc52_.mount = _loc65_;
                           }
                        }
                        else
                        {
                           var _loc66_ = Number(_loc10_[19]);
                           if(!_global.isNaN(_loc66_))
                           {
                              _loc52_.mount = new dofus.datacenter.Mount(_loc66_,Number(_loc21_));
                           }
                        }
                     }
                     if(_loc7_)
                     {
                        var _loc32_ = [_loc14_,this.createTransitionEffect(),_loc11_,10];
                     }
                     var _loc67_ = _loc51_.split(",");
                     _loc52_.alignment = new dofus.datacenter["\x1e\f"](Number(_loc67_[0]),Number(_loc67_[1]));
                     _loc52_.rank = new dofus.datacenter.Rank(Number(_loc67_[2]));
                     _loc52_.alignment.fallenAngelDemon = _loc67_[4] == 1;
                     if(_loc67_.length > 3 && _loc14_ != this.api.datacenter.Player.ID)
                     {
                        if(this.api.lang.getAlignmentCanViewPvpGain(this.api.datacenter.Player.alignment.index,Number(_loc52_.alignment.index)))
                        {
                           var _loc68_ = Number(_loc67_[3]) - _global.parseInt(_loc14_);
                           var _loc69_ = this.api.lang.getConfigText("PVP_VIEW_BONUS_MINOR_LIMIT");
                           var _loc70_ = this.api.lang.getConfigText("PVP_VIEW_BONUS_MINOR_LIMIT_PRC");
                           var _loc71_ = this.api.lang.getConfigText("PVP_VIEW_BONUS_MAJOR_LIMIT");
                           var _loc72_ = this.api.lang.getConfigText("PVP_VIEW_BONUS_MAJOR_LIMIT_PRC");
                           var _loc73_ = 0;
                           if(this.api.datacenter.Player.Level * (1 - _loc70_ / 100) > _loc68_)
                           {
                              _loc73_ = -1;
                           }
                           if(this.api.datacenter.Player.Level - _loc68_ > _loc69_)
                           {
                              _loc73_ = -1;
                           }
                           if(this.api.datacenter.Player.Level * (1 + _loc72_ / 100) < _loc68_)
                           {
                              _loc73_ = 1;
                           }
                           if(this.api.datacenter.Player.Level - _loc68_ < _loc71_)
                           {
                              _loc73_ = 1;
                           }
                           _loc52_.pvpGain = _loc73_;
                        }
                     }
                     if(!this.api.datacenter.Game.isFight && (_global.parseInt(_loc14_,10) != this.api.datacenter.Player.ID && ((this.api.datacenter.Player.alignment.index == 1 || this.api.datacenter.Player.alignment.index == 2) && ((_loc52_.alignment.index == 1 || _loc52_.alignment.index == 2) && (_loc52_.alignment.index != this.api.datacenter.Player.alignment.index && (_loc52_.rank.value && this.api.datacenter.Map.bCanAttack))))))
                     {
                        if(this.api.datacenter.Player.rank.value > _loc52_.rank.value)
                        {
                           this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_NEW_ENEMY_WEAK);
                        }
                        if(this.api.datacenter.Player.rank.value < _loc52_.rank.value)
                        {
                           this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_NEW_ENEMY_STRONG);
                        }
                     }
                     var _loc74_ = this.sliptGfxData(_loc17_);
                     var _loc75_ = _loc74_.gfx;
                     this.splitGfxForScale(_loc75_[0],_loc52_);
                     _loc52_.title = _loc25_;
                     _loc31_ = this.api.kernel.CharactersManager.createCharacter(_loc14_,_loc15_,_loc52_);
                     dofus.datacenter["\x13\x01"](_loc31_).isClear = false;
                     _loc31_.allowGhostMode = _loc19_;
                     var _loc76_ = _loc14_;
                     var _loc77_ = _loc74_.shape != "circle" ? 2 : 0;
                     var _loc78_ = 1;
                     while(true)
                     {
                        if(_loc78_ >= _loc75_.length)
                        {
                           break loop3;
                        }
                        if(_loc75_[_loc78_] != "")
                        {
                           var _loc79_ = _loc14_ + "_" + _loc78_;
                           var _loc80_ = new Object();
                           this.splitGfxForScale(_loc75_[_loc78_],_loc80_);
                           var _loc81_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](_loc79_,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc80_.gfxID + ".swf");
                           _loc81_.allDirections = false;
                           this.api.gfx.addLinkedSprite(_loc79_,_loc76_,_loc77_,_loc81_);
                           if(!_global.isNaN(_loc80_.scaleX))
                           {
                              this.api.gfx.setSpriteScale(_loc81_.id,_loc80_.scaleX,_loc80_.scaleY);
                           }
                           switch(_loc74_.shape)
                           {
                              case "circle":
                                 _loc77_ = _loc78_;
                                 break;
                              case "line":
                                 _loc76_ = _loc79_;
                                 _loc77_ = 2;
                           }
                        }
                        _loc78_ = _loc78_ + 1;
                     }
               }
               this.onSpriteMovement(_loc8_,_loc31_,_loc32_);
            }
            else
            {
               var _loc82_ = _loc6_.substr(1);
               var _loc83_ = this.api.datacenter.Sprites.getItemAt(_loc82_);
               if(!this.api.datacenter.Game.isRunning && this.api.datacenter.Game.isLoggingMapDisconnections)
               {
                  var _loc84_ = _loc83_.name;
                  var _loc85_ = this._aGameSpriteLeftHistory[_loc82_];
                  if(!_global.isNaN(_loc85_) && getTimer() - _loc85_ < 300)
                  {
                     this.api.kernel.showMessage(undefined,this.api.kernel.DebugManager.getTimestamp() + " (Map) " + this.api.kernel.ChatManager.getLinkName(_loc84_) + " s\'est déconnecté (" + _loc82_ + ")","ADMIN_CHAT");
                  }
                  this._aGameSpriteLeftHistory[_loc82_] = getTimer();
               }
               this.onSpriteMovement(_loc8_,_loc83_);
            }
         }
      }
   }
   function onCellData(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc4_].split(";");
         var _loc6_ = Number(_loc5_[0]);
         var _loc7_ = _loc5_[1].substring(0,10);
         var _loc8_ = _loc5_[1].substr(10);
         var _loc9_ = _loc5_[2] != "0" ? 1 : 0;
         this.api.gfx.updateCell(_loc6_,_loc7_,_loc8_,_loc9_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function onZoneData(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc4_];
         var _loc6_ = _loc5_.charAt(0) != "+" ? false : true;
         var _loc7_ = _loc5_.substr(1).split(";");
         var _loc8_ = Number(_loc7_[0]);
         var _loc9_ = Number(_loc7_[1]);
         var _loc10_ = _loc7_[2];
         if(_loc6_)
         {
            this.api.gfx.drawZone(_loc8_,0,_loc9_,_loc10_,dofus.Constants.ZONE_COLOR[_loc10_]);
         }
         else
         {
            this.api.gfx.clearZone(_loc8_,_loc9_,_loc10_);
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function onCellObject(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.charAt(0) == "+";
      var _loc4_ = _loc2_.substr(1).split("|");
      var _loc5_ = 0;
      while(_loc5_ < _loc4_.length)
      {
         var _loc6_ = _loc4_[_loc5_].split(";");
         var _loc7_ = Number(_loc6_[0]);
         var _loc8_ = _global.parseInt(_loc6_[1]);
         if(_loc3_)
         {
            var _loc9_ = new dofus.datacenter["\f\f"](0,_loc8_);
            var _loc10_ = Number(_loc6_[2]);
            switch(_loc10_)
            {
               case 0:
                  this.api.gfx.updateCellObjectExternalWithExternalClip(_loc7_,_loc9_.iconFile,1,true,true,_loc9_);
                  break;
               case 1:
                  if(this.api.gfx.mapHandler.getCellData(_loc7_).layerObjectExternalData.unicID != _loc8_)
                  {
                     this.api.gfx.updateCellObjectExternalWithExternalClip(_loc7_,_loc9_.iconFile,1,true,false,_loc9_);
                  }
                  else
                  {
                     _loc9_ = this.api.gfx.mapHandler.getCellData(_loc7_).layerObjectExternalData;
                  }
                  _loc9_.durability = Number(_loc6_[3]);
                  _loc9_.durabilityMax = Number(_loc6_[4]);
            }
         }
         else
         {
            var _loc11_ = this.api.gfx.mapHandler.getCellData(_loc7_);
            if(_loc11_ != undefined && (_loc11_.mcObjectExternal != undefined && _loc11_.mcObjectExternal == this.api.gfx.rollOverMcObject))
            {
               this.api.gfx.onObjectRollOut(_loc11_.mcObjectExternal);
            }
            this.api.gfx.initializeCell(_loc7_,1);
         }
         _loc5_ = _loc5_ + 1;
      }
   }
   function onFrameObject2(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc4_].split(";");
         var _loc6_ = Number(_loc5_[0]);
         var _loc7_ = _loc5_[1];
         var _loc8_ = _loc5_[2] != undefined;
         var _loc9_ = _loc5_[2] != "1" ? false : true;
         if(_loc8_)
         {
            this.api.gfx.setObject2Interactive(_loc6_,_loc9_,2);
         }
         this.api.gfx.setObject2Frame(_loc6_,_loc7_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function onFrameObjectExternal(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc4_].split(";");
         var _loc6_ = Number(_loc5_[0]);
         var _loc7_ = Number(_loc5_[1]);
         this.api.gfx.setObjectExternalFrame(_loc6_,_loc7_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function onEffect(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split(";");
      var _loc4_ = _loc3_[0];
      var _loc5_ = _loc3_[1].split(",");
      var _loc6_ = _loc3_[2];
      var _loc7_ = _loc3_[3];
      var _loc8_ = _loc3_[4];
      var _loc9_ = _loc3_[5];
      var _loc10_ = Number(_loc3_[6]);
      var _loc11_ = _loc3_[7];
      var _loc12_ = _loc3_[8];
      var _loc13_ = 0;
      while(_loc13_ < _loc5_.length)
      {
         var _loc14_ = _loc5_[_loc13_];
         if(_loc14_ == this.api.datacenter.Game.currentPlayerID && _loc10_ != -1)
         {
            _loc10_ = _loc10_ + 1;
         }
         var _loc15_ = new dofus.datacenter["\x0f\r"](_loc12_,Number(_loc4_),Number(_loc6_),Number(_loc7_),Number(_loc8_),_loc9_,Number(_loc10_),Number(_loc11_));
         var _loc16_ = this.api.datacenter.Sprites.getItemAt(_loc14_);
         _loc16_.EffectsManager.addEffect(_loc15_);
         _loc13_ = _loc13_ + 1;
      }
   }
   function onClearAllEffect(§\x1e\x12\r§)
   {
      var _loc3_ = this.api.datacenter.Sprites;
      for(var a in _loc3_)
      {
         _loc3_[a].EffectsManager.terminateAllEffects();
      }
   }
   function onChallenge(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.charAt(0) == "+";
      var _loc4_ = _loc2_.substr(1).split("|");
      var _loc5_ = _loc4_.shift().split(";");
      var _loc6_ = Number(_loc5_[0]);
      var _loc7_ = Number(_loc5_[1]);
      var _loc8_ = (Math.cos(_loc6_) + 1) * 8388607;
      if(_loc3_)
      {
         var _loc9_ = new dofus.datacenter.Challenge(_loc6_,_loc7_);
         this.api.datacenter.Challenges.addItemAt(_loc6_,_loc9_);
         var _loc10_ = 0;
         while(_loc10_ < _loc4_.length)
         {
            var _loc11_ = _loc4_[_loc10_].split(";");
            var _loc12_ = _loc11_[0];
            var _loc13_ = Number(_loc11_[1]);
            var _loc14_ = Number(_loc11_[2]);
            var _loc15_ = Number(_loc11_[3]);
            var _loc16_ = dofus.Constants.getTeamFileFromType(_loc14_,_loc15_);
            var _loc17_ = new dofus.datacenter.Team(_loc12_,ank.battlefield.mc["\x1e\x0e\x10"],_loc16_,_loc13_,_loc8_,_loc14_,_loc15_);
            _loc9_.addTeam(_loc17_);
            this.api.gfx.addSprite(_loc17_.id,_loc17_);
            _loc10_ = _loc10_ + 1;
         }
      }
      else
      {
         var _loc18_ = this.api.datacenter.Challenges.getItemAt(_loc6_).teams;
         for(var k in _loc18_)
         {
            var _loc19_ = _loc18_[k];
            this.api.gfx.removeSprite(_loc19_.id);
         }
         this.api.datacenter.Challenges.removeItemAt(_loc6_);
      }
   }
   function onTeam(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_.shift());
      var _loc5_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
      var _loc6_ = 0;
      while(_loc6_ < _loc3_.length)
      {
         var _loc7_ = _loc3_[_loc6_].split(";");
         var _loc8_ = _loc7_[0].charAt(0) == "+";
         var _loc9_ = _loc7_[0].substr(1);
         var _loc10_ = _loc7_[1];
         var _loc11_ = _loc7_[2];
         var _loc12_ = _loc10_.split(",");
         var _loc13_ = Number(_loc10_);
         if(_loc12_.length > 1)
         {
            _loc10_ = this.api.lang.getFullNameText(_loc12_);
         }
         else if(!_global.isNaN(_loc13_))
         {
            _loc10_ = this.api.lang.getMonstersText(_loc13_).n;
         }
         if(_loc8_)
         {
            var _loc14_ = new Object();
            _loc14_.id = _loc9_;
            _loc14_.name = _loc10_;
            _loc14_.level = _loc11_;
            _loc5_.addPlayer(_loc14_);
         }
         else
         {
            _loc5_.removePlayer(_loc9_);
         }
         _loc6_ = _loc6_ + 1;
      }
   }
   function onFightOption(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.substr(2);
      var _loc4_ = this.api.datacenter.Sprites.getItemAt(_loc3_);
      if(_loc4_ != undefined)
      {
         var _loc5_ = _loc2_.charAt(0) == "+";
         var _loc6_ = _loc2_.charAt(1);
         switch(_loc6_)
         {
            case "H":
               _loc4_.options[dofus.datacenter.Team.OPT_NEED_HELP] = _loc5_;
               break;
            case "S":
               _loc4_.options[dofus.datacenter.Team.OPT_BLOCK_SPECTATOR] = _loc5_;
               break;
            case "A":
               _loc4_.options[dofus.datacenter.Team.OPT_BLOCK_JOINER] = _loc5_;
               break;
            case "P":
               _loc4_.options[dofus.datacenter.Team.OPT_BLOCK_JOINER_EXCEPT_PARTY_MEMBER] = _loc5_;
         }
         this.api.gfx.addSpriteOverHeadItem(_loc3_,"FightOptions",dofus["\r\x14"].battlefield["\x0e\r"],[_loc4_],undefined);
      }
   }
   function onLeave()
   {
      this.api.datacenter.Game.currentPlayerID = undefined;
      this.api.ui.getUIComponent("Banner").hideRightPanel(true);
      this.api.ui.unloadUIComponent("Timeline");
      this.api.ui.unloadUIComponent("StringCourse");
      this.api.ui.unloadUIComponent("PlayerInfos");
      this.api.ui.unloadUIComponent("SpriteInfos");
      this.aks.GameActions.onActionsFinish(String(this.api.datacenter.Player.ID));
      this.api.datacenter.Player.reset();
      var _loc2_ = dofus["\r\x14"].gapi.ui.FightChallenge(dofus["\r\x14"].gapi.ui.FightChallenge(this.api.ui.getUIComponent("FightChallenge")));
      _loc2_.cleanChallenge();
      this.create();
   }
   function onEnd(§\x1e\x12\r§)
   {
      if(this.api.kernel.MapsServersManager.isBuilding)
      {
         this.addToQueue({object:this,method:this.onEnd,params:[_loc2_]});
         return undefined;
      }
      this._bIsBusy = true;
      var _loc3_ = dofus["\r\x14"].gapi.ui.FightChallenge(dofus["\r\x14"].gapi.ui.FightChallenge(this.api.ui.getUIComponent("FightChallenge")));
      this.api.kernel.StreamingDisplayManager.onFightEnd();
      var _loc4_ = {winners:[],loosers:[],collectors:[],challenges:_loc3_.challenges.clone(),currentTableTurn:this.api.datacenter.Game.currentTableTurn};
      this.api.datacenter.Game.results = _loc4_;
      _loc3_.cleanChallenge();
      var _loc5_ = _loc2_.split("|");
      var _loc6_ = -1;
      if(!_global.isNaN(Number(_loc5_[0])))
      {
         _loc4_.duration = Number(_loc5_[0]);
      }
      else
      {
         var _loc7_ = _loc5_[0].split(";");
         _loc4_.duration = Number(_loc7_[0]);
         _loc6_ = Number(_loc7_[1]);
      }
      this.api.datacenter.Basics.aks_game_end_bonus = _loc6_;
      var _loc8_ = Number(_loc5_[1]);
      var _loc9_ = Number(_loc5_[2]);
      _loc4_.fightType = _loc9_;
      var _loc10_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc11_ = 0;
      this.parsePlayerData(_loc4_,3,_loc8_,_loc5_,_loc9_,_loc11_,_loc10_);
   }
   function parsePlayerData(§\x1e\x18\x02§, §\x1e\x1c\x19§, §\x1e\x1d\x12§, §\x1d\x06§, §\x05\x07§, §\x03\x1c§, §\x10\t§)
   {
      var _loc9_ = _loc3_;
      var _loc10_ = _loc5_[_loc9_].split(";");
      var _loc11_ = new Object();
      if(Number(_loc10_[0]) != 6)
      {
         _loc11_.id = Number(_loc10_[1]);
         if(_loc11_.id == this.api.datacenter.Player.ID)
         {
            if(Number(_loc10_[0]) == 0)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_FIGHT_LOST);
            }
            else
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_FIGHT_WON);
            }
         }
         var _loc13_ = this.api.kernel.CharactersManager.getNameFromData(_loc10_[2]);
         _loc11_.name = _loc13_.name;
         _loc11_.type = _loc13_.type;
         _loc11_.level = Number(_loc10_[3]);
         _loc11_.bDead = _loc10_[4] != "1" ? false : true;
         switch(_loc6_)
         {
            case 0:
               _loc11_.minxp = Number(_loc10_[5]);
               _loc11_.xp = Number(_loc10_[6]);
               _loc11_.maxxp = Number(_loc10_[7]);
               _loc11_.winxp = Number(_loc10_[8]);
               _loc11_.guildxp = Number(_loc10_[9]);
               _loc11_.mountxp = Number(_loc10_[10]);
               var _loc12_ = _loc10_[11].split(",");
               if(_loc11_.id == this.api.datacenter.Player.ID && _loc12_.length > 10)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_GREAT_DROP);
               }
               _loc11_.kama = _loc10_[12];
               break;
            case 1:
               _loc11_.minhonour = Number(_loc10_[5]);
               _loc11_.honour = Number(_loc10_[6]);
               _loc11_.maxhonour = Number(_loc10_[7]);
               _loc11_.winhonour = Number(_loc10_[8]);
               _loc11_.rank = Number(_loc10_[9]);
               _loc11_.disgrace = Number(_loc10_[10]);
               _loc11_.windisgrace = Number(_loc10_[11]);
               _loc11_.maxdisgrace = this.api.lang.getMaxDisgracePoints();
               _loc11_.mindisgrace = 0;
               _loc12_ = _loc10_[12].split(",");
               if(_loc11_.id == this.api.datacenter.Player.ID && _loc12_.length > 10)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_GREAT_DROP);
               }
               _loc11_.kama = _loc10_[13];
               _loc11_.minxp = Number(_loc10_[14]);
               _loc11_.xp = Number(_loc10_[15]);
               _loc11_.maxxp = Number(_loc10_[16]);
               _loc11_.winxp = Number(_loc10_[17]);
         }
      }
      else
      {
         _loc12_ = _loc10_[1].split(",");
         _loc11_.kama = _loc10_[2];
         _loc7_ += Number(_loc11_.kama);
      }
      _loc11_.items = new Array();
      var _loc14_ = _loc12_.length;
      while((_loc14_ = _loc14_ - 1) >= 0)
      {
         var _loc15_ = _loc12_[_loc14_].split("~");
         var _loc16_ = Number(_loc15_[0]);
         var _loc17_ = Number(_loc15_[1]);
         if(_global.isNaN(_loc16_))
         {
            break;
         }
         if(_loc16_ != 0)
         {
            var _loc18_ = new dofus.datacenter["\f\f"](0,_loc16_,_loc17_);
            _loc11_.items.push(_loc18_);
         }
      }
      switch(Number(_loc10_[0]))
      {
         case 0:
            _loc2_.loosers.push(_loc11_);
            break;
         case 2:
            _loc2_.winners.push(_loc11_);
            break;
         case 5:
            _loc2_.collectors.push(_loc11_);
            break;
         case 6:
            _loc8_ = _loc8_.concat(_loc11_.items);
      }
      _loc9_ = _loc9_ + 1;
      if(_loc9_ < _loc5_.length)
      {
         this.addToQueue({object:this,method:this.parsePlayerData,params:[_loc2_,_loc9_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_]});
      }
      else
      {
         this.onParseItemEnd(_loc4_,_loc2_,_loc8_,_loc7_);
      }
   }
   function onParseItemEnd(§\x1e\x1d\x12§, §\x1e\x18\x02§, §\x10\t§, §\x03\x1c§)
   {
      if(_loc4_.length)
      {
         var _loc6_ = Math.ceil(_loc4_.length / _loc3_.winners.length);
         var _loc7_ = 0;
         while(_loc7_ < _loc3_.winners.length)
         {
            var _loc8_ = _loc4_.length;
            _loc3_.winners[_loc7_].kama = Math.ceil(_loc5_ / _loc6_);
            if(_loc7_ == _loc3_.winners.length - 1)
            {
               _loc6_ = _loc8_;
            }
            var _loc9_ = _loc8_ - _loc6_;
            while(_loc9_ < _loc8_)
            {
               _loc3_.winners[_loc7_].items.push(_loc4_.pop());
               _loc9_ = _loc9_ + 1;
            }
            _loc7_ = _loc7_ + 1;
         }
      }
      if(_loc2_ == this.api.datacenter.Player.ID)
      {
         this.aks.GameActions.onActionsFinish(String(_loc2_));
      }
      this.api.datacenter.Game.isRunning = false;
      var _loc10_ = this.api.datacenter.Sprites.getItemAt(_loc2_).sequencer;
      this._bIsBusy = false;
      if(_loc10_ != undefined)
      {
         _loc10_.addAction(26,false,this.api.kernel.GameManager,this.api.kernel.GameManager.terminateFight);
         _loc10_.execute(false);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[AKS.Game.onEnd] Impossible de trouver le sequencer");
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"game",this.api.kernel.GameManager,this.api.kernel.GameManager.terminateFight,500);
      }
      this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_ENDFIGHT);
   }
   function onExtraClip(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = _loc3_[0];
      var _loc5_ = _loc3_[1].split(";");
      var _loc6_ = dofus.Constants.EXTRA_PATH + _loc4_ + ".swf";
      var _loc7_ = _loc4_ == "-";
      for(var k in _loc5_)
      {
         var _loc8_ = _loc5_[k];
         if(_loc7_)
         {
            this.api.gfx.removeSpriteExtraClip(_loc8_,false);
         }
         else
         {
            this.api.gfx.addSpriteExtraClip(_loc8_,_loc6_,undefined,false);
         }
      }
   }
   function onPVP(§\x1e\x12\r§, §\x1a\r§)
   {
      if(!_loc3_)
      {
         var _loc4_ = Number(_loc2_);
         this.api.kernel.showMessage(undefined,this.api.lang.getText("ASK_DISABLE_PVP",[_loc4_]),"CAUTION_YESNO",{name:"DisabledPVP",listener:this});
      }
      else
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("ASK_ENABLED_PVP"),"CAUTION_YESNO",{name:"EnabledPVP",listener:this});
      }
   }
   function onGameOver()
   {
      this.api.network.softDisconnect();
      this.api.ui.loadUIComponent("GameOver","GameOver",undefined,{bAlwaysOnTop:true});
   }
   function onCreateSolo()
   {
      this.api.datacenter.Player.InteractionsManager.setState(false);
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_OBJECT_RELEASE_OVER_OUT);
      this.api.ui.removeCursor();
      this.api.ui.getUIComponent("Banner").shortcuts.setCurrentTab("Items");
      this.api.datacenter.Basics.gfx_isSpritesHidden = false;
      this.api.gfx.spriteHandler.unmaskAllSprites();
      if(this.api.ui.getUIComponent("Banner") == undefined)
      {
         this.api.kernel.OptionsManager.applyAllOptions();
         this.api.ui.loadUIComponent("Banner","Banner",{data:this.api.datacenter.Player},{bAlwaysOnTop:true});
         this.api.ui.setScreenSize(742,432);
      }
      else
      {
         var _loc2_ = this.api.ui.getUIComponent("Banner");
         _loc2_.showPoints(false);
         _loc2_.showNextTurnButton(false);
         _loc2_.showGiveUpButton(false);
         this.api.ui.unloadUIComponent("FightOptionButtons");
         this.api.ui.unloadUIComponent("ChallengeMenu");
      }
      this.api.gfx.cleanMap(2);
   }
   function onSpriteMovement(§\x1c\x17§, oSprite, §\x1e\x1d§)
   {
      if(oSprite instanceof dofus.datacenter["\x13\x01"])
      {
         this.api.datacenter.Game.playerCount += !_loc2_ ? -1 : 1;
      }
      if(_loc2_)
      {
         if(_loc4_ != undefined)
         {
            this.api.gfx.spriteLaunchVisualEffect.apply(this.api.gfx,_loc4_);
         }
         this.api.gfx.addSprite(oSprite.id);
         if(!_global.isNaN(oSprite.scaleX))
         {
            this.api.gfx.setSpriteScale(oSprite.id,oSprite.scaleX,oSprite.scaleY);
         }
         if(oSprite instanceof dofus.datacenter["\x1e\x19\f"])
         {
            oSprite.mc.addExtraClip(dofus.Constants.EXTRA_PATH + oSprite.offlineType + ".swf",undefined,true);
            return undefined;
         }
         if(oSprite instanceof dofus.datacenter["\x02\x01"])
         {
            if(!_global.isNaN(oSprite.extraClipID))
            {
               this.api.gfx.addSpriteExtraClip(oSprite.id,dofus.Constants.EXTRA_PATH + oSprite.extraClipID + ".swf",undefined,false);
               return undefined;
            }
         }
         if(this.api.datacenter.Game.isRunning)
         {
            this.api.gfx.addSpriteExtraClip(oSprite.id,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[oSprite.Team]);
         }
         else if(oSprite.Aura != 0 && (oSprite.Aura != undefined && this.api.kernel.OptionsManager.getOption("Aura")))
         {
            this.api.gfx.addSpriteExtraClip(oSprite.id,dofus.Constants.AURA_PATH + oSprite.Aura + ".swf",undefined,true);
         }
         if(oSprite.id == this.api.datacenter.Player.ID)
         {
            this.api.ui.getUIComponent("Banner").updateLocalPlayer();
         }
         else if(this.api.gfx.spriteHandler.isPlayerSpritesHidden && (oSprite instanceof dofus.datacenter["\x13\x01"] || (oSprite instanceof dofus.datacenter.PlayerShop || oSprite instanceof dofus.datacenter["\t\x1d"])))
         {
            this.api.gfx.spriteHandler.hidePlayerSprites();
         }
         else if(this.api.gfx.spriteHandler.isShowingMonstersTooltip && oSprite instanceof dofus.datacenter["\t\x1d"])
         {
            oSprite.mc._rollOver(true);
         }
      }
      else if(!this.api.datacenter.Game.isRunning)
      {
         this.api.gfx.removeSprite(oSprite.id);
      }
      else
      {
         var _loc5_ = oSprite.sequencer;
         var _loc6_ = oSprite.mc;
         _loc5_.addAction(27,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("LEAVE_GAME",[oSprite.name]),"INFO_CHAT"]);
         _loc5_.addAction(28,false,this.api.ui.getUIComponent("Timeline"),this.api.ui.getUIComponent("Timeline").hideItem,[oSprite.id]);
         _loc5_.addAction(29,true,_loc6_,_loc6_.setAnim,["Die"],1500,true);
         if(oSprite.hasCarriedChild())
         {
            this.api.gfx.uncarriedSprite(oSprite.carriedChild.id,oSprite.cellNum,false,_loc5_);
            _loc5_.addAction(30,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[oSprite.carriedChild.id,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[oSprite.carriedChild.Team]]);
         }
         _loc5_.addAction(31,false,_loc6_,_loc6_.clear);
         _loc5_.execute();
         if(this.api.datacenter.Game.currentPlayerID == oSprite.id)
         {
            this.api.ui.getUIComponent("Banner").stopTimer();
            this.api.ui.getUIComponent("Timeline").stopChrono();
         }
      }
      this.api.kernel.GameManager.applyCreatureMode();
   }
   function onFlag(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = _loc3_[0];
      var _loc5_ = Number(_loc3_[1]);
      var _loc6_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
      var _loc7_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
      _loc7_.file = dofus.Constants.CLIPS_PATH + "flag.swf";
      _loc7_.bInFrontOfSprite = true;
      _loc7_.bTryToBypassContainerColor = true;
      this.api.kernel.showMessage(undefined,this.api.lang.getText("PLAYER_SET_FLAG",[_loc6_.name,_loc5_]),"INFO_CHAT");
      this.api.gfx.spriteLaunchVisualEffect(_loc4_,_loc7_,_loc5_,11,undefined,undefined,undefined,true);
   }
   function onFightChallenge(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split(";");
      if(!this.api.ui.getUIComponent("FightChallenge"))
      {
         this.api.ui.loadUIComponent("FightChallenge","FightChallenge");
      }
      var _loc4_ = new dofus.datacenter["\x0e\x0f"](_global.parseInt(_loc3_[0]),_loc3_[1] == "1",_global.parseInt(_loc3_[2]),_global.parseInt(_loc3_[3]),_global.parseInt(_loc3_[4]),_global.parseInt(_loc3_[5]),_global.parseInt(_loc3_[6]));
      dofus["\r\x14"].gapi.ui.FightChallenge(dofus["\r\x14"].gapi.ui.FightChallenge(this.api.ui.getUIComponent("FightChallenge"))).addChallenge(_loc4_);
   }
   function onFightChallengeUpdate(§\x1e\x12\r§, §\x1e\f\x01§)
   {
      var _loc4_ = _global.parseInt(_loc2_);
      dofus["\r\x14"].gapi.ui.FightChallenge(dofus["\r\x14"].gapi.ui.FightChallenge(this.api.ui.getUIComponent("FightChallenge"))).updateChallenge(_loc4_,_loc3_);
      var _loc5_ = !_loc3_ ? this.api.lang.getText("FIGHT_CHALLENGE_FAILED") : this.api.lang.getText("FIGHT_CHALLENGE_DONE");
      _loc5_ += " : " + this.api.lang.getFightChallenge(_loc4_).n;
      this.api.kernel.showMessage(undefined,_loc5_,"INFO_CHAT");
   }
   function sliptGfxData(§\x1e\x11\x1d§)
   {
      if(_loc2_.indexOf(",") != -1)
      {
         var _loc3_ = _loc2_.split(",");
         return {shape:"circle",gfx:_loc3_};
      }
      if(_loc2_.indexOf(":") != -1)
      {
         var _loc4_ = _loc2_.split(":");
         return {shape:"line",gfx:_loc4_};
      }
      return {shape:"none",gfx:[_loc2_]};
   }
   function createTransitionEffect()
   {
      var _loc2_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
      _loc2_.id = 5;
      _loc2_.file = dofus.Constants.SPELLS_PATH + "transition.swf";
      _loc2_.level = 5;
      _loc2_.params = [];
      _loc2_.bInFrontOfSprite = true;
      _loc2_.bTryToBypassContainerColor = false;
      return _loc2_;
   }
   function splitGfxForScale(§\x1e\x11\x1a§, §\x1e\x19\x15§)
   {
      var _loc4_ = _loc2_.split("^");
      var _loc5_ = _loc4_.length != 2 ? _loc2_ : _loc4_[0];
      var _loc6_ = 100;
      var _loc7_ = 100;
      if(_loc4_.length == 2)
      {
         var _loc8_ = _loc4_[1];
         if(_global.isNaN(Number(_loc8_)))
         {
            var _loc9_ = _loc8_.split("x");
            _loc6_ = _loc9_.length != 2 ? 100 : Number(_loc9_[0]);
            _loc7_ = _loc9_.length != 2 ? 100 : Number(_loc9_[1]);
         }
         else
         {
            _loc6_ = _loc7_ = Number(_loc8_);
         }
      }
      _loc3_.gfxID = _loc5_;
      _loc3_.scaleX = _loc6_;
      _loc3_.scaleY = _loc7_;
   }
   function cancel(§\x1e\x19\x0e§)
   {
      var _loc0_ = _loc2_.target._name;
   }
   function yes(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "AskYesNoEnabledPVP":
            this.api.network.Game.enabledPVPMode(true);
            break;
         case "AskYesNoDisabledPVP":
            this.api.network.Game.enabledPVPMode(false);
      }
   }
   function no(§\x1e\x19\x0e§)
   {
      var _loc0_ = _loc2_.target._name;
   }
}
