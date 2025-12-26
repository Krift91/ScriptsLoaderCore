class dofus.§\r\x14§.battlefield.§\x10\x18§ extends ank.battlefield.§\x1c\n§
{
   var _oAPI;
   var _rollOverMcSprite;
   var _rollOverMcObject;
   var dispatchEvent;
   var mapHandler;
   function §\x10\x18§()
   {
      super();
   }
   function get api()
   {
      return this._oAPI;
   }
   function get rollOverMcSprite()
   {
      return this._rollOverMcSprite;
   }
   function get rollOverMcObject()
   {
      return this._rollOverMcObject;
   }
   function set rollOverMcObject(rollOverMcObject)
   {
      this._rollOverMcObject = rollOverMcObject;
   }
   function initialize(§\x1e\x19\x14§, §\x1e\x11\x19§, §\x1e\x0f\x0f§, §\x1e\x14\x1a§, oAPI)
   {
      super.initialize(_loc3_,_loc4_,_loc5_,_loc6_);
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this._oAPI = oAPI;
   }
   function addSpritePoints(sID, §\x1e\x0b\x19§, §\x06\x1d§)
   {
      if(this.api.kernel.OptionsManager.getOption("PointsOverHead") && this.api.electron.isWindowFocused)
      {
         super.addSpritePoints(sID,_loc4_,_loc5_);
      }
   }
   function onInitError()
   {
      _root.onCriticalError(this.api.lang.getText("CRITICAL_ERROR_LOADING_BATTLEFIELD"));
   }
   function onMapLoaded()
   {
      this._rollOverMcObject = undefined;
      this._rollOverMcSprite = undefined;
      var _loc2_ = this.api.datacenter.Map;
      this.api.ui.unloadUIComponent("CenterText");
      this.api.ui.unloadUIComponent("CenterTextMap");
      this.api.ui.unloadUIComponent("FightsInfos");
      this.setInteraction(ank.battlefield.Constants.INTERACTION_NONE);
      this.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
      this.setInteraction(ank.battlefield.Constants.INTERACTION_SPRITE_RELEASE_OVER_OUT);
      if(this.api.datacenter.Game.isFight)
      {
         this.setInteraction(ank.battlefield.Constants.INTERACTION_OBJECT_NONE);
      }
      else
      {
         this.setInteraction(ank.battlefield.Constants.INTERACTION_OBJECT_RELEASE_OVER_OUT);
      }
      this.api.datacenter.Game.setInteractionType("move");
      this.api.network.Game.getExtraInformations();
      this.api.ui.unloadLastUIAutoHideComponent();
      this.api.ui.removePopupMenu();
      this.api.ui.getUIComponent("MapInfos").update();
      var _loc3_ = _loc2_.subarea;
      if(_loc3_ != this.api.datacenter.Basics.gfx_lastSubarea)
      {
         var _loc4_ = this.api.datacenter.Subareas.getItemAt(_loc3_);
         var _loc5_ = new String();
         var _loc6_ = new String();
         var _loc7_ = this.api.lang.getMapAreaText(_loc2_.area).n;
         if(_loc4_ == undefined)
         {
            _loc6_ = String(this.api.lang.getMapSubAreaText(_loc3_).n).substr(0,2) != "//" ? this.api.lang.getMapSubAreaText(_loc3_).n : String(this.api.lang.getMapSubAreaText(_loc3_).n).substr(2);
            if(_loc7_ != _loc6_)
            {
               _loc5_ = _loc7_ + "\n(" + _loc6_ + ")";
            }
            else
            {
               _loc5_ = _loc7_;
            }
         }
         else
         {
            _loc6_ = _loc4_.name;
            _loc5_ = _loc4_.name + " (" + _loc4_.alignment.name + ")";
            if(_loc7_ != _loc6_)
            {
               _loc5_ = _loc7_ + "\n(" + _loc6_ + ")\n" + _loc4_.alignment.name;
            }
            else
            {
               _loc5_ = _loc7_ + "\n" + _loc4_.alignment.name;
            }
         }
         if(!this.api.kernel.TutorialManager.isTutorialMode)
         {
            this.api.ui.loadUIComponent("CenterText","CenterText",{text:_loc5_,background:false,timer:2000},{bForceLoad:true});
         }
         this.api.datacenter.Basics.gfx_lastSubarea = _loc3_;
      }
      if(this.api.datacenter.Player.isAtHome(_loc2_.id))
      {
         var _loc8_ = new Array();
         var _loc9_ = this.api.lang.getHousesIndoorSkillsText();
         var _loc10_ = 0;
         while(_loc10_ < _loc9_.length)
         {
            var _loc11_ = new dofus.datacenter["\x1e\x10\x1d"](_loc9_[_loc10_]);
            _loc8_.push(_loc11_);
            _loc10_ = _loc10_ + 1;
         }
         var _loc12_ = this.api.lang.getHousesMapText(_loc2_.id);
         if(_loc12_ != undefined)
         {
            var _loc13_ = this.api.datacenter.Houses.getItemAt(_loc12_);
            this.api.ui.loadUIComponent("HouseIndoor","HouseIndoor",{skills:_loc8_,house:_loc13_},{bStayIfPresent:true});
         }
         this.api.ui.getUIComponent("MapInfos")._visible = false;
      }
      else
      {
         this.api.ui.unloadUIComponent("HouseIndoor");
      }
      if(this.api.kernel.OptionsManager.getOption("Grid") == true)
      {
         this.api.gfx.drawGrid();
      }
      else
      {
         this.api.gfx.removeGrid();
      }
      this.api.ui.getUIComponent("Banner").setCircleXtraParams({currentCoords:[_loc2_.x,_loc2_.y]});
      if(Number(_loc2_.ambianceID) > 0)
      {
         this.api.sounds.playEnvironment(_loc2_.ambianceID);
      }
      if(Number(_loc2_.musicID) > 0)
      {
         this.api.sounds.playMusic(_loc2_.musicID,true);
      }
      if(!_loc2_.bOutdoor)
      {
         this.api.kernel.NightManager.noEffects();
      }
      else
      {
         this.api.kernel.NightManager.setState();
      }
      var _loc14_ = Array(this.api.lang.getMapText(_loc2_.id).p);
      var _loc15_ = 0;
      while(_loc14_.length > _loc15_)
      {
         var _loc16_ = _loc14_[_loc15_][0];
         var _loc17_ = _loc14_[_loc15_][1];
         var _loc18_ = _loc14_[_loc15_][2];
         if(!dofus["\x1e\n\x07"]["\x11\x18"]["\x11\x19"].fillingCriterions(_loc18_))
         {
            var _loc19_ = this.api.gfx.mapHandler.getCellData(_loc17_);
            var _loc20_ = 0;
            while(_loc20_ < _loc16_.length)
            {
               if(_loc19_.layerObject1Num == _loc16_[_loc20_])
               {
                  _loc19_.mcObject1._visible = false;
               }
               if(_loc19_.layerObject2Num == _loc16_[_loc20_])
               {
                  _loc19_.mcObject2._visible = false;
               }
               _loc20_ = _loc20_ + 1;
            }
         }
         _loc15_ = _loc15_ + 1;
      }
      this.dispatchEvent({type:"mapLoaded"});
   }
   function onCellRelease(§\n\x1a§)
   {
      if(this.api.kernel.TutorialManager.isTutorialMode)
      {
         this.api.kernel.TutorialManager.onWaitingCase({code:"CELL_RELEASE",params:[_loc2_.num]});
         return false;
      }
      switch(this.api.datacenter.Game.interactionType)
      {
         case 1:
            var _loc3_ = this.api.datacenter.Player.data;
            var _loc4_ = false;
            var _loc5_ = this.api.datacenter.Player.canMoveInAllDirections;
            if(this.api.datacenter.Player.InteractionsManager.calculatePath(this.mapHandler,_loc2_.num,true,this.api.datacenter.Game.isFight,false,_loc5_))
            {
               if(this.api.datacenter.Game.isFight)
               {
                  _loc4_ = true;
               }
               else
               {
                  _loc4_ = this.api.datacenter.Basics.interactionsManager_path[this.api.datacenter.Basics.interactionsManager_path.length - 1].num == _loc2_.num;
               }
            }
            if(!this.api.datacenter.Game.isFight && !_loc4_)
            {
               if(this.api.datacenter.Player.InteractionsManager.calculatePath(this.mapHandler,_loc2_.num,true,this.api.datacenter.Game.isFight,true,_loc5_))
               {
                  _loc4_ = true;
               }
            }
            if(_loc4_)
            {
               if(getTimer() - this.api.datacenter.Basics.gfx_lastActionTime < dofus.Constants.CLICK_MIN_DELAY && (_loc3_ == undefined || !_loc3_.isAdminSonicSpeed))
               {
                  ank["\x1e\n\x07"]["\x0b\f"].err("T trop rapide du clic");
                  return null;
               }
               this.api.datacenter.Basics.gfx_lastActionTime = getTimer();
               if(this.api.datacenter.Basics.interactionsManager_path.length != 0)
               {
                  var _loc6_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].compressPath(this.api.datacenter.Basics.interactionsManager_path);
                  if(_loc6_ != undefined)
                  {
                     if(this.api.datacenter.Game.isFight && this.api.datacenter.Game.isRunning)
                     {
                        var _loc7_ = _loc3_.sequencer;
                        _loc7_.addAction(122,false,_loc3_.GameActionsManager,_loc3_.GameActionsManager.transmittingMove,[1,[_loc6_]]);
                        _loc7_.execute();
                     }
                     else
                     {
                        _loc3_.GameActionsManager.transmittingMove(1,[_loc6_]);
                     }
                     delete this.api.datacenter.Basics.interactionsManager_path;
                  }
               }
               return true;
            }
            return false;
            break;
         case 2:
            if(this.api.datacenter.Player.currentUseObject != null && this.api.datacenter.Basics.gfx_canLaunch == true)
            {
               var _loc8_ = this.api.datacenter.Player.data;
               var _loc9_ = _loc8_.sequencer;
               _loc9_.addAction(123,false,_loc8_.GameActionsManager,_loc8_.GameActionsManager.transmittingOther,[300,[this.api.datacenter.Player.currentUseObject.ID,_loc2_.num]]);
               _loc9_.execute();
               this.api.datacenter.Player.currentUseObject = null;
            }
            else if(this.api.datacenter.Basics.spellManager_errorMsg != undefined)
            {
               this.api.kernel.showMessage(undefined,this.api.datacenter.Basics.spellManager_errorMsg,"ERROR_CHAT");
               delete this.api.datacenter.Basics.spellManager_errorMsg;
            }
            this.api.ui.removeCursor();
            this.api.kernel.GameManager.lastSpellLaunch = getTimer();
            this.api.datacenter.Game.setInteractionType("move");
            break;
         case 3:
            if(this.api.datacenter.Player.currentUseObject != null && this.api.datacenter.Basics.gfx_canLaunch == true)
            {
               var _loc10_ = this.api.datacenter.Player.data;
               var _loc11_ = _loc10_.sequencer;
               _loc11_.addAction(124,false,_loc10_.GameActionsManager,_loc10_.GameActionsManager.transmittingOther,[303,[_loc2_.num]]);
               _loc11_.execute();
               this.api.datacenter.Player.currentUseObject = null;
            }
            this.api.ui.removeCursor();
            this.api.kernel.GameManager.lastSpellLaunch = getTimer();
            this.api.datacenter.Game.setInteractionType("move");
            break;
         case 4:
            var _loc12_ = this.mapHandler.getCellData(_loc2_.num).spriteOnID;
            if(_loc12_ != undefined)
            {
               break;
            }
            this.api.network.Game.setPlayerPosition(_loc2_.num);
            break;
         case 5:
            if(this.api.datacenter.Player.currentUseObject != null && this.api.datacenter.Basics.gfx_canLaunch == true)
            {
               this.api.network.Items.use(this.api.datacenter.Player.currentUseObject.ID,this.mapHandler.getCellData(_loc2_.num).spriteOnID,_loc2_.num);
            }
            this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
            this.api.gfx.clearPointer();
            this.unSelect(true);
            this.api.datacenter.Player.reset();
            this.api.ui.removeCursor();
            this.api.datacenter.Game.setInteractionType("move");
            break;
         case 6:
            if(this.api.datacenter.Game.isFight)
            {
               if(_loc2_.num != undefined)
               {
                  this.api.network.Game.setFlag(_loc2_.num);
               }
               this.api.gfx.clearPointer();
               this.api.gfx.unSelectAllButOne("startPosition");
               this.api.ui.removeCursor();
               if(this.api.datacenter.Game.isRunning && this.api.datacenter.Game.currentPlayerID == this.api.datacenter.Player.ID)
               {
                  this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT);
                  this.api.datacenter.Game.setInteractionType("move");
                  break;
               }
               this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
               this.api.datacenter.Game.setInteractionType("place");
               break;
            }
      }
   }
   function onCellRollOver(§\n\x1a§)
   {
      if(this.api.kernel.TutorialManager.isTutorialMode)
      {
         this.api.kernel.TutorialManager.onWaitingCase({code:"CELL_OVER",params:[_loc2_.num]});
         return undefined;
      }
      if(this.api.datacenter.Game.isRunning && (!this.api.datacenter.Player.isCurrentPlayer && this.api.datacenter.Game.interactionType != 6))
      {
         return undefined;
      }
      switch(this.api.datacenter.Game.interactionType)
      {
         case 1:
            var _loc3_ = this.api.datacenter.Player;
            var _loc4_ = _loc3_.data;
            var _loc5_ = this.mapHandler.getCellData(_loc2_.num).spriteOnID;
            var _loc6_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
            if(_loc6_ != undefined)
            {
               this.showSpriteInfosIfWeNeed(_loc6_);
            }
            if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkRange(this.mapHandler,_loc4_.cellNum,_loc2_.num,false,0,_loc4_.MP,0))
            {
               this.api.datacenter.Player.InteractionsManager.setState(this.api.datacenter.Game.isFight);
               this.api.datacenter.Player.InteractionsManager.calculatePath(this.mapHandler,_loc2_.num,false,this.api.datacenter.Game.isFight);
            }
            else
            {
               delete this.api.datacenter.Basics.interactionsManager_path;
            }
            break;
         case 2:
         case 3:
            var _loc7_ = this.api.datacenter.Player;
            var _loc8_ = _loc7_.data;
            var _loc9_ = _loc8_.cellNum;
            var _loc10_ = _loc7_.currentUseObject;
            var _loc11_ = _loc7_.SpellsManager;
            var _loc12_ = !_loc10_.canBoostRange ? 0 : _loc8_.CharacteristicsManager.getModeratorValue(19) + _loc7_.RangeModerator;
            this.api.gfx.mapHandler.resetEmptyCells();
            this.api.datacenter.Basics.gfx_canLaunch = _loc11_.checkCanLaunchSpellOnCell(this.mapHandler,_loc10_,this.mapHandler.getCellData(_loc2_.num),_loc12_);
            if(this.api.datacenter.Basics.gfx_canLaunch)
            {
               this.api.ui.setCursorForbidden(false);
               this.drawPointer(_loc2_.num);
            }
            else
            {
               this.api.ui.setCursorForbidden(true,dofus.Constants.FORBIDDEN_FILE);
            }
            break;
         case 5:
         case 6:
            this.api.datacenter.Basics.gfx_canLaunch = true;
            this.api.ui.setCursorForbidden(false);
            this.drawPointer(_loc2_.num);
      }
   }
   function onCellRollOut(§\n\x1a§)
   {
      if(this.api.kernel.TutorialManager.isTutorialMode)
      {
         this.api.kernel.TutorialManager.onWaitingCase({code:"CELL_OUT",params:[_loc2_.num]});
         return undefined;
      }
      if(this.api.datacenter.Game.isRunning && (!this.api.datacenter.Player.isCurrentPlayer && this.api.datacenter.Game.interactionType != 6))
      {
         return undefined;
      }
      switch(this.api.datacenter.Game.interactionType)
      {
         case 1:
            this.hideSpriteInfos();
            this.unSelect(true);
            break;
         case 2:
         case 3:
            this.api.ui.setCursorForbidden(true,dofus.Constants.FORBIDDEN_FILE);
            this.hidePointer();
            this.api.datacenter.Basics.gfx_canLaunch = false;
            this.hideSpriteInfos();
            break;
         case 5:
         case 6:
            this.api.ui.setCursorForbidden(true,dofus.Constants.FORBIDDEN_FILE);
            this.api.datacenter.Basics.gfx_canLaunch = false;
            this.hidePointer();
      }
   }
   function onSpriteRelease(§\n\x0e§, §\x16\x03§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      var _loc4_ = _loc2_.data;
      var _loc5_ = _loc4_.id;
      if(this.api.kernel.TutorialManager.isTutorialMode)
      {
         this.api.kernel.TutorialManager.onWaitingCase({code:"SPRITE_RELEASE",params:[_loc4_.id]});
         return undefined;
      }
      if(_loc4_.hasParent)
      {
         this.onSpriteRelease(_loc4_.linkedParent.mc);
         return undefined;
      }
      var _loc0_ = null;
      if((_loc0_ = this.api.datacenter.Game.interactionType) !== 5)
      {
         if(_loc4_ instanceof dofus.datacenter["\t\x07"] && !_loc4_.showIsPlayer)
         {
            if(!this.api.datacenter.Game.isRunning)
            {
               if(this.api.datacenter.Player.isMutant)
               {
                  return undefined;
               }
            }
            var _loc6_ = this.mapHandler.getCellData(_loc4_.cellNum).mc;
            this.onCellRelease(_loc6_);
         }
         else if(_loc4_ instanceof dofus.datacenter["\x13\x01"] || _loc4_ instanceof dofus.datacenter["\t\x07"] && _loc4_.showIsPlayer)
         {
            if(this.api.datacenter.Game.isFight && (this.api.datacenter.Game.isRunning && !(this.api.datacenter.Player.isAuthorized && (this.api.datacenter.Game.interactionType == dofus.datacenter.Game.INTERACTION_TYPE_MOVE && this.api.datacenter.Player.currentUseObject == null))))
            {
               var _loc7_ = this.mapHandler.getCellData(_loc4_.cellNum).mc;
               this.onCellRelease(_loc7_);
               return undefined;
            }
            if(Key.isDown(Key.CONTROL))
            {
               var _loc8_ = this.mapHandler.getCellData(_loc4_.cellNum).allSpritesOn;
               this.api.kernel.GameManager.showCellPlayersPopupMenu(_loc8_);
            }
            else
            {
               this.api.kernel.GameManager.showPlayerPopupMenu(_loc4_,undefined);
            }
         }
         else if(_loc4_ instanceof dofus.datacenter["\x02\x01"])
         {
            if(this.api.datacenter.Player.cantSpeakNPC)
            {
               return undefined;
            }
            var _loc9_ = _loc4_.actions;
            if(_loc9_ != undefined && _loc9_.length != 0)
            {
               var _loc10_ = true;
               var _loc11_ = this.api.ui.createPopupMenu();
               var _loc12_ = _loc9_.length;
               while(_loc12_-- > 0)
               {
                  var _loc13_ = _loc9_[_loc12_];
                  var _loc14_ = _loc13_.actionId;
                  var _loc15_ = _loc13_.action;
                  var _loc16_ = _loc15_.method;
                  var _loc17_ = _loc15_.object;
                  var _loc18_ = _loc15_.params;
                  if((Key.isDown(Key.SHIFT) || _loc3_) && _loc14_ == 3)
                  {
                     _loc10_ = false;
                     _loc16_.apply(_loc17_,_loc18_);
                     break;
                  }
                  _loc11_.addItem(_loc13_.name,_loc17_,_loc16_,_loc18_);
               }
               if(_loc10_)
               {
                  _loc11_.show(_root._xmouse,_root._ymouse);
               }
            }
         }
         else if(_loc4_ instanceof dofus.datacenter.Team)
         {
            var _loc19_ = this.api.datacenter.Player.data.alignment.index;
            var _loc20_ = _loc4_.alignment.index;
            var _loc21_ = _loc4_.enemyTeam.alignment.index;
            var _loc22_ = _loc4_.challenge.fightType;
            var _loc23_ = false;
            loop2:
            switch(_loc22_)
            {
               case 0:
                  switch(_loc4_.type)
                  {
                     case 0:
                     case 2:
                        _loc23_ = this.api.datacenter.Player.canChallenge && (!this.api.datacenter.Player.isMutant || this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant);
                  }
                  break;
               case 1:
               case 2:
                  switch(_loc4_.type)
                  {
                     case 0:
                     case 1:
                        if(_loc19_ == _loc20_)
                        {
                           _loc23_ = !this.api.datacenter.Player.isMutant;
                           break;
                        }
                        _loc23_ = this.api.lang.getAlignmentCanJoin(_loc19_,_loc20_) && (this.api.lang.getAlignmentCanAttack(_loc19_,_loc21_) && !this.api.datacenter.Player.isMutant);
                        break;
                  }
                  break;
               case 3:
                  switch(_loc4_.type)
                  {
                     case 0:
                        _loc23_ = !this.api.datacenter.Player.isMutant || this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant;
                        break;
                     case 1:
                        _loc23_ = false;
                  }
                  break;
               case 4:
                  switch(_loc4_.type)
                  {
                     case 0:
                        _loc23_ = !this.api.datacenter.Player.isMutant || this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant;
                        break;
                     case 1:
                        _loc23_ = false;
                  }
                  break;
               case 5:
                  switch(_loc4_.type)
                  {
                     case 0:
                        _loc23_ = !this.api.datacenter.Player.isMutant && !this.api.datacenter.Player.cantInteractWithTaxCollector;
                        break;
                     case 3:
                        _loc23_ = false;
                  }
                  break;
               case 6:
                  switch(_loc4_.type)
                  {
                     case 0:
                        _loc23_ = !this.api.datacenter.Player.isMutant || this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant;
                        break loop2;
                     case 2:
                        _loc23_ = this.api.datacenter.Player.isMutant && !this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant == true;
                  }
            }
            if(_loc23_)
            {
               var _loc24_ = true;
               var _loc25_ = this.api.ui.createPopupMenu();
               var _loc26_ = this.api.lang.getMapMaxTeam(this.api.datacenter.Map.id);
               var _loc27_ = this.api.lang.getMapMaxChallenge(this.api.datacenter.Map.id);
               if(_loc4_.challenge.count >= _loc27_)
               {
                  _loc25_.addItem(this.api.lang.getText("CHALENGE_FULL"));
               }
               else if(_loc4_.count >= _loc26_)
               {
                  _loc25_.addItem(this.api.lang.getText("TEAM_FULL"));
               }
               else if(Key.isDown(Key.SHIFT) || _loc3_)
               {
                  _loc24_ = false;
                  this.api.network.GameActions.joinChallenge(_loc4_.challenge.id,_loc4_.id);
                  this.api.ui.hideTooltip();
               }
               else
               {
                  _loc25_.addItem(this.api.lang.getText("JOIN_SMALL"),this.api.network.GameActions,this.api.network.GameActions.joinChallenge,[_loc4_.challenge.id,_loc4_.id]);
               }
               if(_loc24_)
               {
                  _loc25_.show(_root._xmouse,_root._ymouse);
               }
            }
         }
         else if(_loc4_ instanceof dofus.datacenter["\x1e\x17\x01"])
         {
            if(_loc4_.ownerName == this.api.datacenter.Player.Name || this.api.datacenter.Map.mountPark.guildName == this.api.datacenter.Player.guildInfos.name && this.api.datacenter.Player.guildInfos.playerRights.canManageOtherMount)
            {
               if(Key.isDown(Key.SHIFT) || _loc3_)
               {
                  this.api.network.Mount.parkMountData(_loc4_.id);
               }
               else
               {
                  var _loc28_ = this.api.ui.createPopupMenu();
                  _loc28_.addStaticItem(this.api.lang.getText("MOUNT_OF",[_loc4_.ownerName]));
                  _loc28_.addItem(this.api.lang.getText("VIEW_MOUNT_DETAILS"),this.api.network.Mount,this.api.network.Mount.parkMountData,[_loc4_.id]);
                  _loc28_.show(_root._xmouse,_root._ymouse);
               }
            }
         }
         else if(_loc4_ instanceof dofus.datacenter.Creature)
         {
            var _loc29_ = this.mapHandler.getCellData(_loc4_.cellNum).mc;
            this.onCellRelease(_loc29_);
         }
         else if(_loc4_ instanceof dofus.datacenter["\t\x1d"] || _loc4_ instanceof dofus.datacenter["\n\x01"])
         {
            if(_loc4_ instanceof dofus.datacenter["\n\x01"] && this.api.kernel.GameManager.isInMyTeam(_loc4_))
            {
               this.api.kernel.GameManager.showMonsterPopupMenu(_loc4_);
            }
            if(!this.api.datacenter.Player.isMutant || (this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant || this.api.datacenter.Player.canAttackMonstersAnywhereWhenMutant))
            {
               var _loc30_ = this.mapHandler.getCellData(_loc4_.cellNum);
               var _loc31_ = _loc30_.mc;
               if(!Key.isDown(Key.SHIFT) && (!_loc3_ && (!this.api.datacenter.Game.isFight && _loc4_ instanceof dofus.datacenter["\t\x1d"])))
               {
                  var _loc32_ = _loc30_.isTrigger;
                  if(!_loc32_ && this.api.kernel.OptionsManager.getOption("ViewAllMonsterInGroup") == true)
                  {
                     var _loc33_ = this.api.ui.createPopupMenu();
                     _loc33_.addItem(this.api.lang.getText("ATTACK"),this,this.onCellRelease,[_loc31_]);
                     _loc33_.show();
                  }
                  else
                  {
                     this.onCellRelease(_loc31_);
                  }
               }
               else
               {
                  this.onCellRelease(_loc31_);
               }
            }
         }
         else if(_loc4_ instanceof dofus.datacenter["\x1e\x19\f"])
         {
            if(!this.api.datacenter.Player.isMutant || this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant)
            {
               if(!this.api.datacenter.Player.canExchange)
               {
                  return undefined;
               }
               if(Key.isDown(Key.SHIFT) || _loc3_)
               {
                  this.api.kernel.GameManager.startExchange(4,_loc4_.id,_loc4_.cellNum);
               }
               else
               {
                  var _loc35_ = _loc4_.name;
                  if(this.api.datacenter.Player.isAuthorized)
                  {
                     var _loc34_ = this.api.kernel.AdminManager.getAdminPopupMenu(_loc35_,false);
                  }
                  else
                  {
                     _loc34_ = this.api.ui.createPopupMenu();
                  }
                  _loc34_.addStaticItem(this.api.lang.getText("SHOP") + " " + this.api.lang.getText("OF") + " " + _loc4_.name);
                  _loc34_.addItem(this.api.lang.getText("BUY"),this.api.kernel.GameManager,this.api.kernel.GameManager.startExchange,[4,_loc4_.id,_loc4_.cellNum]);
                  var _loc36_ = 2;
                  if(this.api.datacenter.Player.isAtHome(this.api.datacenter.Map.id))
                  {
                     _loc34_.addItem(this.api.lang.getText("KICKOFF"),this.api.network.Basics,this.api.network.Basics.kick,[_loc4_.cellNum]);
                     _loc36_ = _loc36_ + 1;
                  }
                  if(this.api.datacenter.Player.isAuthorized)
                  {
                     var _loc37_ = 0;
                     while(_loc37_ < _loc36_)
                     {
                        _loc34_.items.unshift(_loc34_.items.pop());
                        _loc37_ = _loc37_ + 1;
                     }
                  }
                  _loc34_.show(_root._xmouse,_root._ymouse,true);
               }
            }
         }
         else if(_loc4_ instanceof dofus.datacenter["\x1e\x0b\r"])
         {
            if(!this.api.datacenter.Player.isMutant)
            {
               if(this.api.datacenter.Player.cantInteractWithTaxCollector)
               {
                  return undefined;
               }
               if(this.api.datacenter.Game.isFight)
               {
                  var _loc38_ = this.mapHandler.getCellData(_loc4_.cellNum).mc;
                  this.onCellRelease(_loc38_);
               }
               else if(Key.isDown(Key.SHIFT) || _loc3_)
               {
                  this.api.network.Dialog.create(_loc5_);
               }
               else
               {
                  var _loc39_ = this.api.datacenter.Player.guildInfos.playerRights;
                  var _loc40_ = _loc4_.guildName == this.api.datacenter.Player.guildInfos.name;
                  var _loc41_ = _loc40_ && _loc39_.canHireTaxCollector;
                  var _loc42_ = this.api.ui.createPopupMenu();
                  _loc42_.addItem(this.api.lang.getText("SPEAK"),this.api.network.Dialog,this.api.network.Dialog.create,[_loc5_]);
                  _loc42_.addItem(this.api.lang.getText("COLLECT_TAX"),this.api.kernel.GameManager,this.api.kernel.GameManager.startExchange,[8,_loc5_],_loc40_);
                  _loc42_.addItem(this.api.lang.getText("ATTACK"),this.api.network.GameActions,this.api.network.GameActions.attackTaxCollector,[[_loc5_]],!_loc40_);
                  _loc42_.addItem(this.api.lang.getText("REMOVE"),this.api.kernel.GameManager,this.api.kernel.GameManager.askRemoveTaxCollector,[[_loc5_]],_loc41_);
                  _loc42_.show(_root._xmouse,_root._ymouse);
               }
            }
         }
         else if(_loc4_ instanceof dofus.datacenter["\x1e\x16\b"])
         {
            if(!this.api.datacenter.Player.isMutant)
            {
               if(this.api.datacenter.Game.isFight)
               {
                  var _loc43_ = this.mapHandler.getCellData(_loc4_.cellNum).mc;
                  this.onCellRelease(_loc43_);
               }
               else
               {
                  var _loc44_ = this.api.datacenter.Player.alignment.index == 0;
                  var _loc45_ = this.api.datacenter.Player.alignment.compareTo(_loc4_.alignment) == 0;
                  if((Key.isDown(Key.SHIFT) || _loc3_) && _loc45_)
                  {
                     this.api.network.GameActions.usePrism([_loc5_]);
                  }
                  else
                  {
                     var _loc46_ = this.api.ui.createPopupMenu();
                     _loc46_.addItem(this.api.lang.getText("USE_WORD"),this.api.network.GameActions,this.api.network.GameActions.usePrism,[[_loc5_]],_loc45_);
                     _loc46_.addItem(this.api.lang.getText("ATTACK"),this.api.network.GameActions,this.api.network.GameActions.attackPrism,[[_loc5_]],!_loc45_ && !_loc44_);
                     _loc46_.show(_root._xmouse,_root._ymouse);
                  }
               }
            }
         }
      }
      else
      {
         if(this.api.datacenter.Player.currentUseObject != null && this.api.datacenter.Basics.gfx_canLaunch == true)
         {
            this.api.network.Items.use(this.api.datacenter.Player.currentUseObject.ID,_loc4_.id,_loc4_.cellNum);
         }
         this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
         this.api.gfx.clearPointer();
         this.unSelect(true);
         this.api.datacenter.Player.reset();
         this.api.ui.removeCursor();
         this.api.datacenter.Game.setInteractionType("move");
      }
   }
   function onSpriteRollOver(§\n\x0e§, §\x1a\b§)
   {
      if(!_loc3_)
      {
         this._rollOverMcSprite = _loc2_;
      }
      if(_root._xscale != 100)
      {
         return undefined;
      }
      var _loc6_ = _loc2_.data;
      var _loc7_ = dofus.Constants.OVERHEAD_TEXT_OTHER;
      if(_loc6_.isClear)
      {
         return undefined;
      }
      if(_loc6_.hasParent)
      {
         this.onSpriteRollOver(_loc6_.linkedParent.mc,_loc3_);
         return undefined;
      }
      if(this.api.datacenter.Game.isRunning || this.api.datacenter.Game.interactionType == 5)
      {
         var _loc9_ = this.mapHandler.getCellData(_loc6_.cellNum).mc;
         if(_loc6_.isVisible)
         {
            this.onCellRollOver(_loc9_);
         }
      }
      var _loc10_ = _loc6_.name;
      if(_loc6_ instanceof dofus.datacenter["\t\x07"] && _loc6_.showIsPlayer)
      {
         if(this.api.datacenter.Game.isRunning)
         {
            _loc10_ = _loc6_.playerName + " (" + _loc6_.LP + ")";
            this.showSpriteInfosIfWeNeed(_loc6_);
         }
         else
         {
            _loc10_ = _loc6_.playerName + " [" + _loc6_.monsterName + " (" + _loc6_.Level + ")]";
         }
      }
      else if(_loc6_ instanceof dofus.datacenter["\t\x07"] || (_loc6_ instanceof dofus.datacenter.Creature || _loc6_ instanceof dofus.datacenter["\n\x01"]))
      {
         _loc7_ = dofus.Constants.NPC_ALIGNMENT_COLOR[_loc6_.alignment.index];
         if(this.api.datacenter.Game.isRunning)
         {
            _loc10_ += " (" + _loc6_.LP + ")";
            this.showSpriteInfosIfWeNeed(_loc6_);
         }
         else
         {
            _loc10_ += " (" + _loc6_.Level + ")";
         }
      }
      else if(_loc6_ instanceof dofus.datacenter["\x13\x01"])
      {
         _loc7_ = dofus.Constants.OVERHEAD_TEXT_CHARACTER;
         if(this.api.datacenter.Game.isRunning)
         {
            _loc10_ += " (" + _loc6_.LP + ")";
            if(_loc6_.isVisible)
            {
               var _loc11_ = _loc6_.EffectsManager.getEffects();
               if(_loc11_.length != 0)
               {
                  this.addSpriteOverHeadItem(_loc6_.id,"effects",dofus["\r\x14"].battlefield["\x0f\n"],[_loc11_]);
               }
            }
            this.showSpriteInfosIfWeNeed(_loc6_);
         }
         else if(this.api.datacenter.Game.isFight)
         {
            _loc10_ += " (" + _loc6_.Level + ")";
         }
         if(!_loc6_.isVisible)
         {
            return undefined;
         }
         var _loc4_ = dofus.Constants.DEMON_ANGEL_FILE;
         if(_loc6_.alignment.fallenAngelDemon)
         {
            _loc4_ = dofus.Constants.FALLEN_DEMON_ANGEL_FILE;
         }
         var _loc12_ = !_loc6_.haveFakeAlignement ? _loc6_.alignment.index : _loc6_.fakeAlignment.index;
         if(_loc6_.rank.value > 0)
         {
            if(_loc12_ == 1)
            {
               var _loc5_ = _loc6_.rank.value;
            }
            else if(_loc12_ == 2)
            {
               _loc5_ = 10 + _loc6_.rank.value;
            }
            else if(_loc12_ == 3)
            {
               _loc5_ = 20 + _loc6_.rank.value;
            }
         }
         var _loc8_ = _loc6_.title;
         if(_loc6_.guildName != undefined && _loc6_.guildName.length != 0)
         {
            _loc10_ = "";
            this.addSpriteOverHeadItem(_loc6_.id,"text",dofus["\r\x14"].battlefield["\r\f"],[_loc6_.guildName,_loc6_.name,_loc6_.emblem,_loc4_,_loc5_,_loc6_.pvpGain,_loc8_],undefined,true);
         }
      }
      else if(_loc6_ instanceof dofus.datacenter["\x1e\x0b\r"])
      {
         if(this.api.datacenter.Game.isRunning)
         {
            _loc10_ += " (" + _loc6_.LP + ")";
            this.showSpriteInfosIfWeNeed(_loc6_);
         }
         else if(this.api.datacenter.Game.isFight)
         {
            _loc10_ += " (" + _loc6_.Level + ")";
         }
         else
         {
            _loc10_ = "";
            this.addSpriteOverHeadItem(_loc6_.id,"text",dofus["\r\x14"].battlefield["\r\f"],[_loc6_.guildName,_loc6_.name,_loc6_.emblem]);
         }
      }
      else if(_loc6_ instanceof dofus.datacenter["\x1e\x16\b"])
      {
         _loc4_ = dofus.Constants.DEMON_ANGEL_FILE;
         if(_loc6_.alignment.value > 0)
         {
            if(_loc6_.alignment.index == 1)
            {
               _loc5_ = _loc6_.alignment.value;
            }
            else if(_loc6_.alignment.index == 2)
            {
               _loc5_ = 10 + _loc6_.alignment.value;
            }
            else if(_loc6_.alignment.index == 3)
            {
               _loc5_ = 20 + _loc6_.alignment.value;
            }
         }
         _loc7_ = dofus.Constants.NPC_ALIGNMENT_COLOR[_loc6_.alignment.index];
         this.addSpriteOverHeadItem(_loc6_.id,"text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[_loc10_,_loc4_,_loc7_,_loc5_]);
      }
      else if(_loc6_ instanceof dofus.datacenter["\x1e\x17\x01"])
      {
         _loc7_ = dofus.Constants.OVERHEAD_TEXT_CHARACTER;
         _loc10_ = this.api.lang.getText("MOUNT_PARK_OVERHEAD",[_loc6_.modelName,_loc6_.level,_loc6_.ownerName]);
         this.addSpriteOverHeadItem(_loc6_.id,"text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[_loc10_,_loc4_,_loc7_,_loc5_]);
      }
      else if(_loc6_ instanceof dofus.datacenter["\x1e\x19\f"])
      {
         _loc7_ = dofus.Constants.OVERHEAD_TEXT_CHARACTER;
         _loc10_ = "";
         this.addSpriteOverHeadItem(_loc6_.id,"text",dofus["\r\x14"].battlefield["\x1e\x19\x0b"],[_loc6_]);
      }
      else if(_loc6_ instanceof dofus.datacenter["\x02\x01"])
      {
         var _loc13_ = this.api.datacenter.Map;
         var _loc14_ = this.api.datacenter.Subareas.getItemAt(_loc13_.subarea);
         if(_loc14_ != undefined)
         {
            _loc7_ = dofus.Constants.NPC_ALIGNMENT_COLOR[_loc14_.alignment.index];
         }
      }
      else if(_loc6_ instanceof dofus.datacenter["\t\x1d"] || _loc6_ instanceof dofus.datacenter.Team)
      {
         if(_loc6_.alignment.index != -1)
         {
            _loc7_ = dofus.Constants.NPC_ALIGNMENT_COLOR[_loc6_.alignment.index];
         }
         var _loc15_ = _loc6_.challenge.fightType;
         if(_loc6_.isVisible && (_loc6_ instanceof dofus.datacenter["\t\x1d"] || _loc6_.type == 1 && (_loc15_ == 2 || (_loc15_ == 3 || _loc15_ == 4))))
         {
            if(_loc10_ != "")
            {
               var _loc16_ = dofus.Constants.OVERHEAD_TEXT_TITLE;
               this.addSpriteOverHeadItem(_loc6_.id,"text",dofus["\r\x14"].battlefield["\x1e\x0b\x05"],[_loc10_,_loc4_,_loc7_,_loc5_,this.api.lang.getText("LEVEL") + " " + _loc6_.totalLevel,_loc16_,_loc6_.bonusValue]);
            }
            this.selectSprite(_loc6_.id,true);
            return undefined;
         }
      }
      if(_loc6_.isVisible)
      {
         if(_loc10_ != "")
         {
            this.addSpriteOverHeadItem(_loc6_.id,"text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[_loc10_,_loc4_,_loc7_,_loc5_,_loc6_.pvpGain,_loc8_]);
         }
         this.selectSprite(_loc6_.id,true);
      }
   }
   function onSpriteRollOut(§\n\x0e§, §\x1a\b§)
   {
      if(!_loc3_)
      {
         this._rollOverMcSprite = undefined;
      }
      var _loc4_ = _loc2_.data;
      if(this.api.gfx.spriteHandler.isShowingMonstersTooltip && _loc4_ instanceof dofus.datacenter["\t\x1d"])
      {
         return undefined;
      }
      if(_loc4_.hasParent)
      {
         this.onSpriteRollOut(_loc4_.linkedParent.mc);
         return undefined;
      }
      if(this.api.datacenter.Game.isRunning || this.api.datacenter.Game.interactionType == 5)
      {
         this.hideSpriteInfos();
         var _loc5_ = this.mapHandler.getCellData(_loc4_.cellNum).mc;
         this.onCellRollOut(_loc5_);
      }
      this.removeSpriteOverHeadLayer(_loc4_.id,"text");
      this.removeSpriteOverHeadLayer(_loc4_.id,"effects");
      this.selectSprite(_loc4_.id,false);
   }
   function onObjectRelease(§\n\x13§, §\x16\x03§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      this.api.ui.hideTooltip();
      var _loc4_ = _loc2_.cellData;
      var _loc5_ = _loc4_.mc;
      var _loc6_ = _loc4_.layerObject2Num;
      if(this.api.kernel.TutorialManager.isTutorialMode)
      {
         this.api.kernel.TutorialManager.onWaitingCase({code:"OBJECT_RELEASE",params:[_loc4_.num,_loc6_]});
         return undefined;
      }
      var _loc7_ = _loc4_.layerObjectExternalData;
      if(_loc7_ != undefined)
      {
         if(_loc7_.durability != undefined)
         {
            if(this.api.datacenter.Map.mountPark.isMine(this.api))
            {
               var _loc8_ = this.api.ui.createPopupMenu();
               _loc8_.addStaticItem(_loc7_.name);
               _loc8_.addItem(this.api.lang.getText("REMOVE"),this.api.network.Mount,this.api.network.Mount.removeObjectInPark,[_loc5_.num]);
               _loc8_.show(_root._xmouse,_root._ymouse);
               return undefined;
            }
         }
      }
      if(!_global.isNaN(_loc6_) && (this.api.datacenter.Player.canUseInteractiveObjects && this.api.datacenter.Game.interactionType != 5))
      {
         var _loc9_ = this.api.lang.getInteractiveObjectDataByGfxText(_loc6_);
         var _loc10_ = _loc9_.n;
         var _loc11_ = _loc9_.sk;
         var _loc12_ = _loc9_.t;
         switch(_loc12_)
         {
            default:
               if(_loc0_ === 15)
               {
                  break;
               }
               if(_loc0_ !== 5)
               {
                  if(_loc0_ !== 6)
                  {
                     if(_loc0_ !== 13)
                     {
                        addr1435:
                        _loc48_.show(_root._xmouse,_loc50_.description);
                        this.onCellRelease(_loc5_);
                        this.onCellRelease.useRessource(_loc5_);
                        var _loc47_ = false;
                        §§push(!_loc47_);
                        §§push(_root);
                        §§push("_ymouse");
                        §§push(this.api.kernel.GameManager.useRessource);
                        §§push(this.api.kernel.GameManager);
                     }
                     else
                     {
                        var _loc46_ = this.api.datacenter.Map.mountPark;
                        _loc47_ = true;
                        var _loc48_ = this.api.ui.createPopupMenu();
                        _loc48_.addStaticItem(_loc10_);
                        for(var k in _loc11_)
                        {
                           var _loc49_ = _loc11_[k];
                           var _loc50_ = new dofus.datacenter["\x1e\x10\x1d"](_loc49_);
                           var _loc51_ = _loc50_.getState(true,_loc46_.isMine(this.api),_loc46_.price > 0,_loc46_.isPublic || _loc46_.isMine(this.api),false,_loc46_.isPublic);
                           if(_loc51_ == "X")
                           {
                              continue;
                           }
                           var _loc52_ = _loc51_ == "V";
                           if(!(_loc52_ && (Key.isDown(Key.SHIFT) || _loc3_)))
                           {
                              _loc48_.addItem(_loc50_.description,this.api.kernel.GameManager,this.api.kernel.GameManager.useRessource,[_loc5_,_loc5_.num,_loc49_],_loc52_);
                              continue;
                           }
                           this.api.kernel.GameManager.useRessource(_loc5_,_loc5_.num,_loc49_);
                           _loc47_ = false;
                           §§goto(addr1435);
                        }
                     }
                     if(_loc47_)
                     {
                        _loc48_.show(_root._xmouse,_root._ymouse);
                     }
                  }
                  else
                  {
                     §§push(this.api);
                     §§push("datacenter");
                  }
                  addr1482:
               }
               else
               {
                  var _loc28_ = true;
                  var _loc29_ = this.api.ui.createPopupMenu();
                  var _loc30_ = this.api.lang.getHousesDoorText(this.api.datacenter.Map.id,_loc5_.num);
                  var _loc31_ = this.api.datacenter.Houses.getItemAt(_loc30_);
                  _loc29_.addStaticItem(_loc10_ + " " + _loc31_.name);
                  if(_loc31_.localOwner)
                  {
                     _loc29_.addStaticItem(this.api.lang.getText("MY_HOME"));
                  }
                  else if(_loc31_.ownerName != undefined)
                  {
                     if(_loc31_.ownerName == "?")
                     {
                        _loc29_.addStaticItem(this.api.lang.getText("HOUSE_WITH_NO_OWNER"));
                     }
                     else
                     {
                        _loc29_.addStaticItem(this.api.lang.getText("HOME_OF",[_loc31_.ownerName]));
                     }
                  }
                  if(this.api.datacenter.Player.isAuthorized && (_loc31_.ownerName != undefined && _loc31_.ownerName != "?"))
                  {
                     _loc29_.addItem(this.api.lang.getText("HOME_OF",[_loc31_.ownerName]),this.api.kernel.GameManager,this.api.kernel.GameManager.showPlayerPopupMenu,[undefined,"*" + _loc31_.ownerName]);
                  }
                  addr927:
                  for(var k in _loc11_)
                  {
                     var _loc32_ = _loc11_[k];
                     var _loc33_ = new dofus.datacenter["\x1e\x10\x1d"](_loc32_);
                     var _loc34_ = _loc33_.getState(true,_loc31_.localOwner,_loc31_.isForSale,_loc31_.isLocked);
                     if(_loc34_ == "X")
                     {
                        continue;
                     }
                     var _loc35_ = _loc34_ == "V";
                     §§push(_loc35_);
                     if(!_loc35_)
                     {
                        if(!§§pop())
                        {
                           _loc29_.addItem(_loc33_.description,this.api.kernel.GameManager,this.api.kernel.GameManager.useRessource,[_loc5_,_loc5_.num,_loc32_],_loc35_);
                           continue;
                        }
                        this.api.kernel.GameManager.useRessource(_loc5_,_loc5_.num,_loc32_);
                        _loc28_ = false;
                     }
                  }
                  if(_loc28_)
                  {
                     _loc29_.show(_root._xmouse,_root._ymouse);
                  }
                  §§goto(addr1482);
               }
               _loc33_ = new _root.datacenter["\x1e\x10\x1d"]();
               "getState";
               Key.isDown(Key.SHIFT);
               "description";
               var _loc36_ = this.api.kernel.GameManager.Map.id + "_" + _loc5_.num;
               _loc34_ = this.api(_loc36_);
               _loc35_ = _loc34_ == "V";
               _loc35_[!_loc35_].useRessource();
               _loc28_ = false;
               §§goto(addr927);
               §§push(_loc31_.isLocked);
               §§push(_loc31_.isForSale);
               §§push(_loc31_.localOwner);
               §§push(true);
               §§push(4);
               §§push(_loc33_);
               §§push(Key.isDown(Key.SHIFT));
               §§push(_loc3_[!_loc3_].kernel.GameManager.useRessource);
               §§push(this.api.kernel.GameManager);
               §§push(_loc33_);
               §§push(_loc32_ != 84);
               §§push(_loc32_);
               §§push(_loc5_.num);
               §§push(_loc5_);
               §§push(3);
            case 1:
            case 2:
            case 3:
            case 4:
            case 7:
            case 10:
            case 12:
            case 14:
         }
         var _loc13_ = _loc12_ == 1;
         if(_loc13_)
         {
            var _loc14_ = this.api.mouseClicksMemorizer.getPreviousMouseClickForGather();
            if(_loc14_ != undefined)
            {
               var _loc15_ = getTimer() - _loc14_.time;
               var _loc16_ = _loc15_ < dofus.Constants.CLICK_MIN_DELAY;
               if(_loc16_)
               {
                  var _loc17_ = _loc2_.hitTest(_loc14_.nX,_loc14_.nY,true);
                  if(_loc17_)
                  {
                     this.api.kernel.showMessage(undefined,this.api.lang.getText("SRV_MSG_0"),"ERROR_CHAT");
                     return undefined;
                  }
               }
            }
            this.api.mouseClicksMemorizer.resetForGather();
         }
         var _loc18_ = this.api.datacenter.Player.currentJobID != undefined;
         if(_loc18_)
         {
            var _loc19_ = this.api.datacenter.Player.Jobs.findFirstItem("id",this.api.datacenter.Player.currentJobID).item.skills;
         }
         else
         {
            _loc19_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         }
         var _loc20_ = true;
         var _loc21_ = this.api.ui.createPopupMenu();
         _loc21_.addStaticItem(_loc10_);
         for(var k in _loc11_)
         {
            var _loc22_ = _loc11_[k];
            var _loc23_ = new dofus.datacenter["\x1e\x10\x1d"](_loc22_);
            var _loc24_ = _loc19_.findFirstItem("id",_loc22_).index != -1;
            var _loc25_ = this.api.datacenter.Player.Level <= dofus.Constants.NOVICE_LEVEL;
            var _loc26_ = _loc23_.getState(_loc24_,false,false,false,false,_loc25_);
            if(_loc26_ != "X")
            {
               var _loc27_ = _loc26_ == "V";
               if(_loc27_ && ((Key.isDown(Key.SHIFT) || _loc3_) && (_loc22_ != 44 && _loc12_ != 1)))
               {
                  this.api.kernel.GameManager.useRessource(_loc5_,_loc5_.num,_loc22_);
                  _loc20_ = false;
                  break;
               }
               _loc21_.addItem(_loc23_.description,this.api.kernel.GameManager,this.api.kernel.GameManager.useRessource,[_loc5_,_loc5_.num,_loc22_],_loc27_);
            }
         }
         if(_loc20_)
         {
            _loc21_.isGatherPopupMenu = _loc13_;
            _loc21_.show(_root._xmouse,_root._ymouse);
         }
         §§goto(addr1482);
      }
      else
      {
         this.onCellRelease(_loc5_);
      }
   }
   function onObjectRollOver(§\n\x13§)
   {
      this._rollOverMcObject = _loc2_;
      if(_root._xscale != 100)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.cellData;
      var _loc4_ = _loc3_.mc;
      var _loc5_ = _loc3_.layerObject2Num;
      if(this.api.datacenter.Game.interactionType == 5)
      {
         _loc4_ = _loc2_.cellData.mc;
         this.onCellRollOver(_loc4_);
      }
      _loc2_.select(true);
      var _loc6_ = _loc3_.layerObjectExternalData;
      if(_loc6_ != undefined)
      {
         var _loc7_ = _loc6_.name;
         if(_loc6_.durability != undefined)
         {
            if(this.api.datacenter.Map.mountPark.isMine(this.api))
            {
               _loc7_ += "\n" + this.api.lang.getText("DURABILITY") + " : " + _loc6_.durability + "/" + _loc6_.durabilityMax;
            }
         }
         var _loc8_ = new dofus.datacenter["\x13\x01"]("itemOnCell",ank.battlefield.mc["\x1e\x0e\x10"],"",_loc4_.num,0,0);
         this.api.datacenter.Sprites.addItemAt("itemOnCell",_loc8_);
         this.api.gfx.addSprite("itemOnCell");
         this.addSpriteOverHeadItem("itemOnCell","text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[_loc7_,"",dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
      }
      var _loc9_ = this.api.lang.getInteractiveObjectDataByGfxText(_loc5_);
      var _loc10_ = _loc9_.n;
      var _loc11_ = _loc9_.sk;
      var _loc12_ = _loc9_.t;
      switch(_loc12_)
      {
         case 5:
            var _loc13_ = this.api.lang.getHousesDoorText(this.api.datacenter.Map.id,_loc4_.num);
            var _loc14_ = dofus.datacenter["\r\x04"](this.api.datacenter.Houses.getItemAt(_loc13_));
            if(_loc14_.guildName.length > 0)
            {
               var _loc15_ = new dofus.datacenter["\x13\x01"]("porte",ank.battlefield.mc["\x1e\x0e\x10"],"",_loc4_.num,0,0);
               this.api.datacenter.Sprites.addItemAt("porte",_loc15_);
               this.api.gfx.addSprite("porte");
               this.addSpriteOverHeadItem("porte","text",dofus["\r\x14"].battlefield["\r\f"],[this.api.lang.getText("GUILD_HOUSE"),_loc14_.guildName,_loc14_.guildEmblem]);
            }
            break;
         case 13:
            var _loc16_ = this.api.datacenter.Map.mountPark;
            var _loc17_ = new dofus.datacenter["\x13\x01"]("enclos",ank.battlefield.mc["\x1e\x0e\x10"],"",_loc4_.num,0,0);
            this.api.datacenter.Sprites.addItemAt("enclos",_loc17_);
            this.api.gfx.addSprite("enclos");
            if(_loc16_.isPublic)
            {
               this.addSpriteOverHeadItem("enclos","text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[this.api.lang.getText("MOUNTPARK_PUBLIC"),"",dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
               break;
            }
            if(_loc16_.hasNoOwner)
            {
               this.addSpriteOverHeadItem("enclos","text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[this.api.lang.getText("MOUNTPARK_TO_BUY",[_loc16_.price,_loc16_.size,_loc16_.items]),"",dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
               break;
            }
            if(_loc16_.price > 0)
            {
               var _loc18_ = this.api.lang.getText("MOUNTPARK_PRIVATE_TO_BUY",[_loc16_.price]);
            }
            else
            {
               _loc18_ = this.api.lang.getText("MOUNTPARK_PRIVATE");
            }
            this.addSpriteOverHeadItem("enclos","text",dofus["\r\x14"].battlefield["\r\f"],[_loc16_.guildName,_loc18_,_loc16_.guildEmblem]);
            break;
      }
   }
   function onObjectRollOut(§\n\x13§)
   {
      this._rollOverMcObject = undefined;
      this.api.ui.hideTooltip();
      if(this.api.datacenter.Game.interactionType == 5)
      {
         var _loc3_ = _loc2_.cellData.mc;
         this.onCellRollOut(_loc3_);
      }
      _loc2_.select(false);
      this.removeSpriteOverHeadLayer("enclos","text");
      this.removeSprite("enclos",false);
      this.removeSpriteOverHeadLayer("porte","text");
      this.removeSprite("porte",false);
      this.removeSpriteOverHeadLayer("itemOnCell","text");
      this.removeSprite("itemOnCell",false);
   }
   function showSpriteInfosIfWeNeed(oSprite)
   {
      if(this.api.ui.isCursorHidden())
      {
         if(this.api.kernel.OptionsManager.getOption("SpriteInfos"))
         {
            if(this.api.kernel.OptionsManager.getOption("SpriteMove") && oSprite.isVisible)
            {
               this.api.gfx.drawZone(oSprite.cellNum,0,oSprite.MP,"move",dofus.Constants.CELL_MOVE_RANGE_COLOR,"C");
            }
            this.api.ui.getUIComponent("Banner").showRightPanel("BannerSpriteInfos",{data:oSprite},true,true);
         }
      }
   }
   function hideSpriteInfos()
   {
      this.api.ui.getUIComponent("Banner").hideRightPanel(false,true);
      this.api.gfx.clearZoneLayer("move");
   }
}
