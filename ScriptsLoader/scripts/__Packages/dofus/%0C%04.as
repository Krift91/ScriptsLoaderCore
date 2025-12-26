class dofus.§\f\x04§ extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var AudioManager;
   var CharactersManager;
   var ChatManager;
   var MapsServersManager;
   var DocumentsServersManager;
   var TutorialServersManager;
   var GameManager;
   var KeyManager;
   var NightManager;
   var AreasManager;
   var TutorialManager;
   var Console;
   var DebugConsole;
   var OptionsManager;
   var AdminManager;
   var DebugManager;
   var TipsManager;
   var SpellsBoostsManager;
   var SpeakingItemsManager;
   var StreamingDisplayManager;
   var _sendScreenInfoTimer;
   var stopDrag;
   var _dropTarget;
   var startDrag;
   var XTRA_LANG_FILES_LOADED = false;
   static var FAST_SWITCHING_SERVER_REQUEST = undefined;
   function §\f\x04§(oAPI)
   {
      super();
      this.initialize(oAPI);
      if(this.AudioManager == null)
      {
         dofus.sounds.AudioManager.initialize(_root.createEmptyMovieClip("SoundNest",99999),oAPI);
         this.AudioManager = dofus.sounds.AudioManager.getInstance();
      }
      if((this.CharactersManager = dofus["\x0b\b"].CharactersManager.getInstance()) == null)
      {
         this.CharactersManager = new dofus["\x0b\b"].CharactersManager(oAPI);
      }
      if((this.ChatManager = dofus["\x0b\b"].ChatManager.getInstance()) == null)
      {
         this.ChatManager = new dofus["\x0b\b"].ChatManager(oAPI);
      }
      if((this.MapsServersManager = dofus["\x0b\b"].MapsServersManager.getInstance()) == null)
      {
         this.MapsServersManager = new dofus["\x0b\b"].MapsServersManager();
      }
      if((this.DocumentsServersManager = dofus["\x0b\b"].DocumentsServersManager.getInstance()) == null)
      {
         this.DocumentsServersManager = new dofus["\x0b\b"].DocumentsServersManager();
      }
      if((this.TutorialServersManager = dofus["\x0b\b"].TutorialServersManager.getInstance()) == null)
      {
         this.TutorialServersManager = new dofus["\x0b\b"].TutorialServersManager();
      }
      if((this.GameManager = dofus["\x0b\b"].GameManager.getInstance()) == null)
      {
         this.GameManager = new dofus["\x0b\b"].GameManager(oAPI);
      }
      if((this.KeyManager = dofus["\x0b\b"].KeyManager.getInstance()) == null)
      {
         this.KeyManager = new dofus["\x0b\b"].KeyManager(oAPI);
      }
      if((this.NightManager = dofus["\x0b\b"].NightManager.getInstance()) == null)
      {
         this.NightManager = new dofus["\x0b\b"].NightManager(oAPI);
      }
      if((this.AreasManager = dofus["\x0b\b"].AreasManager.getInstance()) == null)
      {
         this.AreasManager = new dofus["\x0b\b"].AreasManager();
      }
      if((this.TutorialManager = dofus["\x0b\b"].TutorialManager.getInstance()) == null)
      {
         this.TutorialManager = new dofus["\x0b\b"].TutorialManager(oAPI);
      }
      this.Console = new dofus["\x1e\n\x07"]["\x12\x05"]["\x12\x1c"](oAPI);
      this.DebugConsole = new dofus["\x1e\n\x07"]["\x12\x05"]["\x11\x07"](oAPI);
      if((this.OptionsManager = dofus["\x0b\b"].OptionsManager.getInstance()) == null)
      {
         this.OptionsManager = new dofus["\x0b\b"].OptionsManager(oAPI);
      }
      if((this.AdminManager = dofus["\x0b\b"].AdminManager.getInstance()) == null)
      {
         this.AdminManager = new dofus["\x0b\b"].AdminManager(oAPI);
      }
      if((this.DebugManager = dofus["\x0b\b"].DebugManager.getInstance()) == null)
      {
         this.DebugManager = new dofus["\x0b\b"].DebugManager(oAPI);
      }
      if((this.TipsManager = dofus["\x0b\b"].TipsManager.getInstance()) == null)
      {
         this.TipsManager = new dofus["\x0b\b"].TipsManager(oAPI);
      }
      if((this.SpellsBoostsManager = dofus["\x0b\b"].SpellsBoostsManager.getInstance()) == null)
      {
         this.SpellsBoostsManager = new dofus["\x0b\b"].SpellsBoostsManager(oAPI);
      }
      if((this.SpeakingItemsManager = dofus["\x0b\b"].SpeakingItemsManager.getInstance()) == null)
      {
         this.SpeakingItemsManager = new dofus["\x0b\b"].SpeakingItemsManager(oAPI);
      }
      if((this.StreamingDisplayManager = dofus["\x0b\b"].StreamingDisplayManager.getInstance()) == null)
      {
         this.StreamingDisplayManager = new dofus["\x0b\b"].StreamingDisplayManager(oAPI);
      }
      dofus["\x0b\b"]["\x1e\n\n"].getInstance().update();
      this._sendScreenInfoTimer = _global.setInterval(this,"sendScreenInfo",1000);
   }
   function sendScreenInfo()
   {
      if(!this.api.datacenter.Basics.inGame || (this.api.datacenter.Game.isFight || this.api.datacenter.Game.isRunning))
      {
         return undefined;
      }
      _global.clearInterval(this._sendScreenInfoTimer);
      this.OptionsManager.setOption("sendResolution",true);
      this.api.network.Infos.sendScreenInfo();
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
   }
   function start()
   {
      this.api.ui.setScreenSize(742,556);
      if(this.getFlashVersion() > 8 && !this.api.electron.enabled)
      {
         Stage.showMenu = false;
      }
      if(this.OptionsManager.getOption("DisplayStyle") == "medium" && (System.capabilities.screenResolutionY < 950 && System.capabilities.playerType != "StandAlone"))
      {
         this.OptionsManager.setOption("DisplayStyle","normal");
      }
      else
      {
         this.setDisplayStyle(this.OptionsManager.getOption("DisplayStyle"),true);
      }
      if(this.api.config.isStreaming)
      {
         if(this.api.config.streamingMethod == "explod")
         {
            this.api.gfx.setStreaming(true,dofus.Constants.GFX_OBJECTS_PATH,dofus.Constants.GFX_GROUNDS_PATH);
         }
         this.api.gfx.setStreamingMethod(this.api.config.streamingMethod);
      }
      this.setQuality(this.OptionsManager.getOption("DefaultQuality"));
      this.autoLogon();
   }
   function quit(§\x1c\x0b§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = true;
      }
      if(!_loc2_)
      {
         if(System.capabilities.playerType == "StandAlone")
         {
            fscommand("quit","");
         }
         else
         {
            _root._loader.closeBrowserWindow();
         }
      }
      else
      {
         this.showMessage(undefined,this.api.lang.getText("DO_U_QUIT"),"CAUTION_YESNO",{name:"Quit"});
      }
   }
   function disconnect()
   {
      this.showMessage(undefined,this.api.lang.getText("DO_U_DISCONNECT"),"CAUTION_YESNO",{name:"Disconnect"});
   }
   function reboot()
   {
      this.api.network.disconnect(false,false);
      this.addToQueue({object:_root._loader,method:_root._loader.reboot});
   }
   function getFlashVersion()
   {
      return Number(getVersion().split(" ")[1].split(",")[0]);
   }
   function setQuality(§\x1e\x15\x1d§)
   {
      _root._quality = _loc2_;
   }
   function setDisplayStyle(§\x1e\r\b§, §\x1a\x15§)
   {
      if(System.capabilities.playerType == "StandAlone" && System.capabilities.os.indexOf("Windows") != -1)
      {
         var _loc4_ = new ank.external.display["\x1e\x13\x0e"]();
         switch(_loc2_)
         {
            case "normal":
               _loc4_.disable();
               break;
            case "medium":
               _loc4_.addEventListener("onScreenResolutionError",this);
               _loc4_.addEventListener("onScreenResolutionSuccess",this);
               if(_loc3_ != true)
               {
                  _loc4_.addEventListener("onExternalError",this);
               }
               _loc4_.enable(800,600,32);
               break;
            case "maximized":
               _loc4_.addEventListener("onScreenResolutionError",this);
               _loc4_.addEventListener("onScreenResolutionSuccess",this);
               if(_loc3_ != true)
               {
                  _loc4_.addEventListener("onExternalError",this);
               }
               _loc4_.enable(1024,768,32);
         }
      }
      else
      {
         _root._loader.setDisplayStyle(_loc2_);
      }
   }
   function onFastServerSwitchFail(§\x1e\x10\x02§)
   {
      dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST = undefined;
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      this.api.kernel.showMessage(undefined,"Fast server switching failed : " + _loc2_,"ERROR_BOX");
   }
   function onFastServerSwitchSuccess(§\x1e\x10\x02§)
   {
      dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST = undefined;
      this.api.kernel.showMessage(undefined,"<b>(Fast server switch)</b> : Welcome on <b>" + this.api.datacenter.Basics.aks_current_server.label + "</b>","COMMANDS_CHAT");
   }
   function changeServer(§\x17\x02§)
   {
      if(_loc2_ == true)
      {
         this.api.network.disconnect(true,false,true);
      }
      else
      {
         this.showMessage(undefined,this.api.lang.getText("DO_U_SWITCH_CHARACTER"),"CAUTION_YESNO",{name:"ChangeCharacter"});
      }
   }
   function showMessage(§\x1e\f\x0e§, §\x1e\x0f\x17§, §\x1e\f\x07§, §\x1e\x18\x0b§, §\x1e\x0b\x1c§)
   {
      switch(_loc4_)
      {
         case "CAUTION_YESNO":
            if(_loc2_ == undefined)
            {
               _loc2_ = this.api.lang.getText("CAUTION");
            }
            var _loc7_ = this.api.ui.loadUIComponent("AskYesNo","AskYesNo" + (_loc5_.name == undefined ? "" : _loc5_.name),{title:_loc2_,text:_loc3_,params:_loc5_.params},{bForceLoad:true});
            _loc7_.addEventListener("yes",_loc5_.listener != undefined ? _loc5_.listener : this);
            _loc7_.addEventListener("no",_loc5_.listener != undefined ? _loc5_.listener : this);
            break;
         case "CAUTION_YESNOIGNORE":
            if(_loc2_ == undefined)
            {
               _loc2_ = this.api.lang.getText("CAUTION");
            }
            var _loc8_ = this.api.ui.loadUIComponent("AskYesNoIgnore","AskYesNoIgnore" + (_loc5_.name == undefined ? "" : _loc5_.name),{title:_loc2_,text:_loc3_,player:_loc5_.player,params:_loc5_.params},{bForceLoad:true});
            _loc8_.addEventListener("yes",_loc5_.listener != undefined ? _loc5_.listener : this);
            _loc8_.addEventListener("no",_loc5_.listener != undefined ? _loc5_.listener : this);
            _loc8_.addEventListener("ignore",_loc5_.listener != undefined ? _loc5_.listener : this);
            break;
         case "ERROR_BOX":
            if(_loc2_ == undefined)
            {
               _loc2_ = this.api.lang.getText("ERROR_WORD");
            }
            this.api.ui.loadUIComponent("AskOK","AskOK" + (_loc5_.name == undefined ? "" : _loc5_.name),{title:_loc2_,text:_loc3_,params:_loc5_.params},{bForceLoad:true});
            break;
         case "WAIT_BOX":
            if(_loc2_ == undefined)
            {
               _loc2_ = this.api.lang.getText("CHAT_LINK_WARNING");
            }
            this.api.ui.loadUIComponent("AskOKWait","AskOKWait",{title:_loc2_,text:_loc3_,params:_loc5_.params},{bForceLoad:true});
            break;
         case "INFO_CANCEL":
            if(_loc2_ == undefined)
            {
               _loc2_ = this.api.lang.getText("INFORMATION");
            }
            var _loc9_ = this.api.ui.loadUIComponent("AskCancel","AskCancel" + (_loc5_.name == undefined ? "" : _loc5_.name),{title:_loc2_,text:_loc3_,params:_loc5_.params},{bForceLoad:true});
            _loc9_.addEventListener("cancel",_loc5_.listener != undefined ? _loc5_.listener : this);
            break;
         case "ERROR_CHAT":
            this.ChatManager.addText(_loc2_ != undefined ? "<b>" + _loc2_ + "</b> : " + _loc3_ : _loc3_,dofus.Constants.ERROR_CHAT_COLOR,true,_loc6_);
            break;
         case "MESSAGE_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.MSG_CHAT_COLOR,true,_loc6_);
            break;
         case "EMOTE_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.EMOTE_CHAT_COLOR,true,_loc6_);
            break;
         case "THINK_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.THINK_CHAT_COLOR,true,_loc6_);
            break;
         case "INFO_FIGHT_CHAT":
            if(!this.api.kernel.OptionsManager.getOption("ChatEffects"))
            {
               return undefined;
            }
         case "INFO_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.INFO_CHAT_COLOR,true,_loc6_);
            break;
         case "PVP_CHAT":
            _loc3_ = this.api.kernel.ChatManager.parseInlinePos(_loc3_);
            this.ChatManager.addText(_loc3_,dofus.Constants.PVP_CHAT_COLOR,true,_loc6_);
            break;
         case "WHISP_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.MSGCHUCHOTE_CHAT_COLOR,true,_loc6_);
            break;
         case "PARTY_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.GROUP_CHAT_COLOR,true,_loc6_);
            break;
         case "GUILD_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.GUILD_CHAT_COLOR,false,_loc6_);
            break;
         case "GUILD_CHAT_SOUND":
            this.ChatManager.addText(_loc3_,dofus.Constants.GUILD_CHAT_COLOR,true,_loc6_);
            break;
         case "RECRUITMENT_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.RECRUITMENT_CHAT_COLOR,false,_loc6_);
            break;
         case "TRADE_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.TRADE_CHAT_COLOR,false,_loc6_);
            break;
         case "MEETIC_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.MEETIC_CHAT_COLOR,false,_loc6_);
            break;
         case "ADMIN_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.ADMIN_CHAT_COLOR,false,_loc6_);
            break;
         case "COMMANDS_CHAT":
            this.ChatManager.addText(_loc3_,dofus.Constants.COMMANDS_CHAT_COLOR,false,_loc6_);
            break;
         case "DEBUG_LOG":
            this.api.datacenter.Basics.aks_a_logs += "\n<font color=\"#FFFFFF\">" + _loc3_ + "</font>";
            var _loc10_ = dofus["\r\x14"].gapi.ui.Debug(this.api.ui.getUIComponent("Debug"));
            if(_loc10_ != undefined)
            {
               _loc10_.refresh();
            }
            break;
         case "DEBUG_ERROR":
            this.api.datacenter.Basics.aks_a_logs += "\n<font color=\"#FF0000\">" + _loc3_ + "</font>";
            var _loc11_ = dofus["\r\x14"].gapi.ui.Debug(this.api.ui.getUIComponent("Debug"));
            if(_loc11_ != undefined)
            {
               _loc11_.refresh();
            }
            break;
         case "DEBUG_INFO":
            this.api.datacenter.Basics.aks_a_logs += "\n<font color=\"#00FF00\">" + _loc3_ + "</font>";
            var _loc12_ = dofus["\r\x14"].gapi.ui.Debug(this.api.ui.getUIComponent("Debug"));
            if(_loc12_ != undefined)
            {
               _loc12_.refresh();
               break;
            }
      }
   }
   function manualLogon()
   {
      this.initLogon();
      this.addToQueue({object:this.api.ui,method:this.api.ui.loadUIComponent,params:["Login","Login",{language:this.api.config.language,canAutoLogOn:false},{bStayIfPresent:true}]});
      this.addToQueue({object:_root._loader,method:_root._loader.onCoreDisplayed});
   }
   function autoLogon()
   {
      this.initLogon();
      this.addToQueue({object:this.api.ui,method:this.api.ui.loadUIComponent,params:["Login","Login",{language:this.api.config.language,canAutoLogOn:true},{bStayIfPresent:true}]});
      this.addToQueue({object:_root._loader,method:_root._loader.onCoreDisplayed});
   }
   function initLogon()
   {
      this.api.electron.updateWindowTitle();
      this.api.electron.setLoginDiscordActivity();
      this.api.ui.loadUIComponent("MainMenu","MainMenu",{quitMode:(!(System.capabilities.playerType == "PlugIn" && !this.api.electron.enabled) ? "quit" : "no")},{bStayIfPresent:true,bAlwaysOnTop:true});
   }
   function askClearCache()
   {
      this.showMessage(undefined,this.api.lang.getText("DO_U_CLEAR_CACHE"),"CAUTION_YESNO",{name:"ClearCache"});
   }
   function clearCache()
   {
      _root._loader.clearCache();
      this.reboot();
   }
   function findMovieClipPath()
   {
      if(this.api.ui.getUIComponent("Dragger") != undefined)
      {
         this.api.ui.unloadUIComponent("Dragger");
      }
      else
      {
         var _loc2_ = this.api.ui.loadUIComponent("Dragger","Dragger",undefined,{bForceLoad:true,bAlwaysOnTop:true});
         _loc2_.api = this.api;
         _loc2_.onRelease = function()
         {
            this.stopDrag();
            this.api.network.Basics.onAuthorizedCommand(true,"2" + new ank["\x1e\n\x07"]["\x0e\x1c"](this._dropTarget).replace("/","."));
            this.startDrag(true);
         };
         _loc2_.startDrag(true);
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "AskYesNoQuit":
            this.quit(false);
            break;
         case "AskYesNoDisconnect":
            this.api.network.disconnect(false,false);
            break;
         case "AskYesNoChangeCharacter":
            this.api.network.disconnect(true,false,true);
            break;
         case "AskYesNoClearCache":
            this.clearCache();
      }
   }
   function onInitAndLoginFinished()
   {
      this.MapsServersManager.initialize(this.api);
      this.DocumentsServersManager.initialize(this.api);
      this.TutorialServersManager.initialize(this.api);
      this.AreasManager.initialize(this.api);
      this.AdminManager.initialize(this.api);
      var _loc2_ = this.api.lang.getTimeZoneText();
      this.NightManager.initialize(_loc2_.tz.slice(),_loc2_.m.slice(),_loc2_.z,this.api.gfx);
      this.api.kernel.KeyManager.onSetChange(this.api.kernel.OptionsManager.getOption("ShortcutSet"));
      this.XTRA_LANG_FILES_LOADED = true;
      this.api.network.Account.sendConfiguredPort();
      this.api.network.Account.sendIdentity();
      this.api.network.Account.getServersList();
   }
   function onScreenResolutionError(§\x1e\x19\x0e§)
   {
      var _loc3_ = ank.external.display["\x1e\x13\x0e"](_loc2_.target);
      _loc3_.removeListeners();
   }
   function onScreenResolutionSuccess(§\x1e\x19\x0e§)
   {
      var _loc3_ = ank.external.display["\x1e\x13\x0e"](_loc2_.target);
      _loc3_.removeListeners();
   }
   function onExternalError(§\x1e\x19\x0e§)
   {
   }
}
