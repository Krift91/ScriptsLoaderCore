class dofus.§\x0b\b§.OptionsManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _so;
   var dispatchEvent;
   static var DEFAULT_VALUES = {loaded:true,Grid:false,Transparency:false,SpriteInfos:true,SpriteMove:true,MapInfos:true,AutoHideSmileys:false,StringCourse:true,PointsOverHead:true,ChatEffects:true,CreaturesMode:50,Buff:true,GuildMessageSound:false,BannerShortcuts:true,StartTurnSound:true,TipsOnStart:true,DisplayStyle:"normal",DebugSizeIndex:0,ServerPortIndex:0,MovableBar:false,ViewAllMonsterInGroup:true,MovableBarSize:5,ShortcutSet:1,ShortcutSetDefault:1,CharacterPreview:true,MapFilters:[0,1,1,1,1,1,1],Aura:true,AudioMusicVol:60,AudioEffectVol:100,AudioEnvVol:60,AudioMusicMute:false,AudioEffectMute:false,AudioEnvMute:false,FloatingTipsCoord:new com.ankamagames.types["\x1e\x16\r"](415,30),DisplayingFreshTips:true,CensorshipFilter:true,BigStoreSellFilter:false,RememberAccountName:false,LastAccountNameUsed:"",DefaultQuality:"high",ConquestFilter:-2,FightGroupAutoLock:false,BannerIllustrationMode:"artwork",BannerGaugeMode:"xp",AskForWrongCraft:true,AdvancedLineOfSight:true,RemindTurnTime:true,HideSpellBar:false,SeeAllSpell:true,UseSpeakingItems:true,ConfirmDropItem:true,TimestampInChat:true,ViewDicesDammages:false,SeeDamagesColor:true,RemasteredSpellIconsPack:1};
   static var _sSelf = null;
   function OptionsManager(oAPI)
   {
      super();
      dofus["\x0b\b"].OptionsManager._sSelf = this;
      this.initialize(oAPI);
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].OptionsManager._sSelf;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this._so = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME];
      if(this._so.data.loaded == undefined)
      {
         this._so.clear();
      }
      for(var k in dofus["\x0b\b"].OptionsManager.DEFAULT_VALUES)
      {
         if(this._so.data[k] == undefined)
         {
            this._so.data[k] = dofus["\x0b\b"].OptionsManager.DEFAULT_VALUES[k];
         }
      }
      this._so.flush();
   }
   function loadDefault()
   {
      var _loc2_ = this._so.data.language;
      this._so.clear();
      for(var k in dofus["\x0b\b"].OptionsManager.DEFAULT_VALUES)
      {
         if(k == "ShortcutSetDefault")
         {
            this.setOption(k,this.api.kernel.KeyManager.getCurrentDefaultSet());
         }
         else
         {
            this.setOption(k,dofus["\x0b\b"].OptionsManager.DEFAULT_VALUES[k]);
         }
      }
      this._so.data.language = _loc2_;
      this._so.flush();
   }
   function setOption(§\x1e\x11\x03§, §\t\x06§)
   {
      var _loc4_ = this.saveValue(_loc2_,_loc3_);
      if(this.applyOption(_loc2_,_loc4_))
      {
         this.dispatchEvent({type:"optionChanged",key:_loc2_,value:_loc4_});
      }
   }
   function getOption(§\x1e\x11\x03§)
   {
      return this.loadValue(_loc2_);
   }
   function applyAllOptions()
   {
      var _loc2_ = this._so.data;
      for(var k in _loc2_)
      {
         var _loc3_ = false;
         var _loc0_ = null;
         if((_loc0_ = k) === "ShortcutSet")
         {
            _loc3_ = true;
         }
         if(!_loc3_)
         {
            this.applyOption(k,_loc2_[k]);
         }
      }
   }
   function saveValue(§\x1e\x11\x03§, §\t\x06§)
   {
      var _loc4_ = this._so.data;
      if(_loc3_ == undefined)
      {
         if(typeof _loc4_[_loc2_] == "boolean")
         {
            _loc4_[_loc2_] = !_loc4_[_loc2_];
         }
         else
         {
            _loc4_[_loc2_] = true;
         }
      }
      else
      {
         _loc4_[_loc2_] = _loc3_;
      }
      this._so.flush();
      return _loc4_[_loc2_];
   }
   function loadValue(§\x1e\x11\x03§)
   {
      return this._so.data[_loc2_];
   }
   function applyOption(§\x1e\x11\x03§, §\t\x06§)
   {
      switch(_loc2_)
      {
         case "Grid":
            if(_loc3_ == true)
            {
               this.api.gfx.drawGrid();
            }
            else
            {
               this.api.gfx.removeGrid();
            }
            break;
         case "Transparency":
            this.api.gfx.setSpriteGhostView(_loc3_);
            break;
         case "SpriteInfos":
            if(_loc3_ == false)
            {
               this.api.ui.unloadUIComponent("SpriteInfos");
               this.setOption("SpriteMove",false);
            }
            break;
         case "SpriteMove":
            if(_loc3_ == false)
            {
               this.api.gfx.clearZoneLayer("move");
            }
            else if(this.loadValue("SpriteInfos") == false)
            {
               this.setOption("SpriteInfos",true);
            }
            break;
         case "MapInfos":
            if(_loc3_ == true)
            {
               this.api.ui.loadUIComponent("MapInfos","MapInfos",undefined,{bForceLoad:true});
            }
            else
            {
               this.api.ui.unloadUIComponent("MapInfos");
            }
            break;
         case "AutoHideSmiley":
            break;
         case "StringCourse":
            if(_loc3_ == false)
            {
               this.api.ui.unloadUIComponent("StringCourse");
            }
            break;
         case "CreaturesMode":
            this.api.kernel.GameManager.applyCreatureMode();
            break;
         case "PointsOverHead":
         case "ChatEffects":
         case "GuildMessageSound":
         case "StartTurnSound":
         case "BannerShortcuts":
         case "TipsOnStart":
         case "DebugSizeIndex":
         case "ServerPortIndex":
         case "ViewAllMonsterInGroup":
            break;
         case "Buff":
            if(_loc3_)
            {
               this.api.ui.loadUIComponent("Buff","Buff");
            }
            else
            {
               this.api.ui.unloadUIComponent("Buff");
            }
            break;
         case "DisplayStyle":
            this.api.kernel.setDisplayStyle(_loc3_);
            break;
         case "DefaultQuality":
            this.api.kernel.setQuality(_loc3_);
            break;
         case "MovableBar":
            this.api.ui.getUIComponent("Banner").displayMovableBar(_loc3_ && (this.api.datacenter.Game.isFight || !this.getOption("HideSpellBar")));
            break;
         case "HideSpellBar":
            this.api.ui.getUIComponent("Banner").displayMovableBar(this.getOption("MovableBar") && (this.api.datacenter.Game.isFight || !_loc3_));
            break;
         case "MovableBarSize":
            this.api.ui.getUIComponent("Banner").setMovableBarSize(_loc3_);
            break;
         case "ShortcutSet":
            this.api.kernel.KeyManager.onSetChange(_loc3_);
            break;
         case "CharacterPreview":
            this.api.ui.getUIComponent("Inventory").showCharacterPreview(_loc3_);
            break;
         case "AudioMusicVol":
            this.api.kernel.AudioManager.musicVolume = _loc3_;
            break;
         case "AudioEffectVol":
            this.api.kernel.AudioManager.effectVolume = _loc3_;
            break;
         case "AudioEnvVol":
            this.api.kernel.AudioManager.environmentVolume = _loc3_;
            break;
         case "AudioMusicMute":
            this.api.kernel.AudioManager.musicMute = _loc3_;
            break;
         case "AudioEffectMute":
            this.api.kernel.AudioManager.effectMute = _loc3_;
            break;
         case "AudioEnvMute":
            this.api.kernel.AudioManager.environmentMute = _loc3_;
            break;
         case "TimestampInChat":
            this.api.kernel.ChatManager.refresh();
      }
      return true;
   }
}
