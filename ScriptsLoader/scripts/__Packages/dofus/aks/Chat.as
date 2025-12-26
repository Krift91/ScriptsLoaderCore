class dofus.aks.Chat extends dofus.aks.Handler
{
   function Chat(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function send(§\x1e\x10\x02§, §\x1e\x13\x01§, §\x1e\x18\x0b§)
   {
      if(this.api.datacenter.Game.isSpectator && _loc3_ == "*")
      {
         _loc3_ = "#";
      }
      if(_loc3_.toLowerCase() == this.api.datacenter.Player.Name.toLowerCase())
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_WISP_YOURSELF"),"ERROR_CHAT");
         return undefined;
      }
      if(this.api.kernel.ChatManager.isBlacklisted(_loc3_))
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_WISP_BLACKLISTED"),"ERROR_CHAT");
         return undefined;
      }
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(["<",">","|"],["&lt;","&gt;",""]);
      var _loc5_ = this.api.kernel.ChatManager.applyOutputCensorship(_loc2_);
      if(!_loc5_)
      {
         return undefined;
      }
      if(this.api.datacenter.Player.zaapToken == undefined && (_loc2_.indexOf(this.api.datacenter.Player.login) > -1 || _loc2_.indexOf(this.api.datacenter.Player.password) > -1))
      {
         if(_loc2_ != undefined && (this.api.datacenter.Player.login != undefined && this.api.datacenter.Player.password != undefined))
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_SAY_YOUR_PASSWORD"),"ERROR_CHAT");
            return undefined;
         }
      }
      if(_loc2_.length == 0)
      {
         return undefined;
      }
      var _loc6_ = new String();
      var _loc7_ = _loc4_.items;
      if(_loc7_.length > 0)
      {
         var _loc8_ = 0;
         var _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            var _loc10_ = _loc7_[_loc9_];
            var _loc11_ = "[" + _loc10_.name + "]";
            var _loc12_ = _loc2_.indexOf(_loc11_);
            if(_loc12_ != -1)
            {
               var _loc13_ = "°" + _loc8_;
               _loc8_ = _loc8_ + 1;
               var _loc14_ = _loc2_.split("");
               _loc14_.splice(_loc12_,_loc11_.length,_loc13_);
               _loc2_ = _loc14_.join("");
               if(_loc6_.length > 0)
               {
                  _loc6_ += "!";
               }
               var _loc15_ = _loc10_.compressedEffects;
               _loc6_ += _loc10_.unicID + "!" + (_loc15_ == undefined ? "." : _loc15_);
            }
            _loc9_ = _loc9_ + 1;
         }
      }
      var _loc16_ = _loc6_;
      if(_loc16_.length > dofus.Constants.MAX_DATA_LENGTH)
      {
         _loc16_ = _loc16_.substring(0,dofus.Constants.MAX_DATA_LENGTH - 1);
      }
      if(_loc2_.length > dofus.Constants.MAX_MESSAGE_LENGTH && !(dofus.Constants.ALPHA && this.api.datacenter.Player.isAuthorized))
      {
         _loc2_ = _loc2_.substring(0,dofus.Constants.MAX_MESSAGE_LENGTH - 1);
      }
      this.aks.send("BM" + _loc3_ + "|" + _loc2_ + "|" + _loc16_,true,undefined,true);
   }
   function reportMessage(§\x1e\x14\x02§, §\x1e\x0f\x1d§, §\x1e\x10\x02§, §\x1e\x1e\r§)
   {
      this.aks.send("BR" + _loc2_ + "|" + _loc4_ + "|" + _loc3_ + "|" + _loc5_,false);
   }
   function subscribeChannels(§\x07\x0b§, §\x14\x17§)
   {
      var _loc4_ = "";
      switch(_loc2_)
      {
         case 0:
            _loc4_ = "i";
            break;
         case 2:
            _loc4_ = "*";
            break;
         case 3:
            _loc4_ = "#$p";
            break;
         case 4:
            _loc4_ = "%";
            break;
         case 5:
            _loc4_ = "!";
            break;
         case 6:
            _loc4_ = "?";
            break;
         case 7:
            _loc4_ = ":";
            break;
         case 8:
            _loc4_ = "^";
      }
      this.aks.send("cC" + (!_loc3_ ? "-" : "+") + _loc4_,true);
   }
   function useSmiley(§\x1e\x1d\x04§)
   {
      if(getTimer() - this.api.datacenter.Basics.aks_chat_lastActionTime < dofus.Constants.CLICK_MIN_DELAY)
      {
         return undefined;
      }
      this.api.datacenter.Basics.aks_chat_lastActionTime = getTimer();
      this.aks.send("BS" + _loc2_,true);
   }
   function onSubscribeChannel(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.charAt(0) == "+";
      var _loc4_ = _loc2_.substr(1).split("");
      var _loc5_ = 0;
      for(; _loc5_ < _loc4_.length; _loc5_ = _loc5_ + 1)
      {
         var _loc6_ = 0;
         switch(_loc4_[_loc5_])
         {
            case "i":
               _loc6_ = 0;
               break;
            case "*":
               _loc6_ = 2;
               break;
            case "#":
               _loc6_ = 3;
               break;
            case "$":
               _loc6_ = 3;
               break;
            case "p":
               _loc6_ = 3;
               break;
            case "%":
               _loc6_ = 4;
               break;
            case "!":
               _loc6_ = 5;
               break;
            case "?":
               _loc6_ = 6;
               break;
            case ":":
               _loc6_ = 7;
               break;
            case "^":
               _loc6_ = 8;
               break;
            case "@":
               _loc6_ = 9;
               break;
            default:
               continue;
         }
         this.api.ui.getUIComponent("Banner").chat.selectFilter(_loc6_,_loc3_);
         this.api.kernel.ChatManager.setTypeVisible(_loc6_,_loc3_);
         this.api.datacenter.Basics.chat_type_visible[_loc6_] = _loc3_;
      }
   }
   function onMessage(§\x14\x16§, §\x1e\x12\r§)
   {
      if(!_loc2_)
      {
         switch(_loc3_.charAt(0))
         {
            case "S":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w <" + this.api.lang.getText("NAME") + "> <" + this.api.lang.getText("MSG") + ">"]),"ERROR_CHAT");
               break;
            case "f":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED",[_loc3_.substr(1)]),"ERROR_CHAT");
               break;
            case "e":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED_BUT_TRY_SEND_EXTERNAL",[_loc3_.substr(1)]),"ERROR_CHAT");
               break;
            case "n":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED_EXTERNAL_NACK",[_loc3_.substr(1)]),"ERROR_CHAT");
         }
         return undefined;
      }
      var _loc4_ = _loc3_.charAt(0);
      _loc3_ = _loc4_ != "|" ? _loc3_.substr(2) : _loc3_.substr(1);
      var _loc5_ = _loc3_.split("|");
      var _loc6_ = _loc5_[2];
      var _loc7_ = _loc5_[1];
      var _loc8_ = _loc5_[0];
      var _loc9_ = _loc5_[3];
      var _loc10_ = !(_loc5_[4] != undefined && (_loc5_[4].length > 0 && _loc5_[4] != "")) ? null : _loc5_[4];
      if(this.api.kernel.ChatManager.isBlacklisted(_loc7_))
      {
         return undefined;
      }
      var _loc11_ = _loc6_;
      if(_loc9_.length > 0)
      {
         var _loc12_ = _loc9_.split("!");
         _loc6_ = this.api.kernel.ChatManager.parseInlineItems(_loc6_,_loc12_);
      }
      _loc6_ = this.api.kernel.ChatManager.parseInlinePos(_loc6_);
      switch(_loc4_)
      {
         case "F":
            var _loc13_ = "WHISP_CHAT";
            _loc6_ = this.api.kernel.ChatManager.parseSecretsEmotes(_loc6_);
            if(!_loc6_.length)
            {
               return undefined;
            }
            var _loc14_ = this.api.lang.getText("FROM") + " " + _loc7_ + " : ";
            this.api.electron.makeNotification(_loc14_ + this.api.kernel.ChatManager.applyInputCensorship(_loc6_));
            _loc6_ = this.api.lang.getText("FROM") + " <i>" + this.getLinkName(_loc7_,_loc10_) + "</i> : " + this.getLinkMessage(_loc7_,_loc14_,_loc11_,_loc6_,_loc10_);
            this.api.kernel.Console.pushWhisper("/w " + _loc7_ + " ");
            break;
         case "T":
            _loc13_ = "WHISP_CHAT";
            var _loc15_ = this.api.lang.getText("TO_DESTINATION") + " " + _loc7_ + " : ";
            _loc6_ = this.api.lang.getText("TO_DESTINATION") + " " + this.getLinkName(_loc7_,_loc10_) + " : " + this.getLinkMessage(_loc7_,_loc15_,_loc11_,_loc6_,_loc10_);
            break;
         case "#":
            if(this.api.datacenter.Game.isFight)
            {
               _loc13_ = "WHISP_CHAT";
               if(this.api.datacenter.Game.isSpectator)
               {
                  var _loc16_ = "(" + this.api.lang.getText("SPECTATOR") + ")";
               }
               else
               {
                  _loc16_ = "(" + this.api.lang.getText("TEAM") + ")";
               }
               var _loc17_ = _loc16_ + " " + _loc7_ + " : ";
               _loc6_ = _loc16_ + " " + this.getLinkName(_loc7_,_loc10_) + " : " + this.getLinkMessage(_loc7_,_loc17_,_loc11_,_loc6_,_loc10_);
            }
            break;
         case "%":
            _loc13_ = "GUILD_CHAT_SOUND";
            var _loc18_ = "(" + this.api.lang.getText("GUILD") + ") " + _loc7_ + " : ";
            _loc6_ = "(" + this.api.lang.getText("GUILD") + ") " + this.getLinkName(_loc7_,_loc10_) + " : " + this.getLinkMessage(_loc7_,_loc18_,_loc11_,_loc6_,_loc10_);
            break;
         case "$":
            _loc13_ = "PARTY_CHAT";
            var _loc19_ = "(" + this.api.lang.getText("PARTY") + ") " + _loc7_ + " : ";
            _loc6_ = "(" + this.api.lang.getText("PARTY") + ") " + this.getLinkName(_loc7_,_loc10_) + " : " + this.getLinkMessage(_loc7_,_loc19_,_loc11_,_loc6_,_loc10_);
            break;
         case "!":
            _loc13_ = "PVP_CHAT";
            var _loc20_ = "(" + this.api.lang.getText("ALIGNMENT") + ") " + _loc7_ + " : ";
            _loc6_ = "(" + this.api.lang.getText("ALIGNMENT") + ") " + this.getLinkName(_loc7_,_loc10_) + " : " + this.getLinkMessage(_loc7_,_loc20_,_loc11_,_loc6_,_loc10_);
            break;
         case "?":
            _loc13_ = "RECRUITMENT_CHAT";
            var _loc21_ = "(" + this.api.lang.getText("RECRUITMENT") + ") " + _loc7_ + " : ";
            _loc6_ = "(" + this.api.lang.getText("RECRUITMENT") + ") " + this.getLinkName(_loc7_,_loc10_) + " : " + this.getLinkMessage(_loc7_,_loc21_,_loc11_,_loc6_,_loc10_);
            break;
         case ":":
            _loc13_ = "TRADE_CHAT";
            var _loc22_ = "(" + this.api.lang.getText("TRADE") + ") " + _loc7_ + " : ";
            _loc6_ = "(" + this.api.lang.getText("TRADE") + ") " + this.getLinkName(_loc7_,_loc10_) + " : " + this.getLinkMessage(_loc7_,_loc22_,_loc11_,_loc6_,_loc10_);
            break;
         case "^":
            _loc13_ = "MEETIC_CHAT";
            var _loc23_ = "(" + this.api.lang.getText("MEETIC") + ") " + _loc7_ + " : ";
            _loc6_ = "(" + this.api.lang.getText("MEETIC") + ") " + this.getLinkName(_loc7_,_loc10_) + " : " + this.getLinkMessage(_loc7_,_loc23_,_loc11_,_loc6_,_loc10_);
            break;
         case "@":
            _loc13_ = "ADMIN_CHAT";
            var _loc24_ = "(" + this.api.lang.getText("PRIVATE_CHANNEL") + ") " + _loc7_ + " : ";
            _loc6_ = "(" + this.api.lang.getText("PRIVATE_CHANNEL") + ") " + this.getLinkName(_loc7_,_loc10_) + " : " + this.getLinkMessage(_loc7_,_loc24_,_loc11_,_loc6_,_loc10_);
            break;
         default:
            var _loc25_ = _loc6_.charAt(0) == dofus.Constants.EMOTE_CHAR && (_loc6_.charAt(1) == dofus.Constants.EMOTE_CHAR && (_loc6_.charAt(_loc6_.length - 1) == dofus.Constants.EMOTE_CHAR && _loc6_.charAt(_loc6_.length - 2) == dofus.Constants.EMOTE_CHAR));
            if(this.api.lang.getConfigText("EMOTES_ENABLED") && (!_loc25_ && (_loc6_.charAt(0) == dofus.Constants.EMOTE_CHAR && _loc6_.charAt(_loc6_.length - 1) == dofus.Constants.EMOTE_CHAR)))
            {
               if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
               {
                  var _loc26_ = !(_loc6_.charAt(_loc6_.length - 2) == "." && _loc6_.charAt(_loc6_.length - 3) != ".") ? _loc6_ : _loc6_.substr(0,_loc6_.length - 2) + dofus.Constants.EMOTE_CHAR;
                  _loc26_ = dofus.Constants.EMOTE_CHAR + _loc26_.charAt(1).toUpperCase() + _loc26_.substr(2);
                  this.api.gfx.addSpriteBubble(_loc8_,this.api.kernel.ChatManager.applyInputCensorship(_loc26_));
               }
               _loc13_ = "EMOTE_CHAT";
               _loc6_ = _loc6_.substr(1,_loc6_.length - 2);
               if(!dofus["\x0b\b"].ChatManager.isPonctuation(_loc6_.charAt(_loc6_.length - 1)))
               {
                  _loc6_ += ".";
               }
               _loc6_ = "<i>" + this.getLinkName(_loc7_,_loc10_) + " " + _loc6_.charAt(0).toLowerCase() + _loc6_.substr(1) + "</i>";
               break;
            }
            if(_loc6_.substr(0,7) == "!THINK!")
            {
               _loc6_ = _loc6_.substr(7);
               if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
               {
                  this.api.gfx.addSpriteBubble(_loc8_,this.api.kernel.ChatManager.applyInputCensorship(_loc6_),ank.battlefield["\x1e\x0b\x07"].BUBBLE_TYPE_THINK);
               }
               _loc13_ = "THINK_CHAT";
               var _loc27_ = _loc7_ + " " + this.api.lang.getText("THINKS_WORD") + " : ";
               _loc6_ = "<i>" + this.getLinkName(_loc7_,_loc10_) + " " + this.api.lang.getText("THINKS_WORD") + " : " + this.getLinkMessage(_loc7_,_loc27_,_loc11_,_loc6_,_loc10_) + "</i>";
               break;
            }
            if(_loc25_ && !_global.isNaN(_loc6_.substr(2,_loc6_.length - 4)))
            {
               if(!this.api.kernel.OptionsManager.getOption("UseSpeakingItems"))
               {
                  return undefined;
               }
               var _loc28_ = _global.parseInt(_loc6_.substr(2,_loc6_.length - 4));
               var _loc29_ = this.api.lang.getSpeakingItemsText(_loc28_ - Number(_loc8_));
               if(_loc29_.m)
               {
                  _loc13_ = "MESSAGE_CHAT";
                  _loc6_ = _loc29_.m;
                  if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
                  {
                     this.api.gfx.addSpriteBubble(_loc8_,this.api.kernel.ChatManager.applyInputCensorship(_loc6_));
                  }
                  var _loc30_ = _loc7_ + " : ";
                  _loc6_ = this.getLinkName(_loc7_,_loc10_,true) + " : " + this.getLinkMessage(_loc7_,_loc30_,_loc11_,_loc6_,_loc10_);
                  break;
               }
               return undefined;
            }
            if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
            {
               this.api.gfx.addSpriteBubble(_loc8_,this.api.kernel.ChatManager.applyInputCensorship(_loc6_));
            }
            _loc13_ = "MESSAGE_CHAT";
            var _loc31_ = _loc7_ + " : ";
            _loc6_ = this.getLinkName(_loc7_,_loc10_) + " : " + this.getLinkMessage(_loc7_,_loc31_,_loc11_,_loc6_,_loc10_);
            if(this.api.datacenter.Player.isAuthorized)
            {
               var _loc32_ = this.api.kernel.DebugManager.getTimestamp();
               this.api.kernel.ChatManager.addRawMessage(this.api.datacenter.Map.id,_loc13_,this.getRawFullMessage(_loc31_,_loc11_),_loc32_);
            }
            break;
      }
      this.api.kernel.showMessage(undefined,_loc6_,_loc13_,undefined,_loc10_);
   }
   function getRawFullMessage(§\x1e\x0e\x11§, §\x1e\x0e\x06§)
   {
      return _loc2_ + _loc3_;
   }
   function getLinkMessage(§\x1e\x0e\x14§, §\x1e\x0e\x11§, §\x1e\x0e\x06§, §\x1e\x10\x02§, §\x1e\x0b\x1c§)
   {
      var _loc7_ = this.api.kernel.DebugManager.getTimestamp() + " ";
      _loc5_ = this.api.kernel.ChatManager.applyInputCensorship(_loc5_);
      if(_loc6_ != undefined && (_loc6_.length > 0 && _loc6_ != ""))
      {
         return "<a href=\'asfunction:onHref,ShowMessagePopupMenu," + _loc2_ + "," + _global.escape(_loc7_ + _loc3_ + _loc4_) + "," + _loc6_ + "\'>" + _loc5_ + "</a>";
      }
      return "<a href=\'asfunction:onHref,ShowMessagePopupMenu," + _loc2_ + "," + _global.escape(_loc7_ + _loc3_ + _loc4_) + "\'>" + _loc5_ + "</a>";
   }
   function getLinkName(§\x1e\x10\f§, §\x1e\x0b\x1c§, §\x17\f§)
   {
      var _loc5_ = "<b>";
      var _loc6_ = "</b>";
      if(_loc4_)
      {
         _loc5_ = "";
         _loc6_ = "";
      }
      if(_loc3_ != undefined && (_loc3_.length > 0 && _loc3_ != ""))
      {
         return _loc5_ + "<a href=\'asfunction:onHref,ShowPlayerPopupMenu," + _loc2_ + "," + _loc3_ + "\'>" + _loc2_ + "</a>" + _loc6_;
      }
      return _loc5_ + "<a href=\'asfunction:onHref,ShowPlayerPopupMenu," + _loc2_ + "\'>" + _loc2_ + "</a>" + _loc6_;
   }
   function onServerMessage(§\x1e\x12\r§)
   {
      if(_loc2_ != undefined)
      {
         this.api.kernel.showMessage(undefined,_loc2_,"INFO_CHAT");
      }
   }
   function onSmiley(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = _loc3_[0];
      var _loc5_ = Number(_loc3_[1]);
      this.api.gfx.addSpriteOverHeadItem(_loc4_,"smiley",dofus["\r\x14"].battlefield["\x1e\x0f\x1a"],[_loc5_],dofus.Constants.SMILEY_DELAY);
   }
}
