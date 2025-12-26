class ank.gapi.controls.Loader extends ank.gapi.core.§\x1e\n\f§
{
   var _oParams;
   var _nBytesLoaded;
   var _nBytesTotal;
   var holder_mc;
   var _bLoaded;
   var _sFrame;
   var _sPrevURL;
   var _bInited;
   var _mvlLoader;
   var __width;
   var __height;
   var onRelease;
   var dispatchEvent;
   var onRollOut;
   var onRollOver;
   static var CLASS_NAME = "Loader";
   var _bEnabled = false;
   var _bAutoLoad = true;
   var _bScaleContent = false;
   var _bCenterContent = false;
   var _sURL = "";
   var _sURLFallback = "";
   var _bForceReload = false;
   function Loader()
   {
      super();
   }
   function set enabled(§\x1a\r§)
   {
      super.enabled = _loc3_;
   }
   function set scaleContent(§\x15\x19§)
   {
      this._bScaleContent = _loc2_;
   }
   function get scaleContent()
   {
      return this._bScaleContent;
   }
   function set autoLoad(§\x1c\x06§)
   {
      this._bAutoLoad = _loc2_;
   }
   function get autoLoad()
   {
      return this._bAutoLoad;
   }
   function set centerContent(§\x1b\x14§)
   {
      this._bCenterContent = _loc2_;
   }
   function get centerContent()
   {
      return this._bCenterContent;
   }
   function set contentParams(§\x1e\x18\x0b§)
   {
      this._oParams = _loc2_;
      if(this._oParams.frame)
      {
         this.frame = this._oParams.frame;
      }
   }
   function get contentParams()
   {
      return this._oParams;
   }
   function set contentPath(sURL)
   {
      this._sURL = sURL;
      if(this._bAutoLoad)
      {
         this.load();
      }
   }
   function get contentPath()
   {
      return this._sURL;
   }
   function set fallbackContentPath(§\x1e\x0b\x1a§)
   {
      this._sURLFallback = _loc2_;
   }
   function get fallbackContentPath()
   {
      return this._sURLFallback;
   }
   function set forceReload(§\x19\x1b§)
   {
      this._bForceReload = _loc2_;
   }
   function get forceReload()
   {
      return this._bForceReload;
   }
   function get bytesLoaded()
   {
      return this._nBytesLoaded;
   }
   function get bytesTotal()
   {
      return this._nBytesTotal;
   }
   function get percentLoaded()
   {
      var _loc2_ = Math.round(this.bytesLoaded / this.bytesTotal * 100);
      _loc2_ = !_global.isNaN(_loc2_) ? _loc2_ : 0;
      return _loc2_;
   }
   function get content()
   {
      return this.holder_mc.content_mc;
   }
   function set content(§\n\x18§)
   {
      this.holder_mc.content_mc = _loc2_;
   }
   function get holder()
   {
      return this.holder_mc;
   }
   function get loaded()
   {
      return this._bLoaded;
   }
   function set frame(§\x1e\x12\x03§)
   {
      this._sFrame = _loc2_;
      this.content.gotoAndStop(_loc2_);
      this.size();
   }
   function forceNextLoad()
   {
      delete this._sPrevURL;
   }
   function init()
   {
      super.init(false,ank.gapi.controls.Loader.CLASS_NAME);
      if(this._bScaleContent == undefined)
      {
         this._bScaleContent = true;
      }
      this._bInited = true;
      this._nBytesLoaded = 0;
      this._nBytesTotal = 0;
      this._bLoaded = false;
      this._mvlLoader = new MovieClipLoader();
      this._mvlLoader.addListener(this);
   }
   function createChildren()
   {
      this.createEmptyMovieClip("holder_mc",10);
      if(this._bAutoLoad && this._sURL != undefined)
      {
         this.load();
      }
   }
   function size()
   {
      super.size();
      if(this.holder_mc.content_mc != undefined)
      {
         if(this._sFrame != undefined && this._sFrame != "")
         {
            this.frame = this._sFrame;
         }
         if(this._bScaleContent)
         {
            var _loc3_ = this.holder_mc.content_mc._width;
            var _loc4_ = this.holder_mc.content_mc._height;
            var _loc5_ = _loc3_ / _loc4_;
            var _loc6_ = this.__width / this.__height;
            if(_loc5_ == _loc6_)
            {
               this.holder_mc._width = this.__width;
               this.holder_mc._height = this.__height;
            }
            else if(_loc5_ > _loc6_)
            {
               this.holder_mc._width = this.__width;
               this.holder_mc._height = this.__width / _loc5_;
            }
            else
            {
               this.holder_mc._width = this.__height * _loc5_;
               this.holder_mc._height = this.__height;
            }
            var _loc7_ = this.holder_mc.content_mc.getBounds();
            this.holder_mc.content_mc._x = - _loc7_.xMin;
            this.holder_mc.content_mc._y = - _loc7_.yMin;
            this.holder_mc._x = (this.__width - this.holder_mc._width) / 2;
            this.holder_mc._y = (this.__height - this.holder_mc._height) / 2;
         }
         if(this._bCenterContent)
         {
            this.holder_mc._x = this.__width / 2;
            this.holder_mc._y = this.__height / 2;
         }
      }
   }
   function setEnabled()
   {
      if(this._bEnabled)
      {
         this.onRelease = function()
         {
            this.dispatchEvent({type:"click"});
         };
         this.onRollOut = function()
         {
            this.dispatchEvent({type:"out"});
         };
         this.onRollOver = function()
         {
            this.dispatchEvent({type:"over"});
         };
      }
      else
      {
         delete this.onRelease;
         delete this.onRollOut;
         delete this.onRollOver;
      }
   }
   function load()
   {
      if(this._sPrevURL == undefined && this._sURL == "")
      {
         return undefined;
      }
      if(!this._bForceReload && (this._sPrevURL == this._sURL || this._sURL == undefined || this.holder_mc == undefined))
      {
         return undefined;
      }
      this._visible = false;
      this._bLoaded = false;
      this._sPrevURL = this._sURL;
      this.holder_mc.content_mc.removeMovieClip();
      if(this._sURL.toLowerCase().indexOf(".swf") != -1)
      {
         if(this.holder_mc.content_mc == undefined)
         {
            this.holder_mc.createEmptyMovieClip("content_mc",1);
         }
         this._mvlLoader.loadClip(this._sURL,this.holder_mc.content_mc);
      }
      else
      {
         this.holder_mc.attachMovie(this._sURL,"content_mc",1,this._oParams);
         this.onLoadComplete(this.holder_mc.content_mc);
         this.onLoadInit(this.holder_mc.content_mc);
      }
   }
   function onLoadError(§\n\x1d§)
   {
      if(this._sURLFallback != "")
      {
         this._sURL = this._sURLFallback;
         this._sURLFallback = "";
         this.load();
      }
      else
      {
         this.dispatchEvent({type:"error",target:this,clip:_loc2_});
      }
   }
   function onLoadProgress(§\n\x1d§, §\x18\x03§, §\x14\x15§)
   {
      this._nBytesLoaded = _loc3_;
      this._nBytesTotal = _loc4_;
      this.dispatchEvent({type:"progress",target:this,clip:_loc2_});
   }
   function onLoadComplete(§\n\x1d§)
   {
      this._bLoaded = true;
      this.dispatchEvent({type:"complete",clip:_loc2_});
   }
   function onLoadInit(§\n\x1d§)
   {
      this.size();
      this._visible = true;
      this.dispatchEvent({type:"initialization",clip:(!_loc2_.clip ? _loc2_ : _loc2_.clip)});
   }
}
