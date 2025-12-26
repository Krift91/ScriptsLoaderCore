class dofus.datacenter.§\n\x01§ extends dofus.datacenter.§\x1e\x16\x13§
{
   var _nNameID;
   var api;
   var _nPowerLevel;
   var CharacteristicsManager;
   var _nSpeedModerator = 1;
   function §\n\x01§(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID)
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
   function get kickable()
   {
      return this.api.lang.getMonstersText(this._nNameID).k;
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
   function get resistances()
   {
      var _loc2_ = this.api.lang.getMonstersText(this._nNameID)["g" + this._nPowerLevel].r;
      var _loc3_ = new Array();
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.length)
      {
         _loc3_[_loc4_] = _loc2_[_loc4_];
         _loc4_ = _loc4_ + 1;
      }
      _loc3_[5] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.DODGE_PA_LOST_PROBABILITY);
      _loc3_[6] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.DODGE_PM_LOST_PROBABILITY);
      return _loc3_;
   }
   function get alignment()
   {
      return new dofus.datacenter["\x1e\f"](this.api.lang.getMonstersText(this._nNameID).a,0);
   }
   function alertChatText()
   {
      var _loc2_ = this.api.datacenter.Map;
      return this.name + " niveau " + this.Level + " en " + _loc2_.x + "," + _loc2_.y + ".";
   }
}
