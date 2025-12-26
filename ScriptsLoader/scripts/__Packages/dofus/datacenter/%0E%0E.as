class dofus.datacenter.§\x0e\x0e§ extends Object
{
   var _nID;
   var duration;
   var api;
   var _eaTeam1Players;
   var _eaTeam2Players;
   var _nTeam1Type;
   var _nTeam1AlignmentIndex;
   var _nTeam1Count;
   var _nTeam2Type;
   var _nTeam2AlignmentIndex;
   var _nTeam2Count;
   function §\x0e\x0e§(§\x04\x12§, §\x05\x19§)
   {
      super();
      this.initialize(_loc3_,_loc4_);
   }
   function get id()
   {
      return this._nID;
   }
   function get durationString()
   {
      return this.api.kernel.GameManager.getDurationString(this.duration);
   }
   function get hasTeamPlayers()
   {
      return this._eaTeam1Players != undefined && this._eaTeam2Players != undefined;
   }
   function get team1IconFile()
   {
      return dofus.Constants.getTeamFileFromType(this._nTeam1Type,this._nTeam1AlignmentIndex);
   }
   function get team1Count()
   {
      return this._nTeam1Count;
   }
   function get team1Players()
   {
      return this._eaTeam1Players;
   }
   function get team1Level()
   {
      var _loc2_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < this._eaTeam1Players.length)
      {
         _loc2_ += this._eaTeam1Players[_loc3_].level;
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
   function get team2IconFile()
   {
      return dofus.Constants.getTeamFileFromType(this._nTeam2Type,this._nTeam2AlignmentIndex);
   }
   function get team2Count()
   {
      return this._nTeam2Count;
   }
   function get team2Players()
   {
      return this._eaTeam2Players;
   }
   function get team2Level()
   {
      var _loc2_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < this._eaTeam2Players.length)
      {
         _loc2_ += this._eaTeam2Players[_loc3_].level;
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
   function initialize(§\x04\x12§, §\x05\x19§)
   {
      this.api = _global.API;
      this._nID = _loc2_;
      this.duration = _loc3_;
   }
   function addTeam(§\x04\n§, §\x1e\x1b\x13§, §\b\x1a§, nCount)
   {
      switch(_loc2_)
      {
         case 1:
            this._nTeam1Type = _loc3_;
            this._nTeam1AlignmentIndex = _loc4_;
            this._nTeam1Count = nCount;
            break;
         case 2:
            this._nTeam2Type = _loc3_;
            this._nTeam2AlignmentIndex = _loc4_;
            this._nTeam2Count = nCount;
      }
   }
   function addPlayers(§\x04\n§, §\x0f\x1a§)
   {
      switch(_loc2_)
      {
         case 1:
            this._eaTeam1Players = _loc3_;
            break;
         case 2:
            this._eaTeam2Players = _loc3_;
      }
   }
}
