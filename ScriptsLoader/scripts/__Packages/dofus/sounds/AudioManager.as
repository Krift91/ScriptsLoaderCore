class dofus.sounds.AudioManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   static var _mcSoundNest;
   static var _pckEffects;
   static var _pckMusics;
   static var MUSIC_INDEX = 1000;
   static var MAX_MUSIC_INDEX = 1010;
   static var SOUND_INDEX = 1;
   static var MAX_SOUND_INDEX = 100;
   static var MUSIC_FADE_OUT_LENGTH = 4;
   static var ENVIRONMENT_TAG = "TAG_ENVIRONMENT";
   static var ENVIRONMENT_NOISE_TAG = "TAG_ENVIRONMENT_NOISE";
   static var EFFECT_TAG = "TAG_EFFECT";
   static var MUSIC_TAG = "TAG_MUSIC";
   static var PACKAGE_TYPE_MUSIC = "mu/";
   static var PACKAGE_TYPE_EFFECT = "fx/";
   static var instance = null;
   static var _bInitialized = false;
   var _bAudioEnabled = true;
   var _nCurrentSoundIndex = dofus.sounds.AudioManager.SOUND_INDEX;
   var _nCurrentMusicIndex = dofus.sounds.AudioManager.MUSIC_INDEX;
   var _bEnvironmentMute = false;
   var _bMusicMute = false;
   var _bEffectMute = false;
   var _nEnvironmentVolume = 100;
   var _nMusicVolume = 100;
   var _nEffectVolume = 100;
   var _aSoundsCollection = new Array();
   var _nLatestSavedMusic = -1;
   var _nLatestMusic = -1;
   var _aeLatestMusic = null;
   var _nLatestEnvironment = -1;
   var _aLatestEnvironmentBackground = null;
   var _nEnvironmentNoisesTimer = -1;
   function AudioManager()
   {
      super();
      if(dofus.sounds.AudioManager._mcSoundNest == null)
      {
         return;
      }
   }
   function get events()
   {
      return dofus.sounds["\x1d\x02"].getInstance();
   }
   function get enabled()
   {
      return this._bAudioEnabled;
   }
   function set enabled(§\x13\x1b§)
   {
      this._bAudioEnabled = _loc2_;
   }
   static function get soundNest()
   {
      return dofus.sounds.AudioManager._mcSoundNest;
   }
   static function set soundNest(§\x05\x0f§)
   {
      dofus.sounds.AudioManager._mcSoundNest = _loc2_;
   }
   function get environmentMute()
   {
      return this._bEnvironmentMute;
   }
   function set environmentMute(§\x13\x1b§)
   {
      this._bEnvironmentMute = _loc2_;
      for(var k in this._aSoundsCollection)
      {
         var _loc3_ = this._aSoundsCollection[k];
         if(_loc3_.tag == dofus.sounds.AudioManager.ENVIRONMENT_TAG)
         {
            _loc3_.mute = this._bEnvironmentMute;
         }
      }
      this.muteChanged();
   }
   function get musicMute()
   {
      return this._bMusicMute;
   }
   function set musicMute(§\x13\x1b§)
   {
      this._bMusicMute = _loc2_;
      for(var k in this._aSoundsCollection)
      {
         var _loc3_ = this._aSoundsCollection[k];
         if(_loc3_.tag == dofus.sounds.AudioManager.MUSIC_TAG)
         {
            _loc3_.mute = this._bMusicMute;
         }
      }
      this.muteChanged();
   }
   function get effectMute()
   {
      return this._bEffectMute;
   }
   function set effectMute(§\x13\x1b§)
   {
      this._bEffectMute = _loc2_;
      for(var k in this._aSoundsCollection)
      {
         var _loc3_ = this._aSoundsCollection[k];
         if(_loc3_.tag == dofus.sounds.AudioManager.EFFECT_TAG)
         {
            _loc3_.mute = this._bEffectMute;
         }
      }
      this.muteChanged();
   }
   function get environmentVolume()
   {
      return this._nEnvironmentVolume;
   }
   function set environmentVolume(§\x1e\x1b\n§)
   {
      this._nEnvironmentVolume = _loc2_;
      for(var k in this._aSoundsCollection)
      {
         var _loc3_ = this._aSoundsCollection[k];
         if(_loc3_.tag == dofus.sounds.AudioManager.ENVIRONMENT_TAG)
         {
            _loc3_.volume = _loc3_.baseVolume / 100 * this._nEnvironmentVolume;
         }
      }
   }
   function get musicVolume()
   {
      return this._nMusicVolume;
   }
   function set musicVolume(§\x1e\x1b\n§)
   {
      this._nMusicVolume = _loc2_;
      for(var k in this._aSoundsCollection)
      {
         var _loc3_ = this._aSoundsCollection[k];
         if(_loc3_.tag == dofus.sounds.AudioManager.MUSIC_TAG)
         {
            _loc3_.volume = _loc3_.baseVolume / 100 * this._nMusicVolume;
         }
      }
   }
   function get effectVolume()
   {
      return this._nEffectVolume;
   }
   function set effectVolume(§\x1e\x1b\n§)
   {
      this._nEffectVolume = _loc2_;
      for(var k in this._aSoundsCollection)
      {
         var _loc3_ = this._aSoundsCollection[k];
         if(_loc3_.tag == dofus.sounds.AudioManager.EFFECT_TAG)
         {
            _loc3_.volume = _loc3_.baseVolume / 100 * this._nEffectVolume;
         }
      }
   }
   static function initialize(soundNest)
   {
      dofus.sounds.AudioManager._mcSoundNest = soundNest;
      if(dofus.Constants.USING_PACKED_SOUNDS)
      {
         dofus.sounds.AudioManager._pckEffects = soundNest.createEmptyMovieClip("pckEffects",soundNest.getNextHighestDepth());
         dofus.sounds.AudioManager._pckEffects.loadMovie(dofus.Constants.SOUND_EFFECTS_PACKAGE);
         dofus.sounds.AudioManager._pckMusics = soundNest.createEmptyMovieClip("pckMusics",soundNest.getNextHighestDepth());
         dofus.sounds.AudioManager._pckMusics.loadMovie(dofus.Constants.SOUND_MUSICS_PACKAGE);
      }
      dofus.sounds.AudioManager._bInitialized = true;
   }
   static function getInstance()
   {
      if(!dofus.sounds.AudioManager._bInitialized)
      {
         return null;
      }
      if(dofus.sounds.AudioManager.instance == null)
      {
         dofus.sounds.AudioManager.instance = new dofus.sounds.AudioManager();
      }
      return dofus.sounds.AudioManager.instance;
   }
   static function getPackage(§\x1e\x0f\b§)
   {
      switch(_loc2_)
      {
         case dofus.sounds.AudioManager.PACKAGE_TYPE_MUSIC:
            return dofus.sounds.AudioManager._pckMusics;
         case dofus.sounds.AudioManager.PACKAGE_TYPE_EFFECT:
            return dofus.sounds.AudioManager._pckEffects;
         default:
            return null;
      }
   }
   function playSound(§\x1e\x0f\f§)
   {
      var _loc3_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_);
      var _loc4_ = _loc3_.replace([" ","é","à","-"],["_","e","a","_"]).toUpperCase();
      var _loc5_ = this.api.lang.getEffectFromKeyname(_loc4_);
      if(_loc5_ != undefined && !_global.isNaN(_loc5_))
      {
         this.playEffect(_loc5_);
      }
      else if(dofus.Constants.USING_PACKED_SOUNDS)
      {
         this.playEffectFromElement(this.getElementFromLinkname(_loc2_));
      }
      else
      {
         return undefined;
      }
   }
   function playEnvironment(§\x0f\x07§)
   {
      if(this._nLatestEnvironment == _loc2_ && !this._bEnvironmentMute)
      {
         return undefined;
      }
      if(this._aLatestEnvironmentBackground != null)
      {
         var _loc3_ = 0;
         while(_loc3_ < this._aLatestEnvironmentBackground.length)
         {
            this._aLatestEnvironmentBackground[_loc3_].fadeOut(dofus.sounds.AudioManager.MUSIC_FADE_OUT_LENGTH,true);
            _loc3_ = _loc3_ + 1;
         }
         this.stopAllSoundsWithTag(dofus.sounds.AudioManager.ENVIRONMENT_NOISE_TAG);
         _global.clearInterval(this._nEnvironmentNoisesTimer);
      }
      var _loc4_ = this.api.lang.getEnvironment(_loc2_);
      if(_loc4_ == null)
      {
         return undefined;
      }
      this._aLatestEnvironmentBackground = new Array();
      var _loc5_ = 0;
      while(_loc5_ < _loc4_.bg.length)
      {
         var _loc6_ = this.getElementFromEffect(this.api.lang.getEffect(Number(_loc4_.bg[_loc5_])));
         _loc6_.mute = this._bEnvironmentMute;
         _loc6_.loops = dofus.sounds["\x1d\x03"].INFINITE_LOOP;
         _loc6_.baseVolume = 100;
         _loc6_.volume = this._nEnvironmentVolume;
         _loc6_.tag = dofus.sounds.AudioManager.ENVIRONMENT_TAG;
         this.playElement(_loc6_);
         this._aLatestEnvironmentBackground.push(_loc6_);
         _loc5_ = _loc5_ + 1;
      }
      this.nextEnvironmentNoise(_loc4_);
      this._nLatestEnvironment = _loc2_;
   }
   function playMusic(§\t\b§, §\x15\x1b§)
   {
      if(this._nLatestMusic == _loc2_ && !this._bMusicMute)
      {
         return undefined;
      }
      if(this._aeLatestMusic != null)
      {
         this._aeLatestMusic.fadeOut(dofus.sounds.AudioManager.MUSIC_FADE_OUT_LENGTH,true);
         if(_loc3_)
         {
            this._nLatestSavedMusic = this._nLatestMusic;
         }
      }
      var _loc4_ = this.getElementFromMusic(this.api.lang.getMusic(_loc2_));
      _loc4_.tag = dofus.sounds.AudioManager.MUSIC_TAG;
      _loc4_.mute = this._bMusicMute;
      this.playElement(_loc4_);
      this._aeLatestMusic = _loc4_;
      this._nLatestMusic = _loc2_;
   }
   function backToOldMusic(§\x14\x1b§)
   {
      this.playMusic(this._nLatestSavedMusic,_loc2_);
   }
   function playEffect(§\x0f\f§, §\x11\x12§, §\x1b\x18§)
   {
      if(_loc4_ == undefined)
      {
         _loc4_ = false;
      }
      if(!_loc4_ && !this.api.electron.isWindowFocused)
      {
         return undefined;
      }
      var _loc5_ = this.getElementFromEffect(this.api.lang.getEffect(_loc2_));
      _loc5_.tag = _loc3_ != undefined ? _loc3_ : dofus.sounds.AudioManager.EFFECT_TAG;
      switch(_loc3_)
      {
         case dofus.sounds.AudioManager.MUSIC_TAG:
            _loc5_.mute = this._bMusicMute;
            break;
         case dofus.sounds.AudioManager.ENVIRONMENT_TAG:
            _loc5_.mute = this._bEnvironmentMute;
            break;
         case dofus.sounds.AudioManager.EFFECT_TAG:
         default:
            _loc5_.mute = this._bEffectMute;
      }
      this.playElement(_loc5_);
   }
   function playEffectFromElement(§\x01§)
   {
      _loc2_.tag = dofus.sounds.AudioManager.EFFECT_TAG;
      _loc2_.mute = this._bEffectMute;
      this.playElement(_loc2_);
   }
   function playMp3(§\x0e\t§)
   {
      var _loc3_ = this.createAudioElement(_loc2_,false,true);
      this.playElement(_loc3_);
   }
   function stopAllSoundsWithTag(§\x1e\r\x02§)
   {
      for(var k in this._aSoundsCollection)
      {
         var _loc3_ = this._aSoundsCollection[k];
         if(_loc3_.tag == _loc2_)
         {
            _loc3_.dispose();
         }
      }
   }
   function stopAllSounds()
   {
      for(var k in this._aSoundsCollection)
      {
         var _loc2_ = this._aSoundsCollection[k];
         _loc2_.dispose();
      }
      _global.clearInterval(this._nEnvironmentNoisesTimer);
      this._nLatestSavedMusic = -1;
      this._nLatestMusic = -1;
      this._nLatestEnvironment = -1;
   }
   function createAudioElement(§\x0e\t§, §\x1e\f\t§, §\t\t§, §\x1e\x17\x03§)
   {
      if(_loc2_ == undefined)
      {
         return null;
      }
      var _loc6_ = !_loc4_ ? this.getNextSoundIndex() : this.getNextMusicIndex();
      var _loc7_ = this.getSoundContainer(_loc6_,_loc5_);
      return new dofus.sounds["\x1d\x03"](_loc6_,_loc2_,_loc7_,_loc3_);
   }
   function playElement(§\x1e\x0f\n§)
   {
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      if(!this._bAudioEnabled)
      {
         return undefined;
      }
      this._aSoundsCollection["SND" + _loc2_.uniqID] = _loc2_;
      this.addToQueue({object:_loc2_,method:_loc2_.startElement});
   }
   function getNextSoundIndex(§\x1e\t\x1c§)
   {
      this._nCurrentSoundIndex++;
      if(this._nCurrentSoundIndex > dofus.sounds.AudioManager.MAX_SOUND_INDEX)
      {
         this._nCurrentSoundIndex = dofus.sounds.AudioManager.SOUND_INDEX;
      }
      var _loc3_ = this._aSoundsCollection["SND" + this._nCurrentSoundIndex];
      _loc3_.dispose();
      return this._nCurrentSoundIndex;
   }
   function getNextMusicIndex(§\x1e\t\x1c§)
   {
      this._nCurrentMusicIndex++;
      if(this._nCurrentMusicIndex > dofus.sounds.AudioManager.MAX_MUSIC_INDEX)
      {
         this._nCurrentMusicIndex = dofus.sounds.AudioManager.MUSIC_INDEX;
      }
      var _loc3_ = this._aSoundsCollection["SND" + this._nCurrentSoundIndex];
      _loc3_.dispose();
      return this._nCurrentMusicIndex;
   }
   function getSoundContainer(§\x1e\x1b\x0f§, §\x1e\x17\x03§)
   {
      if(!dofus.Constants.USING_PACKED_SOUNDS || _loc3_ == null)
      {
         return dofus.sounds.AudioManager._mcSoundNest.createEmptyMovieClip("SND" + _loc2_,_loc2_);
      }
      switch(_loc3_)
      {
         case dofus.sounds.AudioManager.PACKAGE_TYPE_EFFECT:
            return dofus.sounds.AudioManager._pckEffects.createEmptyMovieClip("FX" + _loc2_,_loc2_);
         case dofus.sounds.AudioManager.PACKAGE_TYPE_MUSIC:
            return dofus.sounds.AudioManager._pckMusics.createEmptyMovieClip("MU" + _loc2_,_loc2_);
         default:
            return null;
      }
   }
   function getElementFromLinkname(§\x1e\x10\x0e§)
   {
      var _loc3_ = this.createAudioElement(dofus.sounds.AudioManager.PACKAGE_TYPE_EFFECT + _loc2_,true,false,dofus.sounds.AudioManager.PACKAGE_TYPE_EFFECT);
      _loc3_.baseVolume = 100;
      _loc3_.volume = this._nEffectVolume;
      _loc3_.offset = 0;
      _loc3_.loops = dofus.sounds["\x1d\x03"].ONESHOT_SAMPLE;
      return _loc3_;
   }
   function getElementFromEffect(§\x1e\x19\x12§)
   {
      var _loc3_ = this.createAudioElement((!dofus.Constants.USING_PACKED_SOUNDS ? dofus.Constants.AUDIO_EFFECTS_PATH : dofus.sounds.AudioManager.PACKAGE_TYPE_EFFECT) + _loc2_.f,_loc2_.s,false,!dofus.Constants.USING_PACKED_SOUNDS ? null : dofus.sounds.AudioManager.PACKAGE_TYPE_EFFECT);
      _loc3_.baseVolume = _loc2_.v;
      _loc3_.volume = _loc2_.v / 100 * this._nEffectVolume;
      _loc3_.offset = _loc2_.o;
      _loc3_.loops = _loc2_.l != true ? dofus.sounds["\x1d\x03"].ONESHOT_SAMPLE : dofus.sounds["\x1d\x03"].INFINITE_LOOP;
      return _loc3_;
   }
   function getElementFromMusic(§\x1e\x18\x13§)
   {
      var _loc3_ = this.createAudioElement((!dofus.Constants.USING_PACKED_SOUNDS ? dofus.Constants.AUDIO_MUSICS_PATH : dofus.sounds.AudioManager.PACKAGE_TYPE_MUSIC) + _loc2_.f,_loc2_.s,true,!dofus.Constants.USING_PACKED_SOUNDS ? null : dofus.sounds.AudioManager.PACKAGE_TYPE_MUSIC);
      _loc3_.baseVolume = _loc2_.v;
      _loc3_.volume = _loc2_.v / 100 * this._nMusicVolume;
      _loc3_.offset = _loc2_.o;
      _loc3_.loops = _loc2_.l != true ? dofus.sounds["\x1d\x03"].ONESHOT_SAMPLE : dofus.sounds["\x1d\x03"].INFINITE_LOOP;
      return _loc3_;
   }
   function nextEnvironmentNoise(§\x1e\x19\x0f§)
   {
      _global.clearInterval(this._nEnvironmentNoisesTimer);
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      var _loc3_ = (_loc2_.mind + Math.round(Math.random() * _loc2_.maxd)) * 1000;
      _loc3_ = Math.max(10,_loc3_);
      this._nEnvironmentNoisesTimer = _global.setInterval(this,"onPlayNoise",_loc3_,_loc2_);
   }
   function onPlayNoise(§\x0f\b§)
   {
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.n[Math.floor(_loc2_.n.length * Math.random())];
      this.playEffect(_loc3_,dofus.sounds.AudioManager.ENVIRONMENT_NOISE_TAG);
      this.nextEnvironmentNoise(_loc2_);
   }
   function muteChanged()
   {
      if(this._bMusicMute && (this._bEnvironmentMute && this._bEffectMute))
      {
         this._bAudioEnabled = false;
      }
      else
      {
         this._bAudioEnabled = true;
      }
   }
}
