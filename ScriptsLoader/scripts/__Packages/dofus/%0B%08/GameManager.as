class dofus.§\x0b\b§.GameManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _sLastClickedMessage;
   var _nInactivityInterval;
   var _bFightActivity;
   var _nLastActivity;
   static var MINIMAL_SPELL_LAUNCH_DELAY = 500;
   static var _sSelf = null;
   var _aLastModified = new Array();
   var _bIsFullScreen = false;
   var _bIsAllowingScale = true;
   var _nLastSpellLaunch = 0;
   static var FIGHT_TYPE_CHALLENGE = 0;
   static var FIGHT_TYPE_AGRESSION = 1;
   static var FIGHT_TYPE_PvMA = 2;
   static var FIGHT_TYPE_MXvM = 3;
   static var FIGHT_TYPE_PvM = 4;
   static var FIGHT_TYPE_PvT = 5;
   static var FIGHT_TYPE_PvMU = 6;
   var _nFightTurnInactivity = 0;
   function GameManager(oAPI)
   {
      super();
      dofus["\x0b\b"].GameManager._sSelf = this;
      this.initialize(oAPI);
   }
   function get isFullScreen()
   {
      return this._bIsFullScreen;
   }
   function set isFullScreen(§\x1e\n\x02§)
   {
      this._bIsFullScreen = _loc2_;
   }
   function get isAllowingScale()
   {
      return this._bIsAllowingScale;
   }
   function set isAllowingScale(§\x1e\n\x02§)
   {
      this._bIsAllowingScale = _loc2_;
   }
   function set lastSpellLaunch(§\t\x02§)
   {
      this._nLastSpellLaunch = _loc2_;
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].GameManager._sSelf;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      this.api.ui.addEventListener("removeCursor",this);
   }
   function askPrivateMessage(§\x1e\x0e\x14§)
   {
      var _loc3_ = this.api.ui.loadUIComponent("AskPrivateChat","AskPrivateChat",{title:this.api.lang.getText("WISPER_MESSAGE") + " " + this.api.lang.getText("TO_DESTINATION") + " " + _loc2_,params:{playerName:_loc2_}});
      _loc3_.addEventListener("send",this);
      _loc3_.addEventListener("addfriend",this);
   }
   function giveUpGame()
   {
      if(this.api.datacenter.Game.fightType == dofus["\x0b\b"].GameManager.FIGHT_TYPE_CHALLENGE || this.api.datacenter.Basics.aks_current_server.typeNum != dofus.datacenter["\x1e\x12\x12"].SERVER_HARDCORE)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_GIVEUP"),"CAUTION_YESNO",{name:"GiveUp",listener:this});
      }
      else
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_SUICIDE"),"CAUTION_YESNO",{name:"GiveUp",listener:this});
      }
   }
   function offlineExchange()
   {
      this.api.network.Exchange.askOfflineExchange();
   }
   function askOfflineExchange(§\x1e\t§, tax, §\x1e\x16\n§)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_OFFLINEEXCHANGE",[_loc2_,tax,_loc4_]),"CAUTION_YESNO",{name:"OfflineExchange",listener:this,price:_loc4_});
   }
   function startExchange(§\x05\r§, §\x1e\r\x0e§, §\x07\x11§)
   {
      var _loc5_ = this.api.datacenter.Player.data;
      if(_loc5_.isInMove)
      {
         _loc5_.isInMove = false;
         _loc5_.GameActionsManager.cancel(_loc5_.cellNum,true);
      }
      this.api.network.Exchange.request(_loc2_,Number(_loc3_),_loc4_);
   }
   function startDialog(§\x1e\r\x0e§)
   {
      var _loc3_ = this.api.datacenter.Player.data;
      if(_loc3_.isInMove)
      {
         _loc3_.isInMove = false;
         _loc3_.GameActionsManager.cancel(_loc3_.cellNum,true);
      }
      this.api.network.Dialog.create(_loc2_);
   }
   function askAttack(§\x1e\r\x0e§)
   {
      var _loc3_ = this.api.datacenter.Sprites.getItemAt(_loc2_);
      var _loc4_ = "";
      if(!this.api.datacenter.Player.rank.enable)
      {
         _loc4_ += this.api.lang.getText("DO_U_ATTACK_WHEN_PVP_DISABLED");
      }
      if(_loc3_.rank.value == 0)
      {
         if(_loc4_ != "")
         {
            _loc4_ += "\n\n";
         }
         _loc4_ += this.api.lang.getText("DO_U_ATTACK_NEUTRAL");
      }
      if(_loc4_ != "")
      {
         _loc4_ += "\n\n";
      }
      if(!this.api.lang.getConfigText("SHOW_PVP_GAIN_WARNING_POPUP"))
      {
         _loc3_.pvpGain = 0;
      }
      switch(_loc3_.pvpGain)
      {
         case -1:
            _loc4_ += this.api.lang.getText("DO_U_ATTACK_NO_GAIN",[_loc3_.name]);
            break;
         case 1:
            _loc4_ += this.api.lang.getText("DO_U_ATTACK_BONUS_GAIN",[_loc3_.name]);
            break;
         default:
            _loc4_ += this.api.lang.getText("DO_U_ATTACK",[_loc3_.name]);
      }
      this.api.kernel.showMessage(undefined,_loc4_,"CAUTION_YESNO",{name:"Punish",listener:this,params:{spriteID:_loc2_}});
   }
   function askRemoveTaxCollector(§\x1e\r\x0e§)
   {
      var _loc3_ = this.api.datacenter.Sprites.getItemAt(_loc2_).name;
      this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_REMOVE_TAXCOLLECTOR",[_loc3_]),"CAUTION_YESNO",{name:"RemoveTaxCollector",listener:this,params:{spriteID:_loc2_}});
   }
   function useRessource(§\n\x1a§, §\x07\x11§, §\x1e\x1d\f§)
   {
      var _loc5_ = this.api.datacenter.Player.data.GameActionsManager;
      if(_loc5_ == undefined || _loc5_.isOnUncancelableAction(1))
      {
         return undefined;
      }
      if(this.api.gfx.onCellRelease(_loc2_))
      {
         this.api.network.GameActions.sendActions(500,[_loc3_,_loc4_]);
      }
   }
   function useSkill(§\x1e\x1d\f§)
   {
      this.api.network.GameActions.sendActions(507,[_loc2_]);
   }
   function setEnabledInteractionIfICan(§\x04\b§)
   {
      if(this.api.datacenter.Player.isCurrentPlayer)
      {
         this.api.gfx.setInteraction(_loc2_);
      }
   }
   function cleanPlayer(§\x1e\r\x0e§)
   {
      if(_loc2_ != this.api.datacenter.Game.currentPlayerID)
      {
         var _loc3_ = this.api.datacenter.Sprites.getItemAt(_loc2_);
         _loc3_.EffectsManager.nextTurn();
         _loc3_.CharacteristicsManager.nextTurn();
         _loc3_.GameActionsManager.clear();
      }
   }
   function cleanUpGameArea(§\x18\x04§)
   {
      if(_loc2_ && this.api.datacenter.Game.isRunning)
      {
         if(this.api.datacenter.Game.interactionType == dofus.datacenter.Game.INTERACTION_TYPE_SPELL)
         {
            var _loc3_ = this.api.datacenter.Player.currentUseObject;
            if(_loc3_ != null)
            {
               this.switchToSpellLaunch(_loc3_,true);
               return undefined;
            }
         }
      }
      this.api.ui.removeCursor();
      this.api.ui.getUIComponent("Banner").hideRightPanel();
      this.api.gfx.clearZoneLayer("spell");
      this.api.gfx.clearPointer();
      this.api.gfx.unSelect(true);
      delete this.api.datacenter.Player.currentUseObject;
      if(!(this.api.datacenter.Game.isFight && !this.api.datacenter.Game.isRunning))
      {
         this.api.datacenter.Game.setInteractionType("move");
      }
      this.api.datacenter.Player.InteractionsManager.setState(this.api.datacenter.Game.isFight);
   }
   function terminateFight()
   {
      if(!this.api.datacenter.Basics.isLogged)
      {
         return undefined;
      }
      this.api.sounds.events.onGameEnd();
      this.api.sounds.playMusic(this.api.datacenter.Map.musicID);
      this.api.kernel.showMessage(undefined,this.api.lang.getText("GAME_END"),"INFO_CHAT");
      if(!this.api.datacenter.Player.isSkippingLootPanel)
      {
         this.api.ui.loadUIComponent("GameResult","GameResult",{data:this.api.datacenter.Game.results},{bAlwaysOnTop:true});
      }
      this.api.gfx.cleanMap();
      this.api.network.Game.onLeave();
   }
   function switchToItemTarget(§\x1e\x19\x03§)
   {
      if(this.api.datacenter.Game.isFight)
      {
         return undefined;
      }
      this.api.gfx.clearPointer();
      this.api.gfx.addPointerShape("C",0,dofus.Constants.CELL_SPELL_EFFECT_COLOR,this.api.datacenter.Player.data.cellNum);
      this.api.datacenter.Player.currentUseObject = _loc2_;
      this.api.datacenter.Game.setInteractionType("target");
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT);
      this.api.ui.setCursor(_loc2_,{width:25,height:25,x:15,y:15});
      this.api.datacenter.Basics.gfx_canLaunch = false;
      dofus["\x10\x16"].getInstance().forceMouseOver();
   }
   function switchToFlagSet()
   {
      if(!this.api.datacenter.Game.isFight)
      {
         return undefined;
      }
      this.api.gfx.clearPointer();
      this.api.gfx.unSelectAllButOne("startPosition");
      this.api.gfx.addPointerShape("C",0,dofus.Constants.CELL_SPELL_EFFECT_COLOR,this.api.datacenter.Player.data.cellNum);
      this.api.datacenter.Game.setInteractionType("flag");
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT);
      this.api.ui.removeCursor();
      this.api.datacenter.Basics.gfx_canLaunch = false;
      dofus["\x10\x16"].getInstance().forceMouseOver();
   }
   function switchToSpellLaunch(§\x1e\x17\x17§, §\x14\x1d§, §\x19\x19§)
   {
      if(_loc4_ != true)
      {
         if(!this.api.datacenter.Game.isRunning)
         {
            return undefined;
         }
         var _loc5_ = this.api.datacenter.Player.data;
         var _loc6_ = _loc5_.sequencer;
         if(_loc5_.isInMove)
         {
            return undefined;
         }
         if(_loc6_.containsAction(_loc5_.GameActionsManager,_loc5_.GameActionsManager.transmittingMove))
         {
            return undefined;
         }
         if(_loc5_.GameActionsManager.isWaiting())
         {
            return undefined;
         }
         if(_loc5_.GameActionsManager.m_bNextAction)
         {
            return undefined;
         }
         if(this._nLastSpellLaunch + dofus["\x0b\b"].GameManager.MINIMAL_SPELL_LAUNCH_DELAY > getTimer())
         {
            return undefined;
         }
         if(!this.api.datacenter.Player.SpellsManager.checkCanLaunchSpell(_loc2_.ID,undefined))
         {
            if(this.api.datacenter.Basics.spellManager_errorMsg != undefined)
            {
               this.api.kernel.showMessage(undefined,this.api.datacenter.Basics.spellManager_errorMsg,"ERROR_CHAT");
               delete this.api.datacenter.Basics.spellManager_errorMsg;
            }
            return undefined;
         }
      }
      this.api.gfx.mapHandler.resetEmptyCells();
      this.api.datacenter.Player.isCurrentSpellForced = _loc4_;
      delete this.api.datacenter.Basics.interactionsManager_path;
      this.api.gfx.unSelect(true);
      this.api.datacenter.Player.currentUseObject = _loc2_;
      this.api.gfx.clearZoneLayer("spell");
      this.api.gfx.clearPointer();
      var _loc7_ = this.api.datacenter.Player.data.cellNum;
      if(_loc2_.rangeMax != 63)
      {
         var _loc8_ = _loc2_.rangeMax;
         var _loc9_ = _loc2_.rangeMin;
         if(_loc8_ != 0)
         {
            var _loc10_ = !_loc2_.canBoostRange ? 0 : this.api.datacenter.Player.data.CharacteristicsManager.getModeratorValue(19) + this.api.datacenter.Player.RangeModerator;
            _loc8_ += _loc10_;
            _loc8_ = Math.max(_loc9_,_loc8_);
         }
         if(_loc2_.lineOnly)
         {
            this.api.gfx.drawZone(_loc7_,_loc9_,_loc8_,"spell",dofus.Constants.CELL_SPELL_RANGE_COLOR,"X");
            this.drawAllowedZone(true,_loc7_,_loc9_,_loc8_);
         }
         else
         {
            this.api.gfx.drawZone(_loc7_,_loc9_,_loc8_,"spell",dofus.Constants.CELL_SPELL_RANGE_COLOR,"C");
            this.drawAllowedZone(false,_loc7_,_loc9_,_loc8_);
         }
      }
      else
      {
         this.api.gfx.drawZone(0,0,100,"spell",dofus.Constants.CELL_SPELL_RANGE_COLOR,"C");
      }
      var _loc11_ = _loc2_.effectZones;
      var _loc12_ = 0;
      while(_loc12_ < _loc11_.length)
      {
         if(!(_loc11_[_loc12_].size >= 63 && _loc11_[_loc12_].shape != "L"))
         {
            this.api.gfx.addPointerShape(_loc11_[_loc12_].shape,_loc11_[_loc12_].size,dofus.Constants.CELL_SPELL_EFFECT_COLOR,_loc7_);
         }
         _loc12_ = _loc12_ + 1;
      }
      if(_loc3_)
      {
         this.api.datacenter.Game.setInteractionType("spell");
      }
      else
      {
         this.api.datacenter.Game.setInteractionType("cc");
      }
      this.api.ui.setCursor(_loc2_,{width:25,height:25,x:15,y:15},true);
      this.api.ui.setCursorForbidden(true,dofus.Constants.FORBIDDEN_FILE);
      this.api.datacenter.Basics.gfx_canLaunch = false;
      dofus["\x10\x16"].getInstance().forceMouseOver();
   }
   function drawAllowedZone(lineOnly, §\x1e\x17\x1d§, §\f\x13§, §\x1e\x17\t§)
   {
      if(!this.api.kernel.OptionsManager.getOption("AdvancedLineOfSight"))
      {
         return undefined;
      }
      var _loc6_ = this.api.gfx.mapHandler.getCellCount();
      var _loc7_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(this.api.gfx.mapHandler,_loc3_);
      var _loc8_ = !this.api.datacenter.Player.currentUseObject.canBoostRange ? 0 : this.api.datacenter.Player.data.CharacteristicsManager.getModeratorValue(19) + this.api.datacenter.Player.RangeModerator;
      var _loc9_ = 0;
      for(; _loc9_ < _loc6_; _loc9_ = _loc9_ + 1)
      {
         var _loc10_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].goalDistance(this.api.gfx.mapHandler,_loc3_,_loc9_);
         if(_loc10_ >= _loc4_ && _loc10_ <= _loc5_)
         {
            if(lineOnly)
            {
               var _loc11_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(this.api.gfx.mapHandler,_loc9_);
               if(_loc11_.x != _loc7_.x && _loc11_.y != _loc7_.y)
               {
                  continue;
               }
            }
            if(this.api.datacenter.Player.SpellsManager.checkCanLaunchSpellOnCell(this.api.gfx.mapHandler,this.api.datacenter.Player.currentUseObject,this.api.gfx.mapHandler.getCellData(_loc9_),_loc8_))
            {
               this.api.gfx.select(_loc9_,26316,"spell",50);
            }
         }
      }
   }
   function showDisgraceSanction()
   {
      var _loc2_ = this.api.datacenter.Player.rank.disgrace;
      if(_loc2_ > 0)
      {
         var _loc3_ = "";
         var _loc4_ = 1;
         while(_loc4_ <= _loc2_)
         {
            var _loc5_ = this.api.lang.getText("DISGRACE_SANCTION_" + _loc4_);
            if(_loc5_ != undefined && (_loc5_ != "undefined" && _loc5_.charAt(0) != "!"))
            {
               _loc3_ += "\n\n" + _loc5_;
            }
            _loc4_ = _loc4_ + 1;
         }
         if(_loc3_ != "")
         {
            _loc3_ = this.api.lang.getText("DISGRACE_SANCTION",[ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("POINTS",[_loc2_]),"m",_loc2_ < 2)]) + _loc3_;
            this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),_loc3_,"ERROR_BOX");
         }
      }
   }
   function getSpellDescriptionWithEffects(§\x1e\x1c§, §\x13\x19§, §\x1e\x1d\x01§)
   {
      var _loc5_ = new Array();
      var _loc6_ = _loc2_.length;
      if(typeof _loc2_ == "object")
      {
         var _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            var _loc8_ = _loc2_[_loc7_];
            var _loc9_ = _loc8_[0];
            var _loc10_ = !(_loc4_ > 0 && this.api.kernel.SpellsBoostsManager.isBoostedHealingOrDamagingEffect(_loc9_)) ? -1 : this.api.kernel.SpellsBoostsManager.getSpellModificator(_loc9_,_loc4_);
            var _loc11_ = new dofus.datacenter["\x0f\r"](undefined,_loc9_,_loc8_[1],_loc8_[2],_loc8_[3],undefined,_loc8_[4],undefined,_loc10_);
            if(_loc3_ == true)
            {
               if(_loc11_.showInTooltip)
               {
                  _loc5_.push(_loc11_.description);
               }
            }
            else
            {
               _loc5_.push(_loc11_.description);
            }
            _loc7_ = _loc7_ + 1;
         }
         return _loc5_.join(", ");
      }
      return null;
   }
   function getSpellEffects(§\x1e\x1c§, §\x1e\x1d\x01§)
   {
      var _loc4_ = new Array();
      var _loc5_ = _loc2_.length;
      if(typeof _loc2_ == "object")
      {
         var _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            var _loc7_ = _loc2_[_loc6_];
            var _loc8_ = _loc7_[0];
            var _loc9_ = -1;
            if(_loc3_ > 0)
            {
               if(this.api.kernel.SpellsBoostsManager.isBoostedHealingEffect(_loc8_))
               {
                  _loc9_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_HEAL,_loc3_);
               }
               else if(this.api.kernel.SpellsBoostsManager.isBoostedDamagingEffect(_loc8_))
               {
                  _loc9_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_DMG,_loc3_);
               }
            }
            var _loc10_ = new dofus.datacenter["\x0f\r"](undefined,_loc8_,_loc7_[1],_loc7_[2],_loc7_[3],_loc7_[6],_loc7_[4],undefined,_loc9_);
            _loc10_.probability = _loc7_[5];
            _loc4_.push(_loc10_);
            _loc6_ = _loc6_ + 1;
         }
         return _loc4_;
      }
      return null;
   }
   function removeCursor(§\x1e\x19\x0e§)
   {
      switch(this.api.datacenter.Game.interactionType)
      {
         case 2:
         case 3:
            if(!this.api.datacenter.Basics.gfx_canLaunch)
            {
               this.api.datacenter.Game.setInteractionType("move");
            }
            this.api.gfx.clearZoneLayer("spell");
            this.api.gfx.clearPointer();
            this.api.gfx.unSelect(true);
            break;
         case 5:
            if(!this.api.datacenter.Basics.gfx_canLaunch)
            {
               this.api.datacenter.Game.setInteractionType("move");
            }
            this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
            this.api.gfx.clearPointer();
            this.api.gfx.unSelectAllButOne("startPosition");
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "AskYesNoGiveUp":
            this.api.network.Game.leave();
            break;
         case "AskYesNoOfflineExchange":
            this.api.network.Exchange.offlineExchange();
            break;
         case "AskYesNoPunish":
            this.api.network.GameActions.attack(_loc2_.params.spriteID);
            break;
         case "AskYesNoAttack":
            this.api.network.GameActions.attack(_loc2_.params.spriteID);
            break;
         case "AskYesNoRemoveTaxCollector":
            this.api.network.Guild.removeTaxCollector(_loc2_.params.spriteID);
      }
   }
   function send(§\x1e\x19\x0e§)
   {
      if(_loc2_.message.length != 0)
      {
         this.api.kernel.Console.process("/w " + _loc2_.params.playerName + " " + _loc2_.message);
      }
   }
   function addfriend(§\x1e\x19\x0e§)
   {
      this.api.network.Friends.addFriend(_loc2_.params.playerName);
   }
   function updateCompass(nX, nY, §\x19\x19§)
   {
      var _loc5_ = this.api.ui.getUIComponent("Banner");
      if(!_loc4_ && (this.api.datacenter.Basics.banner_targetCoords[0] == nX && this.api.datacenter.Basics.banner_targetCoords[1] == nY) || (_global.isNaN(nX) || _global.isNaN(nY)))
      {
         this.api.datacenter.Basics.banner_targetCoords = undefined;
         delete this.api.datacenter.Basics.banner_targetCoords;
         if(_loc5_.illustrationType != "map")
         {
            _loc5_.showCircleXtra("artwork",true,{bMask:true});
         }
         return false;
      }
      var _loc6_ = this.api.datacenter.Map;
      if(_loc5_.illustrationType != "map")
      {
         _loc5_.showCircleXtra("compass",true,undefined,{updateOnLoad:false});
      }
      _loc5_.setCircleXtraParams({allCoords:{targetCoords:[nX,nY],currentCoords:[_loc6_.x,_loc6_.y]}});
      this.api.datacenter.Basics.banner_targetCoords = [nX,nY];
      return true;
   }
   function isItemUseful(§\f\n§, §\x1e\x10\x1c§, §\x0b\x03§)
   {
      var _loc5_ = this.api.lang.getSkillText(_loc3_).cl;
      var _loc6_ = 0;
      while(_loc6_ < _loc5_.length)
      {
         var _loc7_ = _loc5_[_loc6_];
         var _loc8_ = this.api.lang.getCraftText(_loc7_);
         if(_loc8_.length <= _loc4_)
         {
            var _loc9_ = 0;
            while(_loc9_ < _loc8_.length)
            {
               if(_loc8_[_loc9_][0] == _loc2_)
               {
                  return true;
               }
               _loc9_ = _loc9_ + 1;
            }
         }
         _loc6_ = _loc6_ + 1;
      }
      return false;
   }
   function analyseReceipts(§\x10\x10§, §\x1e\x10\x1c§, §\x0b\x03§)
   {
      var _loc5_ = this.api.lang.getSkillText(_loc3_).cl;
      var _loc6_ = 0;
      while(_loc6_ < _loc5_.length)
      {
         var _loc7_ = _loc5_[_loc6_];
         var _loc8_ = this.api.lang.getCraftText(_loc7_);
         if(_loc8_.length <= _loc4_)
         {
            var _loc9_ = 0;
            var _loc10_ = 0;
            while(_loc10_ < _loc8_.length)
            {
               var _loc11_ = _loc8_[_loc10_];
               var _loc12_ = _loc11_[0];
               var _loc13_ = _loc11_[1];
               var _loc14_ = _loc2_.findFirstItem("unicID",_loc12_);
               if(!(_loc14_.index != -1 && _loc14_.item.Quantity == _loc13_))
               {
                  break;
               }
               _loc9_ = _loc9_ + 1;
               _loc10_ = _loc10_ + 1;
            }
            if(_loc9_ == _loc8_.length)
            {
               if(_loc2_.length == _loc8_.length)
               {
                  return _loc7_;
               }
               if(_loc2_.length == _loc8_.length + 1)
               {
                  if(_loc2_.findFirstItem("unicID",7508).index != -1)
                  {
                     return _loc7_;
                  }
               }
            }
         }
         _loc6_ = _loc6_ + 1;
      }
      return undefined;
   }
   function mergeTwoInventory(§\x1b§, §\x1a§)
   {
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.length)
      {
         _loc4_.push(_loc2_[_loc5_]);
         _loc5_ = _loc5_ + 1;
      }
      var _loc6_ = 0;
      while(_loc6_ < _loc3_.length)
      {
         _loc4_.push(_loc3_[_loc6_]);
         _loc6_ = _loc6_ + 1;
      }
      return _loc4_;
   }
   function mergeUnicItemInInventory(inventory)
   {
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = new Object();
      var _loc5_ = 0;
      while(_loc5_ < inventory.length)
      {
         var _loc6_ = inventory[_loc5_];
         if(_loc4_[_loc6_.unicID] == undefined)
         {
            _loc4_[_loc6_.unicID] = _loc6_.clone();
         }
         else
         {
            _loc4_[_loc6_.unicID].Quantity += _loc6_.Quantity;
         }
         _loc5_ = _loc5_ + 1;
      }
      for(var a in _loc4_)
      {
         _loc3_.push(_loc4_[a]);
      }
      return _loc3_;
   }
   function getRemainingString(§\x1e\x1e\n§)
   {
      if(_loc2_ == -1)
      {
         return this.api.lang.getText("OPEN_BETA_ACCOUNT");
      }
      if(_loc2_ == 0)
      {
         return this.api.lang.getText("SUBSCRIPTION_OUT");
      }
      var _loc3_ = new Date();
      _loc3_.setTime(_loc2_);
      var _loc4_ = _loc3_.getUTCFullYear() - 1970;
      var _loc5_ = _loc3_.getUTCMonth();
      var _loc6_ = _loc3_.getUTCDate() - 1;
      var _loc7_ = _loc3_.getUTCHours();
      var _loc8_ = _loc3_.getUTCMinutes();
      var _loc9_ = " " + this.api.lang.getText("AND") + " ";
      var _loc10_ = this.api.lang.getText("REMAINING_TIME") + " ";
      if(_loc4_ != 0 && _loc5_ == 0)
      {
         var _loc11_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("YEARS"),"m",_loc4_ == 1);
         _loc10_ += _loc4_ + " " + _loc11_;
      }
      else if(_loc4_ != 0 && _loc5_ != 0)
      {
         var _loc12_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("YEARS"),"m",_loc4_ == 1);
         var _loc13_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("MONTHS"),"m",_loc5_ == 1);
         _loc10_ += _loc4_ + " " + _loc12_ + _loc9_ + _loc5_ + " " + _loc13_;
      }
      else if(_loc5_ != 0 && _loc6_ == 0)
      {
         var _loc14_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("MONTHS"),"m",_loc5_ == 1);
         _loc10_ += _loc5_ + " " + _loc14_;
      }
      else if(_loc5_ != 0 && _loc6_ != 0)
      {
         var _loc15_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("MONTHS"),"m",_loc5_ == 1);
         var _loc16_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("DAYS"),"m",_loc6_ == 1);
         _loc10_ += _loc5_ + " " + _loc15_ + _loc9_ + _loc6_ + " " + _loc16_;
      }
      else if(_loc6_ != 0 && _loc7_ == 0)
      {
         var _loc17_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("DAYS"),"m",_loc6_ == 1);
         _loc10_ += _loc6_ + " " + _loc17_;
      }
      else if(_loc6_ != 0 && _loc7_ != 0)
      {
         var _loc18_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("DAYS"),"m",_loc6_ == 1);
         var _loc19_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("HOURS"),"m",_loc7_ == 1);
         _loc10_ += _loc6_ + " " + _loc18_ + _loc9_ + _loc7_ + " " + _loc19_;
      }
      else if(_loc7_ != 0 && _loc8_ == 0)
      {
         var _loc20_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("HOURS"),"m",_loc7_ == 1);
         _loc10_ += _loc7_ + " " + _loc20_;
      }
      else if(_loc7_ != 0 && _loc8_ != 0)
      {
         var _loc21_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("HOURS"),"m",_loc7_ == 1);
         var _loc22_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("MINUTES"),"m",_loc8_ == 1);
         _loc10_ += _loc7_ + " " + _loc21_ + _loc9_ + _loc8_ + " " + _loc22_;
      }
      else if(_loc8_ != 0)
      {
         var _loc23_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("MINUTES"),"m",_loc8_ == 1);
         _loc10_ += _loc8_ + " " + _loc23_;
      }
      return _loc10_;
   }
   function zoomGfx(§\x1e\x1a\x11§, §\x1e\t\x14§, §\x1e\t\x0b§, §\x1e\t\f§, §\x1e\t\b§)
   {
      var _loc7_ = this.api.gfx.container;
      var _loc8_ = ank.battlefield.Constants.CELL_WIDTH;
      var _loc9_ = ank.battlefield.Constants.CELL_HEIGHT;
      if(_loc2_ != undefined)
      {
         var _loc10_ = this.api.gfx.screenWidth;
         var _loc11_ = this.api.gfx.screenHeight;
         if(_loc3_ == undefined)
         {
            _loc3_ = _loc10_ / 2;
         }
         if(_loc4_ == undefined)
         {
            _loc3_ = _loc11_ / 2;
         }
         if(_loc5_ == undefined)
         {
            _loc5_ = _loc10_ / 2;
         }
         if(_loc6_ == undefined)
         {
            _loc6_ = _loc11_ / 2;
         }
         var _loc12_ = _loc3_ * _loc2_ / 100;
         var _loc13_ = _loc4_ * _loc2_ / 100;
         var _loc14_ = _loc5_ - _loc12_;
         var _loc15_ = _loc6_ - _loc13_;
         var _loc16_ = (this.api.datacenter.Map.width - 1) * _loc8_ * _loc2_ / 100;
         var _loc17_ = (this.api.datacenter.Map.height - 1) * _loc9_ * _loc2_ / 100;
         if(_loc14_ > 0)
         {
            _loc14_ = 0;
         }
         if(_loc14_ + _loc16_ < _loc10_)
         {
            _loc14_ = _loc10_ - _loc16_;
         }
         if(_loc15_ > 0)
         {
            _loc15_ = 0;
         }
         if(_loc15_ + _loc17_ < _loc11_)
         {
            _loc15_ = _loc11_ - _loc17_;
         }
         _loc7_.zoom(_loc2_);
         _loc7_.setXY(_loc14_,_loc15_);
      }
      else
      {
         if(!_loc7_.zoomMap())
         {
            _loc7_.zoom(100);
         }
         _loc7_.center();
      }
   }
   function zoomGfxRoot(§\x1e\x1a\x11§, §\x1e\t\f§, §\x1e\t\b§)
   {
      var _loc5_ = Stage.width;
      var _loc6_ = Stage.height;
      var _loc7_ = _loc3_ * _loc2_ / 100;
      var _loc8_ = _loc4_ * _loc2_ / 100;
      if(_loc2_ <= 100)
      {
         var _loc9_ = 0;
         var _loc10_ = 0;
      }
      else
      {
         _loc9_ = _loc3_ - _loc7_;
         _loc10_ = _loc4_ - _loc8_;
      }
      var _loc11_ = _root;
      _loc11_._xscale = _loc2_;
      _loc11_._yscale = _loc2_;
      _loc11_._x = _loc9_;
      _loc11_._y = _loc10_;
   }
   function showMonsterPopupMenu(§\x1e\x17\x15§)
   {
      var _loc3_ = _loc2_;
      if(_loc3_ == null)
      {
         return undefined;
      }
      var _loc4_ = this.api.datacenter.Game.isFight;
      var _loc5_ = _loc3_.id;
      var _loc6_ = _loc3_.name;
      var _loc7_ = this.api.ui.createPopupMenu();
      _loc7_.addStaticItem(_loc6_);
      if(_loc4_ && (!this.api.datacenter.Game.isRunning && (_loc3_.kickable || this.api.datacenter.Player.isAuthorized)))
      {
         _loc7_.addItem(this.api.lang.getText("KICK"),this.api.network.Game,this.api.network.Game.leave,[_loc5_]);
      }
      if(_loc7_.items.length > 1)
      {
         _loc7_.show(_root._xmouse,_root._ymouse,true);
      }
   }
   function applyCreatureMode()
   {
      if(!this.api.datacenter.Game.isFight && this.api.gfx.isContainerVisible)
      {
         var _loc2_ = this.api.datacenter.Game.playerCount;
         var _loc3_ = this.api.kernel.OptionsManager.getOption("CreaturesMode");
         if(_loc2_ >= _loc3_)
         {
            this.api.gfx.spriteHandler.setCreatureMode(true);
         }
         else if(_loc2_ < _loc3_ - 2)
         {
            this.api.gfx.spriteHandler.setCreatureMode(false);
         }
      }
   }
   function showCellPlayersPopupMenu(§\x1e\b§)
   {
      var _loc3_ = false;
      var _loc4_ = this.api.ui.createPopupMenu();
      for(var k in _loc2_)
      {
         var _loc5_ = this.api.gfx.getSprite(k);
         if(_loc5_ instanceof dofus.datacenter["\x13\x01"] || _loc5_ instanceof dofus.datacenter["\t\x07"] && _loc5_.showIsPlayer)
         {
            if(_loc5_.gfxID != "999")
            {
               _loc3_ = true;
               var _loc6_ = _loc5_.name + " >>";
               _loc4_.addItem(_loc6_,this,this.showPlayerPopupMenu,[_loc5_,undefined]);
            }
         }
      }
      if(_loc3_)
      {
         _loc4_.show(_root._xmouse,_root._ymouse,true);
      }
   }
   function get lastClickedMessage()
   {
      return this._sLastClickedMessage;
   }
   function showMessagePopupMenu(§\x1e\x0e\x14§, §\x1e\x10\x02§, §\x1e\x0b\x1d§)
   {
      this._sLastClickedMessage = _loc3_;
      var _loc5_ = this.api.ui.createPopupMenu();
      _loc5_.addItem(_loc2_ + " >>",this.api.kernel.GameManager,this.api.kernel.GameManager.showPlayerPopupMenu,[undefined,_loc2_,null,null,null,_loc4_,this.api.datacenter.Player.isAuthorized,null,true],true);
      _loc5_.addItem(this.api.lang.getText("COPY"),System,System.setClipboard,[_loc3_],true);
      _loc5_.show(_root._xmouse,_root._ymouse,true);
   }
   function showPlayerPopupMenu(§\x1e\x17\x15§, §\x1e\x0e\x14§, §\x1e\x18\t§, §\x17\b§, §\x17\x07§, §\x1e\x0b\x1c§, §\x15\t§, §\x19\x14§, §\x18\x05§)
   {
      if(!_loc10_)
      {
         this._sLastClickedMessage = undefined;
      }
      if(_loc9_ == undefined)
      {
         _loc9_ = false;
      }
      var _loc11_ = null;
      if(_loc2_ != undefined)
      {
         _loc11_ = _loc2_;
      }
      else
      {
         if(_loc3_ == undefined)
         {
            return undefined;
         }
         var _loc12_ = this.api.datacenter.Sprites.getItems();
         loop0:
         for(var a in _loc12_)
         {
            var _loc13_ = _loc12_[a];
            if(_loc13_.name.toUpperCase() != _loc3_.toUpperCase())
            {
               continue;
            }
            _loc11_ = _loc13_;
            while(true)
            {
               if(§§pop() == null)
               {
                  break loop0;
               }
            }
         }
      }
      var _loc14_ = this.api.datacenter.Game.isFight;
      var _loc15_ = _loc11_.id;
      var _loc16_ = _loc3_ != undefined ? _loc3_ : _loc11_.name;
      if(Key.isDown(Key.SHIFT) && _loc16_ != this.api.datacenter.Player.Name)
      {
         var _loc17_ = this.api.ui.getUIComponent("Banner");
         _loc17_.txtConsole = "/w " + _loc16_ + " ";
         _loc17_.placeCursorAtTheEnd();
      }
      else
      {
         if(this.api.datacenter.Player.isAuthorized && !_loc9_)
         {
            var _loc18_ = this.api.kernel.AdminManager.getAdminPopupMenu(_loc16_,false);
            _loc18_.addItem(_loc16_ + " >>",this,this.showPlayerPopupMenu,[_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,true],true);
            _loc18_.items.unshift(_loc18_.items.pop());
         }
         else
         {
            _loc18_ = this.getPlayerPopupMenu(_loc11_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
         }
         if(_loc18_.items.length > 0)
         {
            _loc18_.show(_root._xmouse,_root._ymouse,true);
         }
      }
   }
   function showTeamAdminPopupMenu(§\x1e\f\x15§)
   {
      var _loc3_ = this.api.kernel.AdminManager.getAdminPopupMenu(_loc2_,false);
      _loc3_.show(_root._xmouse,_root._ymouse,true);
   }
   function getDurationString(§\x10\x12§, §\x1c\x02§)
   {
      if(_loc2_ <= 0)
      {
         return "-";
      }
      var _loc4_ = new Date();
      _loc4_.setTime(_loc2_);
      var _loc5_ = _loc4_.getUTCHours();
      var _loc6_ = _loc4_.getUTCMinutes();
      var _loc7_ = _loc4_.getSeconds();
      if(_loc3_ != true)
      {
         return (_loc5_ == 0 ? "" : _loc5_ + " " + this.api.lang.getText("HOURS_SMALL") + " ") + _loc6_ + " " + this.api.lang.getText("MINUTES_SMALL") + " " + _loc7_ + " " + this.api.lang.getText("SECONDS_SMALL");
      }
      return (_loc5_ == 0 ? "" : _loc5_ + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("HOURS"),"m",_loc5_ < 2) + " ") + _loc6_ + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("MINUTES"),"m",_loc6_ < 2) + " " + _loc7_ + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("SECONDS"),"m",_loc7_ < 2);
   }
   function insertItemInChat(§\x1e\x19\x03§, §\x1e\x0e\x12§, §\x1e\r\x06§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = "";
      }
      if(_loc4_ == undefined)
      {
         _loc4_ = "";
      }
      if(this.api.datacenter.Basics.chatParams.items == undefined)
      {
         this.api.datacenter.Basics.chatParams.items = new Array();
      }
      if(this.api.lang.getConfigText("CHAT_MAXIMUM_LINKS") == undefined || this.api.datacenter.Basics.chatParams.items.length < this.api.lang.getConfigText("CHAT_MAXIMUM_LINKS"))
      {
         this.api.datacenter.Basics.chatParams.items.push(_loc2_);
         this.api.ui.getUIComponent("Banner").insertChat(_loc3_ + "[" + _loc2_.name + "]" + _loc4_);
      }
      else
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("TOO_MANY_ITEM_LINK"),"ERROR_CHAT");
      }
   }
   function getLastModified(§\x1e\x1d\x07§)
   {
      var _loc3_ = this._aLastModified[_loc2_];
      if(_loc3_ == undefined || _global.isNaN(_loc3_))
      {
         return 0;
      }
      return _loc3_;
   }
   function setAsModified(§\x1e\x1d\x07§)
   {
      if(_loc2_ < 0)
      {
         return undefined;
      }
      this._aLastModified[_loc2_] = getTimer();
   }
   function getCriticalHitChance(§\x06\b§)
   {
      if(_loc2_ == 0)
      {
         return 0;
      }
      var _loc3_ = Math.max(0,this.api.datacenter.Player.CriticalHitBonus);
      var _loc4_ = Math.max(0,this.api.datacenter.Player.AgilityTotal);
      _loc2_ -= _loc3_;
      if(_loc4_ != 0)
      {
         _loc2_ = Math.min(_loc2_,Number(_loc2_ * (Math.E * 1.1 / Math.log(_loc4_ + 12))));
      }
      return Math.floor(Math.max(_loc2_,2));
   }
   function reportSentance(§\x1e\x0f\x16§, sID, §\x1e\x0b\x1c§, §\x1e\x19\x15§)
   {
      if(_loc4_ != undefined && (_loc4_.length > 0 && _loc4_ != ""))
      {
         this.api.ui.loadUIComponent("AskReportMessage","AskReportMessage" + _loc4_,{message:this.api.kernel.ChatManager.getMessageFromId(_loc4_),messageId:_loc4_,authorId:sID,authorName:_loc2_});
      }
      else
      {
         this.api.kernel.ChatManager.addToBlacklist(_loc2_,_loc5_.gfxID);
         this.api.kernel.showMessage(undefined,this.api.lang.getText("TEMPORARY_BLACKLISTED",[_loc2_]),"INFO_CHAT");
      }
   }
   function isInMyTeam(§\x1e\x0e\x0f§)
   {
      if(this.api.datacenter.Basics.aks_current_team == 0)
      {
         var _loc3_ = 0;
         while(_loc3_ < this.api.datacenter.Basics.aks_team1_starts.length)
         {
            if(this.api.datacenter.Basics.aks_team1_starts[_loc3_] == _loc2_.cellNum)
            {
               return true;
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      else if(this.api.datacenter.Basics.aks_current_team == 1)
      {
         var _loc4_ = 0;
         while(_loc4_ < this.api.datacenter.Basics.aks_team2_starts.length)
         {
            if(this.api.datacenter.Basics.aks_team2_starts[_loc4_] == _loc2_.cellNum)
            {
               return true;
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      return false;
   }
   function startInactivityDetector()
   {
      this.stopInactivityDetector();
      this.signalActivity();
      this._nInactivityInterval = _global.setInterval(this,"inactivityCheck",1000);
      this._bFightActivity = false;
      Mouse.addListener(this);
   }
   function signalActivity()
   {
      this._nLastActivity = getTimer();
   }
   function stopInactivityDetector()
   {
      if(this._nInactivityInterval != undefined)
      {
         _global.clearInterval(this._nInactivityInterval);
      }
      this._nLastActivity = undefined;
   }
   function getPlayerPopupMenu(§\x11\x10§, §\x1e\x0e\x14§, §\x1e\x18\t§, §\x17\b§, §\x17\x07§, §\x1e\x0b\x1c§, §\x15\t§)
   {
      var _loc9_ = this.api.datacenter.Game.isFight;
      var _loc10_ = _loc2_.id;
      var _loc11_ = _loc3_ != undefined ? _loc3_ : _loc2_.name;
      var _loc12_ = this.api.ui.createPopupMenu();
      _loc12_.addStaticItem(_loc11_);
      var _loc13_ = this.api.kernel.ChatManager.isBlacklisted(_loc11_);
      if(_loc13_)
      {
         _loc12_.addStaticItem("(" + this.api.lang.getText("IGNORED_WORD") + ")");
      }
      if(_loc9_)
      {
         if(!this.api.datacenter.Game.isRunning && (!this.api.datacenter.Player.isMutant || this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant))
         {
            if(_loc2_ != null && _loc10_ != this.api.datacenter.Player.ID)
            {
               _loc12_.addItem(this.api.lang.getText("KICK"),this.api.network.Game,this.api.network.Game.leave,[_loc10_]);
            }
         }
      }
      if(_loc10_ == this.api.datacenter.Player.ID)
      {
         _loc12_.addItem(this.api.lang.getText("HIT_HIMSELF"),this.api.network.Chat,this.api.network.Chat.send,[this.api.lang.getText("SLAP_SENTENCE"),"*"]);
         if(!_loc9_ && this.api.datacenter.Player.canBeMerchant)
         {
            _loc12_.addItem(this.api.lang.getText("ORGANIZE_SHOP"),this.api.kernel.GameManager,this.api.kernel.GameManager.startExchange,[6]);
            _loc12_.addItem(this.api.lang.getText("MERCHANT_MODE"),this.api.kernel.GameManager,this.api.kernel.GameManager.offlineExchange);
         }
         if(this.api.datacenter.Player.data.isTomb)
         {
            _loc12_.addItem(this.api.lang.getText("FREE_MY_SOUL"),this.api.network.Game,this.api.network.Game.freeMySoul);
         }
         else if(!_loc9_)
         {
            var _loc14_ = _loc2_.animation == "static";
            _loc12_.addItem(this.api.lang.getText("CHANGE_DIRECTION"),this.api.ui,this.api.ui.loadUIComponent,["DirectionChooser","DirectionChooser",{allDirections:this.api.datacenter.Player.canMoveInAllDirections,target:this.api.datacenter.Player.data.mc}]);
         }
      }
      else
      {
         if(_loc7_ != undefined && (_loc7_.length > 0 && (_loc7_ != "" && !_loc13_)))
         {
            var _loc15_ = false;
            var _loc16_ = 0;
            while(_loc16_ < this.api.lang.getConfigText("ENABLED_SERVER_REPORT_LIST").length)
            {
               if(this.api.lang.getConfigText("ENABLED_SERVER_REPORT_LIST")[_loc16_] == this.api.datacenter.Basics.aks_current_server.id)
               {
                  _loc15_ = true;
                  break;
               }
               _loc16_ = _loc16_ + 1;
            }
            if(_loc15_)
            {
               _loc12_.addItem(this.api.lang.getText("REPORT_SENTANCE"),this.api.kernel.GameManager,this.api.kernel.GameManager.reportSentance,[_loc11_,_loc10_,_loc7_,_loc2_]);
            }
         }
         if(!this.api.kernel.ChatManager.isBlacklisted(_loc11_))
         {
            _loc12_.addItem(this.api.lang.getText("BLACKLIST_TEMPORARLY"),this.api.kernel.GameManager,this.api.kernel.GameManager.reportSentance,[_loc11_,_loc10_,undefined,_loc2_]);
         }
         else
         {
            _loc12_.addItem(this.api.lang.getText("BLACKLIST_REMOVE"),this.api.kernel.ChatManager,this.api.kernel.ChatManager.removeToBlacklist,[_loc11_]);
         }
         if(!_loc9_ || _loc9_ && _loc3_ != undefined)
         {
            _loc12_.addItem(this.api.lang.getText("WHOIS"),this.api.network.Basics,this.api.network.Basics.whoIs,[_loc11_]);
            if(_loc5_ != true)
            {
               _loc12_.addItem(this.api.lang.getText("ADD_TO_FRIENDS"),this.api.network.Friends,this.api.network.Friends.addFriend,[_loc11_]);
            }
            if(_loc5_ != true)
            {
               _loc12_.addItem(this.api.lang.getText("ADD_TO_ENEMY"),this.api.network.Enemies,this.api.network.Enemies.addEnemy,[_loc11_]);
            }
            _loc12_.addItem(this.api.lang.getText("WISPER_MESSAGE"),this.api.kernel.GameManager,this.api.kernel.GameManager.askPrivateMessage,[_loc11_]);
            if(_loc4_ == undefined)
            {
               _loc12_.addItem(this.api.lang.getText("ADD_TO_PARTY"),this.api.network.Party,this.api.network.Party.invite,[_loc11_]);
            }
            if(this.api.datacenter.Player.guildInfos != undefined)
            {
               if(_loc6_ != true)
               {
                  if(_loc2_ == null || (_loc2_ != null && _loc2_.guildName == undefined || _loc2_.guildName.length == 0))
                  {
                     if(this.api.datacenter.Player.guildInfos.playerRights.canInvite)
                     {
                        _loc12_.addItem(this.api.lang.getText("INVITE_IN_GUILD"),this.api.network.Guild,this.api.network.Guild.invite,[_loc11_]);
                     }
                  }
               }
            }
            if(_loc8_)
            {
               if(this.api.datacenter.Player.isAuthorized)
               {
                  _loc12_.addItem(this.api.lang.getText("JOIN_SMALL"),this.api.kernel.AdminManager,this.api.kernel.AdminManager.sendCommand,["join " + _loc11_]);
               }
               else if(this.api.datacenter.Map.superarea == 3)
               {
                  _loc12_.addItem(this.api.lang.getText("JOIN_SMALL"),this.api.network.Friends,this.api.network.Friends.joinFriend,[_loc11_]);
               }
            }
         }
         if(!_loc9_ && (_loc2_ != null && (_loc2_.gfxID != "999" && !_loc5_)))
         {
            if(this.api.datacenter.Player.isAtHome(this.api.datacenter.Map.id))
            {
               _loc12_.addItem(this.api.lang.getText("KICKOFF"),this.api.network.Houses,this.api.network.Houses.kick,[_loc10_]);
            }
            if(this.api.datacenter.Player.canExchange && _loc2_.canExchange)
            {
               _loc12_.addItem(this.api.lang.getText("EXCHANGE"),this.api.kernel.GameManager,this.api.kernel.GameManager.startExchange,[1,_loc10_]);
            }
            if(this.api.datacenter.Player.canChallenge && _loc2_.canBeChallenge)
            {
               _loc12_.addItem(this.api.lang.getText("CHALLENGE"),this.api.network.GameActions,this.api.network.GameActions.challenge,[_loc10_],this.api.datacenter.Map.bCanChallenge);
            }
            if(this.api.datacenter.Player.canAssault && !_loc2_.showIsPlayer)
            {
               var _loc17_ = this.api.datacenter.Player.data.alignment.index;
               if(this.api.lang.getAlignmentCanAttack(_loc17_,_loc2_.alignment.index))
               {
                  _loc12_.addItem(this.api.lang.getText("ASSAULT"),this.api.kernel.GameManager,this.api.kernel.GameManager.askAttack,[[_loc10_]],this.api.datacenter.Map.bCanAttack);
               }
            }
            if(this.api.datacenter.Player.canAttack && (_loc2_.canBeAttack && !_loc2_.showIsPlayer))
            {
               _loc12_.addItem(this.api.lang.getText("ATTACK"),this.api.network.GameActions,this.api.network.GameActions.mutantAttack,[_loc2_.id]);
            }
            var _loc18_ = _loc2_.multiCraftSkillsID;
            if(_loc18_ != undefined && _loc18_.length > 0)
            {
               var _loc19_ = 0;
               while(_loc19_ < _loc18_.length)
               {
                  var _loc20_ = Number(_loc18_[_loc19_]);
                  _loc12_.addItem(this.api.lang.getText("ASK_TO") + " " + this.api.lang.getSkillText(_loc20_).d,this.api.network.Exchange,this.api.network.Exchange.request,[13,_loc2_.id,_loc20_]);
                  _loc19_ = _loc19_ + 1;
               }
            }
            else
            {
               _loc18_ = this.api.datacenter.Player.data.multiCraftSkillsID;
               if(_loc18_ != undefined && _loc18_.length > 0)
               {
                  var _loc21_ = 0;
                  while(_loc21_ < _loc18_.length)
                  {
                     var _loc22_ = Number(_loc18_[_loc21_]);
                     _loc12_.addItem(this.api.lang.getText("INVITE_TO") + " " + this.api.lang.getSkillText(_loc22_).d,this.api.network.Exchange,this.api.network.Exchange.request,[12,_loc2_.id,_loc22_]);
                     _loc21_ = _loc21_ + 1;
                  }
               }
            }
         }
      }
      if(_loc4_ != undefined)
      {
         _loc4_.addPartyMenuItems(_loc12_);
      }
      return _loc12_;
   }
   function inactivityCheck()
   {
      if(this._nLastActivity == undefined || !this.api.kernel.OptionsManager.getOption("RemindTurnTime"))
      {
         return undefined;
      }
      var _loc2_ = this.api.lang.getConfigText("INACTIVITY_DISPLAY_COUNT");
      if(_global.isNaN(_loc2_) || _loc2_ == undefined)
      {
         _loc2_ = 5;
      }
      if(this.api.datacenter.Basics.inactivity_signaled > _loc2_)
      {
         return undefined;
      }
      var _loc3_ = this.api.lang.getConfigText("INACTIVITY_TIMING");
      if(_global.isNaN(_loc3_) || (_loc3_ == undefined || _loc3_ < 1000))
      {
         _loc3_ = 11000;
      }
      if(this._nLastActivity + _loc3_ < getTimer())
      {
         if(this.api.datacenter.Game.isFight && (this.api.datacenter.Game.isRunning && this.api.datacenter.Player.isCurrentPlayer))
         {
            if(this.autoSkip)
            {
               this.api.network.Game.turnEnd();
               return undefined;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("INFIGHT_INACTIVITY"),"ERROR_CHAT");
            this.api.kernel.TipsManager.pointGUI("Banner",["_btnNextTurn"]);
            this.api.datacenter.Basics.inactivity_signaled++;
         }
         this.stopInactivityDetector();
      }
   }
   function get livingPlayerInCurrentTeam()
   {
      var _loc2_ = this.api.datacenter.Basics.team(this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team);
      var _loc3_ = 0;
      for(var i in _loc2_)
      {
         if(_loc2_[i].LP > 0)
         {
            _loc3_ = _loc3_ + 1;
         }
      }
      return _loc3_;
   }
   function get autoSkip()
   {
      return !this._bFightActivity && (this._nFightTurnInactivity > 0 && (this.livingPlayerInCurrentTeam > 1 && this.api.lang.getConfigText("FIGHT_AUTO_SKIP")));
   }
   function signalFightActivity()
   {
      this._bFightActivity = true;
   }
   function onTurnEnd()
   {
      if(!this._bFightActivity && (this.api.lang.getConfigText("FIGHT_AUTO_SKIP") && this.livingPlayerInCurrentTeam > 1))
      {
         this._nFightTurnInactivity++;
         this.api.kernel.showMessage(undefined,this.api.lang.getText("INFIGHT_INACTIVITY_AUTO_SKIP"),"ERROR_CHAT");
      }
      else
      {
         this._nFightTurnInactivity = 0;
      }
   }
   function onMouseMove()
   {
      this._bFightActivity = true;
   }
   function onMouseUp()
   {
      this._bFightActivity = true;
   }
}
