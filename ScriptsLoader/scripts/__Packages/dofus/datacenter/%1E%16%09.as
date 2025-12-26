class dofus.datacenter.§\x1e\x16\t§ extends Object
{
   var api;
   var _nMapId;
   var _nCost;
   var _atkNear;
   function §\x1e\x16\t§(§\x0b\x07§, cost, attackNear)
   {
      super();
      this.api = _global.API;
      this._nMapId = _loc3_;
      this._nCost = cost;
      this._atkNear = attackNear;
   }
   function get cost()
   {
      return this._nCost;
   }
   function get mapID()
   {
      return this._nMapId;
   }
   function get attackNear()
   {
      return this._atkNear;
   }
   function get coordinates()
   {
      return this.x + ", " + this.y;
   }
   function get x()
   {
      return this.api.lang.getMapText(this._nMapId).x;
   }
   function get y()
   {
      return this.api.lang.getMapText(this._nMapId).y;
   }
   function get name()
   {
      var _loc2_ = Number(this.api.lang.getMapText(this._nMapId).sa);
      return String(this.api.lang.getMapSubAreaText(_loc2_).n).substr(0,2) != "//" ? this.api.lang.getMapSubAreaText(_loc2_).n : String(this.api.lang.getMapSubAreaText(_loc2_).n).substr(2);
   }
}
