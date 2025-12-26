class dofus.datacenter.Team extends ank.battlefield.datacenter.§\x1e\x0e\x10§
{
   var _nType;
   var _oAlignment;
   var _aPlayers;
   var options;
   var _oChallenge;
   var id;
   static var OPT_BLOCK_JOINER = "BlockJoiner";
   static var OPT_BLOCK_SPECTATOR = "BlockSpectator";
   static var OPT_BLOCK_JOINER_EXCEPT_PARTY_MEMBER = "BlockJoinerExceptPartyMember";
   static var OPT_NEED_HELP = "NeedHelp";
   function Team(sID, §\x0e\x14§, §\x1e\x11\x1c§, §\x07\x11§, §\x06\x1c§, §\x1e\x1b\x13§, §\b\x1b§)
   {
      super();
      this.initialize(sID,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
   }
   function initialize(sID, §\x0e\x14§, §\x1e\x11\x1c§, §\x07\x11§, §\x06\x1c§, §\x1e\x1b\x13§, §\b\x1b§)
   {
      super.initialize(sID,_loc4_,_loc5_,_loc6_);
      this.color1 = _loc7_;
      this._nType = Number(_loc8_);
      this._oAlignment = new dofus.datacenter["\x1e\f"](Number(_loc9_));
      this._aPlayers = new Object();
      this.options = new Object();
   }
   function setChallenge(§\x1e\x1a\x01§)
   {
      this._oChallenge = _loc2_;
   }
   function addPlayer(§\x1e\x18\b§)
   {
      this._aPlayers[_loc2_.id] = _loc2_;
   }
   function removePlayer(§\x04\x12§)
   {
      delete this._aPlayers[_loc2_];
   }
   function get type()
   {
      return this._nType;
   }
   function get alignment()
   {
      return this._oAlignment;
   }
   function get name()
   {
      var _loc2_ = new String();
      for(var k in this._aPlayers)
      {
         _loc2_ += "\n" + this._aPlayers[k].name + "(" + this._aPlayers[k].level + ")";
      }
      return _loc2_.substr(1);
   }
   function get totalLevel()
   {
      var _loc2_ = 0;
      for(var k in this._aPlayers)
      {
         _loc2_ += Number(this._aPlayers[k].level);
      }
      return _loc2_;
   }
   function get count()
   {
      var _loc2_ = 0;
      for(var k in this._aPlayers)
      {
         _loc2_ = _loc2_ + 1;
      }
      return _loc2_;
   }
   function get challenge()
   {
      return this._oChallenge;
   }
   function get enemyTeam()
   {
      var _loc2_ = this._oChallenge.teams;
      for(var k in _loc2_)
      {
         if(k != this.id)
         {
            var _loc3_ = k;
            break;
         }
      }
      return _loc2_[_loc3_];
   }
}
