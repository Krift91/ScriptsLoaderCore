class dofus.§\x1e\n\x07§.§\x12\x05§.§\x12\x1c§ extends dofus.§\x1e\n\x07§.§\x12\x05§.§\x15§
{
   var _aWhisperHistory;
   var _nWhisperHistoryPointer;
   function §\x12\x1c§(oAPI)
   {
      super();
      this.initialize(oAPI);
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      this._aWhisperHistory = new Array();
      this._nWhisperHistoryPointer = 0;
   }
   function process(§\x1e\x13\x19§, §\x1e\x18\x0b§)
   {
      super.process(_loc3_,_loc4_);
      _loc3_ = this.parseSpecialDatas(_loc3_);
      if(_loc3_.charAt(0) == "/")
      {
         var _loc5_ = _loc3_.split(" ");
         var _loc6_ = _loc5_[0].substr(1).toUpperCase();
         _loc5_.splice(0,1);
         while(_loc5_[0].length == 0)
         {
            _loc5_.splice(0,1);
         }
         switch(_loc6_)
         {
            case "HELP":
            case "H":
            case "?":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("COMMANDS_HELP"),"COMMANDS_CHAT");
               break;
            case "VERSION":
            case "VER":
            case "ABOUT":
               var _loc7_ = "--------------------------------------------------------------\n";
               _loc7_ += "<b>DOFUS RETRO Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + "</b>";
               if(dofus.Constants.BETAVERSION > 0)
               {
                  _loc7_ += " <b><font color=\"#FF0000\">BETA VERSION " + dofus.Constants.BETAVERSION + "</font></b>";
               }
               _loc7_ += "\n(c) ANKAMA GAMES (" + dofus.Constants.VERSIONDATE + ")\n";
               _loc7_ += "Flash player " + System.capabilities.version + "\n";
               _loc7_ += "--------------------------------------------------------------";
               this.api.kernel.showMessage(undefined,_loc7_,"COMMANDS_CHAT");
               break;
            case "S":
               this.api.network.Chat.send(_loc5_.join(" "),"*",_loc4_);
               break;
            case "T":
               this.api.network.Chat.send(_loc5_.join(" "),"#",_loc4_);
               break;
            case "G":
               if(this.api.datacenter.Player.guildInfos != undefined)
               {
                  this.api.network.Chat.send(_loc5_.join(" "),"%",_loc4_);
               }
               break;
            case "P":
               if(this.api.ui.getUIComponent("Party") != undefined)
               {
                  this.api.network.Chat.send(_loc5_.join(" "),"$",_loc4_);
               }
               break;
            case "A":
               this.api.network.Chat.send(_loc5_.join(" "),"!",_loc4_);
               break;
            case "R":
               this.api.network.Chat.send(_loc5_.join(" "),"?",_loc4_);
               break;
            case "B":
               this.api.network.Chat.send(_loc5_.join(" "),":",_loc4_);
               break;
            case "I":
               this.api.network.Chat.send(_loc5_.join(" "),"^",_loc4_);
               break;
            case "Q":
               this.api.network.Chat.send(_loc5_.join(" "),"@",_loc4_);
               break;
            case "M":
               this.api.network.Chat.send(_loc5_.join(" "),"¤",_loc4_);
               break;
            case "W":
            case "MSG":
            case "WHISPER":
               if(_loc5_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w &lt;" + this.api.lang.getText("NAME") + "&gt; &lt;" + this.api.lang.getText("MSG") + "&gt;"]),"ERROR_CHAT");
                  break;
               }
               var _loc8_ = _loc5_[0];
               if(_loc8_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w &lt;" + this.api.lang.getText("NAME") + "&gt; &lt;" + this.api.lang.getText("MSG") + "&gt;"]),"ERROR_CHAT");
                  break;
               }
               _loc5_.shift();
               var _loc9_ = _loc5_.join(" ");
               this.pushWhisper("/w " + _loc8_ + " ");
               this.api.network.Chat.send(_loc9_,_loc8_,_loc4_);
               break;
            case "WHOAMI":
               this.api.network.Basics.whoAmI();
               break;
            case "WHOIS":
               if(_loc5_.length == 0)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /whois &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
                  break;
               }
               this.api.network.Basics.whoIs(_loc5_[0]);
               break;
            case "F":
            case "FRIEND":
            case "FRIENDS":
               switch(_loc5_[0].toUpperCase())
               {
                  case "A":
                  case "+":
                     this.api.network.Friends.addFriend(_loc5_[1]);
                     break;
                  case "D":
                  case "R":
                  case "-":
                     this.api.network.Friends.removeFriend(_loc5_[1]);
                     break;
                  case "L":
                     this.api.network.Friends.getFriendsList();
                     break;
                  default:
                     this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /f &lt;A/D/L&gt; &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
               }
               break;
            case "IGNORE":
            case "ENEMY":
               switch(_loc5_[0].toUpperCase())
               {
                  case "A":
                  case "+":
                     this.api.network.Enemies.addEnemy(_loc5_[1]);
                     break;
                  case "D":
                  case "R":
                  case "-":
                     this.api.network.Enemies.removeEnemy(_loc5_[1]);
                     break;
                  case "L":
                     this.api.network.Enemies.getEnemiesList();
                     break;
                  default:
                     this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /f &lt;A/D/L&gt; &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
               }
               break;
            case "PING":
               this.api.network.ping();
               break;
            case "GOD":
            case "GODMODE":
               var _loc12_ = Math.random();
               if(_loc12_ >= 0.5)
               {
                  var _loc13_ = ["Bill","Tyn","Nyx","Lichen","Simsoft"];
                  var _loc10_ = _loc13_[Math.floor(Math.random() * _loc13_.length)];
                  var _loc11_ = "Legacy";
               }
               else
               {
                  var _loc14_ = ["Kam","ToT","Sispano","LeLag","DUSK","Logan","Lakha","Sannho","Treuff","Artand","Ekyn","Bonzho","Simeth","Asthenis","Oopah"];
                  _loc10_ = _loc14_[Math.floor(Math.random() * _loc14_.length)];
                  _loc11_ = "1.30+";
               }
               this.api.kernel.showMessage(undefined,"God : <u>" + _loc10_ + "</u> (Retro <b>" + _loc11_ + "</b>)","COMMANDS_CHAT");
               break;
            case "APING":
               this.api.kernel.showMessage(undefined,"Average ping : " + this.api.network.getAveragePing() + "ms (on " + this.api.network.getAveragePingPacketsCount() + " packets)","COMMANDS_CHAT");
               break;
            case "MAPID":
               this.api.kernel.showMessage(undefined,"MAP ID : " + this.api.datacenter.Map.id,"COMMANDS_CHAT");
               if(this.api.datacenter.Player.isAuthorized)
               {
                  this.api.kernel.showMessage(undefined,"Area : " + this.api.datacenter.Map.area,"COMMANDS_CHAT");
                  this.api.kernel.showMessage(undefined,"Sub area : " + this.api.datacenter.Map.subarea,"COMMANDS_CHAT");
                  this.api.kernel.showMessage(undefined,"Super Area : " + this.api.datacenter.Map.superarea,"COMMANDS_CHAT");
               }
               break;
            case "CELLID":
               this.api.kernel.showMessage(undefined,"CELL ID : " + this.api.datacenter.Player.data.cellNum,"COMMANDS_CHAT");
               break;
            case "TIME":
               this.api.kernel.showMessage(undefined,this.api.kernel.NightManager.date + " - " + this.api.kernel.NightManager.time,"COMMANDS_CHAT");
               break;
            case "LIST":
            case "PLAYERS":
               if(!this.api.datacenter.Game.isFight)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc6_]),"ERROR_CHAT");
                  return undefined;
               }
               var _loc15_ = new Array();
               var _loc16_ = this.api.datacenter.Sprites.getItems();
               for(var k in _loc16_)
               {
                  if(_loc16_[k] instanceof dofus.datacenter["\x13\x01"])
                  {
                     _loc15_.push("- " + _loc16_[k].name);
                  }
               }
               this.api.kernel.showMessage(undefined,this.api.lang.getText("PLAYERS_LIST") + " :\n" + _loc15_.join("\n"),"COMMANDS_CHAT");
               break;
            case "KICK":
               if(!this.api.datacenter.Game.isFight || this.api.datacenter.Game.isRunning)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc6_]),"ERROR_CHAT");
                  return undefined;
               }
               var _loc17_ = String(_loc5_[0]);
               var _loc18_ = this.api.datacenter.Sprites.getItems();
               for(var k in _loc18_)
               {
                  if(_loc18_[k] instanceof dofus.datacenter["\x13\x01"] && _loc18_[k].name == _loc17_)
                  {
                     var _loc19_ = _loc18_[k].id;
                     break;
                  }
               }
               if(_loc19_ != undefined)
               {
                  this.api.network.Game.leave(_loc19_);
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_KICK_A",[_loc17_]),"ERROR_CHAT");
               }
               break;
            case "SPECTATOR":
            case "SPEC":
               if(!this.api.datacenter.Game.isRunning || this.api.datacenter.Game.isSpectator)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc6_]),"ERROR_CHAT");
                  return undefined;
               }
               this.api.network.Fights.blockSpectators();
               break;
            case "AWAY":
               this.api.network.Basics.away();
               break;
            case "INVISIBLE":
               this.api.network.Basics.invisible();
               break;
            case "INVITE":
               var _loc20_ = String(_loc5_[0]);
               if(_loc20_.length == 0 || _loc20_ == undefined)
               {
                  break;
               }
               this.api.network.Party.invite(_loc20_);
               break;
            case "CONSOLE":
               if(this.api.datacenter.Player.isAuthorized)
               {
                  this.api.ui.loadUIComponent("Debug","Debug",undefined,{bAlwaysOnTop:true});
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc6_]),"ERROR_CHAT");
               }
               break;
            case "DEBUG":
               if(this.api.datacenter.Player.isAuthorized)
               {
                  this.api.kernel.DebugManager.toggleDebug();
               }
               break;
            case "CHANGECHARACTER":
               this.api.kernel.changeServer();
               break;
            case "LOGOUT":
               this.api.kernel.disconnect();
               break;
            case "QUIT":
               this.api.kernel.quit();
               break;
            case "THINK":
            case "METHINK":
            case "PENSE":
            case "TH":
               if(_loc5_.length < 1)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /" + _loc6_.toLowerCase() + " &lt;" + this.api.lang.getText("TEXT_WORD") + "&gt;"]),"ERROR_CHAT");
                  break;
               }
               var _loc21_ = "!THINK!" + _loc5_.join(" ");
               if(this.api.datacenter.Player.canChatToAll)
               {
                  this.api.network.Chat.send(_loc21_,"*",_loc4_);
               }
               break;
            case "ME":
            case "EM":
            case "MOI":
            case "EMOTE":
               if(!this.api.lang.getConfigText("EMOTES_ENABLED"))
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc6_]),"ERROR_CHAT");
                  break;
               }
               if(_loc5_.length < 1)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /" + _loc6_.toLowerCase() + " &lt;" + this.api.lang.getText("TEXT_WORD") + "&gt;"]),"ERROR_CHAT");
                  break;
               }
               var _loc22_ = _loc5_.join(" ");
               if(this.api.datacenter.Player.canChatToAll)
               {
                  this.api.network.Chat.send(dofus.Constants.EMOTE_CHAR + _loc22_ + dofus.Constants.EMOTE_CHAR,"*",_loc4_);
               }
               break;
            case "KB":
               this.api.ui.loadUIComponent("KnownledgeBase","KnownledgeBase");
               break;
            case "RELEASE":
               if(this.api.datacenter.Player.data.isTomb)
               {
                  this.api.network.Game.freeMySoul();
               }
               else if(this.api.datacenter.Player.data.isSlow)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ALREADY_A_GHOST"),"ERROR_CHAT");
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_NOT_DEAD_AT_LEAST_FOR_NOW"),"ERROR_CHAT");
               }
               break;
            case "SELECTION":
               if(_loc5_[0] == "enable" || _loc5_[0] == "on")
               {
                  dofus["\r\x14"].gapi.ui.Banner(this.api.ui.getUIComponent("Banner")).setSelectable(true);
               }
               else if(_loc5_[0] == "disable" || _loc5_[0] == "off")
               {
                  dofus["\r\x14"].gapi.ui.Banner(this.api.ui.getUIComponent("Banner")).setSelectable(false);
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",["/selection [enable|on|disable|off]"]),"ERROR_CHAT");
               }
               break;
            case "WTF":
            case "DOFUS2":
               this.api.kernel.showMessage(undefined,"(°~°)","ERROR_BOX");
               break;
            case "TACTIC":
               if(this.api.datacenter.Player.isAuthorized || this.api.datacenter.Game.isFight)
               {
                  this.api.datacenter.Game.isTacticMode = !this.api.datacenter.Game.isTacticMode;
                  this.api.ui.getUIComponent("FightOptionButtons")._btnTactic.selected = this.api.datacenter.Game.isTacticMode;
               }
               break;
            case "FILEOUTPUT":
               if(this.api.electron.enabled)
               {
                  var _loc23_ = Number(_loc5_[0]);
                  if(_loc5_[0] == undefined || (_global.isNaN(_loc23_) || (_loc23_ < 0 || _loc23_ > 2)))
                  {
                     this.api.kernel.showMessage(undefined,"/fileoutput &lt;0 (disabled) | 1 (enabled) | 2 (full)&gt;","ERROR_CHAT");
                     return undefined;
                  }
                  var _loc24_ = "";
                  switch(_loc23_)
                  {
                     case 0:
                        _loc24_ = "Disabled";
                        break;
                     case 1:
                        _loc24_ = "Enabled";
                        break;
                     case 2:
                        _loc24_ = "Enabled (full)";
                  }
                  this.api.kernel.ChatManager.fileOutput = _loc23_;
                  this.api.kernel.showMessage(undefined,"File Output (Chat) : " + _loc24_,"COMMANDS_CHAT");
               }
               else
               {
                  this.api.kernel.showMessage(undefined,"Does not work on a Flash Projector","COMMANDS_CHAT");
               }
               break;
            case "CLS":
            case "CLEAR":
               this.api.kernel.ChatManager.clear();
               this.api.kernel.ChatManager.refresh(true);
               break;
            case "SPEAKINGITEM":
               if(this.api.datacenter.Player.isAuthorized)
               {
                  this.api.kernel.showMessage(undefined,"Count : " + this.api.kernel.SpeakingItemsManager.nextMsgDelay,"ERROR_CHAT");
                  break;
               }
            default:
               var _loc25_ = this.api.lang.getEmoteID(_loc6_.toLowerCase());
               if(_loc25_ != undefined)
               {
                  this.api.network.Emotes.useEmote(_loc25_);
                  break;
               }
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc6_]),"ERROR_CHAT");
               break;
         }
      }
      else if(this.api.datacenter.Player.canChatToAll)
      {
         this.api.network.Chat.send(_loc3_,"*",_loc4_);
      }
   }
   function pushWhisper(§\x1e\x13\x19§)
   {
      var _loc3_ = this._aWhisperHistory.slice(-1);
      if(_loc3_[0] != _loc2_)
      {
         var _loc4_ = this._aWhisperHistory.push(_loc2_);
         if(_loc4_ > 50)
         {
            this._aWhisperHistory.shift();
         }
      }
      this.initializePointers();
   }
   function getWhisperHistoryUp()
   {
      if(this._nWhisperHistoryPointer > 0)
      {
         this._nWhisperHistoryPointer--;
      }
      var _loc2_ = this._aWhisperHistory[this._nWhisperHistoryPointer];
      return _loc2_ == undefined ? "" : _loc2_;
   }
   function getWhisperHistoryDown()
   {
      if(this._nWhisperHistoryPointer < this._aWhisperHistory.length)
      {
         this._nWhisperHistoryPointer++;
      }
      var _loc2_ = this._aWhisperHistory[this._nWhisperHistoryPointer];
      return _loc2_ == undefined ? "" : _loc2_;
   }
   function initializePointers()
   {
      super.initializePointers();
      this._nWhisperHistoryPointer = this._aWhisperHistory.length;
   }
   function parseSpecialDatas(§\x1e\x14\x1c§)
   {
      ank["\x1e\n\x07"]["\x0e\x1b"].addExtensions();
      var _loc3_ = this.api.lang.getText("INLINE_VARIABLE_POSITION").split(",");
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc3_,"[" + this.api.datacenter.Map.x + ", " + this.api.datacenter.Map.y + "]");
      var _loc4_ = this.api.lang.getText("INLINE_VARIABLE_AREA").split(",");
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc4_,this.api.lang.getMapAreaText(this.api.datacenter.Map.area).n);
      var _loc5_ = this.api.lang.getText("INLINE_VARIABLE_SUBAREA").split(",");
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc5_,this.api.lang.getMapSubAreaText(this.api.datacenter.Map.subarea).n);
      var _loc6_ = this.api.lang.getText("INLINE_VARIABLE_MYSELF").split(",");
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc6_,this.api.datacenter.Player.Name);
      var _loc7_ = this.api.lang.getText("INLINE_VARIABLE_LEVEL").split(",");
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc7_,String(this.api.datacenter.Player.Level));
      var _loc8_ = this.api.lang.getText("INLINE_VARIABLE_GUILD").split(",");
      var _loc9_ = this.api.datacenter.Player.guildInfos.name;
      if(_loc9_ == undefined)
      {
         _loc9_ = this.api.lang.getText("INLINE_VARIABLE_GUILD_ERROR");
      }
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc8_,_loc9_);
      var _loc10_ = this.api.lang.getText("INLINE_VARIABLE_MAXLIFE").split(",");
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc10_,String(this.api.datacenter.Player.LPmax));
      var _loc11_ = this.api.lang.getText("INLINE_VARIABLE_LIFE").split(",");
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc11_,String(this.api.datacenter.Player.LP));
      var _loc12_ = this.api.lang.getText("INLINE_VARIABLE_LIFEPERCENT").split(",");
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc12_,String(Math.round(this.api.datacenter.Player.LP / this.api.datacenter.Player.LPmax * 100)));
      var _loc13_ = this.api.lang.getText("INLINE_VARIABLE_EXPERIENCE").split(",");
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc13_,String(Math.floor((this.api.datacenter.Player.XP - this.api.datacenter.Player.XPlow) / (this.api.datacenter.Player.XPhigh - this.api.datacenter.Player.XPlow) * 100)) + "%");
      var _loc14_ = this.api.lang.getText("INLINE_VARIABLE_STATS").split(",");
      if(new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc14_,"X").length != _loc2_.length)
      {
         var _loc15_ = this.api.lang.getText("INLINE_VARIABLE_STATS_RESULT",[String(this.api.datacenter.Player.Vitality) + (this.api.datacenter.Player.VitalityXtra == 0 ? "" : " (" + ((this.api.datacenter.Player.VitalityXtra <= 0 ? "" : "+") + String(this.api.datacenter.Player.VitalityXtra)) + ")"),String(this.api.datacenter.Player.Wisdom) + (this.api.datacenter.Player.WisdomXtra == 0 ? "" : " (" + ((this.api.datacenter.Player.WisdomXtra <= 0 ? "" : "+") + String(this.api.datacenter.Player.WisdomXtra)) + ")"),String(this.api.datacenter.Player.Force) + (this.api.datacenter.Player.ForceXtra == 0 ? "" : " (" + ((this.api.datacenter.Player.ForceXtra <= 0 ? "" : "+") + String(this.api.datacenter.Player.ForceXtra)) + ")"),String(this.api.datacenter.Player.Intelligence) + (this.api.datacenter.Player.IntelligenceXtra == 0 ? "" : " (" + ((this.api.datacenter.Player.IntelligenceXtra <= 0 ? "" : "+") + String(this.api.datacenter.Player.IntelligenceXtra)) + ")"),String(this.api.datacenter.Player.Chance) + (this
         .api.datacenter.Player.ChanceXtra == 0 ? "" : " (" + ((this.api.datacenter.Player.ChanceXtra <= 0 ? "" : "+") + String(this.api.datacenter.Player.ChanceXtra)) + ")"),String(this.api.datacenter.Player.Agility) + (this.api.datacenter.Player.AgilityXtra == 0 ? "" : " (" + ((this.api.datacenter.Player.AgilityXtra <= 0 ? "" : "+") + String(this.api.datacenter.Player.AgilityXtra)) + ")"),String(this.api.datacenter.Player.Initiative),String(this.api.datacenter.Player.AP),String(this.api.datacenter.Player.MP)]);
         _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc14_,_loc15_);
      }
      return _loc2_;
   }
}
