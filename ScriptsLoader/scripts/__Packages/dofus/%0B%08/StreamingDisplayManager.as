class dofus.§\x0b\b§.StreamingDisplayManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _soDisplays;
   var _nCurrentMap;
   var _nNewInterfaceTimer;
   static var _self;
   static var DEFAULT_DISPLAY = 19;
   static var DOWNLOAD_DISPLAY = [21,22,23,24,25];
   static var TRIGGERING_MAPS = new Array();
   function StreamingDisplayManager()
   {
      super();
      this.initConfiguration();
   }
   static function getInstance()
   {
      if(dofus["\x0b\b"].StreamingDisplayManager._self == null)
      {
         dofus["\x0b\b"].StreamingDisplayManager._self = new dofus["\x0b\b"].StreamingDisplayManager();
      }
      return dofus["\x0b\b"].StreamingDisplayManager._self;
   }
   function displayAdvice(§\f\x1c§)
   {
      fscommand("display",_loc2_);
      var _loc3_ = this.getDisplaysSharedObject();
      if(_loc3_.data["display" + _loc2_] == undefined)
      {
         _loc3_.data["display" + _loc2_] = 1;
      }
      else
      {
         _loc3_.data["display" + _loc2_] += 1;
      }
      _loc3_.flush();
   }
   function displayAdviceMax(§\f\x1c§, §\x0b\x04§)
   {
      if(this.getDisplaysSharedObject().data["display" + _loc2_] == undefined || this.getDisplaysSharedObject().data["display" + _loc2_] < _loc3_)
      {
         this.displayAdvice(_loc2_);
      }
   }
   function getMapDisplay(§\f\x1c§)
   {
      if(dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[_loc2_] != undefined)
      {
         if(this.getDisplaysSharedObject().data["display" + dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[_loc2_]] == 1)
         {
            return this.getDefaultDisplay(this.getPlayTime());
         }
         return dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[_loc2_];
      }
      return this.getDefaultDisplay(this.getPlayTime());
   }
   function getPlayTime()
   {
      return getTimer() / 1000;
   }
   function getDefaultDisplay(§\x1e\x16\x0f§)
   {
      if(_loc2_ < 1200)
      {
         return dofus["\x0b\b"].StreamingDisplayManager.DEFAULT_DISPLAY;
      }
      return dofus["\x0b\b"].StreamingDisplayManager.DOWNLOAD_DISPLAY[Math.floor((_loc2_ - 1200) / 300) % dofus["\x0b\b"].StreamingDisplayManager.DOWNLOAD_DISPLAY.length];
   }
   function initConfiguration()
   {
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10300] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10284] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10299] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10285] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10298] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10276] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10283] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10294] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10292] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10279] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10296] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10289] = 1;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10305] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10321] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10322] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10323] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10324] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10325] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10326] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10327] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10328] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10329] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10330] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10331] = 2;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10273] = 4;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10337] = 3;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10258] = 3;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10295] = 5;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10288] = 6;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10290] = 6;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10287] = 6;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10345] = 6;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10346] = 6;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10344] = 6;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10297] = 14;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10349] = 14;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10317] = 14;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10304] = 14;
      dofus["\x0b\b"].StreamingDisplayManager.TRIGGERING_MAPS[10318] = 26;
   }
   function getDisplaysSharedObject()
   {
      if(this._soDisplays == undefined && this.api.datacenter.Player.Name)
      {
         this._soDisplays = SharedObject.getLocal(dofus.Constants.GLOBAL_SO_DISPLAYS_NAME + this.api.datacenter.Player.Name);
      }
      return this._soDisplays;
   }
   function onNicknameChoice()
   {
      this.displayAdvice(16);
   }
   function onCharacterCreation()
   {
      this.displayAdvice(17);
   }
   function onCharacterChoice()
   {
      this.displayAdvice(18);
   }
   function onFightStart()
   {
      this.displayAdviceMax(7,2);
   }
   function onFightStartEnd()
   {
      this.displayAdviceMax(8,2);
   }
   function onFightEnd()
   {
      if(this.api.datacenter.Player.LP < this.api.datacenter.Player.LPmax)
      {
         this.displayAdviceMax(12,2);
      }
      else
      {
         this.displayAdvice(this.getMapDisplay(this._nCurrentMap));
      }
   }
   function onNewInterface(§\x0b\x10§)
   {
      _global.clearInterval(this._nNewInterfaceTimer);
      this._nNewInterfaceTimer = _global.setInterval(this,"newInterface",200,_loc2_);
   }
   function newInterface(§\x0b\x10§)
   {
      _global.clearInterval(this._nNewInterfaceTimer);
      switch(_loc2_)
      {
         case "Inventory":
            this.displayAdviceMax(9,2);
            break;
         case "Spells":
            this.displayAdviceMax(10,2);
            break;
         case "StatsJob":
            this.displayAdviceMax(11,2);
      }
   }
   function onInterfaceClose(instanceName)
   {
      _global.clearInterval(this._nNewInterfaceTimer);
      switch(instanceName)
      {
         case "Inventory":
         case "Spells":
         case "StatsJob":
            this.displayAdvice(this.getMapDisplay(this._nCurrentMap));
      }
   }
   function onLevelGain()
   {
      this.displayAdviceMax(13,2);
   }
   function onNewMap(§\f\x1c§)
   {
      this._nCurrentMap = _loc2_;
      this.displayAdvice(this.getMapDisplay(_loc2_));
   }
}
