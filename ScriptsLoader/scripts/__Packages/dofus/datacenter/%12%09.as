class dofus.datacenter.§\x12\t§ extends Object
{
   var _nSubAreaId;
   var _nAlignment;
   var _bDoor;
   var _bPrism;
   var areaName;
   function §\x12\t§(§\f\x1c§, alignment, door, prism)
   {
      super();
      this._nSubAreaId = _loc3_;
      this._nAlignment = alignment;
      this._bDoor = door;
      this._bPrism = prism;
      this.areaName = String(_global.API.lang.getMapAreaText(Number(_global.API.lang.getMapSubAreaText(this._nSubAreaId).a)).n);
   }
   function get id()
   {
      return this._nSubAreaId;
   }
   function get areaId()
   {
      return Number(_global.API.lang.getMapSubAreaText(this._nSubAreaId).a);
   }
   function get alignment()
   {
      return this._nAlignment;
   }
   function get door()
   {
      return this._bDoor;
   }
   function get prism()
   {
      return this._bPrism;
   }
}
