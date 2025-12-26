class dofus.§\x0f\t§ extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _bEnabled = _root.electron != undefined;
   var _bUseRsaCrypto = _root.RSACrypto != undefined;
   var _bFocused = true;
   function §\x0f\t§(oAPI)
   {
      super();
      flash.external.ExternalInterface.addCallback("onRightClick",this,this.onRightClick);
      flash.external.ExternalInterface.addCallback("onWindowFocus",this,this.onWindowFocus);
      flash.external.ExternalInterface.addCallback("onWindowBlur",this,this.onWindowBlur);
      this.initialize(oAPI);
   }
   function get enabled()
   {
      return this._bEnabled;
   }
   function get useRsaCrypto()
   {
      return this._bUseRsaCrypto;
   }
   function get isWindowFocused()
   {
      return !this._bEnabled || this._bFocused;
   }
   function onWindowFocus()
   {
      if(this._bFocused)
      {
         return undefined;
      }
      var _loc2_ = this.api.gfx.spriteHandler.getSprites().getItems();
      for(var sID in _loc2_)
      {
         var _loc3_ = _loc2_[sID];
         if(!(!_loc3_.isInMove || _loc3_.moveSpeedType == undefined))
         {
            var _loc4_ = ank.battlefield.mc["\x1e\x0e\x10"](_loc3_.mc);
            _loc4_.setAnim(_loc3_.moveAnimation != undefined ? _loc3_.moveAnimation : _loc3_.moveSpeedType);
         }
      }
      this._bFocused = true;
   }
   function onWindowBlur()
   {
      if(!this._bFocused)
      {
         return undefined;
      }
      var _loc2_ = this.api.gfx.spriteHandler.getSprites().getItems();
      for(var sID in _loc2_)
      {
         var _loc3_ = _loc2_[sID];
         if(_loc3_.isInMove)
         {
            var _loc4_ = ank.battlefield.mc["\x1e\x0e\x10"](_loc3_.mc);
            _loc4_.setAnim("static");
         }
      }
      this._bFocused = false;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
   }
   function makeReport(§\x1e\r\x1c§, §\x1e\f\x1d§, §\x1e\r\x01§, §\x1e\r\x1d§, §\x1e\x13\x02§, §\x1e\x12\x07§, §\x1e\x0e\x16§, §\x1e\x11\x06§, §\x1e\x13\x16§)
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      if(_loc10_ == undefined)
      {
         _loc10_ = "";
      }
      if(_loc6_ == undefined)
      {
         _loc6_ = "";
      }
      if(_loc9_ == undefined)
      {
         _loc9_ = "";
      }
      var _loc11_ = this.api.datacenter.Basics.aks_current_server.label;
      flash.external.ExternalInterface.call("makeReport",_loc11_,_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
      var _loc12_ = "Report written.";
      this.api.kernel.showMessage(undefined,_loc12_,"COMMANDS_CHAT");
   }
   function getRandomNetworkKey()
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      return String(flash.external.ExternalInterface.call("getRandomNetworkKey"));
   }
   function setIngameDiscordActivity()
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      var _loc2_ = "Dofus Retro v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION;
      var _loc3_ = this.api.lang.getText("CURRENT_SERVER",[this.api.datacenter.Basics.aks_current_server.label]);
      var _loc4_ = this.api.datacenter.Player.Name;
      var _loc5_ = this.api.datacenter.Basics.dofusPseudo;
      var _loc6_ = this.api.lang.getClassText(this.api.datacenter.Player.Guild).ln;
      var _loc7_ = this.api.datacenter.Player.Guild;
      var _loc8_ = this.api.datacenter.Player.Sex;
      flash.external.ExternalInterface.call("setIngameDiscordActivity",_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
   }
   function log(§\x1e\x10\x02§, §\x1a\f§)
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      flash.external.ExternalInterface.call("userLog",_loc2_,_loc3_);
   }
   function consoleLog(§\x1e\f\x07§, §\x1e\r\x17§)
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      flash.external.ExternalInterface.call("consoleLog",_loc2_,_loc3_);
   }
   function chatLog(§\x1e\f\x12§)
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      flash.external.ExternalInterface.call("chatLog",_loc2_);
   }
   function debugRequest(§\x15\x13§, §\x1e\x13\x04§)
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      var _loc4_ = this.api.datacenter.Player.Name;
      var _loc5_ = this.api.datacenter.Basics.aks_current_server.label;
      flash.external.ExternalInterface.call("debugRequest",_loc2_,dofus.Constants.LOG_DATAS,_loc3_,_loc4_,_loc5_);
   }
   function setLoginDiscordActivity()
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      var _loc2_ = "Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION;
      var _loc3_ = "Build " + dofus.Constants.VERSIONDATE;
      flash.external.ExternalInterface.call("setLoginDiscordActivity",_loc2_,_loc3_);
   }
   function makeNotification(§\x1e\x13\x11§)
   {
      if(!this._bEnabled || _loc2_ == undefined)
      {
         return undefined;
      }
      _loc2_ = _loc2_.split("<b>").join("");
      _loc2_ = _loc2_.split("</b>").join("");
      _loc2_ = _loc2_.split("<u>").join("");
      _loc2_ = _loc2_.split("</u>").join("");
      flash.external.ExternalInterface.call("makeNotification",_loc2_);
   }
   function updateWindowTitle(§\x1e\x0e\x14§)
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      var _loc3_ = "";
      if(_loc2_ != undefined)
      {
         _loc3_ = _loc2_ + " - ";
      }
      _loc3_ = _loc3_ + "Dofus Retro v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION;
      flash.external.ExternalInterface.call("changeTitle",_loc3_);
   }
   function onRightClick()
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      _root.menu.onRightClick(this.api);
   }
}
