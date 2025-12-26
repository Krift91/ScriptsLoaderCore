class dofus.aks.Account extends dofus.aks.Handler
{
   var WaitQueueTimer;
   function Account(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
      this.WaitQueueTimer = new Object();
   }
   function logon(§\x1e\x10\x0b§, §\x1e\x0f\x03§, §\x13\x11§)
   {
      if(this.api.datacenter.Basics.connexionKey == undefined)
      {
         this.onLogin(false,"n");
         return undefined;
      }
      if(_loc2_ == undefined)
      {
         _loc2_ = this.api.datacenter.Basics.login;
      }
      else
      {
         this.api.datacenter.Basics.login = _loc2_;
      }
      if(_loc3_ == undefined)
      {
         _loc3_ = this.api.datacenter.Basics.password;
      }
      else
      {
         this.api.datacenter.Basics.password = _loc3_;
      }
      this.aks.send(dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + (dofus.Constants.BETAVERSION <= 0 ? "" : "." + dofus.Constants.BETAVERSION) + (!this.api.electron.enabled ? "" : "e") + (!this.api.config.isStreaming ? "" : "s"),true,this.api.lang.getText("CONNECTING"));
      if(_loc4_)
      {
         this.aks.send(_loc2_ + "\n" + _loc3_);
      }
      else if(this.api.lang.getConfigText("CRYPTO_METHOD") == 2)
      {
         var _loc5_ = new ank["\x1e\n\x07"]["\n\t"]();
         var _loc6_ = "#2" + _loc5_.hex_md5(_loc5_.hex_md5(_loc3_) + this.api.datacenter.Basics.connexionKey);
         this.aks.send(_loc2_ + "\n" + _loc6_);
      }
      else
      {
         this.aks.send(_loc2_ + "\n" + ank["\x1e\n\x07"]["\x11\x17"].cryptPassword(_loc3_,this.api.datacenter.Basics.connexionKey));
      }
   }
   function setNickName(§\x1e\x0f\x12§)
   {
      this.aks.send(_loc2_,true,this.api.lang.getText("WAITING_MSG_LOADING"));
   }
   function getCharacters()
   {
      this.aks.send("AL",true,this.api.lang.getText("CONNECTING"));
   }
   function getCharactersForced()
   {
      this.aks.send("ALf",true,this.api.lang.getText("CONNECTING"));
   }
   function getServersList()
   {
      this.aks.send("Ax",true,this.api.lang.getText("WAITING_MSG_LOADING"));
   }
   function setServer(§\x1e\x1d\x11§)
   {
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      this.api.datacenter.Basics.aks_incoming_server_id = _loc2_;
      this.aks.send("AX" + _loc2_,true,this.api.lang.getText("WAITING_MSG_LOADING"));
   }
   function searchForFriend(§\x1e\x0f\x13§)
   {
      this.aks.send("AF" + _loc2_);
   }
   function setCharacter(§\x1e\x14\x03§)
   {
      this.aks.send("AS" + _loc2_,true,this.api.lang.getText("WAITING_MSG_LOADING"));
      this.api.ui.unloadUIComponent("ChooseCharacter");
      this.getQueuePosition();
   }
   function editCharacterName(§\x1e\x0f\x16§)
   {
      this.aks.send("AEn" + _loc2_,true);
   }
   function editCharacterColors(§\x06\x1c§, §\x06\x1b§, §\x06\x1a§)
   {
      this.aks.send("AEc" + _loc2_ + "|" + _loc3_ + "|" + _loc4_,true);
   }
   function addCharacter(§\x1e\x0f\x16§, §\x07\x02§, §\x06\x1c§, §\x06\x1b§, §\x06\x1a§, §\x1e\x1d\x0f§)
   {
      this.aks.send("AA" + _loc2_ + "|" + _loc3_ + "|" + _loc7_ + "|" + _loc4_ + "|" + _loc5_ + "|" + _loc6_,true,this.api.lang.getText("WAITING_MSG_RECORDING"));
   }
   function deleteCharacter(§\x07\t§, §\x1e\r\x19§)
   {
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      if(_loc3_ == undefined)
      {
         _loc3_ = "";
      }
      var _loc4_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_global.escape(_loc3_));
      this.aks.send("AD" + _loc2_ + "|" + _loc4_.replace(["|","\r","\n",String.fromCharCode(0)],["","","",""]),true,this.api.lang.getText("WAITING_MSG_DELETING"));
   }
   function resetCharacter(§\x07\t§)
   {
      this.aks.send("AR" + _loc2_);
   }
   function boost(§\b\x04§)
   {
      this.aks.send("AB" + _loc2_);
   }
   function sendTicket(§\x1e\f\x11§)
   {
      this.aks.send("AT" + _loc2_);
   }
   function rescue(§\x1e\f\x11§)
   {
      var _loc3_ = "";
      if(this.api.datacenter.Game.isFight)
      {
         _loc3_ = !this.api.datacenter.Game.isRunning ? "|0" : "|1";
      }
      this.aks.send("Ar" + _loc2_ + _loc3_);
   }
   function getGifts()
   {
      this.aks.send("Ag" + this.api.config.language);
   }
   function attributeGiftToCharacter(§\x04\x18§, §\x07\x07§)
   {
      this.aks.send("AG" + _loc2_ + "|" + _loc3_);
   }
   function getQueuePosition()
   {
      this.aks.send("Af",false);
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this.WaitQueueTimer,"WaitQueue",this,this.getQueuePosition,Number(this.api.lang.getConfigText("DELAY_WAIT_QUEUE_REFRESH")));
   }
   function getRandomCharacterName()
   {
      this.aks.send("AP",false);
   }
   function useKey(§\x03\x18§)
   {
      this.aks.send("Ak" + dofus.aks["\x1e\x0f"].HEX_CHARS[_loc2_],false);
   }
   function requestRegionalVersion()
   {
      this.aks.send("AV",true,this.api.lang.getText("WAITING_MSG_LOADING"));
   }
   function sendConfiguredPort()
   {
      this.aks.send("Ap" + this.api.datacenter.Basics.aks_connection_server_port,false);
   }
   function sendIdentity()
   {
      dofus["\x0b\b"]["\x1e\n\n"].getInstance().update();
      var _loc2_ = SharedObject.getLocal(dofus.Constants.GLOBAL_SO_IDENTITY_NAME);
      var _loc3_ = _loc2_.data.identityVersion;
      var _loc4_ = _loc2_.data.identity;
      if(!this.api.network.isValidNetworkKey(_loc4_,_loc3_))
      {
         _loc3_ = dofus.aks["\x1e\x0f"].CURRENT_IDENTITY_VERSION;
         _loc4_ = this.api.network.getRandomNetworkKey();
         _loc2_.data.identityVersion = _loc3_;
         _loc2_.data.identity = _loc4_;
         _loc2_.flush();
      }
      if(this.api.datacenter.Basics.aks_identity != _loc4_)
      {
         this.api.datacenter.Basics.aks_identity = _loc4_;
      }
      this.aks.send("Ai" + this.api.datacenter.Basics.aks_identity,false);
      _loc2_.close();
   }
   function validCharacterMigration(§\x07\x07§, §\x1e\x0f\x16§)
   {
      this.aks.send("AM" + _loc2_ + ";" + _loc3_,false);
   }
   function deleteCharacterMigration(§\x07\x07§)
   {
      this.aks.send("AM-" + _loc2_,false);
   }
   function askCharacterMigration(§\x07\x07§, §\x1e\x0f\x16§)
   {
      this.aks.send("AM?" + _loc2_ + ";" + _loc3_,false);
   }
   function onRegionalVersion(§\x1e\x12\r§)
   {
      var _loc3_ = this.api.lang.getConfigText("MAXIMUM_ALLOWED_VERSION");
      var _loc4_ = Number(_loc2_);
      if(_loc3_ > 0)
      {
         if((_loc4_ <= 0 || _loc4_ > _loc3_) && !this.api.datacenter.Player.isAuthorized)
         {
            var _loc5_ = {name:"SwitchToEnglish",listener:this};
            this.api.kernel.showMessage(undefined,this.api.lang.getText("SWITCH_TO_ENGLISH"),"CAUTION_YESNO",_loc5_);
            return undefined;
         }
      }
      this.api.datacenter.Basics.aks_current_regional_version = !(_loc4_ > 0 && !_global.isNaN(_loc4_)) ? Number.MAX_VALUE : _loc4_;
      this.getGifts();
      this.getCharacters();
      this.api.network.Account.getQueuePosition();
   }
   function onCharacterDelete(§\x14\x16§, §\x1e\x12\r§)
   {
      if(!_loc2_)
      {
         this.api.ui.unloadUIComponent("WaitingMessage");
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CHARACTER_DELETION_FAILED"),"ERROR_BOX");
      }
   }
   function onSecretQuestion(§\x1e\x12\r§)
   {
      this.api.datacenter.Basics.aks_secret_question = _loc2_;
   }
   function onKey(§\x1e\x12\r§)
   {
      var _loc3_ = _global.parseInt(_loc2_.substr(0,1),16);
      var _loc4_ = _loc2_.substr(1);
      this.aks.addKeyToCollection(_loc3_,_loc4_);
      this.useKey(_loc3_);
      this.aks.startUsingKey(_loc3_);
   }
   function onDofusPseudo(§\x1e\x12\r§)
   {
      this.api.datacenter.Basics.dofusPseudo = _loc2_;
   }
   function onCommunity(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      if(_loc3_ >= 0)
      {
         this.api.datacenter.Basics.communityId = _loc3_;
      }
   }
   function onLogin(§\x14\x16§, §\x1e\x12\r§)
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.WaitQueueTimer,"WaitQueue");
      this.api.ui.unloadUIComponent("CenterText");
      this.api.ui.unloadUIComponent("WaitingMessage");
      this.api.ui.unloadUIComponent("WaitingQueue");
      if(_loc2_)
      {
         this.api.datacenter.Basics.isLogged = true;
         this.api.ui.unloadUIComponent("Login");
         this.api.ui.unloadUIComponent("ChooseNickName");
         this.api.datacenter.Player.isAuthorized = _loc3_ == "1";
         _root._loader.loadXtra();
      }
      else
      {
         var _loc4_ = _loc3_.charAt(0);
         var _loc6_ = false;
         switch(_loc4_)
         {
            case "n":
               var _loc5_ = this.api.lang.getText("CONNECT_NOT_FINISHED");
               break;
            case "a":
               _loc5_ = this.api.lang.getText("ALREADY_LOGGED");
               break;
            case "c":
               _loc5_ = this.api.lang.getText("ALREADY_LOGGED_GAME_SERVER");
               break;
            case "v":
               _loc5_ = this.api.lang.getText("BAD_VERSION",[dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + (dofus.Constants.BETAVERSION <= 0 ? "" : " Beta " + dofus.Constants.BETAVERSION),_loc3_.substr(1)]);
               _loc6_ = true;
               break;
            case "p":
               _loc5_ = this.api.lang.getText("NOT_PLAYER");
               break;
            case "b":
               _loc5_ = this.api.lang.getText("BANNED");
               break;
            case "d":
               _loc5_ = this.api.lang.getText("U_DISCONNECT_ACCOUNT");
               break;
            case "k":
               var _loc7_ = _loc3_.substr(1).split("|");
               var _loc8_ = 0;
               while(_loc8_ < _loc7_.length)
               {
                  if(_loc7_[_loc8_] == 0)
                  {
                     _loc7_[_loc8_] = undefined;
                  }
                  _loc8_ = _loc8_ + 1;
               }
               _loc5_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this.api.lang.getText("KICKED"),_loc7_);
               break;
            case "w":
               _loc5_ = this.api.lang.getText("SERVER_FULL");
               break;
            case "o":
               _loc5_ = this.api.lang.getText("OLD_ACCOUNT",[this.api.datacenter.Basics.login]);
               break;
            case "e":
               _loc5_ = this.api.lang.getText("OLD_ACCOUNT_USE_NEW",[this.api.datacenter.Basics.login]);
               break;
            case "m":
               _loc5_ = this.api.lang.getText("MAINTAIN_ACCOUNT");
               break;
            case "r":
               this.api.ui.loadUIComponent("ChooseNickName","ChooseNickName");
               return undefined;
            case "s":
               this.api.ui.getUIComponent("ChooseNickName").nickAlreadyUsed = true;
               return undefined;
            case "i":
               _loc5_ = this.api.lang.getText("LOGIN_ERROR_ANONYMOUS_IP");
               break;
            case "f":
               if(this.api.config.isStreaming)
               {
                  _loc5_ = this.api.lang.getText("ACCESS_DENIED_MINICLIP");
                  break;
               }
            default:
               _loc5_ = this.api.lang.getText("ACCESS_DENIED");
         }
         if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
         {
            getURL("JavaScript:WriteLog(\'LoginError;" + _loc5_ + "\')","_self");
         }
         this.aks.disconnect(false,false);
         var _loc9_ = this.api.ui.loadUIComponent("AskOk",!_loc6_ ? "AskOkOnLogin" : "AskOkOnLoginCloseClient",{title:this.api.lang.getText("LOGIN"),text:_loc5_});
         _loc9_.addEventListener("ok",this);
         this.api.kernel.manualLogon();
      }
   }
   function onServersList(§\x14\x16§, §\x1e\x12\r§)
   {
      this.api.ui.unloadUIComponent("WaitingMessage");
      var _loc4_ = this.api.datacenter.Basics.aks_servers;
      this.api.ui.getUIComponent("MainMenu").quitMode = "menu";
      var _loc5_ = _loc3_.split("|");
      var _loc6_ = Number(_loc5_[0]);
      var _loc7_ = -1;
      this.api.datacenter.Player.subscriber = _loc6_ > 0;
      this.api.ui.getUIComponent("MainMenu").updateSubscribeButton();
      var _loc8_ = 0;
      var _loc9_ = 1;
      while(_loc9_ < _loc5_.length)
      {
         var _loc10_ = _loc5_[_loc9_].split(",");
         var _loc11_ = Number(_loc10_[0]);
         var _loc12_ = Number(_loc10_[1]);
         if(_loc12_ > 0)
         {
            _loc7_ = _loc11_;
         }
         _loc8_ += _loc12_;
         var _loc13_ = 0;
         while(_loc13_ < _loc4_.length)
         {
            if(_loc4_[_loc13_].id == _loc11_)
            {
               _loc4_[_loc13_].charactersCount = _loc12_;
               break;
            }
            _loc13_ = _loc13_ + 1;
         }
         _loc9_ = _loc9_ + 1;
      }
      if(_loc7_ == -1)
      {
         _loc7_ = _loc4_[Math.floor(Math.random() * (_loc4_.length - 1))].id;
         if(!_loc7_)
         {
            _loc7_ = -1;
         }
      }
      this.api.ui.unloadUIComponent("CreateCharacter");
      this.api.ui.unloadUIComponent("ChooseCharacter");
      this.api.ui.unloadUIComponent("AutomaticServer");
      this.api.ui.unloadUIComponent("ChooseServer");
      if(dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST != undefined)
      {
         var _loc14_ = dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST;
         var _loc15_ = _loc14_.serverId;
         var _loc16_ = undefined;
         var _loc17_ = 0;
         while(_loc17_ < _loc4_.length)
         {
            var _loc18_ = _loc4_[_loc17_];
            if(_loc18_.id == _loc15_)
            {
               if(!(_loc18_.state != dofus.datacenter["\x1e\x12\x12"].SERVER_ONLINE || !_loc18_.isAllowed))
               {
                  _loc16_ = _loc18_;
                  break;
               }
            }
            _loc17_ = _loc17_ + 1;
         }
         if(_loc16_ != undefined)
         {
            if(_loc16_.charactersCount != 0)
            {
               this.api.datacenter.Basics.aks_current_server = _loc16_;
               this.api.network.Account.setServer(_loc16_.id);
               return undefined;
            }
            this.api.kernel.onFastServerSwitchFail("You do not have any character on server " + _loc15_);
         }
         else
         {
            this.api.kernel.onFastServerSwitchFail("Server " + _loc15_ + " is not available now.");
         }
      }
      if(!this.api.datacenter.Basics.forceAutomaticServerSelection && (_loc8_ > 0 || (this.api.config.isStreaming || this.api.datacenter.Basics.forceManualServerSelection)))
      {
         if(this.api.datacenter.Basics.forceManualServerSelection)
         {
            this.api.datacenter.Basics.hasForcedManualSelection = true;
         }
         else if(_loc7_ != -1 && this.api.config.isStreaming)
         {
            var _loc19_ = new dofus.datacenter["\x1e\x12\x12"](_loc7_,1,0);
            if(_loc19_.isAllowed())
            {
               this.api.datacenter.Basics.aks_current_server = _loc19_;
               this.api.network.Account.setServer(_loc7_);
               return undefined;
            }
         }
         this.api.datacenter.Basics.forceManualServerSelection = false;
         this.api.ui.loadUIComponent("ChooseServer","ChooseServer",{servers:_loc4_,remainingTime:_loc6_});
      }
      else
      {
         this.api.datacenter.Basics.forceAutomaticServerSelection = false;
         this.api.ui.loadUIComponent("AutomaticServer","AutomaticServer",{servers:_loc4_,remainingTime:_loc6_});
      }
   }
   function onHosts(§\x1e\x12\r§)
   {
      var _loc3_ = this.api.datacenter.Basics.aks_servers;
      var _loc4_ = new Array();
      var _loc5_ = _loc2_.split("|");
      var _loc6_ = 0;
      while(_loc6_ < _loc5_.length)
      {
         var _loc7_ = _loc5_[_loc6_].split(";");
         var _loc8_ = Number(_loc7_[0]);
         var _loc9_ = Number(_loc7_[1]);
         var _loc10_ = Number(_loc7_[2]);
         var _loc11_ = _loc7_[3] == "1";
         var _loc12_ = new dofus.datacenter["\x1e\x12\x12"](_loc8_,_loc9_,_loc10_,_loc11_);
         if(!(_global.CONFIG.onlyHardcore && _loc12_.typeNum != dofus.datacenter["\x1e\x12\x12"].SERVER_HARDCORE))
         {
            var _loc13_ = _loc3_.findFirstItem("id",_loc8_).item;
            if(_loc13_ != undefined)
            {
               _loc12_.charactersCount = _loc13_.charactersCount;
            }
            _loc4_.push(_loc12_);
         }
         _loc6_ = _loc6_ + 1;
      }
      this.api.datacenter.Basics.aks_servers.createFromArray(_loc4_);
   }
   function onCharactersList(§\x14\x16§, §\x1e\x12\r§, §\x18\f§)
   {
      this.api.ui.unloadUIComponent("WaitingMessage");
      this.api.ui.unloadUIComponent("WaitingQueue");
      var _loc5_ = new Array();
      var _loc6_ = _loc3_.split("|");
      var _loc7_ = Number(_loc6_[0]);
      this.api.datacenter.Player.subscriber = _loc7_ > 0;
      this.api.ui.getUIComponent("MainMenu").updateSubscribeButton();
      var _loc8_ = Number(_loc6_[1]);
      var _loc9_ = new Array();
      this.api.datacenter.Sprites.clear();
      var _loc10_ = 2;
      while(_loc10_ < _loc6_.length)
      {
         var _loc11_ = _loc6_[_loc10_].split(";");
         var _loc12_ = new Object();
         var _loc13_ = _loc11_[0];
         var _loc14_ = _loc11_[1];
         _loc12_.level = _loc11_[2];
         _loc12_.gfxID = _loc11_[3];
         _loc12_.color1 = _loc11_[4];
         _loc12_.color2 = _loc11_[5];
         _loc12_.color3 = _loc11_[6];
         _loc12_.accessories = _loc11_[7];
         _loc12_.merchant = _loc11_[8];
         _loc12_.serverID = _loc11_[9];
         _loc12_.isDead = _loc11_[10];
         _loc12_.deathCount = _loc11_[11];
         _loc12_.lvlMax = _loc11_[12];
         var _loc15_ = this.api.kernel.CharactersManager.createCharacter(_loc13_,_loc14_,_loc12_);
         _loc15_.sortID = Number(_loc13_);
         _loc5_.push(_loc15_);
         _loc9_.push(Number(_loc13_));
         _loc10_ = _loc10_ + 1;
      }
      this.api.ui.unloadUIComponent("ChooseCharacter");
      this.api.ui.unloadUIComponent("CreateCharacter");
      this.api.ui.unloadUIComponent("ChooseServer");
      this.api.ui.unloadUIComponent("AutomaticServer");
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.WaitQueueTimer,"WaitQueue");
      this.api.ui.getUIComponent("MainMenu").quitMode = "menu";
      if(this.api.datacenter.Basics.hasCreatedCharacter)
      {
         this.api.datacenter.Basics.hasCreatedCharacter = false;
         if(this.api.datacenter.Basics.oldCharList == undefined && _loc9_.length == 1 || this.api.datacenter.Basics.oldCharList.length + 1 == _loc9_.length)
         {
            var _loc16_ = 0;
            while(true)
            {
               if(_loc16_ < _loc9_.length)
               {
                  var _loc17_ = false;
                  var _loc18_ = 0;
                  while(_loc18_ < this.api.datacenter.Basics.oldCharList.length)
                  {
                     if(_loc9_[_loc16_] == this.api.datacenter.Basics.oldCharList[_loc18_])
                     {
                        _loc17_ = true;
                        break;
                     }
                     _loc18_ = _loc18_ + 1;
                  }
                  if(!_loc17_)
                  {
                     break;
                  }
                  continue;
               }
               _loc16_ = _loc16_ + 1;
            }
            this.setCharacter(_loc9_[_loc16_]);
            return undefined;
         }
      }
      if(dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST != undefined)
      {
         var _loc19_ = dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST;
         var _loc20_ = _loc19_.playerName;
         var _loc21_ = 0;
         while(_loc21_ < _loc5_.length)
         {
            var _loc22_ = _loc5_[_loc21_];
            if(_loc22_.name == _loc20_)
            {
               this.setCharacter(_loc22_.id);
               return undefined;
            }
            _loc21_ = _loc21_ + 1;
         }
         this.api.kernel.onFastServerSwitchFail("Could not find " + _loc20_ + " on this characters list !");
      }
      this.api.datacenter.Basics.oldCharList = _loc9_;
      if((!_loc4_ || this.api.datacenter.Basics.ignoreMigration) && ((this.api.datacenter.Basics.createCharacter || !_loc8_) && !this.api.datacenter.Basics.ignoreCreateCharacter))
      {
         this.api.ui.loadUIComponent("CreateCharacter","CreateCharacter",{remainingTime:_loc7_});
      }
      else
      {
         this.api.ui.unloadUIComponent("CharactersMigration");
         if(!_loc4_ || this.api.datacenter.Basics.ignoreMigration)
         {
            this.api.datacenter.Basics.createCharacter = false;
            this.api.ui.loadUIComponent("ChooseCharacter","ChooseCharacter",{spriteList:_loc5_,remainingTime:_loc7_,characterCount:_loc8_},{bForceLoad:true});
         }
         else
         {
            this.api.datacenter.Basics.ignoreMigration = false;
            this.api.datacenter.Basics.createCharacter = false;
            this.api.ui.loadUIComponent("CharactersMigration","CharactersMigration",{spriteList:_loc5_,remainingTime:_loc7_,characterCount:_loc8_},{bForceLoad:true});
         }
      }
      if(this.api.datacenter.Basics.aks_gifts_stack.length != 0 && _loc5_.length > 0)
      {
         this.api.ui.getUIComponent("CreateCharacter")._visible = false;
         this.api.ui.getUIComponent("ChooseCharacter")._visible = false;
         this.api.ui.loadUIComponent("Gifts","Gifts",{gift:this.api.datacenter.Basics.aks_gifts_stack.shift(),spriteList:_loc5_},{bForceLoad:true});
      }
   }
   function onMiniClipInfo()
   {
      this.api.datacenter.Basics.first_connection_from_miniclip = true;
   }
   function onCharacterAdd(§\x14\x16§, §\x1e\x12\r§)
   {
      this.api.ui.unloadUIComponent("WaitingMessage");
      if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         getURL("JavaScript:WriteLog(\'CharacterValidation;" + _loc2_ + "\')","_self");
      }
      if(!_loc2_)
      {
         switch(_loc3_)
         {
            case "s":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SUBSCRIPTION_OUT"),"ERROR_BOX",{name:"CreateNameExists"});
               break;
            case "f":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CREATE_CHARACTER_FULL"),"ERROR_BOX",{name:"CreateNameExists"});
               break;
            case "a":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("NAME_ALEREADY_EXISTS"),"ERROR_BOX",{name:"CreateNameExists"});
               break;
            case "n":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CREATE_CHARACTER_BAD_NAME"),"ERROR_BOX",{name:"CreateNameExists"});
               break;
            default:
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CREATE_CHARACTER_ERROR"),"ERROR_BOX",{name:"CreateNameExists"});
         }
      }
      else
      {
         this.api.datacenter.Basics.createCharacter = false;
      }
   }
   function onSelectServerMinimal(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      var _loc4_ = new dofus.datacenter["\x1e\x12\x12"](_loc3_,1,0);
      this.api.datacenter.Basics.aks_current_server = _loc4_;
      this.api.network.Basics.onAuthorizedCommandPrompt(this.api.datacenter.Basics.aks_current_server.label);
   }
   function onSelectServer(§\x14\x16§, §\x14\x03§, §\x1e\x12\r§)
   {
      this.api.ui.unloadUIComponent("WaitingMessage");
      if(_loc2_)
      {
         if(_loc3_)
         {
            var _loc8_ = _loc4_.substr(0,8);
            var _loc9_ = _loc4_.substr(8,3);
            var _loc7_ = _loc4_.substr(11);
            var _loc10_ = new Array();
            var _loc11_ = 0;
            while(_loc11_ < 8)
            {
               var _loc12_ = _loc8_.charCodeAt(_loc11_) - 48;
               var _loc13_ = _loc8_.charCodeAt(_loc11_ + 1) - 48;
               _loc10_.push((_loc12_ & 0x0F) << 4 | _loc13_ & 0x0F);
               _loc11_ += 2;
            }
            var _loc5_ = _loc10_.join(".");
            var _loc6_ = (ank["\x1e\n\x07"]["\x12\r"].decode64(_loc9_.charAt(0)) & 0x3F) << 12 | (ank["\x1e\n\x07"]["\x12\r"].decode64(_loc9_.charAt(1)) & 0x3F) << 6 | ank["\x1e\n\x07"]["\x12\r"].decode64(_loc9_.charAt(2)) & 0x3F;
         }
         else
         {
            var _loc14_ = _loc4_.split(";");
            var _loc15_ = _loc14_[0].split(":");
            _loc5_ = _loc15_[0];
            _loc6_ = _loc15_[1];
            _loc7_ = _loc14_[1];
         }
         var _loc16_ = this.api.config.getCustomIP(this.api.datacenter.Basics.aks_incoming_server_id);
         if(_loc16_ != undefined)
         {
            _loc5_ = _loc16_.ip;
            _loc6_ = _loc16_.port;
         }
         this.api.datacenter.Basics.aks_ticket = _loc7_;
         this.api.datacenter.Basics.aks_gameserver_ip = _loc5_;
         this.api.datacenter.Basics.aks_gameserver_port = _loc6_;
         this.api.datacenter.Basics.ignoreMigration = false;
         this.api.datacenter.Basics.ignoreCreateCharacter = false;
         this.api.ui.unloadUIComponent("ChooseServer");
         this.api.ui.unloadUIComponent("AutomaticServer");
         this.api.ui.loadUIComponent("Waiting","Waiting");
         this.aks.softDisconnect();
         this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:this.api.lang.getText("CONNECTING")},{bAlwaysOnTop:true,bForceLoad:true});
         this.api.network.Basics.onAuthorizedCommandPrompt(this.api.datacenter.Basics.aks_current_server.label);
         if(_global.CONFIG.delay != undefined)
         {
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"connect",this.aks,this.aks.connect,_global.CONFIG.delay,[_loc5_,_loc6_,false]);
         }
         else
         {
            this.aks.connect(_loc5_,_loc6_,false);
         }
      }
      else
      {
         delete this.api.datacenter.Basics.aks_current_server;
         this.api.datacenter.Basics.createCharacter = false;
         switch(_loc4_.charAt(0))
         {
            case "d":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_CHOOSE_CHARACTER_SERVER_DOWN"),"ERROR_BOX");
               break;
            case "f":
               var _loc17_ = this.api.lang.getText("CANT_CHOOSE_CHARACTER_SERVER_FULL");
               if(_loc4_.substr(1).length > 0)
               {
                  var _loc18_ = _loc4_.substr(1).split("|");
                  _loc17_ += "<br/><br/>";
                  _loc17_ += this.api.lang.getText("SERVERS_ACCESSIBLES") + " : <br/>";
                  var _loc19_ = 0;
                  while(_loc19_ < _loc18_.length)
                  {
                     var _loc20_ = new dofus.datacenter["\x1e\x12\x12"](_loc18_[_loc19_]);
                     _loc17_ += _loc20_.label;
                     _loc17_ += _loc19_ != _loc18_.length - 1 ? ", " : ".";
                     _loc19_ = _loc19_ + 1;
                  }
               }
               this.api.kernel.showMessage(undefined,_loc17_,"ERROR_BOX");
               break;
            case "F":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SERVER_FULL"),"ERROR_BOX");
               break;
            case "s":
               var _loc21_ = this.api.lang.getServerInfos(Number(_loc4_.substr(1))).n;
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_CHOOSE_CHARACTER_SHOP_OTHER_SERVER",[_loc21_]),"ERROR_BOX");
               break;
            case "r":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_SELECT_THIS_SERVER"),"ERROR_BOX");
         }
      }
   }
   function onRescue(§\x14\x16§)
   {
      this.api.datacenter.Player.data.GameActionsManager.clear();
      this.api.ui.unloadUIComponent("WaitingMessage");
      this.api.ui.unloadUIComponent("WaitingQueue");
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.WaitQueueTimer,"WaitQueue");
      if(!_loc2_)
      {
         this.api.datacenter.Basics.aks_rescue_count = -1;
         this.aks.disconnect(false,true);
      }
   }
   function onTicketResponse(§\x14\x16§, §\x1e\x12\r§)
   {
      this.api.ui.unloadUIComponent("WaitingMessage");
      if(_loc2_)
      {
         var _loc4_ = _global.parseInt(_loc3_.substr(0,1),16);
         if(_global.isNaN(_loc4_))
         {
            _loc4_ = -1;
         }
         if(_loc4_ > 0)
         {
            this.aks.addKeyToCollection(_loc4_,_loc3_.substr(1));
            this.useKey(_loc4_);
            this.aks.startUsingKey(_loc4_);
         }
         else if(_loc4_ == 0)
         {
            this.useKey(0);
         }
         else if(_loc4_ == -1)
         {
         }
         this.api.datacenter.Basics.aks_current_regional_version = Number.POSITIVE_INFINITY;
         this.requestRegionalVersion();
      }
      else
      {
         this.aks.disconnect(false,true);
      }
   }
   function onCharacterSelected(§\x14\x16§, §\x1e\x12\r§)
   {
      this.api.datacenter.Basics.inGame = true;
      if(_loc2_ && this.api.datacenter.Player.isAuthorized)
      {
         this.api.kernel.AdminManager.characterSelected();
      }
      this.api.ui.unloadUIComponent("WaitingMessage");
      this.api.ui.unloadUIComponent("ChooseCharacter");
      this.api.ui.unloadUIComponent("WaitingQueue");
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.WaitQueueTimer,"WaitQueue");
      if(_loc2_)
      {
         var _loc4_ = _loc3_.split("|");
         var _loc5_ = new Object();
         var _loc6_ = Number(_loc4_[0]);
         var _loc7_ = _loc4_[1];
         _loc5_.level = _loc4_[2];
         _loc5_.guild = _loc4_[3];
         _loc5_.sex = _loc4_[4];
         _loc5_.gfxID = _loc4_[5];
         _loc5_.color1 = _loc4_[6];
         _loc5_.color2 = _loc4_[7];
         _loc5_.color3 = _loc4_[8];
         _loc5_.items = _loc4_[9];
         this.api.kernel.CharactersManager.setLocalPlayerData(_loc6_,_loc7_,_loc5_);
         this.aks.Game.create();
         if(this.api.datacenter.Player.isAuthorized)
         {
            this.api.kernel.AdminManager.characterEnteringGame();
         }
         this.api.electron.updateWindowTitle(_loc7_);
         this.api.electron.setIngameDiscordActivity();
      }
      else
      {
         this.aks.disconnect(false,true);
      }
   }
   function onStats(§\x1e\x12\r§)
   {
      this.api.ui.unloadUIComponent("WaitingMessage");
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = this.api.datacenter.Player;
      var _loc5_ = _loc3_[0].split(",");
      _loc4_.XP = _loc5_[0];
      _loc4_.XPlow = _loc5_[1];
      _loc4_.XPhigh = _loc5_[2];
      _loc4_.Kama = _loc3_[1];
      _loc4_.BonusPoints = _loc3_[2];
      _loc4_.BonusPointsSpell = _loc3_[3];
      _loc5_ = _loc3_[4].split(",");
      var _loc6_ = 0;
      if(_loc5_[0].indexOf("~"))
      {
         var _loc7_ = _loc5_[0].split("~");
         _loc4_.haveFakeAlignment = _loc7_[0] != _loc7_[1];
         _loc5_[0] = _loc7_[0];
         _loc6_ = Number(_loc7_[1]);
      }
      var _loc8_ = Number(_loc5_[0]);
      var _loc9_ = Number(_loc5_[1]);
      _loc4_.alignment = new dofus.datacenter["\x1e\f"](_loc8_,_loc9_);
      _loc4_.fakeAlignment = new dofus.datacenter["\x1e\f"](_loc6_,_loc9_);
      _loc4_.data.alignment = _loc4_.alignment.clone();
      var _loc10_ = Number(_loc5_[2]);
      var _loc11_ = Number(_loc5_[3]);
      var _loc12_ = Number(_loc5_[4]);
      var _loc13_ = _loc5_[5] != "1" ? false : true;
      var _loc14_ = _loc4_.rank.disgrace;
      _loc4_.rank = new dofus.datacenter.Rank(_loc10_,_loc11_,_loc12_,_loc13_);
      _loc4_.data.rank = _loc4_.rank.clone();
      if(_loc14_ != undefined && (_loc14_ != _loc12_ && _loc12_ > 0))
      {
         this.api.kernel.GameManager.showDisgraceSanction();
      }
      _loc5_ = _loc3_[5].split(",");
      _loc4_.LP = _loc5_[0];
      _loc4_.data.LP = _loc5_[0];
      _loc4_.LPmax = _loc5_[1];
      _loc4_.data.LPmax = _loc5_[1];
      _loc5_ = _loc3_[6].split(",");
      _loc4_.EnergyMax = _loc5_[1];
      _loc4_.Energy = _loc5_[0];
      _loc4_.Initiative = _loc3_[7];
      _loc4_.Discernment = _loc3_[8];
      var _loc15_ = new Array();
      var _loc16_ = 3;
      while(_loc16_ > -1)
      {
         _loc15_[_loc16_] = new Array();
         _loc16_ = _loc16_ - 1;
      }
      var _loc17_ = 9;
      for(; _loc17_ < 51; _loc17_ = _loc17_ + 1)
      {
         _loc5_ = _loc3_[_loc17_].split(",");
         var _loc18_ = Number(_loc5_[0]);
         var _loc19_ = Number(_loc5_[1]);
         var _loc20_ = Number(_loc5_[2]);
         var _loc21_ = Number(_loc5_[3]);
         switch(_loc17_)
         {
            case 9:
               _loc15_[0].push({id:_loc17_,o:7,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"Star"});
               if(!this.api.datacenter.Game.isFight)
               {
                  _loc4_.AP = _loc18_ + _loc19_ + _loc20_;
               }
               break;
            case 10:
               _loc15_[0].push({id:_loc17_,o:8,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconMP"});
               if(!this.api.datacenter.Game.isFight)
               {
                  _loc4_.MP = _loc18_ + _loc19_ + _loc20_;
               }
               break;
            case 11:
               _loc15_[0].push({id:_loc17_,o:3,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconEarthBonus"});
               _loc4_.Force = _loc18_;
               _loc4_.ForceXtra = _loc19_ + _loc20_;
               break;
            case 12:
               _loc15_[0].push({id:_loc17_,o:1,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconVita"});
               _loc4_.Vitality = _loc18_;
               _loc4_.VitalityXtra = _loc19_ + _loc20_;
               break;
            case 13:
               _loc15_[0].push({id:_loc17_,o:2,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconWisdom"});
               _loc4_.Wisdom = _loc18_;
               _loc4_.WisdomXtra = _loc19_ + _loc20_;
               break;
            case 14:
               _loc15_[0].push({id:_loc17_,o:5,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconWaterBonus"});
               _loc4_.Chance = _loc18_;
               _loc4_.ChanceXtra = _loc19_ + _loc20_;
               break;
            case 15:
               _loc15_[0].push({id:_loc17_,o:6,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconAirBonus"});
               _loc4_.Agility = _loc18_;
               _loc4_.AgilityXtra = _loc19_ + _loc20_;
               _loc4_.AgilityTotal = _loc18_ + _loc19_ + _loc20_ + _loc21_;
               break;
            case 16:
               _loc15_[0].push({id:_loc17_,o:4,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconFireBonus"});
               _loc4_.Intelligence = _loc18_;
               _loc4_.IntelligenceXtra = _loc19_ + _loc20_;
               break;
            case 17:
               _loc15_[0].push({id:_loc17_,o:9,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               _loc4_.RangeModerator = _loc18_ + _loc19_ + _loc20_;
               break;
            case 18:
               _loc15_[0].push({id:_loc17_,o:10,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               _loc4_.MaxSummonedCreatures = _loc18_ + _loc19_ + _loc20_;
               break;
            case 19:
               _loc15_[1].push({id:_loc17_,o:1,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               break;
            case 20:
               _loc15_[1].push({id:_loc17_,o:2,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               break;
            case 21:
               _loc15_[1].push({id:_loc17_,o:3,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               break;
            case 22:
               _loc15_[1].push({id:_loc17_,o:4,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               break;
            case 23:
               _loc15_[1].push({id:_loc17_,o:7,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               break;
            case 24:
               _loc15_[1].push({id:_loc17_,o:5,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               break;
            case 25:
               _loc15_[1].push({id:_loc17_,o:6,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               break;
            case 26:
               _loc15_[1].push({id:_loc17_,o:8,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               break;
            case 27:
               _loc15_[1].push({id:_loc17_,o:9,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               _loc4_.CriticalHitBonus = _loc18_ + _loc19_ + _loc20_ + _loc21_;
               break;
            case 28:
               _loc15_[1].push({id:_loc17_,o:10,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_});
               break;
            case 29:
               _loc15_[1].push({id:_loc17_,o:11,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"Star"});
               break;
            case 30:
               _loc15_[1].push({id:_loc17_,o:12,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconMP"});
               break;
            case 31:
               _loc15_[2].push({id:_loc17_,o:1,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconNeutral"});
               break;
            case 32:
               _loc15_[2].push({id:_loc17_,o:2,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconNeutral"});
               break;
            case 33:
               _loc15_[3].push({id:_loc17_,o:11,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconNeutral"});
               break;
            case 34:
               _loc15_[3].push({id:_loc17_,o:12,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconNeutral"});
               break;
            case 35:
               _loc15_[2].push({id:_loc17_,o:3,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconEarth"});
               break;
            case 36:
               _loc15_[2].push({id:_loc17_,o:4,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconEarth"});
               break;
            case 37:
               _loc15_[3].push({id:_loc17_,o:13,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconEarth"});
               break;
            case 38:
               _loc15_[3].push({id:_loc17_,o:14,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconEarth"});
               break;
            case 39:
               _loc15_[2].push({id:_loc17_,o:7,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconWater"});
               break;
            case 40:
               _loc15_[2].push({id:_loc17_,o:8,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconWater"});
               break;
            case 41:
               _loc15_[3].push({id:_loc17_,o:17,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconWater"});
               break;
            case 42:
               _loc15_[3].push({id:_loc17_,o:18,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconWater"});
               break;
            case 43:
               _loc15_[2].push({id:_loc17_,o:9,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconAir"});
               break;
            case 44:
               _loc15_[2].push({id:_loc17_,o:10,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconAir"});
               break;
            case 45:
               _loc15_[3].push({id:_loc17_,o:19,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconAir"});
               break;
            case 46:
               _loc15_[3].push({id:_loc17_,o:20,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconAir"});
               break;
            case 47:
               _loc15_[2].push({id:_loc17_,o:5,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconFire"});
               break;
            case 48:
               _loc15_[2].push({id:_loc17_,o:6,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconFire"});
               break;
            case 49:
               _loc15_[3].push({id:_loc17_,o:15,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconFire"});
               break;
            case 50:
               _loc15_[3].push({id:_loc17_,o:16,s:_loc18_,i:_loc19_,d:_loc20_,b:_loc21_,p:"IconFire"});
               break;
            default:
               continue;
         }
      }
      _loc4_.FullStats = _loc15_;
      this.api.network.Basics.getDate();
   }
   function onNewLevel(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("NEW_LEVEL",[_loc3_]),"ERROR_BOX",{name:"NewLevel"});
      this.api.datacenter.Player.Level = _loc3_;
      this.api.datacenter.Player.data.Level = _loc3_;
      this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_GAIN_LEVEL);
   }
   function onRestrictions(§\x1e\x12\r§)
   {
      this.api.datacenter.Player.restrictions = _global.parseInt(_loc2_,36);
   }
   function onGiftsList(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = Number(_loc3_[1]);
      var _loc6_ = _loc3_[2];
      var _loc7_ = _loc3_[3];
      var _loc8_ = _loc3_[4];
      var _loc9_ = _loc3_[5];
      var _loc10_ = new LoadVars();
      _loc10_.decode("&text=" + _loc6_);
      var _loc11_ = _loc10_.text;
      _loc10_ = new LoadVars();
      _loc10_.decode("&desc=" + _loc7_);
      var _loc12_ = _loc10_.desc;
      _loc10_ = new LoadVars();
      _loc10_.decode("&gfxurl=" + _loc8_);
      var _loc13_ = _loc10_.gfxurl;
      var _loc14_ = new Array();
      var _loc15_ = _loc9_.split(";");
      var _loc16_ = 0;
      while(_loc16_ < _loc15_.length)
      {
         if(_loc15_[_loc16_] != "")
         {
            var _loc17_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc15_[_loc16_]);
            _loc14_.push(_loc17_);
         }
         _loc16_ = _loc16_ + 1;
      }
      var _loc18_ = new Object();
      _loc18_.type = _loc4_;
      _loc18_.id = _loc5_;
      _loc18_.title = _loc11_;
      _loc18_.desc = _loc12_;
      _loc18_.gfxUrl = _loc13_;
      _loc18_.items = _loc14_;
      this.api.datacenter.Basics.aks_gifts_stack.push(_loc18_);
   }
   function onGiftStored(§\x14\x16§)
   {
      this.api.ui.unloadUIComponent("WaitingMessage");
      this.api.ui.getUIComponent("Gifts").checkNextGift();
   }
   function onQueue(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      if(_loc3_ > 1)
      {
         this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:this.api.lang.getText("CONNECTING") + " ( " + this.api.lang.getText("WAIT_QUEUE_POSITION",[_loc3_]) + " )"},{bAlwaysOnTop:true,bForceLoad:true});
      }
   }
   function onNewQueue(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = Number(_loc3_[1]);
      var _loc6_ = Number(_loc3_[2]);
      switch(_loc3_[3])
      {
         case "0":
            var _loc7_ = false;
            break;
         case "1":
            _loc7_ = true;
      }
      var _loc8_ = Number(_loc3_[4]);
      if(_loc4_ > 1)
      {
         this.api.ui.loadUIComponent("WaitingQueue","WaitingQueue",{queueInfos:{position:_loc4_,totalAbo:_loc5_,totalNonAbo:_loc6_,subscriber:_loc7_,queueId:_loc8_}},{bAlwaysOnTop:true,bForceLoad:true});
      }
   }
   function onCharacterNameGenerated(§\x14\x16§, §\x1e\x13\x1b§)
   {
      if(_loc2_)
      {
         if(this.api.ui.getUIComponent("CreateCharacter"))
         {
            this.api.ui.getUIComponent("CreateCharacter").characterName = _loc3_;
         }
         if(this.api.ui.getUIComponent("CharactersMigration"))
         {
            this.api.ui.getUIComponent("CharactersMigration").setNewName = _loc3_;
         }
         if(this.api.ui.getUIComponent("EditPlayer"))
         {
            this.api.ui.getUIComponent("EditPlayer").characterName = _loc3_;
         }
      }
      else
      {
         switch(_loc3_)
         {
            case "1":
               break;
            case "2":
               this.api.datacenter.Basics.aks_can_generate_names = false;
               if(this.api.ui.getUIComponent("CreateCharacter"))
               {
                  this.api.ui.getUIComponent("CreateCharacter").hideGenerateRandomName();
               }
               if(this.api.ui.getUIComponent("CharactersMigration"))
               {
                  this.api.ui.getUIComponent("CharactersMigration").hideGenerateRandomName();
                  break;
               }
         }
      }
   }
   function onCharactersMigrationAskConfirm(§\x1e\x13\x04§)
   {
      var _loc3_ = _loc2_.split(";");
      var _loc4_ = _global.parseInt(_loc3_[0],10);
      var _loc5_ = _loc3_[1];
      var _loc6_ = {name:"ConfirmMigration",params:{nCharacterID:_loc4_,sName:_loc5_},listener:this};
      this.api.kernel.showMessage(undefined,this.api.lang.getText("CONFIRM_MIGRATION",[_loc5_]),"CAUTION_YESNO",_loc6_);
   }
   function onFriendServerList(§\x1e\x13\x04§)
   {
      var _loc3_ = _loc2_.split(";");
      var _loc4_ = new Array();
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         var _loc6_ = _loc3_[_loc5_].split(",");
         _loc4_.push({server:_loc6_[0],count:_loc6_[1]});
         _loc5_ = _loc5_ + 1;
      }
      this.api.ui.getUIComponent("ServerList").setSearchResult(_loc4_);
   }
   function yes(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "AskYesNoSwitchToEnglish":
            this.api.config.language = "en";
            this.api.kernel.clearCache();
            break;
         case "AskYesNoConfirmMigration":
            this.validCharacterMigration(_loc2_.target.params.nCharacterID,_loc2_.target.params.sName);
      }
   }
   function no(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "AskYesNoSwitchToEnglish")
      {
         this.api.kernel.changeServer(true);
      }
   }
}
