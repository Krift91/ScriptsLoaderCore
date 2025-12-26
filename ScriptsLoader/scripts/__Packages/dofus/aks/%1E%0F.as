class dofus.aks.§\x1e\x0f§ extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var Basics;
   var Account;
   var Friends;
   var Enemies;
   var Chat;
   var Dialog;
   var Exchange;
   var Game;
   var GameActions;
   var Houses;
   var Infos;
   var Items;
   var Job;
   var Key;
   var Spells;
   var Storages;
   var Emotes;
   var Documents;
   var Guild;
   var Waypoints;
   var Subareas;
   var Specialization;
   var Fights;
   var Tutorial;
   var Quests;
   var Party;
   var Subway;
   var Mount;
   var Conquest;
   var Ping;
   var Lag;
   var Deco;
   var _bLag;
   var _bAutoReco;
   var _oDataProcessor;
   var _xSocket;
   var _aLastPings;
   var _oLoader;
   var _sDebug;
   var _isWaitingForData;
   var _nLastWaitingSend;
   var _nCurrentKey;
   var _aKeys;
   var _aDisconnectionUrl;
   var _sDisconnectionParams;
   static var EVALUATE_AVERAGE_PING_ON_COMMANDS = 50;
   var _bConnected = false;
   var _bConnecting = false;
   static var HEX_CHARS = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];
   static var CURRENT_IDENTITY_VERSION = 2;
   function §\x1e\x0f§(oAPI)
   {
      super();
      this.initialize(oAPI);
   }
   function get isConnected()
   {
      return this._bConnected;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      this.Basics = new dofus.aks.Basics(this,oAPI);
      this.Account = new dofus.aks.Account(this,oAPI);
      this.Friends = new dofus.aks.Friends(this,oAPI);
      this.Enemies = new dofus.aks.Enemies(this,oAPI);
      this.Chat = new dofus.aks.Chat(this,oAPI);
      this.Dialog = new dofus.aks.Dialog(this,oAPI);
      this.Exchange = new dofus.aks.Exchange(this,oAPI);
      this.Game = new dofus.aks.Game(this,oAPI);
      this.GameActions = new dofus.aks.GameActions(this,oAPI);
      this.Houses = new dofus.aks.Houses(this,oAPI);
      this.Infos = new dofus.aks.Infos(this,oAPI);
      this.Items = new dofus.aks.Items(this,oAPI);
      this.Job = new dofus.aks.Job(this,oAPI);
      this.Key = new dofus.aks.Key(this,oAPI);
      this.Spells = new dofus.aks.Spells(this,oAPI);
      this.Storages = new dofus.aks.Storages(this,oAPI);
      this.Emotes = new dofus.aks.Emotes(this,oAPI);
      this.Documents = new dofus.aks.Documents(this,oAPI);
      this.Guild = new dofus.aks.Guild(this,oAPI);
      this.Waypoints = new dofus.aks.Waypoints(this,oAPI);
      this.Subareas = new dofus.aks.Subareas(this,oAPI);
      this.Specialization = new dofus.aks.Specialization(this,oAPI);
      this.Fights = new dofus.aks.Fights(this,oAPI);
      this.Tutorial = new dofus.aks.Tutorial(this,oAPI);
      this.Quests = new dofus.aks.Quests(this,oAPI);
      this.Party = new dofus.aks.Party(this,oAPI);
      this.Subway = new dofus.aks.Subway(this,oAPI);
      this.Mount = new dofus.aks.Mount(this,oAPI);
      this.Conquest = new dofus.aks.Conquest(this,oAPI);
      this.Ping = new Object();
      this.Lag = new Object();
      this.Deco = new Object();
      this._bLag = false;
      this._bAutoReco = this.api.lang.getConfigText("AUTO_RECONNECT") == true;
      this._oDataProcessor = new dofus.aks["\x11\f"](this,oAPI);
      this._xSocket = new XMLSocket();
      this._aLastPings = new Array();
      var aks = this;
      this._xSocket.onClose = function()
      {
         aks.onClose();
         aks.resetKeys();
      };
      this._xSocket.onConnect = function(§\x14\x16§)
      {
         aks.onConnect(_loc2_);
      };
      this._xSocket.onData = function(§\x1e\x13\x04§)
      {
         aks.onData(_loc2_);
      };
      this._oLoader = new LoadVars();
      this._oLoader.onLoad = function(§\x1e\f\x01§)
      {
         aks.onLoad(_loc2_);
      };
   }
   function connect(§\x1e\x11\x10§, §\x01\x0b§, §\x15\x1c§)
   {
      if(_loc4_ == undefined)
      {
         _loc4_ = true;
      }
      if(this._bConnected)
      {
         return null;
      }
      if(this._bConnecting)
      {
         return null;
      }
      this.api.ui.loadUIComponent("Waiting","Waiting",undefined,{bStayIfPresent:true});
      if(_loc2_ == undefined)
      {
         _loc2_ = this.api.datacenter.Basics.serverHost;
      }
      else if(_loc4_)
      {
         this.api.datacenter.Basics.serverHost = _loc2_;
      }
      if(_loc3_ == undefined)
      {
         _loc3_ = this.api.datacenter.Basics.serverPort;
      }
      else if(_loc4_)
      {
         this.api.datacenter.Basics.serverPort = _loc3_;
      }
      this._bConnecting = true;
      this._aLastPings = new Array();
      var _loc5_ = this._xSocket.connect(_loc2_,_loc3_);
      return _loc5_;
   }
   function softDisconnect()
   {
      if(this._bConnected)
      {
         this._xSocket.close();
      }
      this.api.electron.updateWindowTitle();
      this.api.electron.setLoginDiscordActivity();
      this.resetKeys();
      this._bConnected = false;
   }
   function disconnect(§\x16\n§, §\x15\x05§, §\x16\t§)
   {
      this.softDisconnect();
      if(!_loc4_)
      {
         this.onClose(_loc2_,_loc3_,true);
      }
      else
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this.Deco,"disconnect",this,this.onClose,1000,[_loc2_,_loc3_,true]);
      }
   }
   function send(§\x1e\x13\x04§, §\x13\x17§, §\x1e\x0b\x17§, §\x17\x06§, §\x17\x0b§)
   {
      if(_loc5_ != true && _loc2_.length > dofus.Constants.MAX_MESSAGE_LENGTH)
      {
         _loc2_ = _loc2_.substring(0,dofus.Constants.MAX_MESSAGE_LENGTH - 1);
      }
      this.api.kernel.GameManager.signalActivity();
      if(_loc3_ || _loc3_ == undefined)
      {
         if(_loc4_ != undefined)
         {
            this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:_loc4_},{bAlwaysOnTop:true,bForceLoad:true});
         }
         this._sDebug = _loc2_;
         this.api.ui.loadUIComponent("Waiting","Waiting");
         this._isWaitingForData = true;
         if(this.api.datacenter.Basics.inGame && this._bAutoReco)
         {
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this.Lag,"lag",this,this.onLag,Number(this.api.lang.getConfigText("DELAY_RECO_MESSAGE")));
         }
      }
      if(dofus.Constants.DEBUG_DATAS)
      {
         this.api.electron.debugRequest(true,_loc2_);
      }
      if(!_loc6_)
      {
         _loc2_ = this.prepareData(_loc2_);
      }
      if(_loc2_.charAt(_loc2_.length - 1) != "\n")
      {
         _loc2_ += "\n";
      }
      this._xSocket.send(_loc2_);
      if(_loc3_ || _loc3_ == undefined)
      {
         this._nLastWaitingSend = getTimer();
      }
      if(dofus.Constants.DEBUG_DATAS && dofus.Constants.DEBUG_ENCRYPTION)
      {
      }
   }
   function processCommand(§\x1e\x13\x19§)
   {
      this._oDataProcessor.process(_loc2_);
   }
   function startUsingKey(§\x03\x18§)
   {
      this._nCurrentKey = _loc2_;
   }
   function resetKeys()
   {
      this._nCurrentKey = 0;
      this._aKeys = new Array();
   }
   function unprepareData(§\x1e\x14\x1c§)
   {
      if(this._nCurrentKey == 0 || (this._nCurrentKey == undefined || _global.isNaN(this._nCurrentKey)))
      {
         return _loc2_;
      }
      var _loc3_ = this._aKeys[_global.parseInt(_loc2_.substr(0,1),16)];
      if(_loc3_ == undefined)
      {
         return _loc2_;
      }
      var _loc4_ = _loc2_.substr(1,1).toUpperCase();
      var _loc5_ = dofus.aks["\x1e\x0f"].decypherData(_loc2_.substr(2),_loc3_,_global.parseInt(_loc4_,16) * 2);
      if(dofus.aks["\x1e\x0f"].checksum(_loc5_) != _loc4_)
      {
         return _loc2_;
      }
      return _loc5_;
   }
   function prepareData(§\x1e\x14\x1c§)
   {
      if(this._nCurrentKey == 0 || (this._nCurrentKey == undefined || _global.isNaN(this._nCurrentKey)))
      {
         return _loc2_;
      }
      if(this._aKeys[this._nCurrentKey] == undefined)
      {
         return _loc2_;
      }
      var _loc3_ = dofus.aks["\x1e\x0f"].HEX_CHARS[this._nCurrentKey];
      var _loc4_ = dofus.aks["\x1e\x0f"].checksum(_loc2_);
      _loc3_ += _loc4_;
      return _loc3_ + dofus.aks["\x1e\x0f"].cypherData(_loc2_,this._aKeys[this._nCurrentKey],_global.parseInt(_loc4_,16) * 2);
   }
   static function prepareKey(§\x11\x10§)
   {
      var _loc3_ = new String();
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.length)
      {
         _loc3_ += String.fromCharCode(_global.parseInt(_loc2_.substr(_loc4_,2),16));
         _loc4_ += 2;
      }
      _loc3_ = _global.unescape(_loc3_);
      return _loc3_;
   }
   static function checksum(§\x1e\x14\x1c§)
   {
      var _loc3_ = 0;
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.length)
      {
         _loc3_ += _loc2_.charCodeAt(_loc4_) % 16;
         _loc4_ = _loc4_ + 1;
      }
      return dofus.aks["\x1e\x0f"].HEX_CHARS[_loc3_ % 16];
   }
   static function d2h(§\x11\x10§)
   {
      if(_loc2_ > 255)
      {
         _loc2_ = 255;
      }
      return dofus.aks["\x1e\x0f"].HEX_CHARS[Math.floor(_loc2_ / 16)] + dofus.aks["\x1e\x0f"].HEX_CHARS[_loc2_ % 16];
   }
   static function preEscape(§\x1e\x14\x1c§)
   {
      var _loc3_ = new String();
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.length)
      {
         var _loc5_ = _loc2_.charAt(_loc4_);
         var _loc6_ = _loc2_.charCodeAt(_loc4_);
         if(_loc6_ < 32 || (_loc6_ > 127 || (_loc5_ == "%" || _loc5_ == "+")))
         {
            _loc3_ += _global.escape(_loc5_);
         }
         else
         {
            _loc3_ += _loc5_;
         }
         _loc4_ = _loc4_ + 1;
      }
      return _loc3_;
   }
   static function cypherData(§\x11\x10§, §\f\x05§, §\x13\x0f§)
   {
      var _loc5_ = new String();
      var _loc6_ = _loc3_.length;
      _loc2_ = dofus.aks["\x1e\x0f"].preEscape(_loc2_);
      var _loc7_ = 0;
      while(_loc7_ < _loc2_.length)
      {
         _loc5_ += dofus.aks["\x1e\x0f"].d2h(_loc2_.charCodeAt(_loc7_) ^ _loc3_.charCodeAt((_loc7_ + _loc4_) % _loc6_));
         _loc7_ = _loc7_ + 1;
      }
      return _loc5_;
   }
   static function decypherData(§\x11\x10§, §\f\x05§, §\x13\x0f§)
   {
      var _loc5_ = new String();
      var _loc6_ = _loc3_.length;
      var _loc7_ = 0;
      var _loc8_ = 0;
      var _loc9_ = 0;
      while(_loc9_ < _loc2_.length)
      {
         _loc5_ += String.fromCharCode(_global.parseInt(_loc2_.substr(_loc9_,2),16) ^ _loc3_.charCodeAt((_loc7_++ + _loc4_) % _loc6_));
         _loc9_ += 2;
      }
      _loc5_ = _global.unescape(_loc5_);
      return _loc5_;
   }
   function addKeyToCollection(§\x03\x18§, §\x1e\x11\x03§)
   {
      if(this._aKeys == undefined)
      {
         this._aKeys = new Array();
      }
      this._aKeys[_loc2_] = dofus.aks["\x1e\x0f"].prepareKey(_loc3_);
   }
   function ping()
   {
      this.api.datacenter.Basics.lastPingTimer = getTimer();
      this.send("ping");
   }
   function quickPing()
   {
      this.send("qping");
   }
   function getAveragePing()
   {
      var _loc2_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < this._aLastPings.length)
      {
         _loc2_ += this._aLastPings[_loc3_];
         _loc3_ = _loc3_ + 1;
      }
      return Math.round(_loc2_ / this._aLastPings.length);
   }
   function getAveragePingPacketsCount()
   {
      return this._aLastPings.length;
   }
   function getAveragePingBufferSize()
   {
      return dofus.aks["\x1e\x0f"].EVALUATE_AVERAGE_PING_ON_COMMANDS;
   }
   function getRandomNetworkKey()
   {
      if(this.api.electron.enabled)
      {
         var _loc2_ = this.api.electron.getRandomNetworkKey();
      }
      else
      {
         _loc2_ = "";
         var _loc3_ = Math.round(Math.random() * 128) + 128;
         var _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ += this.getRandomChar();
            _loc4_ = _loc4_ + 1;
         }
      }
      var _loc5_ = dofus.aks["\x1e\x0f"].checksum(_loc2_) + _loc2_;
      return _loc5_ + dofus.aks["\x1e\x0f"].checksum(_loc5_);
   }
   function isValidNetworkKey(§\x1e\x11\x03§, §\x04\x0e§)
   {
      if(_loc3_ == undefined || _loc3_ != dofus.aks["\x1e\x0f"].CURRENT_IDENTITY_VERSION)
      {
         return false;
      }
      if(_loc2_ == undefined || (_loc2_.length == 0 || (_loc2_ == "" || (dofus.aks["\x1e\x0f"].checksum(_loc2_.substr(0,_loc2_.length - 1)) != _loc2_.substr(_loc2_.length - 1) || dofus.aks["\x1e\x0f"].checksum(_loc2_.substr(1,_loc2_.length - 2)) != _loc2_.substr(0,1)))))
      {
         return false;
      }
      return true;
   }
   function defaultProcessAction(§\x1e\f\x07§, §\x1e\x14\x19§, §\x1a\f§, §\x1e\x13\x04§)
   {
      this.api.network.send(String(_loc5_.substr(0,2) + dofus.aks["\x1e\x0f"].EVALUATE_AVERAGE_PING_ON_COMMANDS),false);
   }
   function getRandomChar()
   {
      var _loc2_ = Math.ceil(Math.random() * 100);
      if(_loc2_ <= 40)
      {
         return String.fromCharCode(Math.floor(Math.random() * 26) + 65);
      }
      if(_loc2_ <= 80)
      {
         return String.fromCharCode(Math.floor(Math.random() * 26) + 97);
      }
      return String.fromCharCode(Math.floor(Math.random() * 10) + 48);
   }
   function onLag()
   {
      this._bLag = true;
      this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:this.api.lang.getText("WAIT_FOR_SERVER")},{bAlwaysOnTop:true,bForceLoad:true});
      if(this._bAutoReco)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this.Deco,"deco",this,this.onDeco,Number(this.api.lang.getConfigText("DELAY_RECO_START")));
      }
   }
   function onDeco()
   {
      if(this._bConnected)
      {
         this.resetKeys();
         this._xSocket.close();
         this._bConnected = false;
      }
      this.onClose(true,false,false);
   }
   function onConnect(§\x14\x16§)
   {
      this._bConnecting = false;
      if(!_loc2_)
      {
         if(this.api.datacenter.Basics.aks_rescue_count > 0)
         {
            this.api.datacenter.Basics.aks_rescue_count--;
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"connect",this,this.connect,_global.CONFIG.rdelay,[this.api.datacenter.Basics.aks_gameserver_ip,this.api.datacenter.Basics.aks_gameserver_port,false]);
            this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:this.api.lang.getText("TRYING_TO_RECONNECT",[this.api.datacenter.Basics.aks_rescue_count])},{bAlwaysOnTop:true,bForceLoad:true});
            return undefined;
         }
         if(this.api.datacenter.Basics.aks_rescue_count == 0)
         {
            this.onClose(false,true);
            return undefined;
         }
         if(this.api.ui.getUIComponent("Login") && (this.api.datacenter.Basics.aks_connection_server && this.api.datacenter.Basics.aks_connection_server.length))
         {
            var _loc3_ = String(this.api.datacenter.Basics.aks_connection_server.shift());
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"connect",this,this.connect,_global.CONFIG.rdelay,[_loc3_,this.api.datacenter.Basics.aks_connection_server_port,false]);
            return undefined;
         }
         this.api.ui.unloadUIComponent("Waiting");
         this.api.ui.unloadUIComponent("WaitingMessage");
         this.api.ui.unloadUIComponent("ChooseCharacter");
         this.api.kernel.manualLogon();
         this.api.kernel.showMessage(this.api.lang.getText("CONNECTION"),this.api.lang.getText("CANT_CONNECT"),"ERROR_BOX",{name:"OnConnect"});
         this.softDisconnect();
      }
      else
      {
         this.api.ui.unloadUIComponent("Waiting");
         this.api.ui.unloadUIComponent("WaitingMessage");
         if(!this.api.datacenter.Basics.isLogged)
         {
            this.api.ui.loadUIComponent("MainMenu","MainMenu",{quitMode:(!(System.capabilities.playerType == "PlugIn" && !this.api.electron.enabled) ? "quit" : "no")},{bStayIfPresent:true,bAlwaysOnTop:true});
         }
         this._bConnected = true;
      }
   }
   function onData(§\x1e\x13\x04§)
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.Lag,"lag");
      if(this._bLag)
      {
         dofus["\x1e\n\x07"]["\x1d\x1b"].getInstance().ui.unloadUIComponent("WaitingMessage");
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.Deco,"deco");
         this._bLag = false;
      }
      if(dofus.Constants.DEBUG_DATAS && dofus.Constants.DEBUG_ENCRYPTION)
      {
      }
      _loc2_ = this.unprepareData(_loc2_);
      if(dofus.Constants.DEBUG_DATAS)
      {
         this.api.electron.debugRequest(false,_loc2_);
      }
      if(this._isWaitingForData)
      {
         this._isWaitingForData = false;
         this.api.ui.unloadUIComponent("Waiting");
         var _loc3_ = getTimer() - this._nLastWaitingSend;
         if(_loc3_ > 100)
         {
         }
         this._aLastPings.push(_loc3_);
         if(this._aLastPings.length > dofus.aks["\x1e\x0f"].EVALUATE_AVERAGE_PING_ON_COMMANDS)
         {
            this._aLastPings.shift();
         }
      }
      this._oDataProcessor.process(_loc2_);
   }
   function onLoad(§\x1e\f\x01§)
   {
      if(!_loc2_)
      {
         this.sendNextDisconnectionState();
      }
   }
   function sendNextDisconnectionState()
   {
      if(this._aDisconnectionUrl.length <= 0)
      {
         return undefined;
      }
      var _loc2_ = this._aDisconnectionUrl.shift() + this._sDisconnectionParams;
      this._oLoader.load(_loc2_);
   }
   function onClose(§\x16\n§, §\x15\x05§, §\x17\x18§)
   {
      if(_loc4_ == undefined)
      {
         _loc4_ = false;
      }
      if(!_loc4_ && (this.api.datacenter.Basics.aks_current_server != undefined && (!this.api.datacenter.Basics.aks_server_will_disconnect && this.api.lang.getConfigText("FORWARD_UNWANTED_DISCONNECTION"))))
      {
         this._aDisconnectionUrl = String(this.api.lang.getConfigText("FORWARD_UNWANTED_DISCONNECTION_URL")).split("|");
         this._sDisconnectionParams = new String();
         this._sDisconnectionParams += "?serverid=" + this.api.datacenter.Basics.aks_current_server;
         this._sDisconnectionParams += "&serverip=" + this.api.datacenter.Basics.aks_gameserver_ip;
         this._sDisconnectionParams += "&serverport=" + this.api.datacenter.Basics.aks_gameserver_port;
         this._sDisconnectionParams += "&login=" + this.api.datacenter.Basics.login;
         this.sendNextDisconnectionState();
      }
      this._bConnecting = false;
      this._bConnected = false;
      if(this.api.datacenter.Basics.aks_current_server != undefined && (this.api.datacenter.Basics.aks_rescue_count == -1 && (!_loc4_ && (this.api.lang.getConfigText("AUTO_RECONNECT") && !this.api.datacenter.Basics.aks_server_will_disconnect))))
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.Deco,"deco");
         this.api.datacenter.Basics.aks_rescue_count = _global.CONFIG.rcount;
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"connect",this,this.connect,_global.CONFIG.rdelay,[this.api.datacenter.Basics.aks_gameserver_ip,this.api.datacenter.Basics.aks_gameserver_port,false]);
         this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:this.api.lang.getText("TRYING_TO_RECONNECT",[this.api.datacenter.Basics.aks_rescue_count])},{bAlwaysOnTop:true,bForceLoad:true});
         return undefined;
      }
      if(_loc2_ == undefined)
      {
         _loc2_ = false;
      }
      if(_loc3_ == undefined)
      {
         _loc3_ = !this.api.datacenter.Basics.aks_server_will_disconnect;
      }
      if(!_loc2_ && dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST != undefined)
      {
         this.api.kernel.onFastServerSwitchFail();
      }
      if(this.api.datacenter.Basics.isLogged)
      {
         this.api.kernel.GameManager.zoomGfxRoot(100);
         this.api.ui.clear();
         if(this.api.ui.getUIComponent("Zoom") == undefined)
         {
            this.api.ui.loadUIComponent("Zoom","Zoom");
         }
         this.api.gfx.clear();
         this.api.kernel.TutorialManager.clear();
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].clear();
      }
      else
      {
         this.api.ui.unloadUIComponent("CenterText");
         this.api.ui.unloadUIComponent("ChooseNickName");
      }
      this.api.sounds.stopAllSounds();
      if(_loc2_)
      {
         var _loc5_ = this.api.datacenter.Player.zaapToken != null;
         if(_loc5_)
         {
            this.api.ui.setScreenSize(742,550);
            this.api.kernel.autoLogon();
         }
         else
         {
            this.connect();
         }
      }
      else if(this.api.datacenter.Basics.isLogged)
      {
         this.api.ui.setScreenSize(742,550);
         this.api.kernel.manualLogon();
         this.api.kernel.ChatManager.clear();
      }
      if(_loc3_)
      {
         var _loc6_ = this.api.lang.getText("DISCONNECT");
         if(this.api.datacenter.Basics.serverMessageID != -1)
         {
            _loc6_ += "\n\n" + this.api.lang.getText("SRV_MSG_" + this.api.datacenter.Basics.serverMessageID,this.api.datacenter.Basics.serverMessageParams);
            this.api.kernel.showMessage(this.api.lang.getText("CONNECTION"),_loc6_,"ERROR_BOX",{name:"OnClose"});
         }
         else if(this.api.lang.getConfigText("SIMPLE_AUTO_RECONNECT"))
         {
            _loc6_ += "\n\n" + this.api.lang.getText("ATTEMPT_RECONNECT");
            var _loc7_ = {name:"OnClose",listener:this,params:{login:this.api.datacenter.Player.login,pass:this.api.datacenter.Player.password}};
            this.api.kernel.showMessage(this.api.lang.getText("CONNECTION"),_loc6_,"CAUTION_YESNO",_loc7_);
         }
         else
         {
            this.api.kernel.showMessage(this.api.lang.getText("CONNECTION"),_loc6_,"ERROR_BOX",{name:"OnClose"});
         }
      }
      this.api.datacenter.clear();
   }
   function onHelloConnectionServer(§\x1e\x11\x03§)
   {
      this.api.datacenter.Basics.connexionKey = _loc2_;
      var _loc3_ = this.api.datacenter.Player.zaapToken != null;
      var _loc4_ = !_loc3_ ? this.api.datacenter.Player.password : this.api.datacenter.Player.zaapToken;
      this.Account.logon(this.api.datacenter.Player.login,_loc4_,_loc3_);
      this.api.network.Account.getQueuePosition();
   }
   function onHelloGameServer(§\x1e\x12\r§)
   {
      this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:this.api.lang.getText("CONNECTING")},{bAlwaysOnTop:true,bForceLoad:true});
      if(this.api.datacenter.Basics.aks_rescue_count == -1)
      {
         this.Account.sendTicket(this.api.datacenter.Basics.aks_ticket);
      }
      else
      {
         this.Account.rescue(this.api.datacenter.Basics.aks_ticket);
      }
      this.api.datacenter.Basics.aks_rescue_count = -1;
   }
   function onPong()
   {
      var _loc2_ = getTimer() - this.api.datacenter.Basics.lastPingTimer;
      this.api.kernel.showMessage(undefined,"Ping : " + _loc2_ + "ms",this.api.ui.getUIComponent("Debug") != undefined ? "DEBUG_LOG" : "INFO_CHAT");
   }
   function onQuickPong()
   {
   }
   function onServerMessage(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.charAt(0);
      switch(_loc3_)
      {
         case "0":
            var _loc4_ = _loc2_.substr(1).split("|");
            var _loc5_ = Number(_loc4_[0]);
            var _loc6_ = _loc4_[1].split(";");
            this.api.datacenter.Basics.serverMessageID = _loc5_;
            this.api.datacenter.Basics.serverMessageParams = _loc6_;
            break;
         case "1":
            var _loc7_ = _loc2_.substr(1).split("|");
            var _loc8_ = _loc7_[0];
            var _loc9_ = _loc7_[1].split(";");
            var _loc10_ = String(_loc7_[2]).length <= 0 ? undefined : _loc7_[2];
            switch(Number(_loc8_))
            {
               case 23:
                  var _loc11_ = Number(_loc9_[0]);
                  _loc9_[0] = this.api.lang.getSpellText(_loc11_).n;
                  break;
               default:
                  break;
               case 12:
                  this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("SRV_MSG_12"),"ERROR_CHAT");
                  this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("SRV_MSG_12") + "\n\n" + this.api.lang.getText("DO_U_RELEASE_NOW"),"CAUTION_YESNO",{name:_loc10_,listener:this});
                  return undefined;
            }
            this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("SRV_MSG_" + _loc8_,_loc9_),"ERROR_BOX",{name:_loc10_});
      }
   }
   function onBadVersion()
   {
      this.api.kernel.quit(false);
   }
   function onServerWillDisconnect()
   {
      this.api.datacenter.Basics.aks_server_will_disconnect = true;
   }
   function yes(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) !== "AskYesNoOnClose")
      {
         this.api.network.Game.freeMySoul();
      }
      else
      {
         var _loc3_ = dofus["\r\x14"].gapi.ui.Login(this.api.ui.getUIComponent("Login"));
         if(_loc3_ != undefined)
         {
            var _loc4_ = _loc2_.params.login;
            if(_loc4_ == dofus["\x1e\t\x06"].LOGIN_TOKEN_NAME)
            {
               _loc3_.zaapAutoLogin(false);
            }
            else
            {
               var _loc5_ = _loc2_.params.pass;
               _loc3_.autoLogin(_loc4_,_loc5_);
            }
         }
      }
   }
}
