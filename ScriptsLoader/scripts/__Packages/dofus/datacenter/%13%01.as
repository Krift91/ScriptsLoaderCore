class dofus.datacenter.§\x13\x01§ extends dofus.datacenter.§\x1e\x16\x13§
{
   var _title;
   var _nGuild;
   var _nSex;
   var _nAura;
   var _oAlignment;
   var _bMerchant;
   var _nServerID;
   var _bDied;
   var _oRank;
   var _aMultiCraftSkillsID;
   var _sGuildName;
   var _oEmblem;
   var _nRestrictions;
   var _aResistances;
   var CharacteristicsManager;
   var xtraClipTopAnimations = {staticF:true};
   function §\x13\x01§(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID, §\x1e\n\x1d§)
   {
      super();
      this._title = _loc9_;
      this.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_,gfxID);
   }
   function get speedModerator()
   {
      var _loc2_ = this._nSpeedModerator;
      if(this.isSlow)
      {
         _loc2_ /= 2;
      }
      else if(this.isAdminSonicSpeed)
      {
         _loc2_ *= 5;
      }
      return _loc2_;
   }
   function get Guild()
   {
      return this._nGuild;
   }
   function set Guild(§\x1e\n\x02§)
   {
      this._nGuild = Number(_loc2_);
   }
   function get Sex()
   {
      return this._nSex;
   }
   function set Sex(§\x1e\n\x02§)
   {
      this._nSex = Number(_loc2_);
   }
   function get Aura()
   {
      return this._nAura;
   }
   function set Aura(§\x1e\n\x02§)
   {
      this._nAura = Number(_loc2_);
   }
   function get alignment()
   {
      return this._oAlignment;
   }
   function set alignment(§\x1e\n\x02§)
   {
      this._oAlignment = _loc2_;
   }
   function get Merchant()
   {
      return this._bMerchant;
   }
   function set Merchant(§\x1e\n\x02§)
   {
      this._bMerchant = _loc2_;
   }
   function get serverID()
   {
      return this._nServerID;
   }
   function set serverID(§\x1e\n\x02§)
   {
      this._nServerID = _loc2_;
   }
   function get Died()
   {
      return this._bDied;
   }
   function set Died(§\x1e\n\x02§)
   {
      this._bDied = _loc2_;
   }
   function get rank()
   {
      return this._oRank;
   }
   function set rank(§\x1e\n\x02§)
   {
      this._oRank = _loc2_;
   }
   function get multiCraftSkillsID()
   {
      return this._aMultiCraftSkillsID;
   }
   function set multiCraftSkillsID(§\x1e\n\x02§)
   {
      this._aMultiCraftSkillsID = _loc2_;
   }
   function set guildName(§\x1e\x11\x18§)
   {
      this._sGuildName = _loc2_;
   }
   function get guildName()
   {
      return this._sGuildName;
   }
   function get title()
   {
      return this._title;
   }
   function set emblem(§\x1e\x19\x10§)
   {
      this._oEmblem = _loc2_;
   }
   function get emblem()
   {
      return this._oEmblem;
   }
   function set restrictions(§\x1e\x1e\x06§)
   {
      this._nRestrictions = Number(_loc2_);
   }
   function get canBeAssault()
   {
      return (this._nRestrictions & 1) != 1;
   }
   function get canBeChallenge()
   {
      return (this._nRestrictions & 2) != 2;
   }
   function get canExchange()
   {
      return (this._nRestrictions & 4) != 4;
   }
   function get canBeAttack()
   {
      return (this._nRestrictions & 8) != 8;
   }
   function get forceWalk()
   {
      return (this._nRestrictions & 0x10) == 16;
   }
   function get isSlow()
   {
      return (this._nRestrictions & 0x20) == 32;
   }
   function get canSwitchInCreaturesMode()
   {
      return (this._nRestrictions & 0x40) != 64;
   }
   function get isTomb()
   {
      return (this._nRestrictions & 0x80) == 128;
   }
   function get isAdminSonicSpeed()
   {
      return (this._nRestrictions & 0x0100) == 256;
   }
   function set resistances(§\x1d\x14§)
   {
      this._aResistances = _loc2_;
   }
   function get resistances()
   {
      var _loc2_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < this._aResistances.length)
      {
         _loc2_[_loc3_] = this._aResistances[_loc3_];
         _loc3_ = _loc3_ + 1;
      }
      _loc2_[5] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.DODGE_PA_LOST_PROBABILITY);
      _loc2_[6] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.DODGE_PM_LOST_PROBABILITY);
      return _loc2_;
   }
}
