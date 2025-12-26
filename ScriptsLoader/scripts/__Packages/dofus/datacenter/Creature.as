class dofus.datacenter.Creature extends dofus.datacenter.§\x1e\x16\x13§
{
   var _nNameID;
   var api;
   var _nPowerLevel;
   var _resistances;
   var CharacteristicsManager;
   var _sStartAnimation = "appear";
   function Creature(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID)
   {
      super();
      this.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_,gfxID);
   }
   function set name(§\x02\x07§)
   {
      this._nNameID = Number(_loc2_);
   }
   function get name()
   {
      return this.api.lang.getMonstersText(this._nNameID).n;
   }
   function set powerLevel(§\x01\t§)
   {
      this._nPowerLevel = Number(_loc2_);
   }
   function get powerLevel()
   {
      return this._nPowerLevel;
   }
   function get Level()
   {
      return this.api.lang.getMonstersText(this._nNameID)["g" + this._nPowerLevel].l;
   }
   function set resistances(§\x1c§)
   {
      this._resistances = _loc2_;
   }
   function get resistances()
   {
      if(this._resistances)
      {
         return this._resistances;
      }
      var _loc2_ = this.api.lang.getMonstersText(this._nNameID)["g" + this._nPowerLevel].r;
      _loc2_[5] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.DODGE_PA_LOST_PROBABILITY);
      _loc2_[6] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.DODGE_PM_LOST_PROBABILITY);
      return _loc2_;
   }
   function get alignment()
   {
      return new dofus.datacenter["\x1e\f"](this.api.lang.getMonstersText(this._nNameID).a,0);
   }
}
