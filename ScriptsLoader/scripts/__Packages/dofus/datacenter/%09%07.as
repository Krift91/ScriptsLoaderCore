class dofus.datacenter.§\t\x07§ extends dofus.datacenter.§\x13\x01§
{
   var _bShowIsPlayer;
   var _sPlayerName;
   var _nMonsterID;
   var api;
   var _nPowerLevel;
   function §\t\x07§(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID, bShowIsPlayer)
   {
      super();
      this._bShowIsPlayer = bShowIsPlayer == undefined ? false : bShowIsPlayer;
      this.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_,gfxID);
   }
   function get name()
   {
      if(!this._bShowIsPlayer)
      {
         return this.monsterName;
      }
      return this._sPlayerName;
   }
   function set monsterID(§\t\x02§)
   {
      this._nMonsterID = _loc2_;
   }
   function get monsterID()
   {
      return this._nMonsterID;
   }
   function set playerName(§\t\x02§)
   {
      this._sPlayerName = _loc2_;
   }
   function get playerName()
   {
      return this._sPlayerName;
   }
   function get monsterName()
   {
      return this.api.lang.getMonstersText(this._nMonsterID).n;
   }
   function get alignment()
   {
      return new dofus.datacenter["\x1e\f"]();
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
      return this.api.lang.getMonstersText(this._nMonsterID)["g" + this._nPowerLevel].l;
   }
   function get resistances()
   {
      return this.api.lang.getMonstersText(this._nMonsterID)["g" + this._nPowerLevel].r;
   }
   function set showIsPlayer(§\x1c\x1d§)
   {
      this._bShowIsPlayer = _loc2_;
   }
   function get showIsPlayer()
   {
      return this._bShowIsPlayer;
   }
}
