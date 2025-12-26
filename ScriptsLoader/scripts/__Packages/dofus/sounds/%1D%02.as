class dofus.sounds.§\x1d\x02§
{
   static var instance;
   static var api;
   function §\x1d\x02§()
   {
   }
   static function getInstance()
   {
      if(dofus.sounds["\x1d\x02"].instance == null)
      {
         dofus.sounds["\x1d\x02"].instance = new dofus.sounds["\x1d\x02"]();
      }
      dofus.sounds["\x1d\x02"].api = _global.API;
      return dofus.sounds["\x1d\x02"].instance;
   }
   function getAudioManager()
   {
      return dofus.sounds.AudioManager.getInstance();
   }
   function onGameStart(§\x1e\x05§)
   {
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      var _loc3_ = Math.floor(Math.random() * _loc2_.length);
      this.getAudioManager().playMusic(_loc2_[_loc3_],false,true);
   }
   function onGameEnd()
   {
   }
   function onTurnStart()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("TURN_START"),undefined,true);
      }
   }
   function onGameInvitation()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("BIP"),undefined,true);
      }
   }
   function onGameCriticalHit()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("BIP"));
      }
   }
   function onGameCriticalMiss()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("COUP_CRITIQUE"));
      }
   }
   function onBannerRoundButtonClick()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("CLICK2"));
      }
   }
   function onBannerChatButtonClick()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("CLICK"));
      }
   }
   function onBannerSpellItemButtonClick()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("CLICK"));
      }
   }
   function onBannerTimer()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("TAK"),undefined,true);
      }
   }
   function onBannerSpellSelect()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("CLICK2"));
      }
   }
   function onStatsJobBoostButtonClick()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("CLICK2"));
      }
   }
   function onSpellsBoostButtonClick()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("CLICK2"));
      }
   }
   function onInventoryFilterButtonClick()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("CLICK3"));
      }
   }
   function onMapButtonClick()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("CLICK3"));
      }
   }
   function onGuildButtonClick()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("CLICK"));
      }
   }
   function onMapFlag()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("POSE2"));
      }
   }
   function onChatWisper()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("BIP"),undefined,true);
      }
   }
   function onTaxcollectorAttack()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("CLANG"),undefined,true);
      }
   }
   function onError()
   {
      if(dofus.sounds["\x1d\x02"].api.kernel.XTRA_LANG_FILES_LOADED)
      {
         this.getAudioManager().playEffect(dofus.sounds["\x1d\x02"].api.lang.getEffectFromKeyname("ERROR"),undefined,true);
      }
   }
   function onEnterVillage()
   {
   }
}
