class dofus.§\x1e\n\x07§.§\x0b\x1c§ extends ank.§\x1e\n\x07§.§\x1e\x15\x11§
{
   var _aServers;
   var _sFile;
   var _mc;
   var _urlIndex;
   var _sSharedObjectName;
   var _sFileName;
   var _sLang;
   var _bUseMultiSO;
   var _mcl;
   var _progressTimer;
   var _timerID;
   var broadcastMessage;
   var _so;
   var _aData;
   var _nStart;
   var _nStep;
   function §\x0b\x1c§()
   {
      super();
      AsBroadcaster.initialize(this);
   }
   function load(§\x1d\r§, §\x1e\x12\x0b§, §\n\x1d§, §\x1e\r\x15§, §\x1e\x12\n§, §\x1e\x10\x18§, §\x14\x01§)
   {
      this._aServers = _loc2_;
      this._sFile = _loc3_;
      this._mc = _loc4_;
      this._urlIndex = -1;
      this._sSharedObjectName = _loc5_;
      this._sFileName = _loc6_;
      this._sLang = _loc7_;
      this._bUseMultiSO = _loc8_;
      this.loadWithNextURL();
   }
   function loadWithNextURL()
   {
      this._urlIndex++;
      if(this._urlIndex < this._aServers.length && this._aServers.length > 0)
      {
         var _loc2_ = this._aServers[this._urlIndex].url;
         var _loc3_ = _loc2_ + this._sFile;
         System.security.allowDomain(_loc2_);
         this._mcl = new MovieClipLoader();
         this._mcl.addListener(this);
         this._progressTimer = _global.setInterval(this.onTimedProgress,1000);
         this._timerID = _global.setInterval(this.onEventNotCall,5000);
         this._mcl.loadClip(_loc3_,this._mc);
      }
      else
      {
         this.broadcastMessage("onAllLoadFailed",this._mc);
      }
   }
   function getCurrentServer()
   {
      return this._aServers[this._urlIndex];
   }
   function onEventNotCall(§\n\x1d§)
   {
      _global.clearInterval(this._timerID);
      this.onLoadError(_loc2_,"unknown",-1);
   }
   function onLoadStart(§\n\x1d§)
   {
      _global.clearInterval(this._timerID);
      this.broadcastMessage("onLoadStart",_loc2_,this.getCurrentServer());
   }
   function onLoadError(§\n\x1d§, §\x0f\x06§, §\r\x03§)
   {
      _global.clearInterval(this._timerID);
      _global.clearInterval(this._progressTimer);
      this.broadcastMessage("onLoadError",_loc2_,_loc3_,_loc4_,this.getCurrentServer());
      this.loadWithNextURL();
   }
   function onTimedProgress()
   {
      var _loc2_ = this._mcl.getProgress(this._mc);
      this.broadcastMessage("onLoadProgress",this._mc,_loc2_.bytesLoaded,_loc2_.bytesTotal,this.getCurrentServer());
   }
   function onLoadComplete(§\n\x1d§, §\r\x03§)
   {
      _global.clearInterval(this._timerID);
      _global.clearInterval(this._progressTimer);
      this.broadcastMessage("onLoadComplete",_loc2_,_loc3_,this.getCurrentServer());
   }
   function onLoadInit(§\n\x1d§)
   {
      _global.clearInterval(this._timerID);
      _global.clearInterval(this._progressTimer);
      this._so = ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(this._sSharedObjectName);
      if(_loc2_.FILE_BEGIN != true && _loc2_.FILE_END != true)
      {
         this.broadcastMessage("onCorruptFile",_loc2_,_loc2_.getBytesTotal(),this.getCurrentServer());
         this.loadWithNextURL();
         return undefined;
      }
      if(this._so.data.VERSIONS == undefined)
      {
         this._so.data.VERSIONS = new Object();
      }
      this._so.data.VERSIONS[this._sFileName] = _loc2_.VERSION;
      if(this._so.data.WEIGHTS == undefined)
      {
         this._so.data.WEIGHTS = new Object();
      }
      this._so.data.WEIGHTS[this._sFileName.toUpperCase()] = _loc2_.getBytesTotal();
      this._aData = new Array();
      for(var k in _loc2_)
      {
         if(!(k == "VERSION" || (k == "FILE_BEGIN" || k == "FILE_END")))
         {
            this._aData.push({key:k,value:_loc2_[k]});
            delete _loc2_[k];
         }
      }
      this._so.data.LANGUAGE = this._sLang;
      if(this._so.flush(1000000000) == false)
      {
         this.broadcastMessage("onCantWrite",_loc2_);
         return undefined;
      }
      this._nStart = 0;
      if(this._bUseMultiSO)
      {
         this._nStep = 1;
      }
      else
      {
         this._nStep = 10000000;
      }
      this.addToQueue({object:this,method:this.processFile});
   }
   function processFile()
   {
      var _loc2_ = this._nStart;
      while(_loc2_ < this._nStart + this._nStep)
      {
         if(!this._aData[_loc2_])
         {
            break;
         }
         if(this._bUseMultiSO)
         {
            this._so = ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(this._sSharedObjectName + "_" + this._aData[_loc2_].key);
         }
         this._so.data[this._aData[_loc2_].key] = this._aData[_loc2_].value;
         delete this._aData[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      this._nStart += this._nStep;
      if(this._so.flush(1000000000) == false)
      {
         this.broadcastMessage("onCantWrite",this._mc);
         return undefined;
      }
      if(this._nStart >= this._aData.length)
      {
         this.processFileEnd();
      }
      else
      {
         this.addToQueue({object:this,method:this.processFile});
      }
   }
   function processFileEnd()
   {
      delete this._so;
      this.broadcastMessage("onLoadInit",this._mc,this.getCurrentServer());
   }
}
