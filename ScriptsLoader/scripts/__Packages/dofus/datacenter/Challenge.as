class dofus.datacenter.Challenge extends Object
{
   var _nID;
   var _nFightType;
   var _teams;
   function Challenge(§\x04\x12§, §\x05\x07§)
   {
      super();
      this.initialize(_loc3_,_loc4_);
   }
   function initialize(§\x04\x12§, §\x05\x07§)
   {
      this._nID = _loc2_;
      this._nFightType = _loc3_;
      this._teams = new Object();
   }
   function addTeam(§\x1e\x0b\x12§)
   {
      this._teams[_loc2_.id] = _loc2_;
      _loc2_.setChallenge(this);
   }
   function get id()
   {
      return this._nID;
   }
   function get fightType()
   {
      return this._nFightType;
   }
   function get teams()
   {
      return this._teams;
   }
   function get count()
   {
      var _loc2_ = 0;
      for(var k in this._teams)
      {
         _loc2_ += this._teams[k].count;
      }
      return _loc2_;
   }
}
