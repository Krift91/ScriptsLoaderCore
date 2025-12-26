class dofus.§\r\x14§.gapi.ui.Banner extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _txtConsole;
   var _cChat;
   var _msShortcuts;
   var _mcXtra;
   var _sCurrentCircleXtra;
   var _btnFights;
   var _btnNextTurn;
   var _btnGiveUp;
   var _hHeart;
   var _pvAP;
   var _pvMP;
   var _mcChronoGrid;
   var _mcCircleXtraMaskBig;
   var _mcCurrentXtraMask;
   var _ccChrono;
   var _mcCircleXtraMask;
   var _nMiniMapCheckInterval;
   var _mcCircleXtraPlacer;
   var _sDefaultMaskType;
   var _mcRightPanel;
   var _mcRightPanelPlacer;
   var parent;
   var _mcbMovableBar;
   var _btnPvP;
   var _btnMount;
   var _btnGuild;
   var _btnStatsJob;
   var _btnSpells;
   var _btnInventory;
   var _btnQuests;
   var _btnMap;
   var _btnFriends;
   var _btnHelp;
   var toggleDisplay;
   var _lastKeyIsShortcut;
   var _bIsOnFocus;
   var _lblFinalCountDown;
   static var CHECK_MOUSE_POSITION_REFRESH_RATE = 250;
   static var CLASS_NAME = "Banner";
   static var NO_TRANSFORM = {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0};
   static var INACTIVE_TRANSFORM = {ra:50,rb:0,ga:50,gb:0,ba:50,bb:0};
   var _nFightsCount = 0;
   var _bChatAutoFocus = true;
   var _sChatPrefix = "";
   var _bHeartMovedTop = false;
   function Banner()
   {
      super();
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oData = _loc2_;
   }
   function get fightsCount()
   {
      return this._nFightsCount;
   }
   function set fightsCount(§\x05\b§)
   {
      this._nFightsCount = _loc2_;
      this.updateEye();
   }
   function get chatAutoFocus()
   {
      return this._bChatAutoFocus;
   }
   function set chatAutoFocus(§\x1b\x11§)
   {
      this._bChatAutoFocus = _loc2_;
   }
   function set txtConsole(§\x1e\f\x12§)
   {
      this._txtConsole.text = _loc2_;
   }
   function get chat()
   {
      return this._cChat;
   }
   function get shortcuts()
   {
      return this._msShortcuts;
   }
   function get illustration()
   {
      return this._mcXtra;
   }
   function get illustrationType()
   {
      return this._sCurrentCircleXtra;
   }
   function updateEye()
   {
      if(this._btnFights.icon == "")
      {
         this._btnFights.icon = "Eye2";
      }
      var _loc2_ = this._nFightsCount != 0 && !this.api.datacenter.Game.isFight;
      this._btnFights._visible = _loc2_;
   }
   function setSelectable(§\x15\x15§)
   {
      this._cChat.selectable = _loc2_;
   }
   function insertChat(§\x1e\f\x12§)
   {
      this._txtConsole.text += _loc2_;
   }
   function showNextTurnButton(§\x15\x0e§)
   {
      this._btnNextTurn._visible = _loc2_;
   }
   function showGiveUpButton(§\x15\x0e§)
   {
      if(_loc2_)
      {
         this.setXtraFightMask(true);
      }
      this._btnGiveUp._visible = _loc2_;
   }
   function moveHeart(§\x14\r§)
   {
      if(_loc2_)
      {
         if(!this._bHeartMovedTop)
         {
            this._hHeart._y -= 30;
         }
      }
      else if(this._bHeartMovedTop)
      {
         this._hHeart._y += 30;
      }
      this._bHeartMovedTop = _loc2_;
   }
   function showPoints(§\x15\x0e§)
   {
      this._pvAP._visible = _loc2_;
      this._pvMP._visible = _loc2_;
      this._cChat.showSitDown(!_loc2_);
      if(_loc2_)
      {
         this._oData.data.addEventListener("lpChanged",this);
         this._oData.data.addEventListener("apChanged",this);
         this._oData.data.addEventListener("mpChanged",this);
         this.apChanged({value:Math.max(0,this._oData.data.AP)});
         this.mpChanged({value:Math.max(0,this._oData.data.MP)});
      }
   }
   function setXtraFightMask(§\x18\x19§)
   {
      this._mcChronoGrid._visible = _loc2_;
      if(!_loc2_)
      {
         this.setXtraMask(this._mcCircleXtraMaskBig);
         if(this._mcCurrentXtraMask == this._mcCircleXtraMaskBig)
         {
            this._ccChrono.setGaugeChrono(100,2109246);
         }
      }
      else
      {
         this.setXtraMask(this._mcCircleXtraMask);
      }
      if(this._mcCurrentXtraMask == this._mcCircleXtraMaskBig)
      {
         if(this._bHeartMovedTop)
         {
            this.setMiniMapScale(dofus["\r\x14"].gapi.controls.MiniMap.SCALE_BIG);
         }
         else
         {
            this.setMiniMapScale(dofus["\r\x14"].gapi.controls.MiniMap.SCALE_NORMAL);
         }
      }
      else
      {
         this.setMiniMapScale(dofus["\r\x14"].gapi.controls.MiniMap.SCALE_SMALL);
      }
      this.displayMovableBar(this.api.kernel.OptionsManager.getOption("MovableBar") && (!this.api.kernel.OptionsManager.getOption("HideSpellBar") || this.api.datacenter.Game.isFight));
   }
   function setXtraMask(§\n\x14§)
   {
      this._mcCurrentXtraMask = _loc2_;
      this._mcXtra.setMask(_loc2_);
   }
   function showCircleXtra(§\x1e\x0b\x13§, §\x15\x0e§, §\x1e\x18\x0b§, §\x1e\x19\x1a§)
   {
      if(_loc2_ == undefined)
      {
         return null;
      }
      if(_loc2_ == this._sCurrentCircleXtra && _loc3_)
      {
         return null;
      }
      if(_loc2_ != this._sCurrentCircleXtra && !_loc3_)
      {
         return null;
      }
      if(this._sCurrentCircleXtra != undefined && _loc3_)
      {
         this.showCircleXtra(this._sCurrentCircleXtra,false);
      }
      var _loc8_ = new Object();
      var _loc9_ = new Array();
      if(_loc5_ == undefined)
      {
         _loc5_ = new Object();
      }
      this.api.kernel.OptionsManager.setOption("BannerIllustrationMode",_loc2_);
      if(this._nMiniMapCheckInterval != undefined)
      {
         _global.clearInterval(this._nMiniMapCheckInterval);
      }
      switch(_loc2_)
      {
         case "artwork":
            var _loc10_ = dofus.Constants.GUILDS_FACES_PATH + this.api.datacenter.Player.Guild + this.api.datacenter.Player.Sex + ".swf";
            var _loc6_ = "Loader";
            _loc8_ = {_x:this._mcCircleXtraMask._x,_y:this._mcCircleXtraMask._y,fallbackContentPath:_loc10_,contentPath:dofus.Constants.GUILDS_FACES_PATH + this._oData.data.gfxID + ".swf",enabled:true};
            _loc9_ = ["complete","click","over","out"];
            break;
         case "compass":
            var _loc11_ = this.api.datacenter.Map;
            _loc6_ = "Compass";
            _loc8_ = {_x:this._mcCircleXtraPlacer._x,_y:this._mcCircleXtraPlacer._y,_width:this._mcCircleXtraPlacer._width,_height:this._mcCircleXtraPlacer._height,arrow:"UI_BannerCompassArrow",noArrow:"UI_BannerCompassNoArrow",background:"UI_BannerCompassBack",targetCoords:this.api.datacenter.Basics.banner_targetCoords,currentCoords:[_loc11_.x,_loc11_.y]};
            _loc9_ = ["click","over","out"];
            break;
         case "clock":
            _loc6_ = "Clock";
            _loc8_ = {_x:this._mcCircleXtraPlacer._x,_y:this._mcCircleXtraPlacer._y,_width:this._mcCircleXtraPlacer._width,_height:this._mcCircleXtraPlacer._height,arrowHours:"UI_BannerClockArrowHours",arrowMinutes:"UI_BannerClockArrowMinutes",background:"UI_BannerClockBack",updateFunction:{object:this.api.kernel.NightManager,method:this.api.kernel.NightManager.getCurrentTime}};
            _loc9_ = ["click","over","out"];
            break;
         case "helper":
            _loc6_ = "Loader";
            if(dofus.Constants.DOUBLEFRAMERATE)
            {
               _loc8_ = {_x:this._mcCircleXtraPlacer._x,_y:this._mcCircleXtraPlacer._y,contentPath:"Helper_DoubleFramerate",enabled:true};
            }
            else
            {
               _loc8_ = {_x:this._mcCircleXtraPlacer._x,_y:this._mcCircleXtraPlacer._y,contentPath:"Helper",enabled:true};
            }
            _loc9_ = ["click","over","out"];
            break;
         case "map":
            this._nMiniMapCheckInterval = _global.setInterval(this,"checkMouseOnMiniMap",dofus["\r\x14"].gapi.ui.Banner.CHECK_MOUSE_POSITION_REFRESH_RATE);
            _loc6_ = "MiniMap";
            _loc8_ = {_x:this._mcCircleXtraPlacer._x,_y:this._mcCircleXtraPlacer._y,contentPath:"Map",enabled:true};
            _loc9_ = ["over"];
            break;
         default:
            _loc6_ = "Loader";
            _loc8_ = {_x:this._mcCircleXtraPlacer._x,_y:this._mcCircleXtraPlacer._y,_width:this._mcCircleXtraPlacer._width,_height:this._mcCircleXtraPlacer._height};
      }
      var _loc12_ = null;
      if(_loc3_)
      {
         for(var k in _loc8_)
         {
            _loc5_[k] = _loc8_[k];
         }
         _loc12_ = this.attachMovie(_loc6_,"_mcXtra",this.getNextHighestDepth(),_loc5_);
         this._sCurrentCircleXtra = _loc2_;
         if(_loc4_.bMask)
         {
            this._sDefaultMaskType = _loc4_.sMaskSize;
            if(!this.api.datacenter.Game.isFight && this.api.kernel.OptionsManager.getOption("BannerGaugeMode") == "none")
            {
               this.setXtraMask(this._mcCircleXtraMaskBig);
            }
            else
            {
               this.setXtraMask(this._mcCircleXtraMask);
            }
         }
         for(var k in _loc9_)
         {
            this._mcXtra.addEventListener(_loc9_[k],this);
         }
         this._mcXtra.swapDepths(this._mcCircleXtraPlacer);
      }
      else if(this._mcXtra != undefined)
      {
         for(var k in _loc9_)
         {
            this._mcXtra.removeEventListener(_loc9_[k],this);
         }
         this._mcCircleXtraPlacer.swapDepths(this._mcXtra);
         this._mcXtra.removeMovieClip();
         delete this._sCurrentCircleXtra;
      }
      if(_loc4_.bUpdateGauge)
      {
         dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
      }
      return _loc12_;
   }
   function setCircleXtraParams(§\x1e\x18\x0b§)
   {
      for(var k in _loc2_)
      {
         this._mcXtra[k] = _loc2_[k];
      }
   }
   function startTimer(§\x05\x19§)
   {
      this.moveHeart(false);
      this.setXtraFightMask(true);
      this._ccChrono.startTimer(_loc2_);
   }
   function redrawChrono()
   {
      this._ccChrono.redraw();
   }
   function stopTimer()
   {
      this._ccChrono.stopTimer();
   }
   function setChatText(§\x1e\f\x12§)
   {
      this._cChat.setText(_loc2_);
   }
   function showRightPanel(§\x1e\x0f\x07§, §\x1e\x18\x0b§, §\x15\x02§, §\x17\x13§)
   {
      if(this.api.datacenter.Game.isSpectator && this._mcRightPanel.bMouseSpriteRollover == true)
      {
         return undefined;
      }
      if(this._mcRightPanel.className == _loc2_ && !(this.api.datacenter.Game.isSpectator && _loc4_ == true))
      {
         return undefined;
      }
      if(!(this.api.datacenter.Game.isSpectator && _loc4_ != true))
      {
         if(this._mcRightPanel.className == _loc2_)
         {
            this._mcRightPanel.update(_loc3_.data);
         }
         else
         {
            if(this._mcRightPanel != undefined)
            {
               this.hideRightPanel(true);
            }
            _loc3_._x = this._mcRightPanelPlacer._x;
            _loc3_._y = this._mcRightPanelPlacer._y;
            var _loc6_ = this.attachMovie(_loc2_,"_mcRightPanel",this.getNextHighestDepth(),_loc3_);
            _loc6_.swapDepths(this._mcRightPanelPlacer);
            _loc6_.parent = this;
            _loc6_.onRollOver = function()
            {
               this.parent.hideRightPanel(true);
            };
         }
         this._mcRightPanel.bMouseSpriteRollover = _loc5_;
      }
   }
   function hideRightPanel(§\x15\x02§, §\x17\x14§)
   {
      if(_loc3_)
      {
         this._mcRightPanel.bMouseSpriteRollover = false;
      }
      if(this._mcRightPanel != undefined && !(this.api.datacenter.Game.isSpectator && _loc2_ != true))
      {
         this._mcRightPanel.swapDepths(this._mcRightPanelPlacer);
         this._mcRightPanel.removeMovieClip();
      }
   }
   function updateSmileysEmotes()
   {
      this._cChat.updateSmileysEmotes();
   }
   function showSmileysEmotesPanel(§\x15\x0e§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = true;
      }
      this._cChat.hideSmileys(!_loc2_);
      this._cChat._btnSmileys.selected = _loc2_;
   }
   function updateArtwork(§\x19\x12§)
   {
      if(this._sCurrentCircleXtra == "artwork")
      {
         if(_loc2_)
         {
            this.showCircleXtra(this._sCurrentCircleXtra,false);
            this.showCircleXtra("artwork",true,{bMask:true});
         }
         else
         {
            var _loc3_ = dofus.Constants.GUILDS_FACES_PATH + this.api.datacenter.Player.Guild + this.api.datacenter.Player.Sex + ".swf";
            this._mcXtra.fallbackContentPath = _loc3_;
            this._mcXtra.contentPath = dofus.Constants.GUILDS_FACES_PATH + this._oData.data.gfxID + ".swf";
         }
      }
   }
   function updateLocalPlayer()
   {
      this.updateArtwork(false);
      this._msShortcuts.meleeVisible = !this._oData.isMutant && this._msShortcuts.currentTab == dofus["\r\x14"].gapi.controls.MouseShortcuts.TAB_SPELLS;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Banner.CLASS_NAME);
   }
   function createChildren()
   {
      this._btnFights._visible = false;
      this.addToQueue({object:this,method:this.hideEpisodicContent});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.showPoints(false);
      this.showNextTurnButton(false);
      this.showGiveUpButton(false);
      this._mcRightPanelPlacer._visible = false;
      this._mcCircleXtraPlacer._visible = false;
      this.api.ui.unloadUIComponent("FightOptionButtons");
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
      this.api.kernel.KeyManager.addKeysListener("onKeys",this);
      this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_ON_CONNECT);
      this.api.network.Game.nLastMapIdReceived = -1;
      this._txtConsole.onSetFocus = function()
      {
         this._parent.onSetFocus();
      };
      this._txtConsole.onKillFocus = function()
      {
         this._parent.onKillFocus();
      };
      this._txtConsole.maxChars = dofus.Constants.MAX_MESSAGE_LENGTH + dofus.Constants.MAX_MESSAGE_LENGTH_MARGIN;
      ank.battlefield["\x1c\n"].useCacheAsBitmapOnStaticAnim = this.api.lang.getConfigText("USE_CACHEASBITMAP_ON_STATICANIM");
   }
   function linkMovableContainer()
   {
      var _loc2_ = this._mcbMovableBar.containers;
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc4_ = _loc2_[_loc3_];
         this._msShortcuts.setContainer(_loc3_ + 15,_loc4_);
         _loc4_.addEventListener("click",this._msShortcuts);
         _loc4_.addEventListener("dblClick",this._msShortcuts);
         _loc4_.addEventListener("over",this._msShortcuts);
         _loc4_.addEventListener("out",this._msShortcuts);
         _loc4_.addEventListener("drag",this._msShortcuts);
         _loc4_.addEventListener("drop",this._msShortcuts);
         _loc4_.addEventListener("onContentLoaded",this._msShortcuts);
         _loc4_.params = {position:_loc3_ + 15};
         _loc3_ = _loc3_ + 1;
      }
   }
   function addListeners()
   {
      this._btnPvP.addEventListener("click",this);
      this._btnMount.addEventListener("click",this);
      this._btnGuild.addEventListener("click",this);
      this._btnStatsJob.addEventListener("click",this);
      this._btnSpells.addEventListener("click",this);
      this._btnInventory.addEventListener("click",this);
      this._btnQuests.addEventListener("click",this);
      this._btnMap.addEventListener("click",this);
      this._btnFriends.addEventListener("click",this);
      this._btnFights.addEventListener("click",this);
      this._btnHelp.addEventListener("click",this);
      this._btnPvP.addEventListener("over",this);
      this._btnMount.addEventListener("over",this);
      this._btnGuild.addEventListener("over",this);
      this._btnStatsJob.addEventListener("over",this);
      this._btnSpells.addEventListener("over",this);
      this._btnInventory.addEventListener("over",this);
      this._btnQuests.addEventListener("over",this);
      this._btnMap.addEventListener("over",this);
      this._btnFriends.addEventListener("over",this);
      this._btnFights.addEventListener("over",this);
      this._btnHelp.addEventListener("over",this);
      this._btnPvP.addEventListener("out",this);
      this._btnMount.addEventListener("out",this);
      this._btnGuild.addEventListener("out",this);
      this._btnStatsJob.addEventListener("out",this);
      this._btnSpells.addEventListener("out",this);
      this._btnInventory.addEventListener("out",this);
      this._btnQuests.addEventListener("out",this);
      this._btnMap.addEventListener("out",this);
      this._btnFriends.addEventListener("out",this);
      this._btnFights.addEventListener("out",this);
      this._btnHelp.addEventListener("out",this);
      this._btnStatsJob.tabIndex = 0;
      this._btnSpells.tabIndex = 1;
      this._btnInventory.tabIndex = 2;
      this._btnQuests.tabIndex = 3;
      this._btnMap.tabIndex = 4;
      this._btnFriends.tabIndex = 5;
      this._btnGuild.tabIndex = 6;
      this._ccChrono.addEventListener("finalCountDown",this);
      this._ccChrono.addEventListener("beforeFinalCountDown",this);
      this._ccChrono.addEventListener("tictac",this);
      this._ccChrono.addEventListener("finish",this);
      this._cChat.addEventListener("filterChanged",this);
      this._cChat.addEventListener("selectSmiley",this);
      this._cChat.addEventListener("selectEmote",this);
      this._cChat.addEventListener("href",this);
      this._oData.addEventListener("lpChanged",this);
      this._oData.addEventListener("lpMaxChanged",this);
      this._btnNextTurn.addEventListener("click",this);
      this._btnNextTurn.addEventListener("over",this);
      this._btnNextTurn.addEventListener("out",this);
      this._btnGiveUp.addEventListener("click",this);
      this._btnGiveUp.addEventListener("over",this);
      this._btnGiveUp.addEventListener("out",this);
      this._oData.SpellsManager.addEventListener("spellLaunched",this);
      this._oData.SpellsManager.addEventListener("nextTurn",this);
      this._pvAP.addEventListener("over",this);
      this._pvAP.addEventListener("out",this);
      this._pvMP.addEventListener("over",this);
      this._pvMP.addEventListener("out",this);
      this._oData.Spells.addEventListener("modelChanged",this);
      this._oData.Inventory.addEventListener("modelChanged",this);
      this._hHeart.onRollOver = function()
      {
         this._parent.over({target:this});
      };
      this._hHeart.onRollOut = function()
      {
         this._parent.out({target:this});
      };
      this._hHeart.onRelease = function()
      {
         this.toggleDisplay();
      };
   }
   function initData()
   {
      switch(this.api.kernel.OptionsManager.getOption("BannerIllustrationMode"))
      {
         case "artwork":
            this.showCircleXtra("artwork",true,{bMask:true});
            break;
         case "clock":
            this.showCircleXtra("clock",true,{bMask:true});
            break;
         case "compass":
            this.showCircleXtra("compass",true);
         case "helper":
            this.showCircleXtra("helper",true);
         case "map":
            this.showCircleXtra("map",true,{bMask:true});
      }
      this.drawBar();
      this.lpMaxChanged({value:this._oData.LPmax});
      this.lpChanged({value:this._oData.LP});
      this.api.kernel.ChatManager.refresh();
      dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].setGaugeMode(this,this.api.kernel.OptionsManager.getOption("BannerGaugeMode"));
      if(this.api.kernel.OptionsManager.getOption("MovableBar"))
      {
         this.displayMovableBar(this.api.kernel.OptionsManager.getOption("MovableBar") && (!this.api.kernel.OptionsManager.getOption("HideSpellBar") || this.api.datacenter.Game.isFight));
      }
   }
   function setChatFocus()
   {
      Selection.setFocus(this._txtConsole);
   }
   function isChatFocus()
   {
      return eval(Selection.getFocus())._name == "_txtConsole";
   }
   function placeCursorAtTheEnd()
   {
      Selection.setFocus(this._txtConsole);
      Selection.setSelection(this._txtConsole.text.length,dofus.Constants.MAX_MESSAGE_LENGTH + dofus.Constants.MAX_MESSAGE_LENGTH_MARGIN);
   }
   function setChatFocusWithLastKey()
   {
      if(!this._bChatAutoFocus)
      {
         return undefined;
      }
      if(Selection.getFocus() != undefined)
      {
         return undefined;
      }
      this.setChatFocus();
      this.placeCursorAtTheEnd();
   }
   function setChatPrefix(§\x1e\x0e\x12§)
   {
      this._sChatPrefix = _loc2_;
      if(_loc2_ != "" && _loc2_ != "/s")
      {
         this._btnHelp.label = _loc2_;
         this._btnHelp.icon = "";
      }
      else
      {
         this._btnHelp.label = "";
         this._btnHelp.icon = "UI_BannerChatCommandAll";
      }
      this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
   }
   function getChatCommand()
   {
      var _loc2_ = this._txtConsole.text;
      var _loc3_ = _loc2_.split(" ");
      if(_loc3_[0].charAt(0) == "/")
      {
         return _loc2_;
      }
      if(this._sChatPrefix != "")
      {
         return this._sChatPrefix + " " + _loc2_;
      }
      return _loc2_;
   }
   function hideEpisodicContent()
   {
      this._btnPvP._visible = this.api.datacenter.Basics.aks_current_regional_version >= 16;
      this._btnMount._visible = this.api.datacenter.Basics.aks_current_regional_version >= 20;
      this._btnGuild._visible = !this.api.config.isStreaming;
      var _loc2_ = this._btnStatsJob._x;
      var _loc3_ = this._btnPvP._x;
      var _loc4_ = new Array();
      _loc4_.push(this._btnStatsJob);
      _loc4_.push(this._btnSpells);
      _loc4_.push(this._btnInventory);
      _loc4_.push(this._btnQuests);
      _loc4_.push(this._btnMap);
      _loc4_.push(this._btnFriends);
      if(this._btnGuild._visible)
      {
         _loc4_.push(this._btnGuild);
      }
      if(this._btnMount._visible)
      {
         _loc4_.push(this._btnMount);
      }
      if(this._btnPvP._visible)
      {
         _loc4_.push(this._btnPvP);
      }
      var _loc5_ = (_loc3_ - _loc2_) / (_loc4_.length - 1);
      var _loc6_ = 0;
      while(_loc6_ < _loc4_.length)
      {
         _loc4_[_loc6_]._x = _loc6_ * _loc5_ + _loc2_;
         _loc6_ = _loc6_ + 1;
      }
   }
   function displayChatHelp()
   {
      this.api.kernel.Console.process("/help");
      this._cChat.open(false);
   }
   function xpChanged()
   {
      dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
   }
   function energyChanged()
   {
      dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
   }
   function currentWeightChanged()
   {
      dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
   }
   function mountChanged()
   {
      dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
   }
   function currentJobChanged()
   {
      dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
   }
   function setMiniMapScale(§\x1e\x1d\x1a§)
   {
      if(this._sCurrentCircleXtra != "map")
      {
         return undefined;
      }
      this._mcXtra.setScale(_loc2_,true);
   }
   function displayMovableBar(§\x15\x0e§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = this._mcbMovableBar == undefined;
      }
      if(_loc2_)
      {
         if(this._mcbMovableBar._name != undefined)
         {
            return undefined;
         }
         this._mcbMovableBar = dofus["\r\x14"].gapi.ui.MovableContainerBar(this.api.ui.loadUIComponent("MovableContainerBar","MovableBar",[],{bAlwaysOnTop:true}));
         this._mcbMovableBar.addEventListener("drawBar",this);
         this._mcbMovableBar.addEventListener("drop",this);
         this._mcbMovableBar.addEventListener("dblClick",this);
         var _loc3_ = {left:0,top:0,right:this.gapi.screenWidth,bottom:this.gapi.screenHeight};
         var _loc4_ = this.api.kernel.OptionsManager.getOption("MovableBarSize");
         var _loc5_ = this.api.kernel.OptionsManager.getOption("MovableBarCoord");
         _loc5_ = !_loc5_ ? {x:0,y:(this.gapi.screenHeight - this._mcbMovableBar._height) / 2} : _loc5_;
         this.addToQueue({object:this._mcbMovableBar,method:this._mcbMovableBar.setOptions,params:[14,20,_loc3_,_loc4_,_loc5_]});
      }
      else
      {
         this.api.ui.unloadUIComponent("MovableBar");
      }
   }
   function setMovableBarSize(§\x1e\x1d\r§)
   {
      this._mcbMovableBar.size = _loc2_;
   }
   function chatInputHasText()
   {
      return this._txtConsole.text != undefined && this._txtConsole.text != "";
   }
   function onKeys(§\x1e\x11\x03§)
   {
      if(this._lastKeyIsShortcut)
      {
         this._lastKeyIsShortcut = false;
         return undefined;
      }
      this.setChatFocusWithLastKey();
   }
   function onShortcut(§\x1e\r\x14§)
   {
      var _loc3_ = true;
      switch(_loc2_)
      {
         case "CTRL_STATE_CHANGED_ON":
            if(this._bIsOnFocus && !(this.api.config.isLinux || this.api.config.isMac))
            {
               fscommand("trapallkeys","false");
            }
            break;
         case "CTRL_STATE_CHANGED_OFF":
            if(this._bIsOnFocus && !(this.api.config.isLinux || this.api.config.isMac))
            {
               fscommand("trapallkeys","true");
            }
            break;
         case "ESCAPE":
            if(this.isChatFocus())
            {
               Selection.setFocus(null);
               _loc3_ = false;
            }
            break;
         case "ACCEPT_CURRENT_DIALOG":
            if(this.isChatFocus())
            {
               if(this._txtConsole.text.length != 0)
               {
                  this.api.kernel.Console.process(this.getChatCommand(),this.api.datacenter.Basics.chatParams);
                  this.api.datacenter.Basics.chatParams = new Object();
                  if(this._txtConsole.text != undefined)
                  {
                     this._txtConsole.text = "";
                  }
                  _loc3_ = false;
               }
            }
            else if(this._bChatAutoFocus)
            {
               var _loc4_ = dofus["\r\x14"].gapi.ui.Debug(this.gapi.getUIComponent("Debug"));
               if(Selection.getFocus() != undefined && !(_loc4_ != undefined && (_loc4_.isFocused() && !_loc4_.commandInputHasText())))
               {
                  break;
               }
               _loc3_ = false;
               this.setChatFocus();
            }
            break;
         case "TEAM_MESSAGE":
            if(this.isChatFocus())
            {
               if(this._txtConsole.text.length != 0)
               {
                  var _loc5_ = this.getChatCommand();
                  if(_loc5_.charAt(0) == "/")
                  {
                     _loc5_ = _loc5_.substr(_loc5_.indexOf(" ") + 1);
                  }
                  this.api.kernel.Console.process("/t " + _loc5_,this.api.datacenter.Basics.chatParams);
                  this.api.datacenter.Basics.chatParams = new Object();
                  if(this._txtConsole.text != undefined)
                  {
                     this._txtConsole.text = "";
                  }
                  _loc3_ = false;
               }
            }
            else if(Selection.getFocus() == undefined && this._bChatAutoFocus)
            {
               _loc3_ = false;
               this.setChatFocus();
            }
            break;
         case "GUILD_MESSAGE":
            if(this.isChatFocus())
            {
               if(this._txtConsole.text.length != 0)
               {
                  var _loc6_ = this.getChatCommand();
                  if(_loc6_.charAt(0) == "/")
                  {
                     _loc6_ = _loc6_.substr(_loc6_.indexOf(" ") + 1);
                  }
                  this.api.kernel.Console.process("/g " + _loc6_,this.api.datacenter.Basics.chatParams);
                  this.api.datacenter.Basics.chatParams = new Object();
                  if(this._txtConsole.text != undefined)
                  {
                     this._txtConsole.text = "";
                  }
                  _loc3_ = false;
               }
            }
            else if(Selection.getFocus() == undefined && this._bChatAutoFocus)
            {
               _loc3_ = false;
               this.setChatFocus();
            }
            break;
         case "WHISPER_HISTORY_UP":
            if(this.isChatFocus())
            {
               this._txtConsole.text = this.api.kernel.Console.getWhisperHistoryUp();
               this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
               _loc3_ = false;
            }
            break;
         case "WHISPER_HISTORY_DOWN":
            if(this.isChatFocus())
            {
               this._txtConsole.text = this.api.kernel.Console.getWhisperHistoryDown();
               this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
               _loc3_ = false;
            }
            break;
         case "HISTORY_UP":
            if(this.isChatFocus())
            {
               var _loc7_ = this.api.kernel.Console.getHistoryUp();
               if(_loc7_ != undefined)
               {
                  this.api.datacenter.Basics.chatParams = _loc7_.params;
                  this._txtConsole.text = _loc7_.value;
               }
               this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
               _loc3_ = false;
            }
            break;
         case "HISTORY_DOWN":
            if(this.isChatFocus())
            {
               var _loc8_ = this.api.kernel.Console.getHistoryDown();
               if(_loc8_ != undefined)
               {
                  this.api.datacenter.Basics.chatParams = _loc8_.params;
                  this._txtConsole.text = _loc8_.value;
               }
               else
               {
                  this._txtConsole.text = "";
               }
               this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
               _loc3_ = false;
            }
            break;
         case "AUTOCOMPLETE":
            var _loc9_ = new Array();
            var _loc10_ = this.api.datacenter.Sprites.getItems();
            for(var k in _loc10_)
            {
               if(_loc10_[k] instanceof dofus.datacenter["\x13\x01"])
               {
                  _loc9_.push(_loc10_[k].name);
               }
            }
            var _loc11_ = this.api.kernel.Console.autoCompletion(_loc9_,this._txtConsole.text);
            if(!_loc11_.isFull)
            {
               if(_loc11_.list == undefined || _loc11_.list.length == 0)
               {
                  this.api.sounds.events.onError();
               }
               else
               {
                  this.api.ui.showTooltip(_loc11_.list.sort().join(", "),0,520);
               }
            }
            this._txtConsole.text = _loc11_.result + (!_loc11_.isFull ? "" : " ");
            this.placeCursorAtTheEnd();
            break;
         case "NEXTTURN":
            if(!this.isChatFocus() && this.api.datacenter.Game.isFight)
            {
               if(!this.api.datacenter.Game.isRunning)
               {
                  var _loc12_ = dofus["\r\x14"].gapi.ui.ChallengeMenu(this.gapi.getUIComponent("ChallengeMenu"));
                  if(_loc12_ != undefined)
                  {
                     _loc12_.sendReadyState();
                  }
               }
               else
               {
                  this.api.network.Game.prepareTurnEnd();
               }
               _loc3_ = false;
            }
            break;
         case "MAXI":
            this._cChat.open(false);
            _loc3_ = false;
            break;
         case "MINI":
            this._cChat.open(true);
            _loc3_ = false;
            break;
         case "CHARAC":
            if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
            {
               this.click({target:this._btnStatsJob});
               _loc3_ = false;
            }
            break;
         case "SPELLS":
            if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
            {
               this.click({target:this._btnSpells});
               _loc3_ = false;
            }
            break;
         case "INVENTORY":
            if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
            {
               this.click({target:this._btnInventory});
               _loc3_ = false;
            }
            break;
         case "QUESTS":
            if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
            {
               this.click({target:this._btnQuests});
               _loc3_ = false;
            }
            break;
         case "MAP":
            if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
            {
               this.click({target:this._btnMap});
               _loc3_ = false;
            }
            break;
         case "FRIENDS":
            if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
            {
               this.click({target:this._btnFriends});
               _loc3_ = false;
            }
            break;
         case "GUILD":
            if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
            {
               this.click({target:this._btnGuild});
               _loc3_ = false;
            }
            break;
         case "MOUNT":
            if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
            {
               this.click({target:this._btnMount});
               _loc3_ = false;
               break;
            }
      }
      this._lastKeyIsShortcut = _loc3_;
      return _loc3_;
   }
   function checkMouseOnMiniMap()
   {
      if(this._sCurrentCircleXtra != "map")
      {
         return undefined;
      }
      if(this._mcXtra.getMcBg().hitTest(_root._xmouse,_root._ymouse,true))
      {
         return undefined;
      }
      if(!this._bHeartMovedTop)
      {
         return undefined;
      }
      this.moveHeart(false);
      if(!this.api.datacenter.Game.isFight && this.api.kernel.OptionsManager.getOption("BannerGaugeMode") == "none")
      {
         this.setXtraMask(this._mcCircleXtraMaskBig);
      }
      else
      {
         this.setXtraMask(this._mcCircleXtraMask);
      }
      dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
   }
   function click(§\x1e\x19\x0e§)
   {
      this.api.kernel.GameManager.signalFightActivity();
      loop0:
      switch(_loc2_.target._name)
      {
         case "_btnPvP":
            this.api.sounds.events.onBannerRoundButtonClick();
            if(this.api.datacenter.Player.data.alignment.index == 0)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("NEED_ALIGNMENT"),"ERROR_CHAT");
            }
            else
            {
               this.showSmileysEmotesPanel(false);
               this.gapi.loadUIAutoHideComponent("Conquest","Conquest",{currentTab:"Stats"});
            }
            break;
         case "_btnMount":
            this.api.sounds.events.onBannerRoundButtonClick();
            if(this._oData.isMutant && !this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
               return undefined;
            }
            if(this._oData.mount != undefined)
            {
               this.showSmileysEmotesPanel(false);
               if(Key.isDown(Key.SHIFT))
               {
                  this.api.network.Exchange.request(15);
               }
               else if(this.gapi.getUIComponent("MountAncestorsViewer") != undefined)
               {
                  this.gapi.unloadUIComponent("MountAncestorsViewer");
                  this.gapi.unloadUIComponent("Mount");
               }
               else
               {
                  this.gapi.loadUIAutoHideComponent("Mount","Mount");
               }
            }
            else
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UI_ONLY_FOR_MOUNT"),"ERROR_CHAT");
            }
            break;
         case "_btnGuild":
            this.api.sounds.events.onBannerRoundButtonClick();
            if(this._oData.isMutant && !this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
               return undefined;
            }
            if(this._oData.guildInfos != undefined)
            {
               this.showSmileysEmotesPanel(false);
               this.gapi.loadUIAutoHideComponent("Guild","Guild",{currentTab:"Members"});
            }
            else
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UI_ONLY_FOR_GUILD"),"ERROR_CHAT");
            }
            break;
         case "_btnStatsJob":
            this.api.sounds.events.onBannerRoundButtonClick();
            if(this._oData.isMutant && !this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
               return undefined;
            }
            this.showSmileysEmotesPanel(false);
            this.gapi.loadUIAutoHideComponent("StatsJob","StatsJob");
            break;
         case "_btnSpells":
            this.api.sounds.events.onBannerRoundButtonClick();
            if(this._oData.isMutant && !this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
               return undefined;
            }
            this.showSmileysEmotesPanel(false);
            this.gapi.loadUIAutoHideComponent("Spells","Spells");
            break;
         case "_btnInventory":
            this.api.sounds.events.onBannerRoundButtonClick();
            this.showSmileysEmotesPanel(false);
            this.gapi.loadUIAutoHideComponent("Inventory","Inventory");
            break;
         case "_btnQuests":
            this.api.sounds.events.onBannerRoundButtonClick();
            this.showSmileysEmotesPanel(false);
            this.gapi.loadUIAutoHideComponent("Quests","Quests");
            break;
         case "_btnMap":
            this.api.sounds.events.onBannerRoundButtonClick();
            this.showSmileysEmotesPanel(false);
            this.gapi.loadUIAutoHideComponent("MapExplorer","MapExplorer");
            break;
         case "_btnFriends":
            this.api.sounds.events.onBannerRoundButtonClick();
            this.showSmileysEmotesPanel(false);
            this.gapi.loadUIAutoHideComponent("Friends","Friends");
            break;
         case "_btnFights":
            if(!this.api.datacenter.Game.isFight)
            {
               this.gapi.loadUIComponent("FightsInfos","FightsInfos",null,{bAlwaysOnTop:true});
            }
            break;
         case "_btnHelp":
            var _loc3_ = this.api.lang.getConfigText("CHAT_FILTERS");
            var _loc4_ = this.api.ui.createPopupMenu();
            _loc4_.addStaticItem(this.api.lang.getText("CHAT_PREFIX"));
            _loc4_.addItem(this.api.lang.getText("DEFAUT") + " (/s)",this,this.setChatPrefix,["/s"]);
            _loc4_.addItem(this.api.lang.getText("TEAM") + " (/t)",this,this.setChatPrefix,["/t"],this.api.datacenter.Game.isFight);
            _loc4_.addItem(this.api.lang.getText("PARTY") + " (/p)",this,this.setChatPrefix,["/p"],this.api.ui.getUIComponent("Party") != undefined);
            _loc4_.addItem(this.api.lang.getText("GUILD") + " (/g)",this,this.setChatPrefix,["/g"],this.api.datacenter.Player.guildInfos != undefined);
            if(_loc3_[4])
            {
               _loc4_.addItem(this.api.lang.getText("ALIGNMENT") + " (/a)",this,this.setChatPrefix,["/a"],this.api.datacenter.Player.alignment.index != 0);
            }
            if(_loc3_[5])
            {
               _loc4_.addItem(this.api.lang.getText("RECRUITMENT") + " (/r)",this,this.setChatPrefix,["/r"]);
            }
            if(_loc3_[6])
            {
               _loc4_.addItem(this.api.lang.getText("TRADE") + " (/b)",this,this.setChatPrefix,["/b"]);
            }
            if(_loc3_[7])
            {
               _loc4_.addItem(this.api.lang.getText("MEETIC") + " (/i)",this,this.setChatPrefix,["/i"]);
            }
            if(this.api.datacenter.Player.isAuthorized)
            {
               _loc4_.addItem(this.api.lang.getText("PRIVATE_CHANNEL") + " (/q)",this,this.setChatPrefix,["/q"]);
            }
            _loc4_.addItem(this.api.lang.getText("HELP"),this,this.displayChatHelp,[]);
            _loc4_.show(this._btnHelp._x,this._btnHelp._y,true);
            break;
         case "_btnNextTurn":
            if(this.api.datacenter.Game.isFight)
            {
               this.api.network.Game.prepareTurnEnd();
            }
            break;
         case "_btnGiveUp":
            if(this.api.datacenter.Game.isFight)
            {
               if(this.api.datacenter.Game.isSpectator)
               {
                  this.api.network.Game.leave();
               }
               else
               {
                  this.api.kernel.GameManager.giveUpGame();
               }
            }
            break;
         case "_mcXtra":
            if(!this.api.datacenter.Player.isAuthorized || this.api.datacenter.Player.isAuthorized && Key.isDown(Key.SHIFT))
            {
               if(this._sCurrentCircleXtra == "helper" && dofus["\x0b\b"].TipsManager.getInstance().hasNewTips())
               {
                  dofus["\x0b\b"].TipsManager.getInstance().displayNextTips();
                  break;
               }
               var _loc5_ = this.api.ui.createPopupMenu();
               _loc5_.addItem(this.api.lang.getText("SHOW") + " >>",dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"],dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeModeSelectMenu,[this]);
               if(this._sCurrentCircleXtra == "helper")
               {
                  _loc5_.addStaticItem(this.api.lang.getText("HELP_ME"));
                  _loc5_.addItem(this.api.lang.getText("KB_TITLE"),this.api.ui,this.api.ui.loadUIComponent,["KnownledgeBase","KnownledgeBase"],true);
                  _loc5_.addStaticItem(this.api.lang.getText("OTHER_DISPLAY_OPTIONS"));
               }
               _loc5_.addItem(this.api.lang.getText("BANNER_ARTWORK"),this,this.showCircleXtra,["artwork",true,{bMask:true,bUpdateGauge:true}],this._sCurrentCircleXtra != "artwork");
               _loc5_.addItem(this.api.lang.getText("BANNER_CLOCK"),this,this.showCircleXtra,["clock",true,{bMask:true,bUpdateGauge:true}],this._sCurrentCircleXtra != "clock");
               _loc5_.addItem(this.api.lang.getText("BANNER_COMPASS"),this,this.showCircleXtra,["compass",true,{bUpdateGauge:true}],this._sCurrentCircleXtra != "compass");
               _loc5_.addItem(this.api.lang.getText("BANNER_HELPER"),this,this.showCircleXtra,["helper",true,{bUpdateGauge:true}],this._sCurrentCircleXtra != "helper");
               _loc5_.addItem(this.api.lang.getText("BANNER_MAP"),this,this.showCircleXtra,["map",true,{bMask:true,bUpdateGauge:true}],this._sCurrentCircleXtra != "map");
               _loc5_.show(_root._xmouse,_root._ymouse,true);
            }
            else
            {
               this.api.kernel.GameManager.showPlayerPopupMenu(undefined,this.api.datacenter.Player.Name);
            }
            break;
         default:
            switch(this._msShortcuts.currentTab)
            {
               case "Spells":
                  this.api.sounds.events.onBannerSpellSelect();
                  if(this.api.kernel.TutorialManager.isTutorialMode)
                  {
                     this.api.kernel.TutorialManager.onWaitingCase({code:"SPELL_CONTAINER_SELECT",params:[Number(_loc2_.target._name.substr(4))]});
                     break loop0;
                  }
                  if(this.gapi.getUIComponent("Spells") != undefined)
                  {
                     return undefined;
                  }
                  var _loc6_ = _loc2_.target.contentData;
                  if(_loc6_ == undefined)
                  {
                     return undefined;
                  }
                  this.api.kernel.GameManager.switchToSpellLaunch(_loc6_,true);
                  break loop0;
               case "Items":
                  if(this.api.kernel.TutorialManager.isTutorialMode)
                  {
                     this.api.kernel.TutorialManager.onWaitingCase({code:"OBJECT_CONTAINER_SELECT",params:[Number(_loc2_.target._name.substr(4))]});
                     break loop0;
                  }
                  if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && (_loc2_.target.contentData != undefined && !_loc2_.target.notInChat))
                  {
                     this.api.kernel.GameManager.insertItemInChat(_loc2_.target.contentData);
                     return undefined;
                  }
                  _loc2_.target.notInChat = false;
                  var _loc7_ = this.gapi.getUIComponent("Inventory");
                  if(_loc7_ != undefined)
                  {
                     _loc7_.showItemInfos(_loc2_.target.contentData);
                     break loop0;
                  }
                  var _loc8_ = _loc2_.target.contentData;
                  if(_loc8_ == undefined)
                  {
                     return undefined;
                  }
                  if(this.api.datacenter.Player.canUseObject)
                  {
                     if(_loc8_.canTarget)
                     {
                        this.api.kernel.GameManager.switchToItemTarget(_loc8_);
                        break loop0;
                     }
                     if(_loc8_.canUse && _loc2_.keyBoard)
                     {
                        this.api.network.Items.use(_loc8_.ID);
                     }
                  }
                  break loop0;
            }
      }
   }
   function dblClick(§\x1e\x19\x0e§)
   {
      if(_loc2_.target == this._mcbMovableBar)
      {
         this._mcbMovableBar.size = this._mcbMovableBar.size != 0 ? 0 : this.api.kernel.OptionsManager.getOption("MovableBarSize");
         return undefined;
      }
   }
   function beforeFinalCountDown(§\x1e\x19\x0e§)
   {
      this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FINAL_COUNTDOWN);
   }
   function finalCountDown(§\x1e\x19\x0e§)
   {
      this._mcXtra._visible = false;
      this._lblFinalCountDown.text = _loc2_.value;
   }
   function tictac(§\x1e\x19\x0e§)
   {
      this.api.sounds.events.onBannerTimer();
   }
   function finish(§\x1e\x19\x0e§)
   {
      this._mcXtra._visible = true;
      if(this._lblFinalCountDown.text != undefined)
      {
         this._lblFinalCountDown.text = "";
      }
   }
   function complete(§\x1e\x19\x0e§)
   {
      var _loc3_ = this.api.kernel.OptionsManager.getOption("BannerIllustrationMode");
      if(_loc2_.target.contentPath.indexOf("artworks") != -1 && _loc3_ == "helper")
      {
         this.showCircleXtra("helper",true);
      }
      else
      {
         this.api.colors.addSprite(this._mcXtra.content,this._oData.data);
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      if(!this.gapi.isCursorHidden())
      {
         return undefined;
      }
      loop0:
      switch(_loc2_.target._name)
      {
         case "_btnHelp":
            this.gapi.showTooltip(this.api.lang.getText("CHAT_MENU"),_loc2_.target,-20,{bXLimit:false,bYLimit:false});
            break;
         case "_btnGiveUp":
            if(this.api.datacenter.Game.isSpectator)
            {
               var _loc3_ = this.api.lang.getText("GIVE_UP_SPECTATOR");
            }
            else if(this.api.datacenter.Game.fightType == dofus["\x0b\b"].GameManager.FIGHT_TYPE_CHALLENGE || !this.api.datacenter.Basics.aks_current_server.isHardcore())
            {
               _loc3_ = this.api.lang.getText("GIVE_UP");
            }
            else
            {
               _loc3_ = this.api.lang.getText("SUICIDE");
            }
            this.gapi.showTooltip(_loc3_,_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_btnPvP":
            this.gapi.showTooltip(this.api.lang.getText("CONQUEST_WORD"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_btnMount":
            this.gapi.showTooltip(this.api.lang.getText("MY_MOUNT"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_btnGuild":
            this.gapi.showTooltip(this.api.lang.getText("YOUR_GUILD"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_btnStatsJob":
            this.gapi.showTooltip(this.api.lang.getText("YOUR_STATS_JOB"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_btnSpells":
            this.gapi.showTooltip(this.api.lang.getText("YOUR_SPELLS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_btnQuests":
            this.gapi.showTooltip(this.api.lang.getText("YOUR_QUESTS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_btnInventory":
            var _loc4_ = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.currentWeight).addMiddleChar(" ",3);
            var _loc5_ = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.maxWeight).addMiddleChar(" ",3);
            var _loc6_ = this.api.lang.getText("PLAYER_WEIGHT",[_loc4_,_loc5_]);
            this.gapi.showTooltip(this.api.lang.getText("YOUR_INVENTORY") + "\n\n" + _loc6_,_loc2_.target,-43,{bXLimit:true,bYLimit:false});
            break;
         case "_btnMap":
            this.gapi.showTooltip(this.api.lang.getText("YOUR_BOOK"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_btnFriends":
            this.gapi.showTooltip(this.api.lang.getText("YOUR_FRIENDS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_btnFights":
            if(this._nFightsCount != 0)
            {
               this.gapi.showTooltip(ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("FIGHTS_ON_MAP",[this._nFightsCount]),"m",this._nFightsCount < 2),_loc2_.target,-20,{bYLimit:false});
            }
            break;
         case "_btnNextTurn":
            this.gapi.showTooltip(this.api.lang.getText("NEXT_TURN"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_pvAP":
            this.gapi.showTooltip(this.api.lang.getText("ACTIONPOINTS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_pvMP":
            this.gapi.showTooltip(this.api.lang.getText("MOVEPOINTS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_mcXtra":
            switch(this._sCurrentCircleXtra)
            {
               case "compass":
                  var _loc7_ = _loc2_.target.targetCoords;
                  if(_loc7_ == undefined)
                  {
                     this.gapi.showTooltip(this.api.lang.getText("BANNER_SET_FLAG"),_loc2_.target,0,{bXLimit:true,bYLimit:false});
                  }
                  else
                  {
                     this.gapi.showTooltip(_loc7_[0] + ", " + _loc7_[1],_loc2_.target,0,{bXLimit:true,bYLimit:false});
                  }
                  break;
               case "clock":
                  this.gapi.showTooltip(this.api.kernel.NightManager.time + "\n" + this.api.kernel.NightManager.getCurrentDateString(),_loc2_.target,0,{bXLimit:true,bYLimit:false});
            }
            if(!this.api.datacenter.Game.isFight)
            {
               this.setXtraMask(this._mcCircleXtraMaskBig);
               this.moveHeart(true);
               dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
            }
            break;
         case "_hHeart":
            this.gapi.showTooltip(this.api.lang.getText("HELP_LIFE"),_loc2_.target,-20);
            break;
         default:
            switch(this._msShortcuts.currentTab)
            {
               case "Spells":
                  var _loc8_ = _loc2_.target.contentData;
                  if(_loc8_ != undefined)
                  {
                     this.gapi.showTooltip(_loc8_.name + " (" + _loc8_.apCost + " " + this.api.lang.getText("AP") + (_loc8_.actualCriticalHit <= 0 ? "" : ", " + this.api.lang.getText("ACTUAL_CRITICAL_CHANCE") + ": 1/" + _loc8_.actualCriticalHit) + ")",_loc2_.target,-20,{bXLimit:true,bYLimit:false});
                  }
                  break loop0;
               case "Items":
                  var _loc9_ = _loc2_.target.contentData;
                  if(_loc9_ != undefined)
                  {
                     var _loc10_ = _loc9_.name;
                     if(this.gapi.getUIComponent("Inventory") == undefined)
                     {
                        if(_loc9_.canUse && _loc9_.canTarget)
                        {
                           _loc10_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_DBLCLICK_CLICK");
                        }
                        else
                        {
                           if(_loc9_.canUse)
                           {
                              _loc10_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_DBLCLICK");
                           }
                           if(_loc9_.canTarget)
                           {
                              _loc10_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_CLICK");
                           }
                        }
                     }
                     this.gapi.showTooltip(_loc10_,_loc2_.target,-30,{bXLimit:true,bYLimit:false});
                     break loop0;
                  }
            }
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "_mcXtra")
      {
         this.moveHeart(false);
         if(!this.api.datacenter.Game.isFight && this.api.kernel.OptionsManager.getOption("BannerGaugeMode") == "none")
         {
            this.setXtraMask(this._mcCircleXtraMaskBig);
         }
         else
         {
            this.setXtraMask(this._mcCircleXtraMask);
         }
         dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
      }
      this.gapi.hideTooltip();
   }
   function drag(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.contentData;
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      switch(this._msShortcuts.currentTab)
      {
         case "Spells":
            if(this.gapi.getUIComponent("Spells") == undefined && !Key.isDown(Key.SHIFT))
            {
               return undefined;
            }
            break;
         case "Items":
            if(this.gapi.getUIComponent("Inventory") == undefined && !Key.isDown(Key.SHIFT))
            {
               return undefined;
            }
            break;
      }
      this.gapi.removeCursor();
      this.gapi.setCursor(_loc3_,undefined,this._msShortcuts.currentTab == "Spells");
   }
   function drop(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) !== this._mcbMovableBar)
      {
         switch(this._msShortcuts.currentTab)
         {
            case "Spells":
               if(this.gapi.getUIComponent("Spells") == undefined && !Key.isDown(Key.SHIFT))
               {
                  return undefined;
               }
               var _loc3_ = this.gapi.getCursor();
               if(_loc3_ == undefined)
               {
                  return undefined;
               }
               this.gapi.removeCursor();
               var _loc4_ = _loc3_.position;
               var _loc5_ = _loc2_.target.params.position;
               if(_loc4_ == _loc5_)
               {
                  return undefined;
               }
               if(_loc4_ != undefined)
               {
                  this._msShortcuts.getContainer(_loc4_).contentData = undefined;
                  this._oData.SpellsUsed.removeItemAt(_loc4_);
               }
               var _loc6_ = this._msShortcuts.getContainer(_loc5_).contentData;
               if(_loc6_ != undefined)
               {
                  _loc6_.position = undefined;
               }
               _loc3_.position = _loc5_;
               _loc2_.target.contentData = _loc3_;
               this._oData.SpellsUsed.addItemAt(_loc5_,_loc3_);
               this.api.network.Spells.moveToUsed(_loc3_.ID,_loc5_);
               this.addToQueue({object:this._msShortcuts,method:this._msShortcuts.setSpellStateOnAllContainers});
               break;
            case "Items":
               if(this.gapi.getUIComponent("Inventory") == undefined && !Key.isDown(Key.SHIFT))
               {
                  return undefined;
               }
               var _loc7_ = this.gapi.getCursor();
               if(_loc7_ == undefined)
               {
                  return undefined;
               }
               if(!_loc7_.canMoveToShortut)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_MOVE_ITEM_HERE"),"ERROR_BOX");
                  return undefined;
               }
               this.gapi.removeCursor();
               var _loc8_ = _loc2_.target.params.position + dofus["\r\x14"].gapi.controls.MouseShortcuts.ITEM_OFFSET;
               if(_loc7_.position == _loc8_)
               {
                  return undefined;
               }
               if(_loc7_.Quantity > 1)
               {
                  var _loc9_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:_loc7_.Quantity,max:_loc7_.Quantity,useAllStage:true,params:{type:"drop",item:_loc7_,position:_loc8_}},{bAlwaysOnTop:true});
                  _loc9_.addEventListener("validate",this);
                  break;
               }
               this.api.network.Items.movement(_loc7_.ID,_loc8_,1);
               break;
         }
      }
      else
      {
         this.api.kernel.OptionsManager.setOption("MovableBarCoord",{x:this._mcbMovableBar._x,y:this._mcbMovableBar._y,v:this._mcbMovableBar._bVertical});
      }
   }
   function filterChanged(§\x1e\x19\x0e§)
   {
      this.api.network.Chat.subscribeChannels(_loc2_.filter,_loc2_.selected);
   }
   function lpChanged(§\x1e\x19\x0e§)
   {
      this._hHeart.value = _loc2_.value;
   }
   function lpMaxChanged(§\x1e\x19\x0e§)
   {
      this._hHeart.max = _loc2_.value;
   }
   function apChanged(§\x1e\x19\x0e§)
   {
      this._pvAP.value = _loc2_.value;
      if(!this.api.datacenter.Game.isFight)
      {
      }
      this._msShortcuts.setSpellStateOnAllContainers();
   }
   function mpChanged(§\x1e\x19\x0e§)
   {
      this._pvMP.value = Math.max(0,_loc2_.value);
   }
   function selectSmiley(§\x1e\x19\x0e§)
   {
      this.api.network.Chat.useSmiley(_loc2_.index);
   }
   function selectEmote(§\x1e\x19\x0e§)
   {
      this.api.network.Emotes.useEmote(_loc2_.index);
   }
   function spellLaunched(§\x1e\x19\x0e§)
   {
      this._msShortcuts.setSpellStateOnContainer(_loc2_.spell.position);
   }
   function nextTurn(§\x1e\x19\x0e§)
   {
      this._msShortcuts.setSpellStateOnAllContainers();
   }
   function href(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.params.split(",");
      switch(_loc3_[0])
      {
         case "OpenGuildTaxCollectors":
            this.addToQueue({object:this.gapi,method:this.gapi.loadUIAutoHideComponent,params:["Guild","Guild",{currentTab:"TaxCollectors"},{bStayIfPresent:true}]});
            break;
         case "OpenPayZoneDetails":
            this.addToQueue({object:this.gapi,method:this.gapi.loadUIComponent,params:["PayZoneDialog2","PayZoneDialog2",{name:"El Pemy",gfx:"9059",dialogID:dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_DETAILS},{bForceLoad:true}]});
            break;
         case "ShowPlayerPopupMenu":
            if(_loc3_[2] != undefined && (String(_loc3_[2]).length > 0 && _loc3_[2] != ""))
            {
               this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showPlayerPopupMenu,params:[undefined,_global.unescape(_loc3_[1]),null,null,null,_loc3_[2],this.api.datacenter.Player.isAuthorized]});
            }
            else
            {
               this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showPlayerPopupMenu,params:[undefined,_global.unescape(_loc3_[1]),null,null,null,null,this.api.datacenter.Player.isAuthorized]});
            }
            break;
         case "ShowMessagePopupMenu":
            if(_loc3_[3] != undefined && (String(_loc3_[3]).length > 0 && _loc3_[3] != ""))
            {
               this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showMessagePopupMenu,params:[_loc3_[1],_global.unescape(_loc3_[2]),_loc3_[3]]});
            }
            else
            {
               this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showMessagePopupMenu,params:[_loc3_[1],_global.unescape(_loc3_[2])]});
            }
            break;
         case "ShowItemViewer":
            var _loc4_ = this.api.kernel.ChatManager.getItemFromBuffer(Number(_loc3_[1]));
            if(_loc4_ == undefined)
            {
               this.addToQueue({object:this.api.kernel,method:this.api.kernel.showMessage,params:[this.api.lang.getText("ERROR_WORD"),this.api.lang.getText("ERROR_ITEM_CANT_BE_DISPLAYED"),"ERROR_BOX"]});
               break;
            }
            this.addToQueue({object:this.api.ui,method:this.api.ui.loadUIComponent,params:["ItemViewer","ItemViewer",{item:_loc4_},{bAlwaysOnTop:true}]});
            break;
         case "updateCompass":
            this.api.kernel.GameManager.updateCompass(Number(_loc3_[1]),Number(_loc3_[2]));
            break;
         case "ShowLinkWarning":
            this.addToQueue({object:this.api.ui,method:this.api.ui.loadUIComponent,params:["AskLinkWarning","AskLinkWarning",{text:this.api.lang.getText(_loc3_[1])}]});
      }
   }
   function validate(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.params.type) === "drop")
      {
         this.gapi.removeCursor();
         if(_loc2_.value > 0 && !_global.isNaN(Number(_loc2_.value)))
         {
            this.api.network.Items.movement(_loc2_.params.item.ID,_loc2_.params.position,Math.min(_loc2_.value,_loc2_.params.item.Quantity));
         }
      }
   }
   function drawBar(§\x1e\x19\x0e§)
   {
      this.linkMovableContainer();
      this._msShortcuts.updateCurrentTabInformations();
      this.updateEye();
   }
   function onSetFocus()
   {
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
      if(this.api.config.isLinux || this.api.config.isMac)
      {
         fscommand("trapallkeys","false");
      }
      else
      {
         this._bIsOnFocus = true;
      }
   }
   function onKillFocus()
   {
      if(this.api.config.isLinux || this.api.config.isMac)
      {
         fscommand("trapallkeys","true");
      }
      else
      {
         this._bIsOnFocus = false;
      }
   }
}
var _loc4_ = §§pop();
if(!_loc4_)
{
   _loc4_ = -1;
}
return _loc4_;
