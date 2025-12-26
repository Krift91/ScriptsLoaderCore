class dofus.datacenter.§\x1e\x12\x12§
{
   var _nCharactersCount;
   var _nID;
   var _nState;
   var api;
   var _bCanLog;
   var completion;
   var populationWeight;
   static var SERVER_OFFLINE = 0;
   static var SERVER_ONLINE = 1;
   static var SERVER_STARTING = 2;
   static var SERVER_RULES_CLASSIC = 0;
   static var SERVER_RULES_HARDCORE = 1;
   static var SERVER_RULES_MONOACCOUNT = 2;
   static var SERVER_CLASSIC = 0;
   static var SERVER_HARDCORE = 1;
   static var SERVER_129 = 3;
   static var SERVER_RETRO = 4;
   static var SERVER_MONOACCOUNT = 5;
   static var SERVER_COMMUNITY_INTERNATIONAL = 2;
   function §\x1e\x12\x12§(§\x04\x12§, §\x1e\x1c\x17§, §\x06\x18§, §\x1b\x15§)
   {
      this.initialize(_loc2_,_loc3_,_loc4_,_loc5_);
      this._nCharactersCount = 0;
   }
   function set id(§\x04\x12§)
   {
      this._nID = _loc2_;
   }
   function get id()
   {
      return this._nID;
   }
   function set charactersCount(nCount)
   {
      this._nCharactersCount = nCount;
   }
   function get charactersCount()
   {
      return this._nCharactersCount;
   }
   function set state(§\x1e\x1c\x17§)
   {
      this._nState = _loc2_;
   }
   function get state()
   {
      return this._nState;
   }
   function get stateStr()
   {
      switch(this._nState)
      {
         case dofus.datacenter["\x1e\x12\x12"].SERVER_OFFLINE:
            return this.api.lang.getText("SERVER_OFFLINE");
         case dofus.datacenter["\x1e\x12\x12"].SERVER_ONLINE:
            return this.api.lang.getText("SERVER_ONLINE");
         case dofus.datacenter["\x1e\x12\x12"].SERVER_STARTING:
            return this.api.lang.getText("SERVER_STARTING");
         default:
            return "";
      }
   }
   function get stateStrShort()
   {
      switch(this._nState)
      {
         case dofus.datacenter["\x1e\x12\x12"].SERVER_OFFLINE:
            return this.api.lang.getText("SERVER_OFFLINE_SHORT");
         case dofus.datacenter["\x1e\x12\x12"].SERVER_ONLINE:
            return this.api.lang.getText("SERVER_ONLINE_SHORT");
         case dofus.datacenter["\x1e\x12\x12"].SERVER_STARTING:
            return this.api.lang.getText("SERVER_STARTING_SHORT");
         default:
            return "";
      }
   }
   function set canLog(§\x1b\x15§)
   {
      this._bCanLog = _loc2_;
   }
   function get canLog()
   {
      return this._bCanLog;
   }
   function get label()
   {
      return this.api.lang.getServerInfos(this._nID).n;
   }
   function get description()
   {
      return this.api.lang.getServerInfos(this._nID).d;
   }
   function get language()
   {
      return this.api.lang.getServerInfos(this._nID).l;
   }
   function get population()
   {
      return Number(this.api.lang.getServerInfos(this._nID).p);
   }
   function get populationStr()
   {
      return this.api.lang.getServerPopulation(this.population);
   }
   function get community()
   {
      return Number(this.api.lang.getServerInfos(this._nID).c);
   }
   function get communityStr()
   {
      return this.api.lang.getServerCommunity(this.community);
   }
   function get date()
   {
      var _loc2_ = new Date(Number(this.api.lang.getServerInfos(this._nID).date));
      return _loc2_;
   }
   function get dateStr()
   {
      var _loc2_ = new Date(Number(this.api.lang.getServerInfos(this._nID).date));
      return eval("\x1e\x18\x01")["\x1e\n\x07"]["\x1e\x11\f"].formatDate(_loc2_,this.api.lang.getConfigText("LONG_DATE_FORMAT"),this.api.config.language);
   }
   function get type()
   {
      return this.api.lang.getText("SERVER_GAME_TYPE_" + this.api.lang.getServerInfos(this._nID).t);
   }
   function get typeNum()
   {
      return this.api.lang.getServerInfos(this._nID).t;
   }
   function getRulesType()
   {
      var _loc2_ = this.typeNum;
      switch(_loc2_)
      {
         case dofus.datacenter["\x1e\x12\x12"].SERVER_MONOACCOUNT:
            return dofus.datacenter["\x1e\x12\x12"].SERVER_RULES_MONOACCOUNT;
         case dofus.datacenter["\x1e\x12\x12"].SERVER_129:
         case dofus.datacenter["\x1e\x12\x12"].SERVER_RETRO:
            return dofus.datacenter["\x1e\x12\x12"].SERVER_RULES_CLASSIC;
         default:
            return _loc2_;
      }
   }
   function isHardcore()
   {
      return this.typeNum == dofus.datacenter["\x1e\x12\x12"].SERVER_HARDCORE;
   }
   function initialize(§\x04\x12§, §\x1e\x1c\x17§, §\x06\x18§, §\x1b\x15§)
   {
      this.api = _global.API;
      this._nID = _loc2_;
      this._nState = _loc3_;
      this._bCanLog = _loc5_;
      this.completion = _loc4_;
      this.populationWeight = Number(this.api.lang.getServerPopulationWeight(this.population));
   }
   function isAllowed()
   {
      if(this.api.datacenter.Player.isAuthorized)
      {
         return true;
      }
      var _loc2_ = this.api.lang.getServerInfos(this._nID).rlng;
      if(_loc2_ == undefined || (_loc2_.length == undefined || (_loc2_.length == 0 || this.api.config.skipLanguageVerification)))
      {
         return true;
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(_loc2_[_loc3_].toUpperCase() == this.api.config.language.toUpperCase())
         {
            return true;
         }
         _loc3_ = _loc3_ + 1;
      }
      return false;
   }
}
