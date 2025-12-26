class dofus.§\x1e\n\x07§.§\x12\x05§.§\x11\x07§ extends dofus.§\x1e\n\x07§.§\x12\x05§.§\x15§
{
   function §\x11\x07§(oAPI)
   {
      super();
      this.initialize(oAPI);
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
   }
   function process(§\x1e\x13\x19§)
   {
      super.process(_loc3_);
      if(_loc3_.charAt(0) == "/")
      {
         var _loc4_ = _loc3_.split(" ");
         var _loc5_ = _loc4_[0].substr(1).toUpperCase();
         _loc4_.splice(0,1);
         switch(_loc5_)
         {
            case "TOGGLESPRITES":
               this.api.datacenter.Basics.gfx_isSpritesHidden = !this.api.datacenter.Basics.gfx_isSpritesHidden;
               if(this.api.datacenter.Basics.gfx_isSpritesHidden)
               {
                  this.api.gfx.spriteHandler.maskAllSprites();
               }
               else
               {
                  this.api.gfx.spriteHandler.unmaskAllSprites();
               }
               break;
            case "CLEANCELLS":
               this.api.gfx.mapHandler.resetEmptyCells();
               break;
            case "SEQACTIONS":
               var _loc6_ = this.api.datacenter.Sprites.getItems();
               for(var k in _loc6_)
               {
                  var _loc7_ = k;
                  var _loc8_ = _loc6_[_loc7_];
                  var _loc9_ = _loc8_.sequencer;
                  this.api.kernel.showMessage(undefined,"    Print Sequencer Actions List for " + _loc7_ + ", " + _loc8_.name,"DEBUG_LOG");
                  _loc9_.printActions();
               }
               break;
            case "INFOS":
               var _loc10_ = "Svr:";
               _loc10_ += "\nNb:";
               _loc10_ += "\n Map  : " + String(this.api.datacenter.Game.playerCount);
               _loc10_ += "\n Cell : " + this.api.datacenter.Map.data[this.api.datacenter.Player.data.cellNum].spriteOnCount;
               _loc10_ += "\nDataServers:";
               var _loc11_ = 0;
               while(_loc11_ < this.api.config.dataServers.length)
               {
                  _loc10_ += "\n host : " + this.api.config.dataServers[_loc11_].url;
                  _loc11_ = _loc11_ + 1;
               }
               _loc10_ += "\n l   : " + this.api.config.language + " (" + this.api.lang.getLangVersion() + " & " + this.api.lang.getXtraVersion() + ")";
               this.api.kernel.showMessage(undefined,_loc10_,"DEBUG_LOG");
               break;
            case "ZOOM":
               this.api.kernel.GameManager.zoomGfx(_loc4_[0],_loc4_[1],_loc4_[2]);
               break;
            case "TIMERSCOUNT":
               this.api.kernel.showMessage(undefined,String(ank["\x1e\n\x07"]["\x1e\x0b\x02"].getTimersCount()),"DEBUG_LOG");
               break;
            case "VARS":
               this.api.kernel.showMessage(undefined,this.api.kernel.TutorialManager.vars,"DEBUG_LOG");
               break;
            case "MOUNT":
               var _loc12_ = this.api.gfx.getSprite(this.api.datacenter.Player.ID);
               if(!_loc12_.isMounting)
               {
                  var _loc13_ = _loc4_[0] == undefined ? "7002.swf" : _loc4_[0] + ".swf";
                  var _loc14_ = _loc4_[1] == undefined ? "10.swf" : _loc4_[1] + ".swf";
                  var _loc15_ = new ank.battlefield.datacenter.Mount(dofus.Constants.CLIPS_PERSOS_PATH + _loc13_,dofus.Constants.CHEVAUCHOR_PATH + _loc14_);
                  this.api.gfx.mountSprite(this.api.datacenter.Player.ID,_loc15_);
               }
               else
               {
                  this.api.gfx.unmountSprite(this.api.datacenter.Player.ID);
               }
               break;
            case "SCALE":
               this.api.gfx.setSpriteScale(this.api.datacenter.Player.ID,_loc4_[0],_loc4_.length != 2 ? _loc4_[0] : _loc4_[1]);
               break;
            case "ANIM":
               if(dofus.Constants.DEBUG)
               {
                  if(_loc4_.length > 1)
                  {
                     this.api.gfx.setSpriteLoopAnim(this.api.datacenter.Player.ID,_loc4_[0],_loc4_[1]);
                  }
                  else
                  {
                     this.api.gfx.setSpriteAnim(this.api.datacenter.Player.ID,_loc4_.join(""));
                  }
               }
               break;
            case "C":
               if(dofus.Constants.DEBUG)
               {
                  var _loc16_ = _loc4_[0];
                  _loc4_.splice(0,1);
                  switch(_loc16_)
                  {
                     case ">":
                        this.api.network.send(_loc4_.join(" "));
                        break;
                     case "<":
                        this.api.network.processCommand(_loc4_.join(" "));
                  }
               }
               break;
            case "D":
               if(dofus.Constants.DEBUG)
               {
                  var _loc17_ = _loc4_[0];
                  _loc4_.splice(0,1);
                  switch(_loc17_)
                  {
                     case ">":
                        this.api.network.send(_loc4_.join(" "),false,undefined,false,true);
                        break;
                     case "<":
                        this.api.network.processCommand(_loc4_.join(" "));
                  }
               }
               break;
            case "DEBUGZAAP":
               dofus["\x1e\t\x06"].newInstance();
               break;
            case "PRINTJAILDIALOG":
               var _loc18_ = this.api.kernel.ChatManager.getJailDialog();
               if(_loc18_.length == 0)
               {
                  this.api.kernel.showMessage(undefined,"No jail dialog found","DEBUG_LOG");
               }
               else
               {
                  this.api.kernel.showMessage(undefined,_loc18_,"DEBUG_LOG");
               }
               break;
            case "MAKEREPORT":
               if(!this.api.electron.enabled)
               {
                  this.api.kernel.showMessage(undefined,"This feature is not compatible on a Flash Projector","ERROR_CHAT");
                  return undefined;
               }
               if(!dofus["\x0b\b"].AdminManager.getInstance().isExecutingBatch)
               {
                  this.api.kernel.showMessage(undefined,"You can\'t do this out of a batch execution.","ERROR_CHAT");
                  return undefined;
               }
               var _loc19_ = _loc3_.split("|");
               var _loc20_ = _loc19_[0].substring(_loc5_.length + 2);
               var _loc21_ = _loc19_[1] == "allaccounts";
               var _loc22_ = _loc19_[2];
               var _loc23_ = _loc19_[3].split(",");
               if(_loc20_ == undefined || (_loc20_.length < 1 || (_loc22_ == undefined || _loc22_.length < 1)))
               {
                  this.api.kernel.showMessage(undefined,"/makereport &lt;target pseudos|\'allaccounts\'|reason|[autocomplete action]&gt;","DEBUG_LOG");
                  return undefined;
               }
               var _loc24_ = undefined;
               var _loc25_ = undefined;
               if(_loc23_ != undefined)
               {
                  var _loc26_ = 0;
                  while(_loc26_ < _loc23_.length)
                  {
                     var _loc27_ = _loc23_[_loc26_];
                     switch(_loc27_)
                     {
                        case "chatmessage":
                           _loc24_ = this.api.kernel.GameManager.lastClickedMessage;
                           break;
                        case "jaildialog":
                           _loc25_ = this.api.kernel.ChatManager.getJailDialog();
                     }
                     _loc26_ = _loc26_ + 1;
                  }
               }
               var _loc28_ = dofus["\r\x14"].gapi.ui.MakeReport(this.api.ui.getUIComponent("MakeReport"));
               if(_loc28_ == undefined)
               {
                  this.api.datacenter.Temporary.Report = new Object();
                  var _loc29_ = this.api.datacenter.Temporary.Report;
                  _loc29_.currentTargetPseudos = _loc20_;
                  _loc29_.currentTargetIsAllAccounts = _loc21_;
                  _loc29_.targetPseudos = _loc20_;
                  _loc29_.description = _loc24_;
                  _loc29_.jailDialog = _loc25_;
                  _loc29_.isAllAccounts = _loc21_;
                  _loc29_.reason = _loc22_;
               }
               else
               {
                  var _loc30_ = this.api.datacenter.Temporary.Report;
                  _loc30_.currentTargetPseudos = _loc20_;
                  _loc30_.currentTargetIsAllAccounts = _loc21_;
                  _loc30_.targetPseudos += "," + _loc20_;
                  _loc30_.description = _loc24_;
               }
               this.api.network.Basics.askReportInfos(1,_loc20_,_loc21_);
               break;
            case "FASTSERVERSWITCH":
               var _loc31_ = Number(_loc4_[0]);
               if(_global.isNaN(_loc31_) || _loc31_ == undefined)
               {
                  this.api.kernel.showMessage(undefined,"I need a valid server ID !","DEBUG_LOG");
                  return undefined;
               }
               var _loc32_ = this.api.datacenter.Player.Name;
               if(_loc32_ == undefined)
               {
                  this.api.kernel.showMessage(undefined,"You have to be in game to do this","DEBUG_LOG");
                  return undefined;
               }
               var _loc33_ = new Object();
               _loc33_.serverId = _loc31_;
               _loc33_.playerName = _loc32_;
               dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST = _loc33_;
               this.api.network.disconnect(true,false,false);
               break;
            case "CLEAR":
               this.api.ui.getUIComponent("Debug").clear();
               break;
            case "FILEOUTPUT":
               if(this.api.electron.enabled)
               {
                  var _loc34_ = this.api.ui.getUIComponent("Debug");
                  if(_loc34_ == undefined)
                  {
                     _loc34_ = this.api.ui.loadUIComponent("Debug","Debug",undefined,{bAlwaysOnTop:true});
                  }
                  var _loc35_ = Number(_loc4_[0]);
                  if(_loc4_[0] == undefined || (_global.isNaN(_loc35_) || (_loc35_ < 0 || _loc35_ > 2)))
                  {
                     this.api.kernel.showMessage(undefined,"/fileoutput &lt;0 (disabled) | 1 (enabled) | 2 (full)&gt;","DEBUG_LOG");
                     return undefined;
                  }
                  var _loc36_ = "";
                  switch(_loc35_)
                  {
                     case 0:
                        _loc36_ = "Disabled";
                        break;
                     case 1:
                        _loc36_ = "Enabled";
                        break;
                     case 2:
                        _loc36_ = "Enabled (full)";
                  }
                  _loc34_.fileOutput = _loc35_;
                  this.api.kernel.showMessage(undefined,"File Output (Console) : " + _loc36_,"DEBUG_LOG");
               }
               else
               {
                  this.api.kernel.showMessage(undefined,"Does not work on a Flash Projector","DEBUG_ERROR");
               }
               break;
            case "LOGDISCO":
               if(_loc4_[0] == "1")
               {
                  this.api.datacenter.Game.isLoggingMapDisconnections = true;
               }
               else if(_loc4_[0] == "0")
               {
                  this.api.datacenter.Game.isLoggingMapDisconnections = false;
               }
               else
               {
                  this.api.datacenter.Game.isLoggingMapDisconnections = !this.api.datacenter.Game.isLoggingMapDisconnections;
               }
               this.api.kernel.showMessage(undefined,"LOG DISCONNECTIONS ON MAP : " + this.api.datacenter.Game.isLoggingMapDisconnections,"DEBUG_LOG");
               break;
            case "PING":
               this.api.network.ping();
               break;
            case "MAPID":
               this.api.kernel.showMessage(undefined,"carte : " + this.api.datacenter.Map.id,"DEBUG_LOG");
               this.api.kernel.showMessage(undefined,"Area : " + this.api.datacenter.Map.area,"DEBUG_LOG");
               this.api.kernel.showMessage(undefined,"Sub area : " + this.api.datacenter.Map.subarea,"DEBUG_LOG");
               this.api.kernel.showMessage(undefined,"Super Area : " + this.api.datacenter.Map.superarea,"DEBUG_LOG");
               break;
            case "CELLID":
               this.api.kernel.showMessage(undefined,"cellule : " + this.api.datacenter.Player.data.cellNum,"DEBUG_LOG");
               break;
            case "TIME":
               this.api.kernel.showMessage(undefined,"Heure : " + this.api.kernel.NightManager.time,"DEBUG_LOG");
               break;
            case "CACHE":
               this.api.kernel.askClearCache();
               break;
            case "REBOOT":
               this.api.kernel.reboot();
               break;
            case "FPS":
               this.api.ui.getUIComponent("Debug").showFps();
               break;
            case "UI":
               this.api.ui.loadUIComponent(_loc4_[0],_loc4_[0]);
               break;
            case "DEBUG":
               dofus.Constants.DEBUG = !dofus.Constants.DEBUG;
               this.api.kernel.showMessage(undefined,"DEBUG : " + dofus.Constants.DEBUG,"DEBUG_LOG");
               break;
            case "ASKOK":
               this.api.ui.loadUIComponent("AskOk","AskOkContent",{title:"AskOKDebug",text:this.api.lang.getText(_loc4_[0],_loc4_.splice(1))});
               break;
            case "ASKOK2":
               var _loc37_ = "";
               var _loc38_ = 0;
               while(_loc38_ < _loc4_.length)
               {
                  if(_loc38_ > 0)
                  {
                     _loc37_ += " ";
                  }
                  _loc37_ += _loc4_[_loc38_];
                  _loc38_ = _loc38_ + 1;
               }
               this.api.ui.loadUIComponent("AskOk","AskOkContent",{title:"AskOKDebug",text:_loc37_});
               break;
            case "MOVIECLIP":
               this.api.kernel.findMovieClipPath();
               break;
            case "LOS":
               var _loc39_ = Number(_loc4_[0]);
               var _loc40_ = Number(_loc4_[1]);
               if(_global.isNaN(_loc39_) || (_loc39_ == undefined || (_global.isNaN(_loc40_) || _loc40_ == undefined)))
               {
                  this.api.kernel.showMessage(undefined,"Unable to resolve case ID","DEBUG_LOG");
                  return undefined;
               }
               this.api.kernel.showMessage(undefined,"Line of sight between " + _loc39_ + " and " + _loc40_ + " -> " + ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkView(this.api.gfx.mapHandler,_loc39_,_loc40_),"DEBUG_LOG");
               break;
            case "CLEARCELL":
               var _loc41_ = Number(_loc4_[0]);
               if(_global.isNaN(_loc41_) || _loc41_ == undefined)
               {
                  this.api.kernel.showMessage(undefined,"I\'ll need an ID!","DEBUG_LOG");
                  return undefined;
               }
               this.api.gfx.mapHandler.getCellData(_loc41_).removeAllSpritesOnID();
               this.api.kernel.showMessage(undefined,"Cell " + _loc41_ + " cleaned.","DEBUG_LOG");
               break;
            case "CELLINFO":
               var _loc42_ = Number(_loc4_[0]);
               if(_global.isNaN(_loc42_) || _loc42_ == undefined)
               {
                  this.api.kernel.showMessage(undefined,"I\'ll need an ID!","DEBUG_LOG");
                  return undefined;
               }
               var _loc43_ = this.api.gfx.mapHandler.getCellData(_loc42_);
               this.api.kernel.showMessage(undefined,"Datas about cell " + _loc42_ + ":","DEBUG_LOG");
               for(var k in _loc43_)
               {
                  this.api.kernel.showMessage(undefined,"    " + k + " -> " + _loc43_[k],"DEBUG_LOG");
                  if(_loc43_[k] instanceof Object)
                  {
                     for(var l in _loc43_[k])
                     {
                        this.api.kernel.showMessage(undefined,"        " + l + " -> " + _loc43_[k][l],"DEBUG_LOG");
                     }
                  }
               }
               break;
            case "LANGFILE":
               this.api.kernel.showMessage(undefined,_loc4_[0] + " lang file size : " + this.api.lang.getLangFileSize(_loc4_[0]) + " octets","DEBUG_LOG");
               break;
            case "POINTSPRITE":
               this.api.kernel.TipsManager.pointSprite(-1,Number(_loc4_[0]));
               break;
            case "LISTSPRITES":
               var _loc44_ = this.api.gfx.spriteHandler.getSprites().getItems();
               for(var k in _loc44_)
               {
                  this.api.kernel.showMessage(undefined,"Sprite " + _loc44_[k].gfxFile,"DEBUG_LOG");
               }
               break;
            case "LISTPICTOS":
               var _loc45_ = this.api.gfx.mapHandler.getCellsData();
               for(var k in _loc45_)
               {
                  if(_loc45_[k].layerObject1Num != undefined && (!_global.isNaN(_loc45_[k].layerObject1Num) && _loc45_[k].layerObject1Num > 0))
                  {
                     this.api.kernel.showMessage(undefined,"Picto " + _loc45_[k].layerObject1Num,"DEBUG_LOG");
                  }
                  if(_loc45_[k].layerObject2Num != undefined && (!_global.isNaN(_loc45_[k].layerObject2Num) && _loc45_[k].layerObject2Num > 0))
                  {
                     this.api.kernel.showMessage(undefined,"Picto " + _loc45_[k].layerObject2Num,"DEBUG_LOG");
                  }
               }
               break;
            case "POINTPICTO":
               this.api.kernel.TipsManager.pointPicto(-1,Number(_loc4_[0]));
               break;
            case "SAVETHEWORLD":
               if(dofus.Constants.SAVING_THE_WORLD)
               {
                  dofus["\x1e\x14\x0f"].execute();
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc5_]),"DEBUG_ERROR");
               }
               break;
            case "STOPSAVETHEWORLD":
               if(dofus.Constants.SAVING_THE_WORLD)
               {
                  dofus["\x1e\x14\x0f"].stop();
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc5_]),"DEBUG_ERROR");
               }
               break;
            case "NEXTSAVE":
               if(dofus.Constants.SAVING_THE_WORLD)
               {
                  dofus["\x1e\x14\x0f"].getInstance().nextAction();
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc5_]),"DEBUG_ERROR");
               }
               break;
            case "SOMAPLAY":
               var _loc46_ = _loc4_.join(" ");
               this.api.kernel.AudioManager.playSound(_loc46_);
               break;
            case "SKIPFIGHTANIMATIONS":
               if(!dofus.Constants.ALPHA)
               {
                  if(!this.api.datacenter.Player.isAuthorized)
                  {
                     this.api.kernel.showMessage(undefined,"(°~°)","ERROR_BOX");
                  }
                  return undefined;
               }
               if(_loc4_[0] == "1")
               {
                  this.api.datacenter.Player.isSkippingFightAnimations = true;
               }
               else if(_loc4_[0] == "0")
               {
                  this.api.datacenter.Player.isSkippingFightAnimations = false;
               }
               else
               {
                  this.api.datacenter.Player.isSkippingFightAnimations = !this.api.datacenter.Player.isSkippingFightAnimations;
               }
               this.api.kernel.showMessage(undefined,"SKIP FIGHT ANIMATIONS : " + this.api.datacenter.Player.isSkippingFightAnimations,"DEBUG_LOG");
               break;
            case "SKIPLOOTPANEL":
               if(!dofus.Constants.ALPHA)
               {
                  if(!this.api.datacenter.Player.isAuthorized)
                  {
                     this.api.kernel.showMessage(undefined,"(°~°)","ERROR_BOX");
                  }
                  return undefined;
               }
               if(_loc4_[0] == "1")
               {
                  this.api.datacenter.Player.isSkippingLootPanel = true;
               }
               else if(_loc4_[0] == "0")
               {
                  this.api.datacenter.Player.isSkippingLootPanel = false;
               }
               else
               {
                  this.api.datacenter.Player.isSkippingLootPanel = !this.api.datacenter.Player.isSkippingLootPanel;
               }
               this.api.kernel.showMessage(undefined,"SKIP LOOT PANEL : " + this.api.datacenter.Player.isSkippingLootPanel,"DEBUG_LOG");
               break;
            case "VERIFYIDENTITY":
               var _loc47_ = _loc4_[0];
               if(this.api.network.isValidNetworkKey(_loc47_))
               {
                  this.api.kernel.showMessage(undefined,_loc47_ + ": Ok!","DEBUG_LOG");
               }
               else
               {
                  this.api.kernel.showMessage(undefined,_loc47_ + ": Failed.","DEBUG_LOG");
                  if(_loc47_ == undefined)
                  {
                     this.api.kernel.showMessage(undefined," - Undefined identity.","DEBUG_LOG");
                  }
                  if(_loc47_.length == 0)
                  {
                     this.api.kernel.showMessage(undefined," - Zero-length identity.","DEBUG_LOG");
                  }
                  if(_loc47_ == "")
                  {
                     this.api.kernel.showMessage(undefined,"\t- Empty string identity.","DEBUG_LOG");
                  }
                  if(dofus.aks["\x1e\x0f"].checksum(_loc47_.substr(0,_loc47_.length - 1)) != _loc47_.substr(_loc47_.length - 1))
                  {
                     this.api.kernel.showMessage(undefined,"\t- First checksum is wrong. Got " + _loc47_.substr(_loc47_.length - 1) + ", " + dofus.aks["\x1e\x0f"].checksum(_loc47_.substr(0,_loc47_.length - 1)) + " expected.","DEBUG_LOG");
                  }
                  if(dofus.aks["\x1e\x0f"].checksum(_loc47_.substr(1,_loc47_.length - 2)) != _loc47_.substr(0,1))
                  {
                     this.api.kernel.showMessage(undefined,"\t- Second checksum is wrong. Got " + _loc47_.substr(0,1) + ", " + dofus.aks["\x1e\x0f"].checksum(_loc47_.substr(1,_loc47_.length - 2)) + " expected.","DEBUG_LOG");
                  }
               }
               break;
            case "SEARCHNPC":
               var _loc48_ = _loc3_.substr(_loc5_.length + 2);
               if(_loc48_ == undefined || _loc48_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,"Syntax : /searchnpc [name]","DEBUG_LOG");
                  return undefined;
               }
               var _loc49_ = "";
               _loc49_ += "Looking for npc : " + _loc48_;
               var _loc50_ = this.api.lang.getNonPlayableCharactersTexts();
               for(var i in _loc50_)
               {
                  if(_loc50_[i].n.toUpperCase().indexOf(_loc48_.toUpperCase()) != -1)
                  {
                     _loc49_ += "\n " + _loc50_[i].n + " : " + i;
                  }
               }
               this.api.kernel.showMessage(undefined,_loc49_,"DEBUG_LOG");
               break;
            case "SEARCHBREED":
               var _loc51_ = _loc3_.substr(_loc5_.length + 2);
               if(_loc51_ == undefined || _loc51_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,"Syntax : /searchbreed [name]","DEBUG_LOG");
                  return undefined;
               }
               var _loc52_ = "";
               _loc52_ += "Looking for breed : " + _loc51_;
               var _loc53_ = this.api.lang.getAllClassText();
               for(var i in _loc53_)
               {
                  if(_loc53_[i].sn.toUpperCase().indexOf(_loc51_.toUpperCase()) != -1)
                  {
                     _loc52_ += "\n " + _loc53_[i].sn + " : " + i;
                  }
               }
               this.api.kernel.showMessage(undefined,_loc52_,"DEBUG_LOG");
               break;
            case "SEARCHALIGNMENT":
               var _loc54_ = _loc3_.substr(_loc5_.length + 2);
               if(_loc54_ == undefined || _loc54_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,"Syntax : /searchalignment [name]","DEBUG_LOG");
                  return undefined;
               }
               var _loc55_ = "";
               _loc55_ += "Looking for alignment : " + _loc54_;
               var _loc56_ = this.api.lang.getAlignments();
               for(var i in _loc56_)
               {
                  if(_loc56_[i].n.toUpperCase().indexOf(_loc54_.toUpperCase()) != -1)
                  {
                     _loc55_ += "\n " + _loc56_[i].n + " : " + i;
                  }
               }
               this.api.kernel.showMessage(undefined,_loc55_,"DEBUG_LOG");
               break;
            case "SEARCHITEM":
               var _loc57_ = _loc3_.substr(_loc5_.length + 2);
               if(_loc57_ == undefined || _loc57_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,"Syntax : /searchitem [name]","DEBUG_LOG");
                  return undefined;
               }
               var _loc58_ = "";
               _loc58_ += "Looking for item : " + _loc57_;
               var _loc59_ = this.api.lang.getItemUnics();
               for(var i in _loc59_)
               {
                  if(_loc59_[i].n.toUpperCase().indexOf(_loc57_.toUpperCase()) != -1)
                  {
                     _loc58_ += "\n " + _loc59_[i].n + " : " + i;
                  }
               }
               this.api.kernel.showMessage(undefined,_loc58_,"DEBUG_LOG");
               break;
            case "SEARCHJOB":
               var _loc60_ = _loc3_.substr(_loc5_.length + 2);
               if(_loc60_ == undefined || _loc60_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,"Syntax : /searchjob [name]","DEBUG_LOG");
                  return undefined;
               }
               var _loc61_ = "";
               _loc61_ += "Looking for job : " + _loc60_;
               var _loc62_ = this.api.lang.getAllJobsText();
               for(var i in _loc62_)
               {
                  var _loc63_ = _loc62_[i];
                  if(!(_global.isNaN(_loc63_.g) || _loc63_.g < 1))
                  {
                     if(_loc63_.n.toUpperCase().indexOf(_loc60_.toUpperCase()) != -1)
                     {
                        _loc61_ += "\n " + _loc63_.n + " : " + i;
                     }
                  }
               }
               this.api.kernel.showMessage(undefined,_loc61_,"DEBUG_LOG");
               break;
            case "SEARCHMONSTER":
               var _loc64_ = _loc3_.substr(_loc5_.length + 2);
               if(_loc64_ == undefined || _loc64_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,"Syntax : /searchmonster [name]","DEBUG_LOG");
                  return undefined;
               }
               var _loc65_ = "";
               _loc65_ += "Looking for monster : " + _loc64_;
               var _loc66_ = this.api.lang.getMonsters();
               for(var i in _loc66_)
               {
                  if(_loc66_[i].n.toUpperCase().indexOf(_loc64_.toUpperCase()) != -1)
                  {
                     _loc65_ += "\n " + _loc66_[i].n + " : " + i + " (gfx : " + _loc66_[i].g + ")";
                  }
               }
               this.api.kernel.showMessage(undefined,_loc65_,"DEBUG_LOG");
               break;
            case "SEARCHSUBAREA":
               var _loc67_ = _loc3_.substr(_loc5_.length + 2);
               if(_loc67_ == undefined || _loc67_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,"Syntax : /searchsubarea [name]","DEBUG_LOG");
                  return undefined;
               }
               var _loc68_ = "";
               _loc68_ += "Looking for subarea : " + _loc67_;
               var _loc69_ = this.api.lang.getMapSubAreas();
               for(var i in _loc69_)
               {
                  if(_loc69_[i].n.toUpperCase().indexOf(_loc67_.toUpperCase()) != -1)
                  {
                     _loc68_ += "\n " + _loc69_[i].n + " : " + i;
                  }
               }
               this.api.kernel.showMessage(undefined,_loc68_,"DEBUG_LOG");
               break;
            case "SEARCHSPELL":
               var _loc70_ = _loc3_.substr(_loc5_.length + 2);
               if(_loc70_ == undefined || _loc70_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,"Syntax : /searchspell [name]","DEBUG_LOG");
                  return undefined;
               }
               var _loc71_ = "";
               _loc71_ += "Looking for spell : " + _loc70_;
               var _loc72_ = this.api.lang.getSpells();
               for(var i in _loc72_)
               {
                  if(_loc72_[i].n.toUpperCase().indexOf(_loc70_.toUpperCase()) != -1)
                  {
                     _loc71_ += "\n " + _loc72_[i].n + " : " + i;
                  }
               }
               this.api.kernel.showMessage(undefined,_loc71_,"DEBUG_LOG");
               break;
            case "SEARCHQUEST":
               var _loc73_ = _loc3_.substr(_loc5_.length + 2);
               if(_loc73_ == undefined || _loc73_.length < 2)
               {
                  this.api.kernel.showMessage(undefined,"Syntax : /searchquest [name]","DEBUG_LOG");
                  return undefined;
               }
               var _loc74_ = "";
               _loc74_ += "Looking for quest : " + _loc73_;
               var _loc75_ = this.api.lang.getQuests();
               for(var i in _loc75_)
               {
                  if(_loc75_[i].toUpperCase().indexOf(_loc73_.toUpperCase()) != -1)
                  {
                     _loc74_ += "\n " + _loc75_[i] + " : " + i;
                  }
               }
               this.api.kernel.showMessage(undefined,_loc74_,"DEBUG_LOG");
               break;
            default:
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc5_]),"DEBUG_ERROR");
         }
      }
      else if(this.api.datacenter.Basics.isLogged)
      {
         this.api.network.Basics.autorisedCommand(_loc3_);
      }
      else
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc3_]),"DEBUG_ERROR");
      }
   }
}
