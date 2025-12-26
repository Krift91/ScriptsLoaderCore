class dofus.§\x1e\t\x06§ extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _api;
   var _nPort;
   var _bDebug;
   var _xSocket;
   var _bConnected;
   static var TCP_DEFAULT_PORT = -1;
   static var LOGIN_TOKEN_NAME = "#Z";
   static var TOKEN_LENGTH = 32;
   static var TCP_HOST = "127.0.0.1";
   static var HAAPI_GAME_ID = 101;
   static var ENABLED = true;
   static var instance = null;
   var _gameSessionToken = null;
   var _authToken = null;
   function §\x1e\t\x06§(bDebug)
   {
      super();
      this._api = _global.API;
      this._nPort = _global.CONFIG.zaapConnectPort;
      this._bDebug = dofus.Constants.DEBUG;
      this._xSocket = new XMLSocket();
      var ref = this;
      this._xSocket.onConnect = function(§\x14\x16§)
      {
         ref.setConnected(_loc2_);
         ref.onConnect(_loc2_);
      };
      this._xSocket.onData = function(§\x1e\x13\x04§)
      {
         ref.onData(_loc2_);
      };
      this._xSocket.onClose = function(§\x1e\x13\x04§)
      {
         ref.setConnected(false);
      };
      this.connect();
   }
   static function newInstance()
   {
      if(!dofus["\x1e\t\x06"].isEnabled())
      {
         return null;
      }
      if(dofus["\x1e\t\x06"].instance != null)
      {
         delete dofus["\x1e\t\x06"].instance;
      }
      dofus["\x1e\t\x06"].instance = new dofus["\x1e\t\x06"]();
      return dofus["\x1e\t\x06"].instance;
   }
   static function getInstance()
   {
      return dofus["\x1e\t\x06"].instance;
   }
   static function isEnabled()
   {
      return dofus["\x1e\t\x06"].ENABLED && (_global.CONFIG.zaapConnectPort != undefined && _global.CONFIG.zaapConnectPort > 0);
   }
   function renewAuthKey()
   {
      if(this.isConnected() && this.getSessionToken() != undefined)
      {
         this.askAuthToken();
      }
      else
      {
         this.connect();
      }
   }
   function getSessionToken()
   {
      return this._gameSessionToken;
   }
   function consumeAuthToken()
   {
      var _loc2_ = this._authToken;
      if(_loc2_ == undefined)
      {
         return null;
      }
      delete this._authToken;
      return _loc2_;
   }
   function isDebug()
   {
      return this._bDebug;
   }
   function isConnected()
   {
      return this._bConnected;
   }
   function setConnected(§\x1b\f§)
   {
      this._bConnected = _loc2_;
   }
   function debugLog(§\x1e\x10\x02§)
   {
      if(!this.isDebug() || _loc2_ == null)
      {
         return undefined;
      }
      _loc2_ = "[ZaapConnect] " + _loc2_;
      this.api.kernel.showMessage(undefined,_loc2_,"DEBUG_LOG");
      this.api.electron.log(_loc2_);
   }
   function processRequest(§\x1e\f\x07§, §\x17§)
   {
      switch(_loc2_)
      {
         case "connect":
            this._gameSessionToken = _loc3_[0];
            this.refreshUiLogin();
            this.debugLog("New Session Token : " + this.getSessionToken());
            this.askAuthToken();
            break;
         case "auth_getGameToken":
            this._authToken = _loc3_[0];
            this.debugLog("New Auth Token : " + this._authToken);
            this.doAutoLogin();
            break;
         case "ignored":
            this.debugLog("Zaap is ignoring your client");
            this.disable();
      }
   }
   function connect()
   {
      this.debugLog("Connection to local port " + this._nPort);
      this._xSocket.connect(dofus["\x1e\t\x06"].TCP_HOST,this._nPort);
   }
   function disconnect()
   {
      this._gameSessionToken = "";
      this._authToken = "";
      this._xSocket.close();
   }
   function disable()
   {
      this.disconnect();
      this.debugLog("Now disabled until client restart");
      dofus["\x1e\t\x06"].ENABLED = false;
      this.refreshUiLogin();
   }
   function refreshUiLogin()
   {
      var _loc2_ = dofus["\r\x14"].gapi.ui.Login(this.api.ui.getUIComponent("Login"));
      if(_loc2_ != undefined)
      {
         _loc2_.refreshAutoLoginUi();
      }
   }
   function send(§\x1e\x13\x04§)
   {
      this.debugLog("--&gt; " + _loc2_);
      this._xSocket.send(_loc2_);
   }
   function onData(§\x1e\x13\x04§)
   {
      this.debugLog("&lt;-- " + _loc2_);
      var _loc3_ = _loc2_.split(" ");
      var _loc4_ = new Array();
      var _loc5_ = _loc3_[0];
      var _loc6_ = 1;
      while(_loc6_ < _loc3_.length)
      {
         _loc4_.push(_loc3_[_loc6_]);
         _loc6_ = _loc6_ + 1;
      }
      this.processRequest(_loc5_,_loc4_);
   }
   function onConnect(§\x14\x16§)
   {
      if(!_loc2_)
      {
         this.debugLog("Could not connect to the launcher");
         this.disable();
         return undefined;
      }
      this.debugLog("Connected to the zaap");
      this.askSessionToken();
   }
   function askSessionToken()
   {
      this.debugLog("Asking session token...");
      this.send("connect retro main -1 -1");
   }
   function askAuthToken()
   {
      this.debugLog("Asking auth token...");
      this.send("auth_getGameToken " + this.getSessionToken() + " " + dofus["\x1e\t\x06"].HAAPI_GAME_ID);
   }
   function doAutoLogin()
   {
      if(this._authToken == undefined || this._authToken.length != dofus["\x1e\t\x06"].TOKEN_LENGTH)
      {
         this.debugLog("Invalid auth token");
         this.disable();
         return undefined;
      }
      if(this.api.network.isConnected)
      {
         this.debugLog("Already connected to the login server");
         return undefined;
      }
      var _loc2_ = dofus["\r\x14"].gapi.ui.Login(this.api.ui.getUIComponent("Login"));
      if(_loc2_ == undefined)
      {
         this.debugLog("UI Login not found");
         return undefined;
      }
      if(!_loc2_.isLoaded())
      {
         this.debugLog("UI Login is not fully loaded, can\'t auto login now");
         return undefined;
      }
      this.debugLog("Let\'s login automatically...");
      _loc2_.zaapAutoLogin(true);
   }
}
