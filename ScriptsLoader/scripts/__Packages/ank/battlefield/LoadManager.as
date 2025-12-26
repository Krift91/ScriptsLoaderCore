class ank.battlefield.LoadManager extends MovieClip
{
   var _mcMainContainer;
   var dispatchEvent;
   static var _aMovieClipLoader;
   static var MAX_PARALLELE_LOAD = 3;
   static var STATE_WAITING = 0;
   static var STATE_LOADING = 1;
   static var STATE_LOADED = 2;
   static var STATE_ERROR = -1;
   static var STATE_UNKNOWN = -1;
   function LoadManager(§\n\x1d§)
   {
      super();
      this.initialize(_loc3_);
   }
   function processLoad()
   {
      var _loc2_ = 0;
      while(_loc2_ < ank.battlefield.LoadManager._aMovieClipLoader.length)
      {
         if(this.waitingRequest > ank.battlefield.LoadManager.MAX_PARALLELE_LOAD)
         {
            return undefined;
         }
         if(ank.battlefield.LoadManager._aMovieClipLoader[_loc2_].state == ank.battlefield.LoadManager.STATE_WAITING)
         {
            ank.battlefield.LoadManager._aMovieClipLoader[_loc2_].state = ank.battlefield.LoadManager.STATE_LOADING;
            ank.battlefield.LoadManager._aMovieClipLoader[_loc2_].loader.loadClip(ank.battlefield.LoadManager._aMovieClipLoader[_loc2_].file,ank.battlefield.LoadManager._aMovieClipLoader[_loc2_].container);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function getFileByMc(§\n\x1d§)
   {
      var _loc3_ = 0;
      while(_loc3_ < ank.battlefield.LoadManager._aMovieClipLoader.length)
      {
         if(ank.battlefield.LoadManager._aMovieClipLoader[_loc3_].container === _loc2_)
         {
            return ank.battlefield.LoadManager._aMovieClipLoader[_loc3_];
         }
         _loc3_ = _loc3_ + 1;
      }
      return undefined;
   }
   function getFileByName(§\x1e\x12\x0b§)
   {
      var _loc3_ = 0;
      while(_loc3_ < ank.battlefield.LoadManager._aMovieClipLoader.length)
      {
         if(ank.battlefield.LoadManager._aMovieClipLoader[_loc3_].file == _loc2_)
         {
            return ank.battlefield.LoadManager._aMovieClipLoader[_loc3_];
         }
         _loc3_ = _loc3_ + 1;
      }
      return undefined;
   }
   function initialize(§\n\x1d§)
   {
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      ank.battlefield.LoadManager._aMovieClipLoader = new Array();
      this._mcMainContainer = _loc2_;
   }
   function loadFile(§\x1e\x12\x0b§)
   {
      if(this.isRegister(_loc2_))
      {
         if(!this.isLoaded(_loc2_))
         {
            return undefined;
         }
         this.onFileLoaded(_loc2_);
      }
      else
      {
         var _loc3_ = new Object();
         _loc3_.file = _loc2_;
         _loc3_.bitLoaded = 0;
         _loc3_.bitTotal = 1;
         _loc3_.state = ank.battlefield.LoadManager.STATE_WAITING;
         _loc3_.loader = new MovieClipLoader();
         var _loc4_ = this;
         _loc3_.loader.addListener(_loc4_);
         _loc3_.container = this._mcMainContainer.createEmptyMovieClip(_loc2_.split("/").join("_").split(".").join("_"),this._mcMainContainer.getNextHighestDepth());
         ank.battlefield.LoadManager._aMovieClipLoader.push(_loc3_);
         if(this.waitingRequest > ank.battlefield.LoadManager.MAX_PARALLELE_LOAD)
         {
            return undefined;
         }
         _loc3_.state = ank.battlefield.LoadManager.STATE_LOADING;
         _loc3_.loader.loadClip(_loc2_,_loc3_.container);
      }
   }
   function loadFiles(§\x1e\x17§)
   {
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         this.loadFile(_loc2_[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
   }
   function get waitingRequest()
   {
      var _loc2_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < ank.battlefield.LoadManager._aMovieClipLoader.length)
      {
         if(ank.battlefield.LoadManager._aMovieClipLoader[_loc3_].state == ank.battlefield.LoadManager.STATE_LOADING)
         {
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
   function isRegister(§\x1e\x12\x0b§)
   {
      var _loc3_ = 0;
      while(_loc3_ < ank.battlefield.LoadManager._aMovieClipLoader.length)
      {
         if(_loc2_ == ank.battlefield.LoadManager._aMovieClipLoader[_loc3_].file)
         {
            return true;
         }
         _loc3_ = _loc3_ + 1;
      }
      return false;
   }
   function isLoaded(§\x1e\x12\x0b§)
   {
      if(!this.isRegister(_loc2_))
      {
         return false;
      }
      var _loc3_ = 0;
      while(_loc3_ < ank.battlefield.LoadManager._aMovieClipLoader.length)
      {
         if(_loc2_ == ank.battlefield.LoadManager._aMovieClipLoader[_loc3_].file)
         {
            return ank.battlefield.LoadManager._aMovieClipLoader[_loc3_].state == ank.battlefield.LoadManager.STATE_LOADED;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function areRegister(§\x1e\x17§)
   {
      true;
      var _loc3_ = _loc2_.length > 0;
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.length && _loc3_)
      {
         _loc3_ = _loc3_ && this.isRegister(_loc2_[_loc4_]);
         _loc4_ = _loc4_ + 1;
      }
      return _loc3_;
   }
   function areLoaded(§\x1e\x17§)
   {
      if(!this.areRegister(_loc2_))
      {
         return false;
      }
      true;
      var _loc3_ = _loc2_.length > 0;
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.length && _loc3_)
      {
         _loc3_ = _loc3_ && this.isLoaded(_loc2_[_loc4_]);
         _loc4_ = _loc4_ + 1;
      }
      return _loc3_;
   }
   function getFileState(§\x1e\x12\x0b§)
   {
      var _loc3_ = this.getFileByName(_loc2_);
      if(_loc3_)
      {
         return _loc3_.state;
      }
      return ank.battlefield.LoadManager.STATE_UNKNOWN;
   }
   function getProgression(§\x1e\x12\x0b§)
   {
      var _loc3_ = this.getFileByName(_loc2_);
      if(!_loc3_)
      {
         return undefined;
      }
      if(_loc3_.state == ank.battlefield.LoadManager.STATE_LOADED)
      {
         return 100;
      }
      return Math.floor(_loc3_.bitLoaded / _loc3_.bitTotal * 100);
   }
   function getProgressions(§\x1e\x17§)
   {
      var _loc3_ = 0;
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.length)
      {
         var _loc5_ = this.getProgression(_loc2_[_loc4_]);
         if(_loc5_ == undefined)
         {
            return undefined;
         }
         _loc3_ += _loc5_;
         _loc4_ = _loc4_ + 1;
      }
      return Math.floor(_loc3_ / _loc2_.length);
   }
   function onFileLoaded(§\x1e\x12\x0b§)
   {
      this.dispatchEvent({type:"onFileLoaded",value:_loc2_});
   }
   function onLoadError(§\n\x1d§)
   {
      var _loc3_ = this.getFileByMc(_loc2_);
      _loc3_.state = ank.battlefield.LoadManager.STATE_ERROR;
      delete _loc3_.loader;
      this.processLoad();
   }
   function onLoadInit(§\n\x1d§)
   {
      var _loc3_ = this.getFileByMc(_loc2_);
      _loc3_.state = ank.battlefield.LoadManager.STATE_LOADED;
      delete _loc3_.loader;
      this.onFileLoaded(_loc3_.file);
      this.processLoad();
   }
   function onLoadProgress(§\n\x1d§, §\b\x06§, §\x07\x1d§)
   {
      var _loc5_ = this.getFileByMc(_loc2_);
      if(!_loc5_)
      {
         return undefined;
      }
      _loc5_.bitLoaded = _loc3_;
      _loc5_.bitTotal = _loc4_;
   }
}
