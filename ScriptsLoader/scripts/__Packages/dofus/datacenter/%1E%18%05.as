class dofus.datacenter.§\x1e\x18\x05§ extends Object
{
   var api;
   var _nIndex;
   var _oOrderInfos;
   function §\x1e\x18\x05§(§\x04\n§)
   {
      super();
      this.api = _global.API;
      this.initialize(_loc3_);
   }
   function get index()
   {
      return this._nIndex;
   }
   function set index(§\x04\n§)
   {
      this._nIndex = !(_global.isNaN(_loc2_) || _loc2_ == undefined) ? _loc2_ : 0;
   }
   function get name()
   {
      return this._oOrderInfos.n;
   }
   function get alignment()
   {
      return new dofus.datacenter["\x1e\f"](this._oOrderInfos.a);
   }
   function get iconFile()
   {
      return dofus.Constants.ORDERS_PATH + this._nIndex + ".swf";
   }
   function initialize(§\x04\n§)
   {
      this._nIndex = _loc2_;
      this._oOrderInfos = this.api.lang.getAlignmentOrder(_loc2_);
   }
}
