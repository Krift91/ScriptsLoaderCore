class dofus.aks.GameActions extends dofus.aks.Handler
{
   function GameActions(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function warning(§\x1e\x0b\x16§)
   {
      this.infoImportanteDecompilo("Hello, we would like to tell you that modifying your Dofus client or sharing a modified client is strictly FORBIDDEN.");
      this.infoImportanteDecompilo("Modifying your client in any way will also flag you as a bot by our security systems.");
      this.infoImportanteDecompilo("Bonjour, nous souhaitons vous avertir que toute modification du client ou partage d\'un client modifié est strictement INTERDIT.");
      this.infoImportanteDecompilo("Modifier votre client (et ce quelque soit le type de modification) aura également pour conséquence de vous identifier comme un BOT par nos systèmes de sécurité.");
   }
   function infoImportanteDecompilo(§\x1e\x11\x0b§)
   {
   }
   function sendActions(§\b\x1c§, §\x1e\x01§)
   {
      var _loc4_ = new String();
      this.aks.send("GA" + new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).addLeftChar("0",3) + _loc3_.join(";"));
   }
   function actionAck(§\t\x01§)
   {
      this.aks.send("GKK" + _loc2_,false);
   }
   function actionCancel(§\t\x01§, §\x1e\x17\x02§)
   {
      this.aks.send("GKE" + _loc2_ + "|" + _loc3_,false);
   }
   function challenge(§\x1e\r\x0e§)
   {
      this.sendActions(900,[_loc2_]);
   }
   function acceptChallenge(§\x1e\r\x0e§)
   {
      this.sendActions(901,[_loc2_]);
   }
   function refuseChallenge(§\x1e\r\x0e§)
   {
      this.sendActions(902,[_loc2_]);
   }
   function joinChallenge(§\x07\r§, §\x1e\r\x0e§)
   {
      if(_loc3_ == undefined)
      {
         this.sendActions(903,[_loc2_]);
      }
      else
      {
         this.sendActions(903,[_loc2_,_loc3_]);
      }
   }
   function attack(§\x1e\r\x0e§)
   {
      this.sendActions(906,[_loc2_]);
   }
   function attackTaxCollector(§\x1e\r\x0e§)
   {
      this.sendActions(909,[_loc2_]);
   }
   function mutantAttack(§\x1e\r\x0e§)
   {
      this.sendActions(910,[_loc2_]);
   }
   function attackPrism(§\x1e\r\x0e§)
   {
      this.sendActions(912,[_loc2_]);
   }
   function usePrism(§\x1e\r\x0e§)
   {
      this.sendActions(512,[_loc2_]);
   }
   function acceptMarriage(§\x1e\r\x0e§)
   {
      this.sendActions(618,[_loc2_]);
   }
   function refuseMarriage(§\x1e\r\x0e§)
   {
      this.sendActions(619,[_loc2_]);
   }
   function onActionsStart(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_;
      if(_loc3_ != this.api.datacenter.Player.ID)
      {
         return undefined;
      }
      var _loc4_ = this.api.datacenter.Player.data;
      _loc4_.GameActionsManager.m_bNextAction = true;
      if(this.api.datacenter.Game.isFight)
      {
         var _loc5_ = _loc4_.sequencer;
         _loc5_.execute();
      }
   }
   function onActionsFinish(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = _loc3_[1];
      if(_loc5_ != this.api.datacenter.Player.ID)
      {
         return undefined;
      }
      var _loc6_ = this.api.datacenter.Player.data;
      var _loc7_ = _loc6_.sequencer;
      _loc6_.GameActionsManager.m_bNextAction = false;
      if(this.api.datacenter.Game.isFight)
      {
         _loc7_.addAction(32,false,this.api.kernel.GameManager,this.api.kernel.GameManager.setEnabledInteractionIfICan,[ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT]);
         if(_loc4_ != undefined)
         {
            _loc7_.addAction(33,false,this,this.actionAck,[_loc4_]);
         }
         _loc7_.addAction(34,false,this.api.kernel.GameManager,this.api.kernel.GameManager.cleanPlayer,[_loc5_]);
         this.api.gfx.mapHandler.resetEmptyCells();
         _loc7_.execute();
         if(_loc4_ == 2)
         {
            this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_ENDMOVE);
         }
      }
   }
   function onActions(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.indexOf(";");
      var _loc4_ = Number(_loc2_.substring(0,_loc3_));
      if(dofus.Constants.SAVING_THE_WORLD)
      {
         if(_loc2_ == ";0")
         {
            dofus["\x1e\x14\x0f"].getInstance().nextActionIfOnSafe();
         }
      }
      _loc2_ = _loc2_.substring(_loc3_ + 1);
      _loc3_ = _loc2_.indexOf(";");
      var _loc5_ = Number(_loc2_.substring(0,_loc3_));
      _loc2_ = _loc2_.substring(_loc3_ + 1);
      _loc3_ = _loc2_.indexOf(";");
      var _loc6_ = _loc2_.substring(0,_loc3_);
      var _loc7_ = _loc2_.substring(_loc3_ + 1);
      if(_loc6_.length == 0)
      {
         _loc6_ = this.api.datacenter.Player.ID;
      }
      var _loc9_ = this.api.datacenter.Game.currentPlayerID;
      if(this.api.datacenter.Game.isFight && _loc9_ != undefined)
      {
         var _loc8_ = _loc9_;
      }
      else
      {
         _loc8_ = _loc6_;
      }
      var _loc10_ = this.api.datacenter.Sprites.getItemAt(_loc8_);
      var _loc11_ = _loc10_.sequencer;
      var _loc12_ = _loc10_.GameActionsManager;
      var _loc13_ = true;
      _loc12_.onServerResponse(_loc4_);
      switch(_loc5_)
      {
         case 0:
            return undefined;
         case 1:
            var _loc14_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            if(!this.api.gfx.isMapBuild)
            {
               return undefined;
            }
            if(dofus.Constants.USE_JS_LOG && (_global.CONFIG.isNewAccount && !this.api.datacenter.Basics.first_movement))
            {
               getURL("JavaScript:WriteLog(\'Mouvement\')","_self");
               this.api.datacenter.Basics.first_movement = true;
            }
            if(_loc6_ == this.api.datacenter.Player.ID && (this.api.datacenter.Game.isFight && this.api.datacenter.Game.isRunning))
            {
               _loc11_.addAction(35,false,this.api.gfx,this.api.gfx.setInteraction,[ank.battlefield.Constants.INTERACTION_CELL_NONE]);
            }
            var _loc15_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].extractFullPath(this.api.gfx.mapHandler,_loc7_);
            if(_loc14_.hasCarriedParent() && !_loc14_.uncarryingSprite)
            {
               _loc14_.uncarryingSprite = true;
               _loc15_.shift();
               _loc11_.addAction(174,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc6_,_loc15_[0],true,_loc11_]);
               _loc11_.addAction(36,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc6_,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc14_.Team]]);
            }
            var _loc16_ = _loc14_.forceRun;
            var _loc17_ = _loc14_.forceWalk;
            var _loc18_ = !this.api.datacenter.Game.isFight ? (!(_loc14_ instanceof dofus.datacenter["\x13\x01"]) ? 6 : 3) : (!(_loc14_ instanceof dofus.datacenter["\x13\x01"]) ? 4 : 3);
            if(this.api.datacenter.Game.isRunning)
            {
               _loc11_.addAction(37,false,this.api.gfx,this.api.gfx.unSelect,[true]);
               _loc11_.addAction(175,false,this.api.gfx,this.api.gfx.moveSpriteWithUncompressedPath,[_loc6_,_loc15_,_loc11_,false,_loc16_,_loc17_,_loc18_]);
            }
            else
            {
               this.api.gfx.moveSpriteWithUncompressedPath(_loc6_,_loc15_,_loc11_,true,_loc16_,_loc17_,_loc18_);
            }
            break;
         case 2:
            if(_loc11_ == undefined)
            {
               this.api.gfx.clear();
               this.api.datacenter.clearGame();
               if(!this.api.kernel.TutorialManager.isTutorialMode)
               {
                  this.api.ui.loadUIComponent("CenterText","CenterTextMap",{text:this.api.lang.getText("LOADING_MAP"),timer:40000},{bForceLoad:true});
               }
            }
            else
            {
               _loc11_.addAction(38,false,this.api.gfx,this.api.gfx.clear);
               _loc11_.addAction(39,false,this.api.datacenter,this.api.datacenter.clearGame);
               if(_loc7_.length == 0)
               {
                  _loc11_.addAction(40,true,this.api.ui,this.api.ui.loadUIComponent,["CenterText","CenterTextMap",{text:this.api.lang.getText("LOADING_MAP"),timer:40000},{bForceLoad:true}]);
               }
               else
               {
                  _loc11_.addAction(41,true,this.api.ui,this.api.ui.loadUIComponent,["Cinematic","Cinematic",{file:dofus.Constants.CINEMATICS_PATH + _loc7_ + ".swf",sequencer:_loc11_}]);
               }
            }
            break;
         case 4:
            var _loc19_ = _loc7_.split(",");
            var _loc20_ = _loc19_[0];
            var _loc21_ = Number(_loc19_[1]);
            var _loc22_ = this.api.datacenter.Sprites.getItemAt(_loc20_);
            var _loc23_ = _loc22_.mc;
            _loc11_.addAction(42,false,_loc23_,_loc23_.setPosition,[_loc21_]);
            break;
         case 5:
            var _loc24_ = _loc7_.split(",");
            var _loc25_ = _loc24_[0];
            var _loc26_ = Number(_loc24_[1]);
            this.api.gfx.slideSprite(_loc25_,_loc26_,_loc11_);
            break;
         case 11:
            var _loc27_ = _loc7_.split(",");
            var _loc28_ = _loc27_[0];
            var _loc29_ = Number(_loc27_[1]);
            _loc11_.addAction(43,false,this.api.gfx,this.api.gfx.setSpriteDirection,[_loc28_,_loc29_]);
            break;
         case 50:
            var _loc30_ = _loc7_;
            _loc11_.addAction(44,false,this.api.gfx,this.api.gfx.carriedSprite,[_loc30_,_loc6_]);
            _loc11_.addAction(45,false,this.api.gfx,this.api.gfx.removeSpriteExtraClip,[_loc30_]);
            break;
         case 51:
            var _loc31_ = Number(_loc7_);
            var _loc32_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc33_ = _loc32_.carriedChild;
            var _loc34_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
            _loc34_.file = dofus.Constants.SPELLS_PATH + "1200.swf";
            _loc34_.level = 1;
            _loc34_.bInFrontOfSprite = true;
            _loc34_.bTryToBypassContainerColor = false;
            this.api.gfx.spriteLaunchCarriedSprite(_loc6_,_loc34_,_loc31_,31,10);
            _loc11_.addAction(46,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc33_.id,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc33_.Team]]);
            break;
         case 52:
            var _loc35_ = _loc7_.split(",");
            var _loc36_ = _loc35_[0];
            var _loc37_ = this.api.datacenter.Sprites.getItemAt(_loc36_);
            var _loc38_ = Number(_loc35_[1]);
            if(_loc37_.hasCarriedParent() && !_loc37_.uncarryingSprite)
            {
               _loc37_.uncarryingSprite = true;
               _loc11_.addAction(47,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc36_,_loc38_,true,_loc11_]);
               _loc11_.addAction(48,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc36_,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc37_.Team]]);
            }
            break;
         case 100:
         case 108:
         case 110:
            var _loc39_ = _loc7_.split(",");
            var _loc40_ = _loc39_[0];
            var _loc41_ = this.api.datacenter.Sprites.getItemAt(_loc40_);
            var _loc42_ = Number(_loc39_[1]);
            if(_loc42_ != 0)
            {
               var _loc43_ = Number(_loc39_[2]);
               var _loc44_ = dofus.Constants.getElementColorById(_loc43_);
               var _loc45_ = _loc42_ >= 0 ? "WIN_LP" : "LOST_LP";
               if(_loc44_ != undefined && this.api.kernel.OptionsManager.getOption("SeeDamagesColor"))
               {
                  var _loc46_ = this.api.lang.getText(_loc45_,[_loc41_.name,"<font color=\"#" + _loc44_ + "\">" + Math.abs(_loc42_) + "</font>"]);
               }
               else
               {
                  _loc46_ = this.api.lang.getText(_loc45_,[_loc41_.name,Math.abs(_loc42_)]);
               }
               _loc11_.addAction(49,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc46_,"INFO_FIGHT_CHAT"]);
               _loc11_.addAction(50,false,_loc41_,_loc41_.updateLP,[_loc42_]);
               _loc11_.addAction(51,false,this.api.ui.getUIComponent("Timeline").timelineControl,this.api.ui.getUIComponent("Timeline").timelineControl.updateCharacters);
            }
            else
            {
               _loc11_.addAction(52,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("NOCHANGE_LP",[_loc41_.name]),"INFO_FIGHT_CHAT"]);
            }
            break;
         case 101:
         case 102:
         case 111:
         case 120:
         case 168:
            var _loc47_ = _loc7_.split(",");
            var _loc48_ = this.api.datacenter.Sprites.getItemAt(_loc47_[0]);
            var _loc49_ = Number(_loc47_[1]);
            if(_loc49_ == 0)
            {
               break;
            }
            if(_loc5_ == 101 || (_loc5_ == 111 || (_loc5_ == 120 || _loc5_ == 168)))
            {
               var _loc50_ = _loc49_ >= 0 ? "WIN_AP" : "LOST_AP";
               _loc11_.addAction(53,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText(_loc50_,[_loc48_.name,Math.abs(_loc49_)]),"INFO_FIGHT_CHAT"]);
            }
            _loc11_.addAction(54,false,_loc48_,_loc48_.updateAP,[_loc49_,_loc5_ == 102]);
            break;
         case 127:
         case 129:
         case 128:
         case 78:
         case 169:
            var _loc51_ = _loc7_.split(",");
            var _loc52_ = _loc51_[0];
            var _loc53_ = Number(_loc51_[1]);
            var _loc54_ = this.api.datacenter.Sprites.getItemAt(_loc52_);
            if(_loc53_ == 0)
            {
               break;
            }
            if(_loc5_ == 127 || (_loc5_ == 128 || (_loc5_ == 169 || _loc5_ == 78)))
            {
               var _loc55_ = _loc53_ >= 0 ? "WIN_MP" : "LOST_MP";
               _loc11_.addAction(55,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText(_loc55_,[_loc54_.name,Math.abs(_loc53_)]),"INFO_FIGHT_CHAT"]);
            }
            _loc11_.addAction(56,false,_loc54_,_loc54_.updateMP,[_loc53_,_loc5_ == 129]);
            break;
         case 103:
            var _loc56_ = _loc7_;
            var _loc57_ = this.api.datacenter.Sprites.getItemAt(_loc56_);
            var _loc58_ = _loc57_.mc;
            if(_loc58_ == undefined)
            {
               return undefined;
            }
            _loc57_.isPendingClearing = true;
            var _loc59_ = _loc57_.sex != 1 ? "m" : "f";
            _loc11_.addAction(57,false,this.api.kernel,this.api.kernel.showMessage,[undefined,ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("DIE",[_loc57_.name]),_loc59_,true),"INFO_FIGHT_CHAT"]);
            var _loc60_ = this.api.ui.getUIComponent("Timeline");
            _loc11_.addAction(58,false,_loc60_,_loc60_.hideItem,[_loc56_]);
            _loc11_.addAction(176,false,this.api.gfx,this.api.gfx.removeEffectsByCasterID,[_loc56_]);
            this.warning("You\'re not allowed to change the behaviour of the game animations. Please play legit !");
            this.warning("Toute modification du comportement des animations est détectée et sanctionnée car c\'est considéré comme de la triche, merci de jouer legit !");
            if(!this.api.datacenter.Player.isSkippingFightAnimations)
            {
               _loc11_.addAction(59,true,_loc58_,_loc58_.setAnim,["Die"],1500,true);
            }
            this.warning("Vous n\'êtes même pas sensé pouvoir lire ce message, mais un rappel de plus n\'est pas de trop pour certains : modification du client = ban ;)");
            _loc11_.addAction(61,false,_loc58_,_loc58_.clear);
            if(_loc57_.hasCarriedChild() && !_loc57_.uncarryingSprite)
            {
               _loc57_.uncarryingSprite = true;
               _loc11_.addAction(172,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc57_.carriedSprite.id,_loc57_.cellNum,false,_loc11_]);
               _loc11_.addAction(60,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc57_.carriedChild.id,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc57_.carriedChild.Team]]);
            }
            if(this.api.datacenter.Player.summonedCreaturesID[_loc56_])
            {
               this.api.datacenter.Player.SummonedCreatures--;
               delete this.api.datacenter.Player.summonedCreaturesID[_loc56_];
               this.api.ui.getUIComponent("Banner").shortcuts.setSpellStateOnAllContainers();
            }
            if(_loc56_ == this.api.datacenter.Player.ID)
            {
               if(_loc6_ == this.api.datacenter.Player.ID)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_KILLED_HIMSELF);
               }
               else
               {
                  var _loc61_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
                  var _loc62_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc6_)).Team;
                  if(_loc61_ == _loc62_)
                  {
                     this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_KILLED_BY_ALLY);
                  }
                  else
                  {
                     this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_KILLED_BY_ENEMY);
                  }
               }
            }
            else if(_loc6_ == this.api.datacenter.Player.ID)
            {
               var _loc63_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               var _loc64_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc56_)).Team;
               if(_loc63_ == _loc64_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_KILL_ALLY);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_KILL_ENEMY);
               }
            }
            break;
         case 104:
            var _loc65_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc66_ = _loc65_.mc;
            _loc11_.addAction(62,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("CANT_MOVEOUT"),"INFO_FIGHT_CHAT"]);
            if(!this.api.datacenter.Player.isSkippingFightAnimations && this.api.electron.isWindowFocused)
            {
               _loc11_.addAction(63,false,_loc66_,_loc66_.setAnim,["Hit"]);
            }
            break;
         case 105:
         case 164:
            var _loc67_ = _loc7_.split(",");
            var _loc68_ = _loc67_[0];
            var _loc69_ = _loc5_ != 164 ? _loc67_[1] : _loc67_[1] + "%";
            var _loc70_ = this.api.datacenter.Sprites.getItemAt(_loc68_);
            _loc11_.addAction(64,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("REDUCE_DAMAGES",[_loc70_.name,_loc69_]),"INFO_FIGHT_CHAT"]);
            break;
         case 106:
            var _loc71_ = _loc7_.split(",");
            var _loc72_ = _loc71_[0];
            var _loc73_ = _loc71_[1] == "1";
            var _loc74_ = this.api.datacenter.Sprites.getItemAt(_loc72_);
            var _loc75_ = !_loc73_ ? this.api.lang.getText("RETURN_SPELL_NO",[_loc74_.name]) : this.api.lang.getText("RETURN_SPELL_OK",[_loc74_.name]);
            _loc11_.addAction(65,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc75_,"INFO_FIGHT_CHAT"]);
            break;
         case 107:
            var _loc76_ = _loc7_.split(",");
            var _loc77_ = _loc76_[0];
            var _loc78_ = _loc76_[1];
            var _loc79_ = this.api.datacenter.Sprites.getItemAt(_loc77_);
            _loc11_.addAction(66,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("RETURN_DAMAGES",[_loc79_.name,_loc78_]),"INFO_FIGHT_CHAT"]);
            break;
         case 130:
            var _loc80_ = Number(_loc7_);
            var _loc81_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            _loc11_.addAction(67,false,this.api.kernel,this.api.kernel.showMessage,[undefined,ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("STEAL_GOLD",[_loc81_.name,_loc80_]),"m",_loc80_ < 2),"INFO_FIGHT_CHAT"]);
            break;
         case 132:
            var _loc82_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc83_ = this.api.datacenter.Sprites.getItemAt(_loc7_);
            _loc11_.addAction(68,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("REMOVE_ALL_EFFECTS",[_loc82_.name,_loc83_.name]),"INFO_FIGHT_CHAT"]);
            _loc11_.addAction(69,false,_loc83_.CharacteristicsManager,_loc83_.CharacteristicsManager.terminateAllEffects);
            _loc11_.addAction(70,false,_loc83_.EffectsManager,_loc83_.EffectsManager.terminateAllEffects);
            break;
         case 140:
            var _loc84_ = Number(_loc7_);
            var _loc85_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc86_ = this.api.datacenter.Sprites.getItemAt(_loc7_);
            _loc11_.addAction(71,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("A_PASS_NEXT_TURN",[_loc86_.name]),"INFO_FIGHT_CHAT"]);
            break;
         case 151:
            var _loc87_ = Number(_loc7_);
            var _loc88_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc89_ = _loc87_ != -1 ? this.api.lang.getText("INVISIBLE_OBSTACLE",[_loc88_.name,this.api.lang.getSpellText(_loc87_).n]) : this.api.lang.getText("CANT_DO_INVISIBLE_OBSTACLE");
            _loc11_.addAction(72,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc89_,"ERROR_CHAT"]);
            break;
         case 166:
            var _loc90_ = _loc7_.split(",");
            var _loc91_ = Number(_loc90_[0]);
            var _loc92_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc93_ = Number(_loc90_[1]);
            _loc11_.addAction(73,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("RETURN_AP",[_loc92_.name,_loc93_]),"INFO_FIGHT_CHAT"]);
            break;
         case 164:
            var _loc94_ = _loc7_.split(",");
            var _loc95_ = Number(_loc94_[0]);
            var _loc96_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc97_ = Number(_loc94_[1]);
            _loc11_.addAction(74,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("REDUCE_LP_DAMAGES",[_loc96_.name,_loc97_]),"INFO_FIGHT_CHAT"]);
            break;
         case 780:
            if(_loc6_ == this.api.datacenter.Player.ID)
            {
               this.api.datacenter.Player.SummonedCreatures++;
               var _loc98_ = _global.parseInt(_loc7_.split(";")[3]);
               this.api.datacenter.Player.summonedCreaturesID[_loc98_] = true;
            }
         case 147:
            var _loc99_ = _loc7_.split(";")[3];
            var _loc100_ = this.api.ui.getUIComponent("Timeline");
            _loc11_.addAction(75,false,_loc100_,_loc100_.showItem,[_loc99_]);
            _loc11_.addAction(76,false,this.aks.Game,this.aks.Game.onMovement,[_loc7_,true]);
            break;
         case 180:
         case 181:
            var _loc101_ = _loc7_.split(";")[3];
            if(_loc6_ == this.api.datacenter.Player.ID)
            {
               this.api.datacenter.Player.SummonedCreatures++;
               this.api.datacenter.Player.summonedCreaturesID[_loc101_] = true;
            }
            _loc11_.addAction(77,false,this.aks.Game,this.aks.Game.onMovement,[_loc7_,true]);
            break;
         case 185:
            _loc11_.addAction(78,false,this.aks.Game,this.aks.Game.onMovement,[_loc7_]);
            break;
         case 117:
         case 116:
         case 115:
         case 122:
         case 112:
         case 142:
         case 145:
         case 138:
         case 160:
         case 161:
         case 114:
         case 182:
         case 118:
         case 157:
         case 123:
         case 152:
         case 126:
         case 155:
         case 119:
         case 154:
         case 124:
         case 156:
         case 125:
         case 153:
         case 160:
         case 161:
         case 162:
         case 163:
         case 606:
         case 607:
         case 608:
         case 609:
         case 610:
         case 611:
            var _loc102_ = _loc7_.split(",");
            var _loc103_ = _loc102_[0];
            var _loc104_ = this.api.datacenter.Sprites.getItemAt(_loc103_);
            var _loc105_ = Number(_loc102_[1]);
            var _loc106_ = Number(_loc102_[2]);
            var _loc107_ = _loc104_.CharacteristicsManager;
            var _loc108_ = new dofus.datacenter["\x0f\r"](undefined,_loc5_,_loc105_,undefined,undefined,undefined,_loc106_);
            _loc11_.addAction(79,false,_loc107_,_loc107_.addEffect,[_loc108_]);
            _loc11_.addAction(80,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"<b>" + _loc104_.name + "</b> : " + _loc108_.description,"INFO_FIGHT_CHAT"]);
            break;
         case 149:
            var _loc109_ = _loc7_.split(",");
            var _loc110_ = _loc109_[0];
            var _loc111_ = this.api.datacenter.Sprites.getItemAt(_loc110_);
            var _loc112_ = Number(_loc109_[1]);
            var _loc113_ = Number(_loc109_[2]);
            var _loc114_ = Number(_loc109_[3]);
            _loc11_.addAction(81,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("GFX",[_loc111_.name]),"INFO_FIGHT_CHAT"]);
            var _loc115_ = _loc111_.CharacteristicsManager;
            var _loc116_ = new dofus.datacenter["\x0f\r"](undefined,_loc5_,_loc112_,_loc113_,undefined,undefined,_loc114_);
            _loc11_.addAction(82,false,_loc115_,_loc115_.addEffect,[_loc116_]);
            break;
         case 150:
            var _loc117_ = _loc7_.split(",");
            var _loc118_ = _loc117_[0];
            var _loc119_ = this.api.datacenter.Sprites.getItemAt(_loc118_);
            var _loc120_ = Number(_loc117_[1]);
            if(_loc120_ > 0)
            {
               _loc11_.addAction(83,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("INVISIBILITY",[_loc119_.name]),"INFO_FIGHT_CHAT"]);
               if(_loc118_ == this.api.datacenter.Player.ID)
               {
                  _loc11_.addAction(84,false,_loc119_.mc,_loc119_.mc.setAlpha,[40]);
               }
               else
               {
                  _loc11_.addAction(85,false,_loc119_.mc,_loc119_.mc.setVisible,[false]);
               }
            }
            else
            {
               _loc11_.addAction(86,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("VISIBILITY",[_loc119_.name]),"INFO_FIGHT_CHAT"]);
               this.api.gfx.hideSprite(_loc118_,false);
               if(_loc119_.allowGhostMode && this.api.gfx.bGhostView)
               {
                  this.api.gfx.setSpriteAlpha(_loc118_,ank.battlefield.Constants.GHOSTVIEW_SPRITE_ALPHA);
               }
               else
               {
                  this.api.gfx.setSpriteAlpha(_loc118_,100);
               }
            }
            break;
         case 165:
            var _loc121_ = _loc7_.split(",");
            var _loc122_ = _loc121_[0];
            var _loc123_ = Number(_loc121_[1]);
            var _loc124_ = Number(_loc121_[2]);
            var _loc125_ = Number(_loc121_[3]);
            break;
         case 200:
            var _loc126_ = _loc7_.split(",");
            var _loc127_ = Number(_loc126_[0]);
            var _loc128_ = Number(_loc126_[1]);
            _loc11_.addAction(87,false,this.api.gfx,this.api.gfx.setObject2Frame,[_loc127_,_loc128_]);
            break;
         case 208:
            var _loc129_ = _loc7_.split(",");
            var _loc130_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc131_ = Number(_loc129_[0]);
            var _loc132_ = _loc129_[1];
            var _loc133_ = Number(_loc129_[2]);
            var _loc134_ = !_global.isNaN(Number(_loc129_[3])) ? "anim" + _loc129_[3] : String(_loc129_[3]).split("~");
            var _loc135_ = _loc129_[4] == undefined ? 1 : Number(_loc129_[4]);
            var _loc136_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
            _loc136_.file = dofus.Constants.SPELLS_PATH + _loc132_ + ".swf";
            _loc136_.level = _loc135_;
            _loc136_.bInFrontOfSprite = true;
            _loc136_.bTryToBypassContainerColor = true;
            this.api.gfx.spriteLaunchVisualEffect(_loc6_,_loc136_,_loc131_,_loc133_,_loc134_);
            break;
         case 228:
            var _loc137_ = _loc7_.split(",");
            var _loc138_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc139_ = Number(_loc137_[0]);
            var _loc140_ = _loc137_[1];
            var _loc141_ = Number(_loc137_[2]);
            var _loc142_ = !_global.isNaN(Number(_loc137_[3])) ? "anim" + _loc137_[3] : String(_loc137_[3]).split("~");
            var _loc143_ = _loc137_[4] == undefined ? 1 : Number(_loc137_[4]);
            var _loc144_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
            _loc144_.file = dofus.Constants.SPELLS_PATH + _loc140_ + ".swf";
            _loc144_.level = _loc143_;
            _loc144_.bInFrontOfSprite = true;
            _loc144_.bTryToBypassContainerColor = false;
            this.api.gfx.spriteLaunchVisualEffect(_loc6_,_loc144_,_loc139_,_loc141_,_loc142_);
            break;
         case 300:
            var _loc145_ = _loc7_.split(",");
            var _loc146_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc147_ = Number(_loc145_[0]);
            var _loc148_ = Number(_loc145_[1]);
            var _loc149_ = _loc145_[2];
            var _loc150_ = Number(_loc145_[3]);
            var _loc151_ = Number(_loc145_[4]);
            var _loc152_ = !_global.isNaN(Number(_loc145_[5])) ? (!(_loc145_[5] == "-1" || _loc145_[5] == "-2") ? "anim" + _loc145_[5] : undefined) : String(_loc145_[5]).split("~");
            var _loc153_ = false;
            if(Number(_loc145_[5]) == -2)
            {
               _loc153_ = true;
            }
            var _loc154_ = _loc145_[6] != "1" ? false : true;
            var _loc155_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
            _loc155_.file = dofus.Constants.SPELLS_PATH + _loc149_ + ".swf";
            _loc155_.level = _loc150_;
            _loc155_.bInFrontOfSprite = _loc154_;
            _loc155_.params = new dofus.datacenter["\x1e\x0e\x1c"](_loc147_,_loc150_).elements;
            _loc11_.addAction(88,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_LAUNCH_SPELL",[_loc146_.name,this.api.lang.getSpellText(_loc147_).n]),"INFO_FIGHT_CHAT"]);
            if(_loc152_ != undefined || _loc153_)
            {
               if(!this.api.datacenter.Player.isSkippingFightAnimations)
               {
                  this.api.gfx.spriteLaunchVisualEffect(_loc6_,_loc155_,_loc148_,_loc151_,_loc152_);
               }
            }
            if(_loc6_ == this.api.datacenter.Player.ID)
            {
               var _loc156_ = this.api.datacenter.Player.SpellsManager;
               var _loc157_ = this.api.gfx.mapHandler.getCellData(_loc148_).spriteOnID;
               var _loc158_ = new dofus.datacenter["\x0b\x18"](_loc147_,_loc157_);
               _loc156_.addLaunchedSpell(_loc158_);
            }
            break;
         case 301:
            var _loc159_ = Number(_loc7_);
            _loc11_.addAction(89,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalHit,[]);
            _loc11_.addAction(90,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_HIT") + ")","INFO_FIGHT_CHAT"]);
            if(!this.api.datacenter.Player.isSkippingFightAnimations && this.api.electron.isWindowFocused)
            {
               _loc11_.addAction(91,false,this.api.gfx,this.api.gfx.addSpriteExtraClipOnTimer,[_loc6_,dofus.Constants.CRITICAL_HIT_XTRA_FILE,undefined,true,dofus.Constants.CRITICAL_HIT_DURATION]);
            }
            if(_loc6_ == this.api.datacenter.Player.ID)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_OWNER);
            }
            else
            {
               var _loc160_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               var _loc161_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc6_)).Team;
               if(_loc160_ == _loc161_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ALLIED);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ENEMY);
               }
            }
            break;
         case 302:
            var _loc162_ = Number(_loc7_);
            var _loc163_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            _loc11_.addAction(92,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalMiss,[]);
            _loc11_.addAction(93,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_LAUNCH_SPELL",[_loc163_.name,this.api.lang.getSpellText(_loc162_).n]),"INFO_FIGHT_CHAT"]);
            _loc11_.addAction(94,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_MISS") + ")","INFO_FIGHT_CHAT"]);
            _loc11_.addAction(95,false,this.api.gfx,this.api.gfx.addSpriteBubble,[_loc6_,this.api.lang.getText("CRITICAL_MISS")]);
            if(_loc6_ == this.api.datacenter.Player.ID)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_OWNER);
            }
            else
            {
               var _loc164_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               var _loc165_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc6_)).Team;
               if(_loc164_ == _loc165_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ALLIED);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ENEMY);
               }
            }
            break;
         case 303:
            var _loc166_ = _loc7_.split(",");
            var _loc167_ = Number(_loc166_[0]);
            var _loc168_ = _loc166_[1];
            var _loc169_ = Number(_loc166_[2]);
            var _loc170_ = _loc166_[3] != "1" ? false : true;
            var _loc171_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc172_ = _loc171_.mc;
            var _loc173_ = _loc171_.ToolAnimation;
            _loc11_.addAction(96,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_ATTACK_CC",[_loc171_.name]),"INFO_FIGHT_CHAT"]);
            if(_loc168_ == undefined)
            {
               _loc11_.addAction(97,false,this.api.gfx,this.api.gfx.autoCalculateSpriteDirection,[_loc6_,_loc167_]);
               _loc11_.addAction(98,true,this.api.gfx,this.api.gfx.setSpriteAnim,[_loc6_,_loc173_]);
            }
            else
            {
               var _loc174_ = _loc171_.accessories[0].unicID;
               var _loc175_ = _loc171_.Guild;
               var _loc176_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
               _loc176_.file = dofus.Constants.SPELLS_PATH + _loc168_ + ".swf";
               _loc176_.level = 1;
               _loc176_.bInFrontOfSprite = _loc170_;
               _loc176_.params = new dofus.datacenter["\x12\x18"](new dofus.datacenter["\f\f"](undefined,_loc174_),_loc175_).elements;
               this.api.gfx.spriteLaunchVisualEffect(_loc6_,_loc176_,_loc167_,_loc169_,_loc173_);
            }
            break;
         case 304:
            var _loc177_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc178_ = _loc177_.mc;
            _loc11_.addAction(99,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalHit,[]);
            _loc11_.addAction(100,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_HIT") + ")","INFO_FIGHT_CHAT"]);
            if(!this.api.datacenter.Player.isSkippingFightAnimations && this.api.electron.isWindowFocused)
            {
               _loc11_.addAction(101,false,this.api.gfx,this.api.gfx.addSpriteExtraClipOnTimer,[_loc6_,dofus.Constants.CRITICAL_HIT_XTRA_FILE,undefined,true,dofus.Constants.CRITICAL_HIT_DURATION]);
            }
            if(_loc6_ == this.api.datacenter.Player.ID)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_OWNER);
            }
            else
            {
               var _loc179_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               var _loc180_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc6_)).Team;
               if(_loc179_ == _loc180_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ALLIED);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ENEMY);
               }
            }
            break;
         case 305:
            var _loc181_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            _loc11_.addAction(102,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalMiss,[]);
            _loc11_.addAction(103,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_ATTACK_CC",[_loc181_.name]),"INFO_FIGHT_CHAT"]);
            _loc11_.addAction(104,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_MISS") + ")","INFO_FIGHT_CHAT"]);
            _loc11_.addAction(105,false,this.api.gfx,this.api.gfx.addSpriteBubble,[_loc6_,this.api.lang.getText("CRITICAL_MISS")]);
            if(_loc6_ == this.api.datacenter.Player.ID)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_OWNER);
            }
            else
            {
               var _loc182_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               var _loc183_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc6_)).Team;
               if(_loc182_ == _loc183_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ALLIED);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ENEMY);
               }
            }
            break;
         case 306:
            var _loc184_ = _loc7_.split(",");
            var _loc185_ = Number(_loc184_[0]);
            var _loc186_ = Number(_loc184_[1]);
            var _loc187_ = _loc184_[2];
            var _loc188_ = Number(_loc184_[3]);
            var _loc189_ = _loc184_[4] != "1" ? false : true;
            var _loc190_ = Number(_loc184_[5]);
            var _loc191_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc192_ = this.api.datacenter.Sprites.getItemAt(_loc190_);
            var _loc193_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
            _loc193_.id = _loc185_;
            _loc193_.file = dofus.Constants.SPELLS_PATH + _loc187_ + ".swf";
            _loc193_.level = _loc188_;
            _loc193_.bInFrontOfSprite = _loc189_;
            _loc11_.addAction(106,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_START_TRAP",[_loc191_.name,this.api.lang.getSpellText(_loc193_.id).n,_loc192_.name]),"INFO_FIGHT_CHAT"]);
            _loc11_.addAction(107,false,this.api.gfx,this.api.gfx.addVisualEffectOnSprite,[_loc190_,_loc193_,_loc186_,11],1000);
            break;
         case 307:
            var _loc194_ = _loc7_.split(",");
            var _loc195_ = Number(_loc194_[0]);
            var _loc196_ = Number(_loc194_[1]);
            var _loc197_ = Number(_loc194_[3]);
            var _loc198_ = Number(_loc194_[5]);
            var _loc199_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc200_ = this.api.datacenter.Sprites.getItemAt(_loc198_);
            var _loc201_ = new dofus.datacenter["\x1e\x0e\x1c"](_loc195_,_loc197_);
            _loc11_.addAction(108,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_START_GLIPH",[_loc199_.name,_loc201_.name,_loc200_.name]),"INFO_FIGHT_CHAT"]);
            break;
         case 308:
            var _loc202_ = _loc7_.split(",");
            var _loc203_ = this.api.datacenter.Sprites.getItemAt(Number(_loc202_[0]));
            var _loc204_ = Number(_loc202_[1]);
            _loc11_.addAction(109,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_DODGE_AP",[_loc203_.name,_loc204_]),"INFO_FIGHT_CHAT"]);
            break;
         case 309:
            var _loc205_ = _loc7_.split(",");
            var _loc206_ = this.api.datacenter.Sprites.getItemAt(Number(_loc205_[0]));
            var _loc207_ = Number(_loc205_[1]);
            _loc11_.addAction(110,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_DODGE_MP",[_loc206_.name,_loc207_]),"INFO_FIGHT_CHAT"]);
            break;
         case 501:
            var _loc208_ = _loc7_.split(",");
            var _loc209_ = _loc208_[0];
            var _loc210_ = Number(_loc208_[1]);
            var _loc211_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc212_ = _loc208_[2] != undefined ? "anim" + _loc208_[2] : _loc211_.ToolAnimation;
            _loc11_.addAction(111,false,this.api.gfx,this.api.gfx.autoCalculateSpriteDirection,[_loc6_,_loc209_]);
            _loc11_.addAction(112,_loc6_ == this.api.datacenter.Player.ID,this.api.gfx,this.api.gfx.setSpriteLoopAnim,[_loc6_,_loc212_,_loc210_],_loc210_,true);
            break;
         case 617:
            _loc13_ = false;
            var _loc213_ = _loc7_.split(",");
            var _loc214_ = this.api.datacenter.Sprites.getItemAt(Number(_loc213_[0]));
            var _loc215_ = this.api.datacenter.Sprites.getItemAt(Number(_loc213_[1]));
            var _loc216_ = _loc213_[2];
            this.api.gfx.addSpriteBubble(_loc216_,this.api.lang.getText("A_ASK_MARRIAGE_B",[_loc214_.name,_loc215_.name]));
            if(_loc214_.id == this.api.datacenter.Player.ID)
            {
               this.api.kernel.showMessage(this.api.lang.getText("MARRIAGE"),this.api.lang.getText("A_ASK_MARRIAGE_B",[_loc214_.name,_loc215_.name]),"CAUTION_YESNO",{name:"Marriage",listener:this,params:{spriteID:_loc214_.id,refID:_loc6_}});
            }
            break;
         case 618:
         case 619:
            _loc13_ = false;
            var _loc217_ = _loc7_.split(",");
            var _loc218_ = this.api.datacenter.Sprites.getItemAt(Number(_loc217_[0]));
            var _loc219_ = this.api.datacenter.Sprites.getItemAt(Number(_loc217_[1]));
            var _loc220_ = _loc217_[2];
            var _loc221_ = _loc5_ != 618 ? "A_NOT_MARRIED_B" : "A_MARRIED_B";
            this.api.gfx.addSpriteBubble(_loc220_,this.api.lang.getText(_loc221_,[_loc218_.name,_loc219_.name]));
            break;
         case 900:
            _loc13_ = false;
            var _loc222_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc223_ = this.api.datacenter.Sprites.getItemAt(Number(_loc7_));
            if(_loc222_ == undefined || (_loc223_ == undefined || (this.api.ui.getUIComponent("AskCancelChallenge") != undefined || this.api.ui.getUIComponent("AskYesNoIgnoreChallenge") != undefined)))
            {
               this.refuseChallenge(_loc6_);
               return undefined;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("A_CHALENGE_B",[this.api.kernel.ChatManager.getLinkName(_loc222_.name),this.api.kernel.ChatManager.getLinkName(_loc223_.name)]),"INFO_CHAT");
            if(_loc222_.id == this.api.datacenter.Player.ID)
            {
               this.api.kernel.showMessage(this.api.lang.getText("CHALENGE"),this.api.lang.getText("YOU_CHALENGE_B",[_loc223_.name]),"INFO_CANCEL",{name:"Challenge",listener:this,params:{spriteID:_loc222_.id}});
            }
            if(_loc223_.id == this.api.datacenter.Player.ID)
            {
               if(this.api.kernel.ChatManager.isBlacklisted(_loc222_.name))
               {
                  this.refuseChallenge(_loc222_.id);
                  return undefined;
               }
               this.api.electron.makeNotification(this.api.lang.getText("A_CHALENGE_YOU",[_loc222_.name]));
               this.api.kernel.showMessage(this.api.lang.getText("CHALENGE"),this.api.lang.getText("A_CHALENGE_YOU",[_loc222_.name]),"CAUTION_YESNOIGNORE",{name:"Challenge",player:_loc222_.name,listener:this,params:{spriteID:_loc222_.id,player:_loc222_.name}});
               this.api.sounds.events.onGameInvitation();
            }
            break;
         case 901:
            _loc13_ = false;
            if(_loc6_ == this.api.datacenter.Player.ID || Number(_loc7_) == this.api.datacenter.Player.ID)
            {
               this.api.ui.unloadUIComponent("AskCancelChallenge");
            }
            break;
         case 902:
            _loc13_ = false;
            this.api.ui.unloadUIComponent("AskYesNoIgnoreChallenge");
            this.api.ui.unloadUIComponent("AskCancelChallenge");
            break;
         case 903:
            _loc13_ = false;
            switch(_loc7_)
            {
               case "c":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CHALENGE_FULL"),"ERROR_CHAT");
                  break;
               case "t":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("TEAM_FULL"),"ERROR_CHAT");
                  break;
               case "a":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("TEAM_DIFFERENT_ALIGNMENT"),"ERROR_CHAT");
                  break;
               case "g":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_BECAUSE_GUILD"),"ERROR_CHAT");
                  break;
               case "l":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_TOO_LATE"),"ERROR_CHAT");
                  break;
               case "m":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
                  break;
               case "p":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_BECAUSE_MAP"),"ERROR_CHAT");
                  break;
               case "r":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_BECAUSE_ON_RESPAWN"),"ERROR_CHAT");
                  break;
               case "o":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_YOU_R_OCCUPED"),"ERROR_CHAT");
                  break;
               case "z":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_YOU_OPPONENT_OCCUPED"),"ERROR_CHAT");
                  break;
               case "h":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_FIGHT"),"ERROR_CHAT");
                  break;
               case "i":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_FIGHT_NO_RIGHTS"),"ERROR_CHAT");
                  break;
               case "s":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_21"),"ERROR_CHAT");
                  break;
               case "n":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SUBSCRIPTION_OUT"),"ERROR_CHAT");
                  break;
               case "b":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("A_NOT_SUBSCRIB"),"ERROR_CHAT");
                  break;
               case "f":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("TEAM_CLOSED"),"ERROR_CHAT");
                  break;
               case "d":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("NO_ZOMBIE_ALLOWED"),"ERROR_CHAT");
            }
            break;
         case 905:
            this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("YOU_ARE_ATTAC"),background:true,timer:2000},{bForceLoad:true});
            break;
         case 906:
            var _loc224_ = _loc7_;
            var _loc225_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc226_ = this.api.datacenter.Sprites.getItemAt(_loc224_);
            var _loc227_ = _loc225_.name;
            var _loc228_ = _loc226_.name;
            if(_loc227_ == undefined || _loc228_ == undefined)
            {
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("A_ATTACK_B",[this.api.kernel.ChatManager.getLinkName(_loc227_),this.api.kernel.ChatManager.getLinkName(_loc228_)]),"INFO_CHAT");
            if(_loc224_ == this.api.datacenter.Player.ID)
            {
               this.api.electron.makeNotification(this.api.lang.getText("A_ATTACK_B",[_loc227_,_loc228_]));
               this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("YOU_ARE_ATTAC"),background:true,timer:2000},{bForceLoad:true});
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_AGRESSED);
            }
            else
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_AGRESS);
            }
            break;
         case 909:
            var _loc229_ = _loc7_;
            var _loc230_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
            var _loc231_ = this.api.datacenter.Sprites.getItemAt(_loc229_);
            this.api.kernel.showMessage(undefined,this.api.lang.getText("A_ATTACK_B",[_loc230_.name,_loc231_.name]),"INFO_CHAT");
            break;
         case 950:
            var _loc232_ = _loc7_.split(",");
            var _loc233_ = _loc232_[0];
            var _loc234_ = this.api.datacenter.Sprites.getItemAt(_loc233_);
            var _loc235_ = Number(_loc232_[1]);
            var _loc236_ = Number(_loc232_[2]) != 1 ? false : true;
            if(_loc235_ == 8 && (!_loc236_ && (_loc234_.hasCarriedParent() && !_loc234_.uncarryingSprite)))
            {
               _loc234_.uncarryingSprite = true;
               _loc11_.addAction(173,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc6_,_loc234_.cellNum,false,_loc11_]);
               _loc11_.addAction(113,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc233_,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc234_.Team]]);
            }
            _loc11_.addAction(114,false,_loc234_,_loc234_.setState,[_loc235_,_loc236_]);
            var _loc237_ = this.api.lang.getText(!_loc236_ ? "EXIT_STATE" : "ENTER_STATE",[_loc234_.name,this.api.lang.getStateText(_loc235_)]);
            _loc11_.addAction(115,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc237_,"INFO_FIGHT_CHAT"]);
            break;
         case 998:
            var _loc238_ = _loc2_.split(",");
            var _loc239_ = _loc238_[0];
            var _loc240_ = _loc238_[1];
            var _loc241_ = _loc238_[2];
            var _loc242_ = _loc238_[3];
            var _loc243_ = _loc238_[4];
            var _loc244_ = _loc238_[6];
            var _loc245_ = _loc238_[7];
            var _loc246_ = new dofus.datacenter["\x0f\r"](undefined,Number(_loc240_),Number(_loc241_),Number(_loc242_),Number(_loc243_),"",Number(_loc244_),Number(_loc245_));
            var _loc247_ = this.api.datacenter.Sprites.getItemAt(_loc239_);
            _loc247_.EffectsManager.addEffect(_loc246_);
            break;
         case 999:
            _loc11_.addAction(116,false,this.aks,this.aks.processCommand,[_loc7_]);
      }
      if(!_global.isNaN(_loc4_) && _loc6_ == this.api.datacenter.Player.ID)
      {
         _loc11_.addAction(117,false,_loc12_,_loc12_.ack,[_loc4_]);
      }
      else
      {
         _loc12_.end(_loc8_ == this.api.datacenter.Player.ID);
      }
      if(!_loc11_.isPlaying() && _loc13_)
      {
         _loc11_.execute(true);
      }
   }
   function cancel(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "AskCancelChallenge")
      {
         this.refuseChallenge(_loc2_.params.spriteID);
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "AskYesNoIgnoreChallenge":
            this.acceptChallenge(_loc2_.params.spriteID);
            break;
         case "AskYesNoMarriage":
            this.acceptMarriage(_loc2_.params.refID);
            this.api.gfx.addSpriteBubble(_loc2_.params.spriteID,this.api.lang.getText("YES"));
      }
   }
   function no(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "AskYesNoIgnoreChallenge":
            this.refuseChallenge(_loc2_.params.spriteID);
            break;
         case "AskYesNoMarriage":
            this.refuseMarriage(_loc2_.params.refID);
            this.api.gfx.addSpriteBubble(_loc2_.params.spriteID,this.api.lang.getText("NO"));
      }
   }
   function ignore(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "AskYesNoIgnoreChallenge")
      {
         this.api.kernel.ChatManager.addToBlacklist(_loc2_.params.player);
         this.api.kernel.showMessage(undefined,this.api.lang.getText("TEMPORARY_BLACKLISTED",[_loc2_.params.player]),"INFO_CHAT");
         this.refuseChallenge(_loc2_.params.spriteID);
      }
   }
}
