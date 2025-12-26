class dofus.datacenter.§\x0e\x12§ extends Object
{
   var api;
   var _nIndex;
   var _sFeatEffectInfos;
   var _aParams;
   function §\x0e\x12§(§\x04\n§, §\x1e\x01§)
   {
      super();
      this.api = _global.API;
      this.initialize(_loc3_,_loc4_);
   }
   function get index()
   {
      return this._nIndex;
   }
   function set index(§\x04\n§)
   {
      this._nIndex = _loc2_;
   }
   function get description()
   {
      return ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this._sFeatEffectInfos,this._aParams);
   }
   function set params(§\x1e\x01§)
   {
      this._aParams = _loc2_;
   }
   function get params()
   {
      return this._aParams;
   }
   function initialize(§\x04\n§, §\x1e\x01§)
   {
      this._nIndex = _loc2_;
      this._aParams = _loc3_;
      this._sFeatEffectInfos = this.api.lang.getAlignmentFeatEffect(_loc2_);
   }
}
