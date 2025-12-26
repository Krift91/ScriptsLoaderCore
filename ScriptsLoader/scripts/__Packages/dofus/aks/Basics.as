class dofus.aks.Basics extends dofus.aks.Handler
{
   function Basics(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function autorisedCommand(§\x1e\x13\x17§)
   {
      this.aks.send("BA" + _loc2_,false,undefined,true);
   }
   function autorisedMoveCommand(nX, nY)
   {
      this.aks.send("BaM" + nX + "," + nY,false);
   }
   function autorisedKickCommand(§\x1e\x0e\x14§, §\x1e\x1c\x03§, §\x1e\x10\x02§)
   {
      this.aks.send("BaK" + _loc2_ + "|" + _loc3_ + "|" + _loc4_,false);
   }
   function whoAmI()
   {
      this.whoIs("");
   }
   function whoIs(§\x1e\x0f\x16§)
   {
      this.aks.send("BW" + _loc2_);
   }
   function kick(§\x07\x11§)
   {
      this.aks.send("BQ" + _loc2_,false);
   }
   function away()
   {
      this.aks.send("BYA",false);
   }
   function invisible()
   {
      this.aks.send("BYI",false);
   }
   function getDate()
   {
      this.aks.send("BD",false);
   }
   function fileCheckAnswer(§\x07\x04§, §\x05\x04§)
   {
      this.aks.send("BC" + _loc2_ + ";" + _loc3_,false);
   }
   function sanctionMe(§\x1e\x1d\x1b§, §\x1e\x1b\x01§)
   {
      this.aks.send("BK" + _loc2_ + "|" + _loc3_,false);
   }
   function averagePing()
   {
      this.aks.send("Bp" + this.api.network.getAveragePing() + "|" + this.api.network.getAveragePingPacketsCount() + "|" + this.api.network.getAveragePingBufferSize(),false);
   }
   function askReportInfos(§\x1e\x1c\x15§, §\x1e\f\x1a§, §\x1c\x14§)
   {
      this.aks.send("Br" + _loc2_ + "|" + _loc3_ + "|" + (!_loc4_ ? "0" : "1"));
   }
   function onReportInfos(§\x1e\x12\r§)
   {
      var _loc3_ = this.api.datacenter.Temporary.Report;
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      var _loc4_ = _loc2_.charAt(0);
      var _loc5_ = _loc2_.substring(1);
      switch(_loc4_)
      {
         case "t":
            var _loc6_ = _loc5_.split("|");
            if(_loc3_.targetAccountPseudo == undefined)
            {
               _loc3_.targetAccountPseudo = _loc6_[0];
               _loc3_.targetAccountId = _loc6_[1];
            }
            break;
         case "s":
            if(_loc3_.sanctionnatedAccounts == undefined)
            {
               _loc3_.sanctionnatedAccounts = _loc5_;
            }
            else
            {
               _loc3_.sanctionnatedAccounts += "\n\n" + _loc5_;
            }
            break;
         case "p":
            _loc3_.penal = _loc5_;
            break;
         case "f":
            _loc3_.findAccounts = _loc5_;
            break;
         case "#":
            this.api.ui.unloadUIComponent("FightsInfos");
            var _loc7_ = dofus["\r\x14"].gapi.ui.MakeReport(this.api.ui.getUIComponent("MakeReport"));
            if(_loc7_ == undefined)
            {
               var _loc8_ = _loc3_.targetPseudos;
               var _loc9_ = _loc3_.reason;
               var _loc10_ = _loc3_.description;
               var _loc11_ = _loc3_.jailDialog;
               var _loc12_ = _loc3_.isAllAccounts;
               var _loc13_ = _loc3_.penal;
               var _loc14_ = _loc3_.findAccounts;
               this.api.ui.loadUIComponent("MakeReport","MakeReport",{targetPseudos:_loc8_,reason:_loc9_,description:_loc10_,jailDialog:_loc11_,isAllAccounts:_loc12_,penal:_loc13_,findAccounts:_loc14_});
               break;
            }
            _loc7_.update();
            break;
      }
   }
   function onPopupMessage(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_;
      if(_loc3_ != undefined && _loc3_.length > 0)
      {
         this.api.kernel.showMessage(undefined,_loc3_,"WAIT_BOX");
      }
   }
   function onAuthorizedInterfaceOpen(§\x1e\x12\r§)
   {
      this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("A_GIVE_U_RIGHTS",[_loc2_]),"ERROR_BOX");
      this.api.datacenter.Player.isAuthorized = true;
   }
   function onAuthorizedInterfaceClose(§\x1e\x12\r§)
   {
      this.api.ui.unloadUIComponent("Debug");
      this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("A_REMOVE_U_RIGHTS",[_loc2_]),"ERROR_BOX");
      this.api.datacenter.Player.isAuthorized = false;
   }
   function onAuthorizedCommand(§\x14\x16§, §\x1e\x12\r§)
   {
      if(_loc2_)
      {
         var _loc4_ = Number(_loc3_.charAt(0));
         var _loc5_ = "DEBUG_LOG";
         switch(_loc4_)
         {
            case 1:
               _loc5_ = "DEBUG_ERROR";
               break;
            case 2:
               _loc5_ = "DEBUG_INFO";
         }
         if(this.api.ui.getUIComponent("Debug") == undefined)
         {
            this.api.ui.loadUIComponent("Debug","Debug",undefined,{bStayIfPresent:true,bAlwaysOnTop:true});
         }
         var _loc6_ = _loc3_.substr(1);
         var _loc7_ = this.api.ui.getUIComponent("Debug").fileOutput;
         _loc6_ = this.api.kernel.DebugManager.getFormattedMessage(_loc6_);
         if(this.api.electron.enabled && _loc7_ != 0)
         {
            this.api.electron.consoleLog(_loc5_,_loc6_);
            if(_loc7_ == 2)
            {
               return undefined;
            }
         }
         this.api.kernel.showMessage(undefined,_loc6_,_loc5_);
         if(dofus.Constants.SAVING_THE_WORLD)
         {
            if(_loc6_.indexOf("BotKick inactif") == 0)
            {
               dofus["\x1e\x14\x0f"].getInstance().nextAction();
            }
         }
      }
      else
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",["/a"]),"ERROR_CHAT");
      }
   }
   function onAuthorizedCommandPrompt(§\x1e\x12\r§)
   {
      this.api.datacenter.Basics.aks_a_prompt = _loc2_;
      this.api.ui.getUIComponent("Debug").setPrompt(_loc2_);
   }
   function onAuthorizedCommandClear()
   {
      this.api.ui.getUIComponent("Debug").clear();
   }
   function onAuthorizedLine(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = Number(_loc3_[1]);
      var _loc6_ = _loc3_[2];
      var _loc7_ = this.api.datacenter.Basics.aks_a_logs.split("<br/>");
      var _loc8_ = "<font color=\"#FFFFFF\">" + _loc6_ + "</font>";
      switch(_loc5_)
      {
         case 1:
            _loc8_ = "<font color=\"#FF0000\">" + _loc6_ + "</font>";
            break;
         case 2:
            _loc8_ = "<font color=\"#00FF00\">" + _loc6_ + "</font>";
      }
      if(!_global.isNaN(_loc4_) && _loc4_ < _loc7_.length)
      {
         _loc7_[_loc7_.length - _loc4_] = _loc8_;
         this.api.datacenter.Basics.aks_a_logs = _loc7_.join("<br/>");
         this.api.ui.getUIComponent("Debug").refresh();
      }
   }
   function onReferenceTime(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      this.api.kernel.NightManager.setReferenceTime(_loc3_);
   }
   function onDate(§\x1e\x12\r§)
   {
      this.api.datacenter.Basics.lastDateUpdate = getTimer();
      var _loc3_ = _loc2_.split("|");
      this.api.kernel.NightManager.setReferenceDate(Number(_loc3_[0]),Number(_loc3_[1]),Number(_loc3_[2]));
   }
   function onWhoIs(§\x14\x16§, §\x1e\x12\r§)
   {
      if(_loc2_)
      {
         var _loc4_ = _loc3_.split("|");
         if(_loc4_.length != 4)
         {
            return undefined;
         }
         var _loc5_ = _loc4_[0];
         var _loc6_ = _loc4_[1];
         var _loc7_ = _loc4_[2];
         loop0:
         while(true)
         {
            var _loc8_ = Number(_loc4_[3]) == -1 ? this.api.lang.getText("UNKNOWN_AREA") : this.api.lang.getMapAreaText(Number(_loc4_[3])).n;
            if(_loc5_.toLowerCase() == this.api.datacenter.Basics.login)
            {
               switch(_loc6_)
               {
                  case "1":
                     this.api.kernel.showMessage(undefined,this.api.lang.getText("I_AM_IN_SINGLE_GAME",[_loc7_,_loc5_,_loc8_]),"COMMANDS_CHAT");
                     break;
                  case "2":
                     this.api.kernel.showMessage(undefined,this.api.lang.getText("I_AM_IN_GAME",[_loc7_,_loc5_,_loc8_]),"COMMANDS_CHAT");
                     break;
                  default:
                     continue;
               }
               break;
            }
            switch(_loc6_)
            {
               case "1":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("IS_IN_SINGLE_GAME",[_loc7_,_loc5_,_loc8_]),"COMMANDS_CHAT");
                  break loop0;
               case "2":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("IS_IN_GAME",[_loc7_,_loc5_,_loc8_]),"COMMANDS_CHAT");
            }
         }
      }
      else
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_FIND_ACCOUNT_OR_CHARACTER",[_loc3_]),"ERROR_CHAT");
      }
   }
   function onFileCheck(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split(";");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = _loc3_[1];
      if(_loc5_.indexOf("bright.swf") == 0)
      {
         this.api.network.send("BC" + _loc4_ + ";-1",false);
         _loc2_ = _loc5_.substr(10);
         this.onBrightCell(_loc2_);
      }
      else
      {
         dofus["\x1e\n\x07"]["\x1d\x1b"].getInstance().checkFileSize(_loc5_,_loc4_);
      }
   }
   function onBrightCell(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("/");
      var _loc4_ = Number(_loc3_[0]);
      if(_loc4_ == 0)
      {
         this.api.gfx.unSelect(true);
      }
      else if(_loc2_.charAt(0) == "-")
      {
         var _loc5_ = _loc3_[0].substr(1).split(".");
         this.api.gfx.unSelect(false,_loc5_,"brightedPosition");
      }
      else
      {
         var _loc6_ = _loc3_[0].split(".");
         var _loc7_ = _global.parseInt(_loc3_[1],16);
         this.api.gfx.select(_loc6_,_loc7_,"brightedPosition");
      }
   }
   function onAveragePing(§\x1e\x12\r§)
   {
      this.averagePing();
   }
   function onSubscriberRestriction(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.charAt(0) == "+";
      if(_loc3_)
      {
         var _loc4_ = Number(_loc2_.substr(1));
         if(_loc4_ != 10)
         {
            this.api.ui.loadUIComponent("PayZoneDialog2","PayZoneDialog2",{dialogID:_loc4_,name:"El Pemy",gfx:"9059"});
         }
         else
         {
            this.api.ui.loadUIComponent("PayZone","PayZone",{dialogID:_loc4_},{bForceLoad:true});
            this.api.datacenter.Basics.payzone_isFirst = false;
         }
      }
      else
      {
         this.api.ui.unloadUIComponent("PayZone");
      }
   }
}
