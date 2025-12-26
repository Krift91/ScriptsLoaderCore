class ank.external.ExternalConnector extends LocalConnection
{
   var _sConnectionName;
   var dispatchEvent;
   static var _oInstance;
   static var CONNECTION_NAME = "__ank.external.connector__";
   static var TIME_OUT = 1500;
   static var TIME_OUT_LAYER = "externalconnectortimeout";
   var _bInitializing = false;
   var _bInitialized = false;
   var _aCallQueue = new Array();
   var _bCalling = false;
   function ExternalConnector()
   {
      super();
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this._sConnectionName = ank.external.ExternalConnector.CONNECTION_NAME + new Date().getTime() + random(100000);
      this.connect(this._sConnectionName);
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"externalconnector",this,this.initialize,100);
   }
   static function getInstance()
   {
      if(ank.external.ExternalConnector._oInstance == undefined)
      {
         ank.external.ExternalConnector._oInstance = new ank.external.ExternalConnector();
      }
      return ank.external.ExternalConnector._oInstance;
   }
   function pushCall(§\x1e\x0f\x1b§)
   {
      this._aCallQueue.push({args:arguments});
      if(!this._bInitializing)
      {
         if(!this._bCalling)
         {
            this.processQueue();
         }
         else if(!this._bInitialized)
         {
            this.onUnknownMethod();
         }
      }
   }
   function call(§\x1e\x0f\x1b§)
   {
      this._bCalling = true;
      var _loc3_ = new Array();
      _loc3_.push(ank.external.ExternalConnector.CONNECTION_NAME);
      _loc3_.push(_loc2_);
      _loc3_.push(this._sConnectionName);
      var _loc4_ = 1;
      while(_loc4_ < arguments.length)
      {
         _loc3_.push(arguments[_loc4_]);
         _loc4_ = _loc4_ + 1;
      }
      this.send.apply(this,_loc3_);
   }
   function onStatus(§\x1e\x19\x04§)
   {
      this._bCalling = false;
      switch(_loc2_.level)
      {
         case "status":
            break;
         case "error":
            this.dispatchEvent({type:"onExternalConnectionFaild"});
      }
      if(this._bInitialized)
      {
         this.processQueue();
      }
   }
   function toString()
   {
      return "ExternalConnector" + " initialized:" + this._bInitialized + " calling:" + this._bCalling;
   }
   function initialize()
   {
      this._bInitializing = true;
      this.call("Initialize");
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,ank.external.ExternalConnector.TIME_OUT_LAYER,this,this.onInitializeFaild,ank.external.ExternalConnector.TIME_OUT);
   }
   function processQueue()
   {
      if(this._aCallQueue.length != 0)
      {
         var _loc2_ = this._aCallQueue.shift();
         if(!this._bInitialized)
         {
            this.dispatchEvent({type:"onExternalConnectionFaild"});
         }
         else
         {
            this.call.apply(this,_loc2_.args);
         }
      }
   }
   function onInitialize()
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,ank.external.ExternalConnector.TIME_OUT_LAYER);
      this._bInitializing = false;
      this._bInitialized = true;
      this.processQueue();
   }
   function onInitializeFaild()
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,ank.external.ExternalConnector.TIME_OUT_LAYER);
      this._bInitializing = false;
      this._bInitialized = false;
      this.dispatchEvent({type:"onExternalConnectionFaild"});
   }
   function onUnknownMethod()
   {
      this.dispatchEvent({type:"onExternalConnectionFaild"});
   }
   function onApplicationArgs(§\x1e\x14\x15§)
   {
      this.dispatchEvent({type:"onApplicationArgs",args:_loc2_.split(" ")});
   }
   function onBrowseFileCancel()
   {
      this.dispatchEvent({type:"onBrowseFileCancel"});
   }
   function onBrowseFileSelect(§\x1e\x17§)
   {
      this.dispatchEvent({type:"onBrowseFileSelect",files:_loc2_});
   }
   function onBrowseFileToSaveCancel()
   {
      this.dispatchEvent({type:"onBrowseFileToSaveCancel"});
   }
   function onBrowseFileToSaveSelect(§\x1e\x12\x0b§)
   {
      this.dispatchEvent({type:"onBrowseFileToSaveSelect",file:_loc2_});
   }
   function onHttpDownloadError(§\x1e\x0f\x17§, §\t\x11§)
   {
      this.dispatchEvent({type:"onHttpDownloadError",msg:_loc2_,params:_loc3_});
   }
   function onHttpDownloadProgress(§\x07\x1a§, §\x07\x19§)
   {
      this.dispatchEvent({type:"onHttpDownloadProgress",bl:_loc2_,bt:_loc3_});
   }
   function onHttpDownloadComplete()
   {
      this.dispatchEvent({type:"onHttpDownloadComplete"});
   }
   function onScreenResolutionError(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"onScreenResolutionError"});
   }
   function onScreenResolutionSuccess(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"onScreenResolutionSuccess"});
   }
}
