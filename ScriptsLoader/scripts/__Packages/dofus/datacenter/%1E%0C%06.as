class dofus.datacenter.§\x1e\f\x06§ extends Object
{
   var api;
   var _nID;
   var _oAlignment;
   function §\x1e\f\x06§(§\x04\x12§, §\b\x1b§)
   {
      super();
      this.api = _global.API;
      this.initialize(_loc3_,_loc4_);
   }
   function get id()
   {
      return this._nID;
   }
   function get alignment()
   {
      return this._oAlignment;
   }
   function set alignment(§\x1e\x1a\r§)
   {
      this._oAlignment = _loc2_;
   }
   function get name()
   {
      return String(this.api.lang.getMapSubAreaText(this._nID).n).substr(0,2) != "//" ? this.api.lang.getMapSubAreaText(this._nID).n : String(this.api.lang.getMapSubAreaText(this._nID).n).substr(2);
   }
   function get color()
   {
      return dofus.Constants.AREA_ALIGNMENT_COLOR[this._oAlignment.index];
   }
   function initialize(§\x04\x12§, §\b\x1b§)
   {
      this._nID = _loc2_;
      this._oAlignment = new dofus.datacenter["\x1e\f"](_loc3_);
   }
}
