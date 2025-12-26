class dofus.datacenter.§\x1e\x16\b§ extends dofus.datacenter.§\x1e\x16\x13§
{
   var _nLinkedMonsterId;
   var api;
   var _aAlignment;
   function §\x1e\x16\b§(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID)
   {
      super();
      this.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_,gfxID);
   }
   function get name()
   {
      return this.api.lang.getMonstersText(this._nLinkedMonsterId).n;
   }
   function set linkedMonster(§\x1e\n\x02§)
   {
      this._nLinkedMonsterId = _loc2_;
   }
   function get linkedMonster()
   {
      return this._nLinkedMonsterId;
   }
   function set alignment(§\x1e\n\x02§)
   {
      this._aAlignment = _loc2_;
   }
   function get alignment()
   {
      return this._aAlignment;
   }
}
