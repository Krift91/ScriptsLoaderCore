class dofus.§\r\x14§.gapi.ui.Options extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _eaDisplayStyles;
   var _eaFlashQualities;
   var _eaSpellIconsPacks;
   var _lblGeneral;
   var _lblDetailLevel;
   var _lblAudio;
   var _lblOptimize;
   var _lblDisplay;
   var _winBackground;
   var _btnTabGeneral;
   var _btnTabSound;
   var _btnTabDisplay;
   var _mcTabViewer;
   var _btnClose2;
   var _btnDefault;
   var _btnClose;
   var _sbOptions;
   var _sCurrentTab;
   var _mcPlacer;
   var _mcMask;
   var _mcComboBoxPopup;
   static var CLASS_NAME = "Options";
   static var SCROLL_BY = 20;
   function Options()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Options.CLASS_NAME);
      var _loc3_ = System.capabilities.playerType == "StandAlone" && System.capabilities.os.indexOf("Windows") != -1;
      this._eaDisplayStyles = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaDisplayStyles.push({label:this.api.lang.getText("DISPLAYSTYLE_NORMAL"),style:"normal"});
      if(System.capabilities.screenResolutionY > 950 || _loc3_)
      {
         this._eaDisplayStyles.push({label:this.api.lang.getText("DISPLAYSTYLE_MEDIUM" + (!_loc3_ ? "" : "_RES")),style:"medium"});
      }
      this._eaDisplayStyles.push({label:this.api.lang.getText("DISPLAYSTYLE_MAXIMIZED" + (!_loc3_ ? "" : "_RES")),style:"maximized"});
      this._eaFlashQualities = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaFlashQualities.push({label:this.api.lang.getText("QUALITY_LOW"),quality:"low"});
      this._eaFlashQualities.push({label:this.api.lang.getText("QUALITY_MEDIUM"),quality:"medium"});
      this._eaFlashQualities.push({label:this.api.lang.getText("QUALITY_HIGH"),quality:"high"});
      this._eaFlashQualities.push({label:this.api.lang.getText("QUALITY_BEST"),quality:"best"});
      this._eaSpellIconsPacks = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaSpellIconsPacks.push({label:this.api.lang.getText("UI_OPTION_SPELLCOLOR_CLASSIC"),frame:3});
      this._eaSpellIconsPacks.push({label:this.api.lang.getText("UI_OPTION_SPELLCOLOR_REMASTERED"),frame:1});
      this._eaSpellIconsPacks.push({label:this.api.lang.getText("UI_OPTION_SPELLCOLOR_CONTRAST"),frame:2});
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.setCurrentTab,params:["General"]});
   }
   function initTexts()
   {
      this._lblGeneral.text = this.api.lang.getText("OPTIONS_GENERAL");
      this._lblDetailLevel.text = this.api.lang.getText("OPTIONS_DETAILLEVEL");
      this._lblAudio.text = this.api.lang.getText("OPTIONS_AUDIO");
      this._lblOptimize.text = this.api.lang.getText("OPTIONS_OPTIMIZE");
      this._lblDisplay.text = this.api.lang.getText("OPTIONS_DISPLAY");
      this._winBackground.title = this.api.lang.getText("OPTIONS");
      this._btnTabGeneral.label = this.api.lang.getText("OPTIONS_GENERAL");
      this._btnTabSound.label = this.api.lang.getText("OPTIONS_AUDIO");
      this._btnTabDisplay.label = this.api.lang.getText("OPTIONS_DISPLAY");
   }
   function initTabTexts()
   {
      this._mcTabViewer._lblMusic.text = this.api.lang.getText("MUSICS");
      this._mcTabViewer._lblSounds.text = this.api.lang.getText("SOUNDS");
      this._mcTabViewer._lblEnvironment.text = this.api.lang.getText("ENVIRONMENT");
      this._btnClose2.label = this.api.lang.getText("CLOSE");
      this._btnDefault.label = this.api.lang.getText("DEFAUT");
      this._mcTabViewer._btnShortcuts.label = this.api.lang.getText("KEYBORD_SHORTCUT");
      this._mcTabViewer._btnClearCache.label = this.api.lang.getText("CLEAR_CACHE");
      this._mcTabViewer._btnResetTips.label = this.api.lang.getText("REINIT_WORD");
      this._mcTabViewer._lblTitleMap.text = this.api.lang.getText("MAP");
      this._mcTabViewer._lblTitleFight.text = this.api.lang.getText("FIGHT");
      this._mcTabViewer._lblTitleSecurity.text = this.api.lang.getText("SECURITY_SHORTCUT");
      this._mcTabViewer._lblTitleUI.text = this.api.lang.getText("INTERFACE_WORD");
      this._mcTabViewer._lblTitleMisc.text = this.api.lang.getText("MISC_WORD");
      this._mcTabViewer._lblTitleOptimiz.text = this.api.lang.getText("OPTIONS_OPTIMIZE");
      this._mcTabViewer._lblTitleScreen.text = this.api.lang.getText("OPTION_TITLE_SCREEN");
      this._mcTabViewer._lblGrid.text = this.api.lang.getText("OPTION_GRID");
      this._mcTabViewer._lblTransparency.text = this.api.lang.getText("OPTION_TRANSPARENCY");
      this._mcTabViewer._lblSpriteInfos.text = this.api.lang.getText("OPTION_SPRITEINFOS");
      this._mcTabViewer._lblSpriteMove.text = this.api.lang.getText("OPTION_SPRITEMOVE");
      this._mcTabViewer._lblMapInfos.text = this.api.lang.getText("OPTION_MAPINFOS");
      this._mcTabViewer._lblAutoHideSmileys.text = this.api.lang.getText("OPTION_AUTOHIDESMILEYS");
      this._mcTabViewer._lblStringCourse.text = this.api.lang.getText("OPTION_STRINGCOURSE");
      this._mcTabViewer._lblPointsOverHead.text = this.api.lang.getText("OPTION_POINTSOVERHEAD");
      this._mcTabViewer._lblChatEffects.text = this.api.lang.getText("OPTION_CHATEFFECTS");
      this._mcTabViewer._lblBuff.text = this.api.lang.getText("OPTION_BUFF");
      this._mcTabViewer._lblAdvancedLineOfSight.text = this.api.lang.getText("OPTION_LINEOFSIGHT");
      this._mcTabViewer._lblRemindTurnTime.text = this.api.lang.getText("OPTION_REMINDTURN");
      this._mcTabViewer._lblHideSpellBar.text = this.api.lang.getText("OPTION_SPELLBAR");
      this._mcTabViewer._lblCraftWrongConfirm.text = this.api.lang.getText("OPTION_WRONG_CRAFT_CONFIRM");
      this._mcTabViewer._lblGuildMessageSound.text = this.api.lang.getText("OPTION_GUILDMESSAGESOUND");
      this._mcTabViewer._lblStartTurnSound.text = this.api.lang.getText("OPTION_STARTTURNSOUND");
      this._mcTabViewer._lblBannerShortcuts.text = this.api.lang.getText("OPTION_BANNERSHORTCUTS");
      this._mcTabViewer._lblTipsOnStart.text = this.api.lang.getText("OPTION_TIPSONSTART");
      this._mcTabViewer._lblCreaturesMode.text = this.api.lang.getText("OPTION_CREATURESMODE");
      this._mcTabViewer._lblDisplayStyle.text = this.api.lang.getText("OPTION_DISPLAYSTYLE");
      this._mcTabViewer._lblMovableBar.text = this.api.lang.getText("OPTION_MOVABLEBAR");
      this._mcTabViewer._lblMovableBarSize.text = this.api.lang.getText("OPTION_MOVABLEBARSIZE");
      this._mcTabViewer._lblSpellBar.text = this.api.lang.getText("OPTION_SPELLBAR");
      this._mcTabViewer._lblViewAllMonsterInGroup.text = this.api.lang.getText("OPTION_VIEWALLMONSTERINGROUP");
      this._mcTabViewer._lblCharacterPreview.text = this.api.lang.getText("OPTION_CHARACTERPREVIEW");
      this._mcTabViewer._lblSeeAllSpell.text = this.api.lang.getText("UI_OPTION_SEEALLSPELL");
      this._mcTabViewer._lblAura.text = this.api.lang.getText("OPTION_AURA");
      this._mcTabViewer._lblTutorialTips.text = this.api.lang.getText("OPTION_TUTORIALTIPS");
      this._mcTabViewer._lblCensorshipFilter.text = this.api.lang.getText("OPTION_CENSORSHIP_FILTER");
      this._mcTabViewer._lblDefaultQuality.text = this.api.lang.getText("OPTION_DEFAULTQUALITY");
      this._mcTabViewer._lblSpeakingItems.text = this.api.lang.getText("OPTION_USE_SPEAKINGITEMS");
      this._mcTabViewer._lblConfirmDropItem.text = this.api.lang.getText("OPTION_CONFIRM_DROPITEM");
      this._mcTabViewer._lblChatTimestamp.text = this.api.lang.getText("OPTION_USE_CHATTIMESTAMP");
      this._mcTabViewer._lblViewDicesDammages.text = this.api.lang.getText("OPTION_VIEW_DICES_DAMMAGES");
      this._mcTabViewer._lblSeeDamagesColor.text = this.api.lang.getText("UI_OPTION_SEEDAMAGESCOLOR");
      if(dofus.Constants.DOUBLEFRAMERATE)
      {
         this._mcTabViewer._lblRemasteredSpellIcons.text = this.api.lang.getText("DOFUS_REMASTERED_SPELL_ICONS");
      }
      else
      {
         this._mcTabViewer._lblRemasteredSpellIcons._visible = false;
      }
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnClose2.addEventListener("click",this);
      this._btnDefault.addEventListener("click",this);
      this._btnTabGeneral.addEventListener("click",this);
      this._btnTabSound.addEventListener("click",this);
      this._btnTabDisplay.addEventListener("click",this);
      this.api.kernel.OptionsManager.addEventListener("optionChanged",this);
      ank["\x1e\n\x07"]["\t\x17"].addListener(this);
   }
   function addTabListeners()
   {
      this._mcTabViewer._btnShortcuts.addEventListener("click",this);
      this._mcTabViewer._btnClearCache.addEventListener("click",this);
      this._mcTabViewer._btnGrid.addEventListener("click",this);
      this._mcTabViewer._btnTransparency.addEventListener("click",this);
      this._mcTabViewer._btnSpriteInfos.addEventListener("click",this);
      this._mcTabViewer._btnSpriteMove.addEventListener("click",this);
      this._mcTabViewer._btnMapInfos.addEventListener("click",this);
      this._mcTabViewer._btnAutoHideSmileys.addEventListener("click",this);
      this._mcTabViewer._btnStringCourse.addEventListener("click",this);
      this._mcTabViewer._btnPointsOverHead.addEventListener("click",this);
      this._mcTabViewer._btnChatEffects.addEventListener("click",this);
      this._mcTabViewer._btnBuff.addEventListener("click",this);
      this._mcTabViewer._btnGuildMessageSound.addEventListener("click",this);
      this._mcTabViewer._btnStartTurnSound.addEventListener("click",this);
      this._mcTabViewer._btnBannerShortcuts.addEventListener("click",this);
      this._mcTabViewer._btnTipsOnStart.addEventListener("click",this);
      this._mcTabViewer._btnMovableBar.addEventListener("click",this);
      this._mcTabViewer._btnViewAllMonsterInGroup.addEventListener("click",this);
      this._mcTabViewer._btnCharacterPreview.addEventListener("click",this);
      this._mcTabViewer._btnAura.addEventListener("click",this);
      this._mcTabViewer._btnTutorialTips.addEventListener("click",this);
      this._mcTabViewer._btnResetTips.addEventListener("click",this);
      this._mcTabViewer._btnCensorshipFilter.addEventListener("click",this);
      this._mcTabViewer._btnCraftWrongConfirm.addEventListener("click",this);
      this._mcTabViewer._btnAdvancedLineOfSight.addEventListener("click",this);
      this._mcTabViewer._btnRemindTurnTime.addEventListener("click",this);
      this._mcTabViewer._btnHideSpellBar.addEventListener("click",this);
      this._mcTabViewer._btnSeeAllSpell.addEventListener("click",this);
      this._mcTabViewer._btnSpeakingItems.addEventListener("click",this);
      this._mcTabViewer._btnConfirmDropItem.addEventListener("click",this);
      this._mcTabViewer._btnChatTimestamp.addEventListener("click",this);
      this._mcTabViewer._btnViewDicesDammages.addEventListener("click",this);
      this._mcTabViewer._btnSeeDamagesColor.addEventListener("click",this);
      this._mcTabViewer._cbDisplayStyle.addEventListener("itemSelected",this);
      this._mcTabViewer._cbDefaultQuality.addEventListener("itemSelected",this);
      this._mcTabViewer._cbSpellIconsPack.addEventListener("itemSelected",this);
      this._mcTabViewer._vsMusic.addEventListener("change",this);
      this._mcTabViewer._vsSounds.addEventListener("change",this);
      this._mcTabViewer._vsEnvironment.addEventListener("change",this);
      this._mcTabViewer._vsCreaturesMode.addEventListener("change",this);
      this._mcTabViewer._vsMovableBarSize.addEventListener("change",this);
      this._mcTabViewer._btnMuteMusic.addEventListener("click",this);
      this._mcTabViewer._btnMuteSounds.addEventListener("click",this);
      this._mcTabViewer._btnMuteEnvironment.addEventListener("click",this);
      this._sbOptions.addEventListener("scroll",this);
   }
   function initData()
   {
      this._mcTabViewer._btnShortcuts.enabled = this.api.kernel.XTRA_LANG_FILES_LOADED;
      var _loc2_ = this.api.kernel.OptionsManager;
      this._mcTabViewer._vsMusic.value = _loc2_.getOption("AudioMusicVol");
      this._mcTabViewer._vsSounds.value = _loc2_.getOption("AudioEffectVol");
      this._mcTabViewer._vsEnvironment.value = _loc2_.getOption("AudioEnvVol");
      this._mcTabViewer._btnMuteMusic.selected = _loc2_.getOption("AudioMusicMute");
      this._mcTabViewer._btnMuteSounds.selected = _loc2_.getOption("AudioEffectMute");
      this._mcTabViewer._btnMuteEnvironment.selected = _loc2_.getOption("AudioEnvMute");
      this._mcTabViewer._btnGrid.selected = _loc2_.getOption("Grid");
      this._mcTabViewer._btnTransparency.selected = _loc2_.getOption("Transparency");
      this._mcTabViewer._btnSpriteInfos.selected = _loc2_.getOption("SpriteInfos");
      this._mcTabViewer._btnSpriteMove.selected = _loc2_.getOption("SpriteMove");
      this._mcTabViewer._btnMapInfos.selected = _loc2_.getOption("MapInfos");
      this._mcTabViewer._btnAutoHideSmileys.selected = _loc2_.getOption("AutoHideSmileys");
      this._mcTabViewer._btnStringCourse.selected = _loc2_.getOption("StringCourse");
      this._mcTabViewer._btnPointsOverHead.selected = _loc2_.getOption("PointsOverHead");
      this._mcTabViewer._btnChatEffects.selected = _loc2_.getOption("ChatEffects");
      this._mcTabViewer._btnBuff.selected = _loc2_.getOption("Buff");
      this._mcTabViewer._btnGuildMessageSound.selected = _loc2_.getOption("GuildMessageSound");
      this._mcTabViewer._btnStartTurnSound.selected = _loc2_.getOption("StartTurnSound");
      this._mcTabViewer._btnBannerShortcuts.selected = _loc2_.getOption("BannerShortcuts");
      this._mcTabViewer._btnTipsOnStart.selected = _loc2_.getOption("TipsOnStart");
      this._mcTabViewer._btnViewAllMonsterInGroup.selected = _loc2_.getOption("ViewAllMonsterInGroup");
      this._mcTabViewer._btnCharacterPreview.selected = _loc2_.getOption("CharacterPreview");
      this._mcTabViewer._btnAura.selected = _loc2_.getOption("Aura");
      this._mcTabViewer._btnTutorialTips.selected = _loc2_.getOption("DisplayingFreshTips");
      this._mcTabViewer._btnCensorshipFilter.selected = _loc2_.getOption("CensorshipFilter");
      this._mcTabViewer._btnCraftWrongConfirm.selected = _loc2_.getOption("AskForWrongCraft");
      this._mcTabViewer._btnAdvancedLineOfSight.selected = _loc2_.getOption("AdvancedLineOfSight");
      this._mcTabViewer._btnRemindTurnTime.selected = _loc2_.getOption("RemindTurnTime");
      this._mcTabViewer._btnHideSpellBar.selected = _loc2_.getOption("HideSpellBar");
      this._mcTabViewer._btnSeeAllSpell.selected = !_loc2_.getOption("SeeAllSpell");
      this._mcTabViewer._btnSpeakingItems.selected = _loc2_.getOption("UseSpeakingItems");
      this._mcTabViewer._btnConfirmDropItem.selected = _loc2_.getOption("ConfirmDropItem");
      this._mcTabViewer._btnChatTimestamp.selected = _loc2_.getOption("TimestampInChat");
      this._mcTabViewer._btnViewDicesDammages.selected = _loc2_.getOption("ViewDicesDammages");
      this._mcTabViewer._btnSeeDamagesColor.selected = _loc2_.getOption("SeeDamagesColor");
      this._mcTabViewer._btnMovableBar.selected = _loc2_.getOption("MovableBar");
      this._mcTabViewer._vsMovableBarSize.value = _loc2_.getOption("MovableBarSize");
      this._mcTabViewer._lblMovableBarSizeValue.text = _loc2_.getOption("MovableBarSize");
      this._mcTabViewer._vsCreaturesMode.value = _loc2_.getOption("CreaturesMode");
      this._mcTabViewer._lblCreaturesModeValue.text = !!_global.isFinite(_loc2_.getOption("CreaturesMode")) ? _loc2_.getOption("CreaturesMode") : this.api.lang.getText("INFINIT");
      this._mcTabViewer._cbDefaultQuality.dataProvider = this._eaFlashQualities;
      this.selectQuality(_loc2_.getOption("DefaultQuality"));
      this.selectRemasteredSpellIconsPack(_loc2_.getOption("RemasteredSpellIconsPack"));
      if(dofus.Constants.DOUBLEFRAMERATE)
      {
         this._mcTabViewer._cbSpellIconsPack.dataProvider = this._eaSpellIconsPacks;
      }
      else
      {
         this._mcTabViewer._cbSpellIconsPack._visible = false;
      }
      this._mcTabViewer._cbDisplayStyle.dataProvider = this._eaDisplayStyles;
      var _loc3_ = System.capabilities.playerType == "PlugIn" || (System.capabilities.playerType == "ActiveX" || System.capabilities.playerType == "StandAlone" && System.capabilities.os.indexOf("Windows") != -1);
      this.selectDisplayStyle(!!_loc3_ ? _loc2_.getOption("DisplayStyle") : "normal");
      this._mcTabViewer._cbDisplayStyle.enabled = _loc3_;
      var _loc4_ = new Color(this._mcTabViewer._cbDisplayStyle);
      _loc4_.setTransform(!_loc3_ ? {ra:30,rb:149,ga:30,gb:145,ba:30,bb:119} : {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0});
   }
   function selectQuality(§\x1e\x0e\t§)
   {
      var _loc3_ = 0;
      var _loc4_ = 0;
      while(_loc4_ < this._eaFlashQualities.length)
      {
         if(this._eaFlashQualities[_loc4_].quality == _loc2_)
         {
            _loc3_ = _loc4_;
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      this._mcTabViewer._cbDefaultQuality.selectedIndex = _loc3_;
   }
   function selectRemasteredSpellIconsPack(§\x01\x1c§)
   {
      var _loc3_ = 0;
      var _loc4_ = 0;
      while(_loc4_ < this._eaSpellIconsPacks.length)
      {
         if(this._eaSpellIconsPacks[_loc4_].frame == _loc2_)
         {
            _loc3_ = _loc4_;
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      this._mcTabViewer._cbSpellIconsPack.selectedIndex = _loc3_;
   }
   function selectDisplayStyle(§\x1e\r\x07§)
   {
      var _loc3_ = 0;
      var _loc4_ = 0;
      while(_loc4_ < this._eaDisplayStyles.length)
      {
         if(this._eaDisplayStyles[_loc4_].style == _loc2_)
         {
            _loc3_ = _loc4_;
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      this._mcTabViewer._cbDisplayStyle.selectedIndex = _loc3_;
   }
   function updateCurrentTabInformations()
   {
      this._mcTabViewer.removeMovieClip();
      this.attachMovie("Options" + this._sCurrentTab + "Content","_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
      this._mcTabViewer.setMask(this._mcMask);
      if(this._mcTabViewer._height > this._mcPlacer._height)
      {
         this._sbOptions._visible = true;
         this._sbOptions.min = 0;
         this._sbOptions.max = this._mcTabViewer._height - this._mcPlacer._height;
         this._sbOptions.page = this._sbOptions.max / 2;
      }
      else
      {
         this._sbOptions._visible = false;
      }
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTabTexts});
      this.addToQueue({object:this,method:this.addTabListeners});
   }
   function setCurrentTab(§\x1e\x0f\x14§)
   {
      this._mcComboBoxPopup.removeMovieClip();
      var _loc3_ = this["_btnTab" + this._sCurrentTab];
      var _loc4_ = this["_btnTab" + _loc2_];
      _loc3_.selected = true;
      _loc3_.enabled = true;
      _loc4_.selected = false;
      _loc4_.enabled = false;
      this._sCurrentTab = _loc2_;
      this._sbOptions.scrollPosition = 0;
      this.updateCurrentTabInformations();
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnTabGeneral":
         case "_btnTabSound":
         case "_btnTabDisplay":
            this.setCurrentTab(_loc2_.target._name.substr(7));
            break;
         case "_btnMuteMusic":
            this.api.kernel.OptionsManager.setOption("AudioMusicMute",_loc2_.target.selected);
            break;
         case "_btnMuteSounds":
            this.api.kernel.OptionsManager.setOption("AudioEffectMute",_loc2_.target.selected);
            break;
         case "_btnMuteEnvironment":
            this.api.kernel.OptionsManager.setOption("AudioEnvMute",_loc2_.target.selected);
            break;
         case "_btnClose":
         case "_btnClose2":
            this.callClose();
            break;
         case "_btnDefault":
            this.api.kernel.OptionsManager.loadDefault();
            break;
         case "_btnShortcuts":
            this.api.ui.loadUIComponent("Shortcuts","Shortcuts",undefined,{bAlwaysOnTop:true});
            break;
         case "_btnClearCache":
            this.api.kernel.askClearCache();
            break;
         case "_btnGrid":
            this.api.kernel.OptionsManager.setOption("Grid",_loc2_.target.selected);
            break;
         case "_btnTransparency":
            this.api.kernel.OptionsManager.setOption("Transparency",_loc2_.target.selected);
            break;
         case "_btnSpriteInfos":
            this.api.kernel.OptionsManager.setOption("SpriteInfos",_loc2_.target.selected);
            break;
         case "_btnSpriteMove":
            this.api.kernel.OptionsManager.setOption("SpriteMove",_loc2_.target.selected);
            break;
         case "_btnMapInfos":
            this.api.kernel.OptionsManager.setOption("MapInfos",_loc2_.target.selected);
            break;
         case "_btnCraftWrongConfirm":
            this.api.kernel.OptionsManager.setOption("AskForWrongCraft",_loc2_.target.selected);
            break;
         case "_btnAutoHideSmileys":
            this.api.kernel.OptionsManager.setOption("AutoHideSmileys",_loc2_.target.selected);
            break;
         case "_btnStringCourse":
            this.api.kernel.OptionsManager.setOption("StringCourse",_loc2_.target.selected);
            break;
         case "_btnPointsOverHead":
            this.api.kernel.OptionsManager.setOption("PointsOverHead",_loc2_.target.selected);
            break;
         case "_btnChatEffects":
            this.api.kernel.OptionsManager.setOption("ChatEffects",_loc2_.target.selected);
            break;
         case "_btnBuff":
            this.api.kernel.OptionsManager.setOption("Buff",_loc2_.target.selected);
            break;
         case "_btnGuildMessageSound":
            this.api.kernel.OptionsManager.setOption("GuildMessageSound",_loc2_.target.selected);
            break;
         case "_btnStartTurnSound":
            this.api.kernel.OptionsManager.setOption("StartTurnSound",_loc2_.target.selected);
            break;
         case "_btnBannerShortcuts":
            this.api.kernel.OptionsManager.setOption("BannerShortcuts",_loc2_.target.selected);
            break;
         case "_btnTipsOnStart":
            this.api.kernel.OptionsManager.setOption("TipsOnStart",_loc2_.target.selected);
            break;
         case "_btnMovableBar":
            this.api.kernel.OptionsManager.setOption("MovableBar",_loc2_.target.selected);
            break;
         case "_btnViewAllMonsterInGroup":
            this.api.kernel.OptionsManager.setOption("ViewAllMonsterInGroup",_loc2_.target.selected);
            break;
         case "_btnCharacterPreview":
            this.api.kernel.OptionsManager.setOption("CharacterPreview",_loc2_.target.selected);
            break;
         case "_btnAura":
            this.api.kernel.OptionsManager.setOption("Aura",_loc2_.target.selected);
            break;
         case "_btnTutorialTips":
            this.api.kernel.OptionsManager.setOption("DisplayingFreshTips",_loc2_.target.selected);
            break;
         case "_btnResetTips":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_RESET_TIPS"),"CAUTION_YESNO",{name:"ResetTips",listener:this});
            break;
         case "_btnCensorshipFilter":
            this.api.kernel.OptionsManager.setOption("CensorshipFilter",_loc2_.target.selected);
            break;
         case "_btnAdvancedLineOfSight":
            this.api.kernel.OptionsManager.setOption("AdvancedLineOfSight",_loc2_.target.selected);
            break;
         case "_btnRemindTurnTime":
            this.api.kernel.OptionsManager.setOption("RemindTurnTime",_loc2_.target.selected);
            break;
         case "_btnHideSpellBar":
            this.api.kernel.OptionsManager.setOption("HideSpellBar",_loc2_.target.selected);
            break;
         case "_btnSeeAllSpell":
            this.api.kernel.OptionsManager.setOption("SeeAllSpell",!_loc2_.target.selected);
            break;
         case "_btnSpeakingItems":
            this.api.kernel.OptionsManager.setOption("UseSpeakingItems",_loc2_.target.selected);
            break;
         case "_btnConfirmDropItem":
            this.api.kernel.OptionsManager.setOption("ConfirmDropItem",_loc2_.target.selected);
            break;
         case "_btnChatTimestamp":
            this.api.kernel.OptionsManager.setOption("TimestampInChat",_loc2_.target.selected);
            this.api.kernel.ChatManager.refresh();
            break;
         case "_btnViewDicesDammages":
            this.api.kernel.OptionsManager.setOption("ViewDicesDammages",_loc2_.target.selected);
            break;
         case "_btnSeeDamagesColor":
            this.api.kernel.OptionsManager.setOption("SeeDamagesColor",_loc2_.target.selected);
      }
   }
   function change(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_vsMusic":
            this.api.kernel.OptionsManager.setOption("AudioMusicVol",_loc2_.target.value);
            break;
         case "_vsSounds":
            this.api.kernel.OptionsManager.setOption("AudioEffectVol",_loc2_.target.value);
            break;
         case "_vsEnvironment":
            this.api.kernel.OptionsManager.setOption("AudioEnvVol",_loc2_.target.value);
            break;
         case "_vsCreaturesMode":
            if(_loc2_.target.value == _loc2_.target.max)
            {
               this.api.kernel.OptionsManager.setOption("CreaturesMode",Number.POSITIVE_INFINITY);
            }
            else if(_loc2_.target.value == _loc2_.target.min)
            {
               this.api.kernel.OptionsManager.setOption("CreaturesMode",0);
            }
            else
            {
               this.api.kernel.OptionsManager.setOption("CreaturesMode",Math.floor(_loc2_.target.value));
            }
            break;
         case "_vsMovableBarSize":
            var _loc3_ = Math.floor(_loc2_.target.value);
            this.api.kernel.OptionsManager.setOption("MovableBarSize",_loc3_);
            this._mcTabViewer._lblMovableBarSizeValue.text = _loc3_.toString();
      }
   }
   function optionChanged(§\x1e\x19\x0e§)
   {
      switch(_loc2_.key)
      {
         case "Grid":
            this._mcTabViewer._btnGrid.selected = _loc2_.value;
            break;
         case "Transparency":
            this._mcTabViewer._btnTransparency.selected = _loc2_.value;
            break;
         case "SpriteInfos":
            this._mcTabViewer._btnSpriteInfos.selected = _loc2_.value;
            break;
         case "SpriteMove":
            this._mcTabViewer._btnSpriteMove.selected = _loc2_.value;
            break;
         case "MapInfos":
            this._mcTabViewer._btnMapInfos.selected = _loc2_.value;
            break;
         case "AutoHideSmileys":
            this._mcTabViewer._btnAutoHideSmileys.selected = _loc2_.value;
            break;
         case "StringCourse":
            this._mcTabViewer._btnStringCourse.selected = _loc2_.value;
            break;
         case "PointsOverHead":
            this._mcTabViewer._btnPointsOverHead.selected = _loc2_.value;
            break;
         case "ChatEffects":
            this._mcTabViewer._btnChatEffects.selected = _loc2_.value;
            break;
         case "CreaturesMode":
            this._mcTabViewer._vsCreaturesMode.value = _loc2_.value;
            this._mcTabViewer._lblCreaturesModeValue.text = !_global.isFinite(_loc2_.value) ? this.api.lang.getText("INFINIT") : _loc2_.value;
            break;
         case "Buff":
            this._mcTabViewer._btnBuff.selected = _loc2_.value;
            break;
         case "GuildMessageSound":
            this._mcTabViewer._btnGuildMessageSound.selected = _loc2_.value;
            break;
         case "StartTurnSound":
            this._mcTabViewer._btnStartTurnSound.selected = _loc2_.value;
            break;
         case "BannerShortcuts":
            this._mcTabViewer._btnBannerShortcuts.selected = _loc2_.value;
            break;
         case "TipsOnStart":
            this._mcTabViewer._btnTipsOnStart.selected = _loc2_.value;
            break;
         case "DisplayStyle":
            this._mcTabViewer.selectDisplayStyle(_loc2_.value);
            break;
         case "MovableBar":
            this._mcTabViewer._btnMovableBar.selected = _loc2_.value;
            break;
         case "MovableBarSize":
            this._mcTabViewer._vsMovableBarSize.value = _loc2_.value;
            break;
         case "ViewAllMonsterInGroup":
            this._mcTabViewer._btnViewAllMonsterInGroup.selected = _loc2_.value;
            break;
         case "CharacterPreview":
            this._mcTabViewer._btnCharacterPreview.selected = _loc2_.value;
            break;
         case "Aura":
            this._mcTabViewer._btnAura.selected = _loc2_.value;
            break;
         case "DisplayingFreshTips":
            this._mcTabViewer._btnTutorialTips.selected = _loc2_.value;
            break;
         case "CensorshipFilter":
            this._mcTabViewer._btnCensorshipFilter.selected = _loc2_.value;
            break;
         case "AskForWrongCraft":
            this._mcTabViewer._btnCraftWrongConfirm.selected = _loc2_.value;
            break;
         case "AdvancedLineOfSight":
            this._mcTabViewer._btnAdvancedLineOfSight.selected = _loc2_.value;
            break;
         case "RemindTurnTime":
            this._mcTabViewer._btnRemindTurnTime.selected = _loc2_.value;
            break;
         case "HideSpellBar":
            this._mcTabViewer._btnHideSpellBar.selected = _loc2_.value;
            break;
         case "SeeAllSpell":
            this._mcTabViewer._btnSeeAllSpell.selected = !_loc2_.value;
            break;
         case "UseSpeakingItems":
            this._mcTabViewer._btnSpeakingItems.selected = _loc2_.value;
            break;
         case "ConfirmDropItem":
            this._mcTabViewer._btnConfirmDropItem.selected = _loc2_.value;
            break;
         case "TimestampInChat":
            this._mcTabViewer._btnChatTimestamp.selected = _loc2_.value;
            this.api.kernel.ChatManager.refresh();
            break;
         case "AudioMusicMute":
            this._mcTabViewer._btnMuteMusic.selected = _loc2_.value;
            break;
         case "AudioEffectMute":
            this._mcTabViewer._btnMuteSounds.selected = _loc2_.value;
            break;
         case "AudioEnvMute":
            this._mcTabViewer._btnMuteEnvironment.selected = _loc2_.value;
      }
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_cbDisplayStyle":
            var _loc3_ = _loc2_.target.selectedItem;
            if(_loc3_.style == "normal")
            {
               this.api.kernel.OptionsManager.setOption("DisplayStyle",_loc3_.style);
            }
            else
            {
               this.api.kernel.showMessage(this.api.lang.getText("OPTIONS_DISPLAY"),this.api.lang.getText("DO_U_CHANGE_DISPLAYSTYLE"),"CAUTION_YESNO",{name:"Display",listener:this,params:{style:_loc3_.style}});
            }
            break;
         case "_cbDefaultQuality":
            var _loc4_ = _loc2_.target.selectedItem;
            this.api.kernel.showMessage(this.api.lang.getText("OPTIONS_DISPLAY"),this.api.lang.getText("DO_U_CHANGE_QUALITY_" + String(_loc4_.quality).toUpperCase()),"CAUTION_YESNO",{name:"Quality",listener:this,params:{quality:_loc4_.quality}});
            break;
         case "_cbSpellIconsPack":
            var _loc5_ = _loc2_.target.selectedItem;
            var _loc6_ = _loc5_.frame;
            var _loc7_ = this.api.kernel.OptionsManager.getOption("RemasteredSpellIconsPack");
            if(_loc7_ == _loc6_)
            {
               break;
            }
            this.api.kernel.OptionsManager.setOption("RemasteredSpellIconsPack",_loc6_);
            this.selectRemasteredSpellIconsPack(_loc6_);
            var _loc8_ = dofus["\r\x14"].gapi.ui.Banner(this.gapi.getUIComponent("Banner"));
            if(_loc8_ != undefined)
            {
               _loc8_.shortcuts.updateSpells();
            }
            var _loc9_ = dofus["\r\x14"].gapi.ui.Spells(this.gapi.getUIComponent("Spells"));
            if(_loc9_ != undefined)
            {
               _loc9_.updateSpells();
               var _loc10_ = _loc9_.spellFullInfosViewer;
               if(_loc10_ != undefined)
               {
                  _loc10_.updateData();
               }
            }
            var _loc11_ = dofus["\r\x14"].gapi.ui.SpellViewerOnCreate(this.gapi.getUIComponent("SpellViewerOnCreate"));
            if(_loc11_ != undefined)
            {
               _loc11_.refreshSpellsPack();
            }
            break;
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "AskYesNoDisplay":
            this.api.kernel.OptionsManager.setOption("DisplayStyle",_loc2_.target.params.style);
            break;
         case "AskYesNoResetTips":
            dofus["\x0b\b"].TipsManager.getInstance().resetDisplayedTipsList();
            break;
         case "AskYesNoQuality":
            this.api.kernel.OptionsManager.setOption("DefaultQuality",_loc2_.target.params.quality);
      }
   }
   function no(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "AskYesNoDisplay":
            this.selectDisplayStyle(this.api.kernel.OptionsManager.getOption("DisplayStyle"));
            break;
         case "AskYesNoQuality":
            this.selectQuality(this.api.kernel.OptionsManager.getOption("DefaultQuality"));
      }
   }
   function scroll(§\x1e\x19\x0e§)
   {
      this._mcTabViewer._y = this._mcPlacer._y - this._sbOptions.scrollPosition;
   }
   function onMouseWheel(§\x06\n§, §\n\x1d§)
   {
      if(dofus["\r\x14"].gapi.ui.Zoom.isZooming())
      {
         return undefined;
      }
      if(String(_loc3_._target).indexOf(this._target) != -1 && this._sbOptions._visible)
      {
         this._sbOptions.scrollPosition -= _loc2_ <= 0 ? - dofus["\r\x14"].gapi.ui.Options.SCROLL_BY : dofus["\r\x14"].gapi.ui.Options.SCROLL_BY;
      }
   }
}
