class dofus.sounds.§\x1d\x03§ extends Sound implements com.ankamagames.§\f\x10§.§\f\x1a§
{
   var _nUniqID;
   var _mcLinkedClip;
   var _sFile;
   var _bStreaming;
   var _bLoading;
   var _bMute;
   var _nLoops;
   var _nOffset;
   var _nMaxLength;
   var _bLoaded;
   var _bStartWhenLoaded;
   var _nKillTimer;
   var baseVolume;
   static var INFINITE_LOOP = 999999;
   static var ONESHOT_SAMPLE = 1;
   static var UNLIMITED_LENGTH = 0;
   var _nVolumeBeforeMute = -1;
   function §\x1d\x03§(uniqID, §\x0e\t§, linkedClip, §\x1e\f\t§)
   {
      if(uniqID == undefined)
      {
         return;
      }
      if(_loc4_ == undefined)
      {
         return;
      }
      if(linkedClip == undefined)
      {
         return;
      }
      this._nUniqID = uniqID;
      this._mcLinkedClip = linkedClip;
      this._sFile = _loc4_;
      this._bStreaming = _loc6_ == undefined ? false : _loc6_;
      super(linkedClip);
      this._bLoading = true;
      if(dofus.Constants.USING_PACKED_SOUNDS)
      {
         super.attachSound(_loc4_.substr(3));
         this.onLoad(true);
      }
      else
      {
         super.loadSound(_loc4_,this._bStreaming);
      }
   }
   function get uniqID()
   {
      return this._nUniqID;
   }
   function get linkedClip()
   {
      return this._mcLinkedClip;
   }
   function get file()
   {
      return this._sFile;
   }
   function get streaming()
   {
      return this._bStreaming;
   }
   function get volume()
   {
      return super.getVolume();
   }
   function set volume(§\x1e\x1b\n§)
   {
      if(_loc3_ < 0 || _loc3_ > 100)
      {
         return;
      }
      if(!this._bMute && super.setVolume != undefined)
      {
         super.setVolume(_loc3_);
      }
      else if(super.setVolume != undefined)
      {
         super.setVolume(0);
         this._nVolumeBeforeMute = _loc3_;
      }
   }
   function get mute()
   {
      return this._bMute;
   }
   function set mute(§\x13\x1b§)
   {
      this._bMute = _loc3_;
      if(this._bMute && super.setVolume != undefined)
      {
         this._nVolumeBeforeMute = this.volume;
         super.setVolume(0);
      }
      else if(super.setVolume != undefined)
      {
         if(this._nVolumeBeforeMute > 0)
         {
            super.setVolume(this._nVolumeBeforeMute);
         }
      }
   }
   function get loops()
   {
      return this._nLoops;
   }
   function set loops(§\x1e\x1b\n§)
   {
      if(_loc2_ < dofus.sounds["\x1d\x03"].ONESHOT_SAMPLE || _loc2_ > dofus.sounds["\x1d\x03"].INFINITE_LOOP)
      {
         return;
      }
      this._nLoops = _loc2_;
   }
   function get offset()
   {
      return this._nOffset;
   }
   function set offset(§\x1e\x1b\n§)
   {
      if(_loc2_ < 0 || this._nMaxLength != null && _loc2_ > this._nMaxLength)
      {
         return;
      }
      this._nOffset = _loc2_;
   }
   function get maxLength()
   {
      return this._nMaxLength;
   }
   function set maxLength(§\x1e\x1b\n§)
   {
      if(_loc2_ < 0)
      {
         return;
      }
      this._nMaxLength = _loc2_;
   }
   function dispose(§\x1e\t\x1c§)
   {
      this.onKill();
      this._mcLinkedClip.onEnterFrame = null;
      delete this._mcLinkedClip.onEnterFrame;
      this._mcLinkedClip.unloadMovie();
      this._mcLinkedClip.removeMovieClip();
      delete this._mcLinkedClip;
   }
   function getVolume()
   {
      return this.volume;
   }
   function setVolume(§\x1e\x1b\x05§)
   {
      this.volume = _loc2_;
   }
   function startElement()
   {
      if(this._bStreaming && !this._bLoading || !this._bStreaming && !this._bLoaded)
      {
         this._bStartWhenLoaded = true;
      }
      else
      {
         if(this._nMaxLength != dofus.sounds["\x1d\x03"].UNLIMITED_LENGTH)
         {
            _global.clearInterval(this._nKillTimer);
            this._nKillTimer = _global.setInterval(this,this.onKill,this._nMaxLength * 1000);
         }
         super.start(this._nOffset,this._nLoops);
      }
   }
   function stop()
   {
      super.stop();
   }
   function fadeOut(§\x05\x19§, §\x1c\t§)
   {
      var volume = this.volume;
      var t = volume / _loc3_ / dofus.Constants.AVERAGE_FRAMES_PER_SECOND;
      var parentElement = this;
      var parent = super;
      var myself = this._mcLinkedClip;
      var destroy = _loc4_;
      this._mcLinkedClip.onEnterFrame = function()
      {
         volume -= t;
         parent.setVolume(volume);
         if(volume <= 0)
         {
            parentElement.stop();
            myself.onEnterFrame = undefined;
            delete myself.onEnterFrame;
            if(destroy)
            {
               parentElement.dispose();
            }
         }
      };
   }
   function toString()
   {
      var _loc2_ = "[AudioElement = " + this._nUniqID + "]\n";
      _loc2_ += " > Linked clip  : " + this._mcLinkedClip + "\n";
      _loc2_ += " > File         : " + this._sFile + "\n";
      _loc2_ += " > Loops        : " + this._nLoops + "\n";
      _loc2_ += " > Start offset : " + this._nOffset + "\n";
      _loc2_ += " > Max length   : " + this._nMaxLength + "\n";
      _loc2_ += " > Base vol.    : " + this.baseVolume + "\n";
      _loc2_ += " > Volume       : " + this.getVolume() + "\n";
      _loc2_ += " > Mute         : " + this._bMute + "\n";
      return _loc2_;
   }
   function onLoad(§\x14\x16§)
   {
      if(!_loc2_)
      {
         return undefined;
      }
      this._bLoaded = true;
      if(this._bStartWhenLoaded)
      {
         this.startElement();
      }
   }
   function onSoundComplete()
   {
      this.dispose();
   }
   function onKill()
   {
      _global.clearInterval(this._nKillTimer);
      this.stop();
   }
}
