class dofus.datacenter.§\x1e\t\x19§ extends Object
{
   var api;
   var _nID;
   var _bCurrent;
   var _bRespawn;
   var _nCost;
   var fieldToSort;
   function §\x1e\t\x19§(§\x04\x12§, bCurrent, bRespawn, nCost)
   {
      super();
      this.api = _global.API;
      this._nID = _loc3_;
      this._bCurrent = bCurrent;
      this._bRespawn = bRespawn;
      this._nCost = nCost;
      this.fieldToSort = this.name + _loc3_;
   }
   function get id()
   {
      return this._nID;
   }
   function get name()
   {
      return this.api.kernel.MapsServersManager.getMapName(this._nID);
   }
   function get coordinates()
   {
      return this.api.lang.getMapText(this._nID).x + ", " + this.api.lang.getMapText(this._nID).y;
   }
   function get isRespawn()
   {
      return this._bRespawn;
   }
   function get isCurrent()
   {
      return this._bCurrent;
   }
   function get cost()
   {
      return this._nCost;
   }
}
