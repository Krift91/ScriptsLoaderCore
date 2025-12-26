class dofus.aks.§\x11\f§ extends dofus.aks.Handler
{
   function §\x11\f§(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function process(§\x1e\x13\x04§)
   {
      var _loc3_ = _loc2_.charAt(0);
      var _loc4_ = _loc2_.charAt(1);
      var _loc5_ = _loc2_.charAt(2) == "E";
      this.postProcess(_loc3_,_loc4_,_loc5_,_loc2_);
   }
   function defaultProcessAction(§\x1e\f\x07§, §\x1e\x14\x19§, §\x1a\f§, §\x1e\x13\x04§)
   {
      this.api.network.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
   }
   function postProcess(§\x1e\f\x07§, §\x1e\x14\x19§, §\x1a\f§, §\x1e\x13\x04§)
   {
      loop1:
      switch(_loc2_)
      {
         case "H":
            switch(_loc3_)
            {
               case "C":
                  this.aks.onHelloConnectionServer(_loc5_.substr(2));
                  break;
               case "G":
                  this.aks.onHelloGameServer(_loc5_.substr(2));
                  break;
               default:
                  this.aks.disconnect(false,true);
            }
            break;
         case "p":
            this.aks.onPong();
            break;
         case "q":
            this.aks.onQuickPong();
            break;
         case "r":
            this.aks.send("rpong" + _loc5_.substr(5),false);
            break;
         default:
            §§push(_loc0_);
            §§push("M");
            while(true)
            {
               if(§§pop() === §§pop())
               {
                  this.aks.onServerMessage(_loc5_.substr(1));
                  break loop1;
               }
               if(_loc0_ === "k")
               {
                  this.aks.onServerWillDisconnect();
                  break loop1;
               }
               if(_loc0_ === "B")
               {
                  switch(_loc3_)
                  {
                     case "N":
                        return undefined;
                     case "A":
                        switch(_loc5_.charAt(2))
                        {
                           case "T":
                              this.aks.Basics.onAuthorizedCommand(true,_loc5_.substr(3));
                              break;
                           case "L":
                              this.aks.Basics.onAuthorizedLine(_loc5_.substr(3));
                              break;
                           case "P":
                              this.aks.Basics.onAuthorizedCommandPrompt(_loc5_.substr(3));
                              break;
                           case "C":
                              this.aks.Basics.onAuthorizedCommandClear();
                              break;
                           case "E":
                              this.aks.Basics.onAuthorizedCommand(false);
                              break;
                           case "I":
                              switch(_loc5_.charAt(3))
                              {
                                 case "O":
                                    this.aks.Basics.onAuthorizedInterfaceOpen(_loc5_.substr(4));
                                    break;
                                 case "C":
                                    this.aks.Basics.onAuthorizedInterfaceClose(_loc5_.substr(4));
                                    break;
                                 default:
                                    this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                              }
                              break;
                           default:
                              this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                        }
                        break;
                     case "r":
                        this.aks.Basics.onReportInfos(_loc5_.substr(2));
                        break;
                     case "T":
                        this.aks.Basics.onReferenceTime(_loc5_.substr(2));
                        break;
                     case "D":
                        this.aks.Basics.onDate(_loc5_.substr(2));
                        break;
                     case "W":
                        this.aks.Basics.onWhoIs(!_loc4_,_loc5_.substr(3));
                        break;
                     case "P":
                        this.aks.Basics.onSubscriberRestriction(_loc5_.substr(2));
                        break;
                     case "C":
                        this.aks.Basics.onFileCheck(_loc5_.substr(2));
                        break;
                     case "p":
                        this.aks.Basics.onAveragePing(_loc5_.substr(2));
                        break;
                     case "M":
                        this.aks.Basics.onPopupMessage(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "A")
               {
                  switch(_loc3_)
                  {
                     case "E":
                        var _loc6_ = false;
                        var _loc7_ = false;
                        switch(_loc5_.charAt(2))
                        {
                           case "n":
                              _loc6_ = true;
                              break;
                           case "c":
                              _loc7_ = true;
                              break;
                           default:
                              break;
                           case "i":
                              if(this.api.ui.getUIComponent("MakeMimibiote") == undefined)
                              {
                                 this.api.ui.loadUIComponent("MakeMimibiote","MakeMimibiote");
                              }
                              return undefined;
                        }
                        var _loc8_ = _loc5_.charAt(3) != undefined && _loc5_.charAt(3) == "f";
                        if(this.api.ui.getUIComponent("EditPlayer") == undefined)
                        {
                           this.api.ui.loadUIComponent("EditPlayer","EditPlayer",{editName:_loc6_,editColors:_loc7_,force:_loc8_});
                        }
                        break;
                     case "c":
                        this.aks.Account.onCommunity(_loc5_.substr(2));
                        break;
                     case "d":
                        this.aks.Account.onDofusPseudo(_loc5_.substr(2));
                        break;
                     case "l":
                        this.aks.Account.onLogin(!_loc4_,_loc5_.substr(3));
                        break;
                     case "L":
                        this.aks.Account.onCharactersList(!_loc4_,_loc5_.substr(3));
                        break;
                     case "x":
                        this.aks.Account.onServersList(!_loc4_,_loc5_.substr(3));
                        break;
                     case "A":
                        this.aks.Account.onCharacterAdd(!_loc4_,_loc5_.substr(3));
                        break;
                     case "T":
                        this.aks.Account.onTicketResponse(!_loc4_,_loc5_.substr(3));
                        break;
                     case "X":
                        this.aks.Account.onSelectServer(!_loc4_,true,_loc5_.substr(3));
                        break;
                     case "Y":
                        this.aks.Account.onSelectServer(!_loc4_,false,_loc5_.substr(3));
                        break;
                     case "Z":
                        this.aks.Account.onSelectServerMinimal(_loc5_.substr(3));
                        break;
                     case "S":
                        this.aks.Account.onCharacterSelected(!_loc4_,_loc5_.substr(4));
                        break;
                     case "s":
                        this.aks.Account.onStats(_loc5_.substr(2));
                        break;
                     case "N":
                        this.aks.Account.onNewLevel(_loc5_.substr(2));
                        break;
                     case "R":
                        this.aks.Account.onRestrictions(_loc5_.substr(2));
                        break;
                     case "H":
                        this.aks.Account.onHosts(_loc5_.substr(2));
                        break;
                     case "r":
                        this.aks.Account.onRescue(!_loc4_);
                        break;
                     case "g":
                        this.aks.Account.onGiftsList(_loc5_.substr(2));
                        break;
                     case "G":
                        this.aks.Account.onGiftStored(!_loc4_);
                        break;
                     case "q":
                        this.aks.Account.onQueue(_loc5_.substr(2));
                        break;
                     case "f":
                        this.aks.Account.onNewQueue(_loc5_.substr(2));
                        break;
                     case "V":
                        this.aks.Account.onRegionalVersion(_loc5_.substr(2));
                        break;
                     case "P":
                        this.aks.Account.onCharacterNameGenerated(!_loc4_,_loc5_.substr(3));
                        break;
                     case "K":
                        this.aks.Account.onKey(_loc5_.substr(2));
                        break;
                     case "Q":
                        this.aks.Account.onSecretQuestion(_loc5_.substr(2));
                        break;
                     case "D":
                        this.aks.Account.onCharacterDelete(!_loc4_,_loc5_.substr(3));
                        break;
                     case "M":
                        var _loc0_ = null;
                        if((_loc0_ = _loc5_.charAt(2)) !== "?")
                        {
                           this.aks.Account.onCharactersList(!_loc4_,_loc5_.substr(3),true);
                        }
                        else
                        {
                           this.aks.Account.onCharactersMigrationAskConfirm(_loc5_.substr(3));
                        }
                        break;
                     case "F":
                        this.aks.Account.onFriendServerList(_loc5_.substr(2));
                        break;
                     case "m":
                        if(!_global.CONFIG.isStreaming)
                        {
                           this.aks.Account.onMiniClipInfo();
                           break;
                        }
                        var _loc9_ = _global.parseInt(_loc5_.charAt(2),10);
                        if(_global.isNaN(_loc9_))
                        {
                           _loc9_ = 3;
                        }
                        fscommand("GoToCongratulation",_loc9_);
                        break;
                  }
                  break loop1;
               }
               if(_loc0_ === "G")
               {
                  switch(_loc3_)
                  {
                     case "C":
                        this.aks.Game.onCreate(!_loc4_,_loc5_.substr(4));
                        break;
                     case "J":
                        this.aks.Game.onJoin(_loc5_.substr(3));
                        break;
                     case "P":
                        this.aks.Game.onPositionStart(_loc5_.substr(2));
                        break;
                     case "R":
                        this.aks.Game.onReady(_loc5_.substr(2));
                        break;
                     case "S":
                        this.aks.Game.onStartToPlay();
                        break;
                     case "E":
                        this.aks.Game.onEnd(_loc5_.substr(2));
                        break;
                     case "M":
                        this.aks.Game.onMovement(_loc5_.substr(3));
                        break;
                     case "c":
                        this.aks.Game.onChallenge(_loc5_.substr(2));
                        break;
                     case "t":
                        this.aks.Game.onTeam(_loc5_.substr(2));
                        break;
                     case "V":
                        this.aks.Game.onLeave(true,_loc5_.substr(2));
                        break;
                     case "f":
                        this.aks.Game.onFlag(_loc5_.substr(2));
                        break;
                     case "I":
                        switch(_loc5_.charAt(2))
                        {
                           case "C":
                              this.aks.Game.onPlayersCoordinates(_loc5_.substr(4));
                              break;
                           case "E":
                              this.aks.Game.onEffect(_loc5_.substr(3));
                              break;
                           case "e":
                              this.aks.Game.onClearAllEffect(_loc5_.substr(3));
                              break;
                           case "P":
                              this.aks.Game.onPVP(_loc5_.substr(3),false);
                              break;
                           default:
                              this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                        }
                        break;
                     case "D":
                        switch(_loc5_.charAt(2))
                        {
                           case "M":
                              this.aks.Game.onMapData(_loc5_.substr(4));
                              break;
                           case "K":
                              this.aks.Game.onMapLoaded();
                              break;
                           case "C":
                              this.aks.Game.onCellData(_loc5_.substr(3));
                              break;
                           case "Z":
                              this.aks.Game.onZoneData(_loc5_.substring(3));
                              break;
                           case "O":
                              this.aks.Game.onCellObject(_loc5_.substring(3));
                              break;
                           case "F":
                              this.aks.Game.onFrameObject2(_loc5_.substring(4));
                              break;
                           case "E":
                              this.aks.Game.onFrameObjectExternal(_loc5_.substring(4));
                              break;
                           default:
                              this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                        }
                        break;
                     case "d":
                        switch(_loc5_.charAt(3))
                        {
                           case "K":
                              this.aks.Game.onFightChallengeUpdate(_loc5_.substr(4),true);
                              break;
                           case "O":
                              this.aks.Game.onFightChallengeUpdate(_loc5_.substr(4),false);
                              break;
                           default:
                              this.aks.Game.onFightChallenge(_loc5_.substr(2));
                        }
                        break;
                     case "A":
                        switch(_loc5_.charAt(2))
                        {
                           case "S":
                              this.aks.GameActions.onActionsStart(_loc5_.substr(3));
                              break;
                           case "F":
                              this.aks.GameActions.onActionsFinish(_loc5_.substr(3));
                              break;
                           default:
                              this.aks.GameActions.onActions(_loc5_.substr(2));
                        }
                        break;
                     case "T":
                        switch(_loc5_.charAt(2))
                        {
                           case "S":
                              this.aks.Game.onTurnStart(_loc5_.substr(3));
                              break;
                           case "F":
                              this.aks.Game.onTurnFinish(_loc5_.substr(3));
                              break;
                           case "L":
                              this.aks.Game.onTurnlist(_loc5_.substr(4));
                              break;
                           case "M":
                              this.aks.Game.onTurnMiddle(_loc5_.substr(4));
                              break;
                           case "R":
                              this.aks.Game.onTurnReady(_loc5_.substr(3));
                              break;
                           default:
                              this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                        }
                        break;
                     case "X":
                        this.aks.Game.onExtraClip(_loc5_.substr(2));
                        break;
                     case "o":
                        this.aks.Game.onFightOption(_loc5_.substr(2));
                        break;
                     case "O":
                        this.aks.Game.onGameOver();
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "c")
               {
                  switch(_loc3_)
                  {
                     case "M":
                        this.aks.Chat.onMessage(!_loc4_,_loc5_.substr(3));
                        break;
                     case "s":
                        this.aks.Chat.onServerMessage(_loc5_.substr(2));
                        break;
                     case "S":
                        this.aks.Chat.onSmiley(_loc5_.substr(2));
                        break;
                     case "C":
                        this.aks.Chat.onSubscribeChannel(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "D")
               {
                  switch(_loc3_)
                  {
                     case "A":
                        this.aks.Dialog.onCustomAction(_loc5_.substr(2));
                        break;
                     case "C":
                        this.aks.Dialog.onCreate(!_loc4_,_loc5_.substr(3));
                        break;
                     case "Q":
                        this.aks.Dialog.onQuestion(_loc5_.substr(2));
                        break;
                     case "V":
                        this.aks.Dialog.onLeave();
                        break;
                     case "P":
                        this.aks.Dialog.onPause();
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "I")
               {
                  switch(_loc3_)
                  {
                     case "M":
                        this.aks.Infos.onInfoMaps(_loc5_.substr(2));
                        break;
                     case "C":
                        this.aks.Infos.onInfoCompass(_loc5_.substr(2));
                        break;
                     case "H":
                        this.aks.Infos.onInfoCoordinatespHighlight(_loc5_.substr(2));
                        break;
                     case "m":
                        this.aks.Infos.onMessage(_loc5_.substr(2));
                        break;
                     case "Q":
                        this.aks.Infos.onQuantity(_loc5_.substr(2));
                        break;
                     case "O":
                        this.aks.Infos.onObject(_loc5_.substr(2));
                        break;
                     case "L":
                        switch(_loc5_.charAt(2))
                        {
                           case "S":
                              this.aks.Infos.onLifeRestoreTimerStart(_loc5_.substr(3));
                              break;
                           case "F":
                              this.aks.Infos.onLifeRestoreTimerFinish(_loc5_.substr(3));
                              break;
                           default:
                              this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                        }
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "S")
               {
                  switch(_loc3_)
                  {
                     case "L":
                        if((_loc0_ = _loc5_.charAt(2)) !== "o")
                        {
                           this.aks.Spells.onList(_loc5_.substr(2));
                        }
                        else
                        {
                           this.aks.Spells.onChangeOption(_loc5_.substr(3));
                        }
                        break;
                     case "U":
                        this.aks.Spells.onUpgradeSpell(!_loc4_,_loc5_.substr(3));
                        break;
                     case "B":
                        this.aks.Spells.onSpellBoost(_loc5_.substr(2));
                        break;
                     case "F":
                        this.aks.Spells.onSpellForget(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "O")
               {
                  switch(_loc3_)
                  {
                     case "a":
                        this.aks.Items.onAccessories(_loc5_.substr(2));
                        break;
                     case "D":
                        this.aks.Items.onDrop(!_loc4_,_loc5_.substr(3));
                        break;
                     case "A":
                        this.aks.Items.onAdd(!_loc4_,_loc5_.substr(3));
                        break;
                     case "C":
                        this.aks.Items.onChange(_loc5_.substr(3));
                        break;
                     case "R":
                        this.aks.Items.onRemove(_loc5_.substr(2));
                        break;
                     case "Q":
                        this.aks.Items.onQuantity(_loc5_.substr(2));
                        break;
                     case "M":
                        this.aks.Items.onMovement(_loc5_.substr(2));
                        break;
                     case "T":
                        this.aks.Items.onTool(_loc5_.substr(2));
                        break;
                     case "w":
                        this.aks.Items.onWeight(_loc5_.substr(2));
                        break;
                     case "S":
                        this.aks.Items.onItemSet(_loc5_.substr(2));
                        break;
                     case "K":
                        this.aks.Items.onItemUseCondition(_loc5_.substr(2));
                        break;
                     case "F":
                        this.aks.Items.onItemFound(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "F")
               {
                  switch(_loc3_)
                  {
                     case "A":
                        this.aks.Friends.onAddFriend(!_loc4_,_loc5_.substr(3));
                        break;
                     case "D":
                        this.aks.Friends.onRemoveFriend(!_loc4_,_loc5_.substr(3));
                        break;
                     case "L":
                        this.aks.Friends.onFriendsList(_loc5_.substr(3));
                        break;
                     case "S":
                        this.aks.Friends.onSpouse(_loc5_.substr(2));
                        break;
                     case "O":
                        this.aks.Friends.onNotifyChange(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "i")
               {
                  switch(_loc3_)
                  {
                     case "A":
                        this.aks.Enemies.onAddEnemy(!_loc4_,_loc5_.substr(3));
                        break;
                     case "D":
                        this.aks.Enemies.onRemoveEnemy(!_loc4_,_loc5_.substr(3));
                        break;
                     case "L":
                        this.aks.Enemies.onEnemiesList(_loc5_.substr(3));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "K")
               {
                  switch(_loc3_)
                  {
                     case "C":
                        this.aks.Key.onCreate(_loc5_.substr(3));
                        break;
                     case "K":
                        this.aks.Key.onKey(!_loc4_);
                        break;
                     case "V":
                        this.aks.Key.onLeave();
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "J")
               {
                  switch(_loc3_)
                  {
                     case "S":
                        this.aks.Job.onSkills(_loc5_.substr(3));
                        break;
                     case "X":
                        this.aks.Job.onXP(_loc5_.substr(3));
                        break;
                     case "N":
                        this.aks.Job.onLevel(_loc5_.substr(2));
                        break;
                     case "R":
                        this.aks.Job.onRemove(_loc5_.substr(2));
                        break;
                     case "O":
                        this.aks.Job.onOptions(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "E")
               {
                  switch(_loc3_)
                  {
                     case "R":
                        this.aks.Exchange.onRequest(!_loc4_,_loc5_.substr(3));
                        break;
                     case "K":
                        this.aks.Exchange.onReady(_loc5_.substr(2));
                        break;
                     case "V":
                        this.aks.Exchange.onLeave(!_loc4_,_loc5_.substr(2));
                        break;
                     case "C":
                        this.aks.Exchange.onCreate(!_loc4_,_loc5_.substr(3));
                        break;
                     case "c":
                        this.aks.Exchange.onCraft(!_loc4_,_loc5_.substr(3));
                        break;
                     case "M":
                        this.aks.Exchange.onLocalMovement(!_loc4_,_loc5_.substr(3));
                        break;
                     case "m":
                        this.aks.Exchange.onDistantMovement(!_loc4_,_loc5_.substr(3));
                        break;
                     case "r":
                        this.aks.Exchange.onCoopMovement(!_loc4_,_loc5_.substr(3));
                        break;
                     case "p":
                        this.aks.Exchange.onPayMovement(!_loc4_,_loc5_.substr(2));
                        break;
                     case "s":
                        this.aks.Exchange.onStorageMovement(!_loc4_,_loc5_.substr(3));
                        break;
                     case "i":
                        this.aks.Exchange.onPlayerShopMovement(!_loc4_,_loc5_.substr(3));
                        break;
                     case "W":
                        this.aks.Exchange.onCraftPublicMode(_loc5_.substr(2));
                        break;
                     case "e":
                        this.aks.Exchange.onMountStorage(_loc5_.substr(2));
                        break;
                     case "f":
                        this.aks.Exchange.onMountPark(_loc5_.substr(2));
                        break;
                     case "w":
                        this.aks.Exchange.onMountPods(_loc5_.substr(2));
                        break;
                     case "L":
                        this.aks.Exchange.onList(_loc5_.substr(2));
                        break;
                     case "S":
                        this.aks.Exchange.onSell(!_loc4_);
                        break;
                     case "B":
                        this.aks.Exchange.onBuy(!_loc4_);
                        break;
                     case "q":
                        this.aks.Exchange.onAskOfflineExchange(_loc5_.substr(2));
                        break;
                     case "H":
                        switch(_loc5_.charAt(2))
                        {
                           case "S":
                              this.aks.Exchange.onSearch(_loc5_.substr(3));
                              break;
                           case "L":
                              this.aks.Exchange.onBigStoreTypeItemsList(_loc5_.substr(3));
                              break;
                           case "M":
                              this.aks.Exchange.onBigStoreTypeItemsMovement(_loc5_.substr(3));
                              break;
                           case "l":
                              this.aks.Exchange.onBigStoreItemsList(_loc5_.substr(3));
                              break;
                           case "m":
                              this.aks.Exchange.onBigStoreItemsMovement(_loc5_.substr(3));
                              break;
                           case "P":
                              this.aks.Exchange.onItemMiddlePriceInBigStore(_loc5_.substr(3));
                              break;
                           default:
                              this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                        }
                        break;
                     case "J":
                        this.aks.Exchange.onCrafterListChanged(_loc5_.substr(2));
                        break;
                     case "j":
                        this.aks.Exchange.onCrafterReference(_loc5_.substr(2));
                        break;
                     case "A":
                        this.aks.Exchange.onCraftLoop(_loc5_.substr(2));
                        break;
                     case "a":
                        this.aks.Exchange.onCraftLoopEnd(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "h")
               {
                  switch(_loc3_)
                  {
                     case "L":
                        this.aks.Houses.onList(_loc5_.substr(2));
                        break;
                     case "P":
                        this.aks.Houses.onProperties(_loc5_.substr(2));
                        break;
                     case "X":
                        this.aks.Houses.onLockedProperty(_loc5_.substr(2));
                        break;
                     case "C":
                        this.aks.Houses.onCreate(_loc5_.substr(3));
                        break;
                     case "S":
                        this.aks.Houses.onSell(!_loc4_,_loc5_.substr(3));
                        break;
                     case "B":
                        this.aks.Houses.onBuy(!_loc4_,_loc5_.substr(3));
                        break;
                     case "V":
                        this.aks.Houses.onLeave();
                        break;
                     case "G":
                        this.aks.Houses.onGuildInfos(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "s")
               {
                  switch(_loc3_)
                  {
                     case "L":
                        this.aks.Storages.onList(_loc5_.substr(2));
                        break;
                     case "X":
                        this.aks.Storages.onLockedProperty(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "e")
               {
                  switch(_loc3_)
                  {
                     case "U":
                        this.aks.Emotes.onUse(!_loc4_,_loc5_.substr(3));
                        break;
                     case "L":
                        this.aks.Emotes.onList(_loc5_.substr(2));
                        break;
                     case "A":
                        this.aks.Emotes.onAdd(_loc5_.substr(2));
                        break;
                     case "R":
                        this.aks.Emotes.onRemove(_loc5_.substr(2));
                        break;
                     case "D":
                        this.aks.Emotes.onDirection(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "d")
               {
                  switch(_loc3_)
                  {
                     case "C":
                        this.aks.Documents.onCreate(!_loc4_,_loc5_.substr(3));
                        break;
                     case "V":
                        this.aks.Documents.onLeave();
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "g")
               {
                  switch(_loc3_)
                  {
                     case "n":
                        this.aks.Guild.onNew();
                        break;
                     case "C":
                        this.aks.Guild.onCreate(!_loc4_,_loc5_.substr(3));
                        break;
                     case "S":
                        this.aks.Guild.onStats(_loc5_.substr(2));
                        break;
                     case "I":
                        switch(_loc5_.charAt(2))
                        {
                           case "G":
                              this.aks.Guild.onInfosGeneral(_loc5_.substr(3));
                              break;
                           case "M":
                              this.aks.Guild.onInfosMembers(_loc5_.substr(3));
                              break;
                           case "B":
                              this.aks.Guild.onInfosBoosts(_loc5_.substr(3));
                              break;
                           case "F":
                              this.aks.Guild.onInfosMountPark(_loc5_.substr(3));
                              break;
                           case "T":
                              switch(_loc5_.charAt(3))
                              {
                                 case "M":
                                    this.aks.Guild.onInfosTaxCollectorsMovement(_loc5_.substr(4));
                                    break;
                                 case "P":
                                    this.aks.Guild.onInfosTaxCollectorsPlayers(_loc5_.substr(4));
                                    break;
                                 case "p":
                                    this.aks.Guild.onInfosTaxCollectorsAttackers(_loc5_.substr(4));
                                    break;
                                 default:
                                    this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                              }
                              break;
                           case "H":
                              this.aks.Guild.onInfosHouses(_loc5_.substr(3));
                              break;
                           default:
                              this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                        }
                        break;
                     case "J":
                        switch(_loc5_.charAt(2))
                        {
                           case "E":
                              this.aks.Guild.onJoinError(_loc5_.substr(3));
                              break;
                           case "R":
                              this.aks.Guild.onRequestLocal(_loc5_.substr(3));
                              break;
                           case "r":
                              this.aks.Guild.onRequestDistant(_loc5_.substr(3));
                              break;
                           case "K":
                              this.aks.Guild.onJoinOk(_loc5_.substr(3));
                              break;
                           case "C":
                              this.aks.Guild.onJoinDistantOk();
                              break;
                           default:
                              this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                        }
                        break;
                     case "V":
                        this.aks.Guild.onLeave();
                        break;
                     case "K":
                        this.aks.Guild.onBann(!_loc4_,_loc5_.substr(3));
                        break;
                     case "H":
                        this.aks.Guild.onHireTaxCollector(!_loc4_,_loc5_.substr(3));
                        break;
                     case "A":
                        this.aks.Guild.onTaxCollectorAttacked(_loc5_.substr(2));
                        break;
                     case "T":
                        this.aks.Guild.onTaxCollectorInfo(_loc5_.substr(2));
                        break;
                     case "U":
                        this.aks.Guild.onUserInterfaceOpen(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "W")
               {
                  switch(_loc3_)
                  {
                     case "C":
                        this.aks.Waypoints.onCreate(_loc5_.substr(2));
                        break;
                     case "V":
                        this.aks.Waypoints.onLeave();
                        break;
                     case "U":
                        this.aks.Waypoints.onUseError();
                        break;
                     case "c":
                        this.aks.Subway.onCreate(_loc5_.substr(2));
                        break;
                     case "v":
                        this.aks.Subway.onLeave();
                        break;
                     case "u":
                        this.aks.Subway.onUseError();
                        break;
                     case "p":
                        this.aks.Subway.onPrismCreate(_loc5_.substr(2));
                        break;
                     case "w":
                        this.aks.Subway.onPrismLeave();
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "a")
               {
                  switch(_loc3_)
                  {
                     case "l":
                        this.aks.Subareas.onList(_loc5_.substr(3));
                        break;
                     case "m":
                        this.aks.Subareas.onAlignmentModification(_loc5_.substr(2));
                        break;
                     case "M":
                        this.aks.Conquest.onAreaAlignmentChanged(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "C")
               {
                  switch(_loc3_)
                  {
                     case "I":
                        switch(_loc5_.charAt(2))
                        {
                           case "J":
                              this.aks.Conquest.onPrismInfosJoined(_loc5_.substr(3));
                              break;
                           case "V":
                              this.aks.Conquest.onPrismInfosClosing(_loc5_.substr(3));
                              break;
                           default:
                              this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                        }
                        break;
                     case "B":
                        this.aks.Conquest.onConquestBonus(_loc5_.substr(2));
                        break;
                     case "A":
                        this.aks.Conquest.onPrismAttacked(_loc5_.substr(2));
                        break;
                     case "S":
                        this.aks.Conquest.onPrismSurvived(_loc5_.substr(2));
                        break;
                     case "D":
                        this.aks.Conquest.onPrismDead(_loc5_.substr(2));
                        break;
                     case "P":
                        this.aks.Conquest.onPrismFightAddPlayer(_loc5_.substr(2));
                        break;
                     case "p":
                        this.aks.Conquest.onPrismFightAddEnemy(_loc5_.substr(2));
                        break;
                     case "W":
                        this.aks.Conquest.onWorldData(_loc5_.substr(2));
                        break;
                     case "b":
                        this.aks.Conquest.onConquestBalance(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "Z")
               {
                  switch(_loc3_)
                  {
                     case "S":
                        this.aks.Specialization.onSet(_loc5_.substr(2));
                        break;
                     case "C":
                        this.aks.Specialization.onChange(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "f")
               {
                  switch(_loc3_)
                  {
                     case "C":
                        this.aks.Fights.onCount(_loc5_.substr(2));
                        break;
                     case "L":
                        this.aks.Fights.onList(_loc5_.substr(2));
                        break;
                     case "D":
                        this.aks.Fights.onDetails(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "T")
               {
                  switch(_loc3_)
                  {
                     case "C":
                        this.aks.Tutorial.onCreate(_loc5_.substr(2));
                        break;
                     case "T":
                        this.aks.Tutorial.onShowTip(_loc5_.substr(2));
                        break;
                     case "B":
                        this.aks.Tutorial.onGameBegin();
                        break;
                     case "q":
                        this.api.kernel.TutorialManager.forceTerminate();
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "Q")
               {
                  switch(_loc3_)
                  {
                     case "L":
                        this.aks.Quests.onList(_loc5_.substr(3));
                        break;
                     case "S":
                        this.aks.Quests.onStep(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ === "P")
               {
                  switch(_loc3_)
                  {
                     case "I":
                        this.aks.Party.onInvite(!_loc4_,_loc5_.substr(3));
                        break;
                     case "L":
                        this.aks.Party.onLeader(_loc5_.substr(2));
                        break;
                     case "R":
                        this.aks.Party.onRefuse(_loc5_.substr(2));
                        break;
                     case "A":
                        this.aks.Party.onAccept(_loc5_.substr(2));
                        break;
                     case "C":
                        this.aks.Party.onCreate(!_loc4_,_loc5_.substr(3));
                        break;
                     case "V":
                        this.aks.Party.onLeave(_loc5_.substr(2));
                        break;
                     case "F":
                        this.aks.Party.onFollow(!_loc4_,_loc5_.substr(3));
                        break;
                     case "M":
                        this.aks.Party.onMovement(_loc5_.substr(2));
                        break;
                     default:
                        this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
                  }
                  break loop1;
               }
               if(_loc0_ !== "R")
               {
                  continue;
               }
               switch(_loc3_)
               {
                  case "e":
                     this.aks.Mount.onEquip(_loc5_.substr(2));
                     break loop1;
                  case "x":
                     this.aks.Mount.onXP(_loc5_.substr(2));
                     break loop1;
                  case "n":
                     this.aks.Mount.onName(_loc5_.substr(2));
                     break loop1;
                  case "d":
                     this.aks.Mount.onData(_loc5_.substr(2));
                     break loop1;
                  case "p":
                     this.aks.Mount.onMountPark(_loc5_.substr(2));
                     break loop1;
                  case "D":
                     this.aks.Mount.onMountParkBuy(_loc5_.substr(2));
                     break loop1;
                  case "v":
                     this.aks.Mount.onLeave(_loc5_.substr(2));
                     break loop1;
                  case "r":
                     this.aks.Mount.onRidingState(_loc5_.substr(2));
                     break loop1;
                  default:
                     this.defaultProcessAction(_loc2_,_loc3_,_loc4_,_loc5_);
               }
            }
      }
   }
}
