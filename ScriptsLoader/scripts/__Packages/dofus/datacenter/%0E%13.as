class dofus.datacenter.§\x0e\x13§ extends Object
{
   var api;
   var _nIndex;
   var _oFeatInfos;
   var _nLevel;
   var _aParams;
   function §\x0e\x13§(§\x04\n§, §\x03\x11§, §\x1e\x01§)
   {
      super();
      this.api = _global.API;
      this.initialize(_loc3_,_loc4_,_loc5_);
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
      return this._oFeatInfos.n;
   }
   function get level()
   {
      return this._nLevel;
   }
   function get effect()
   {
      return new dofus.datacenter["\x0e\x12"](this._oFeatInfos.e,this._aParams);
   }
   function get iconFile()
   {
      return dofus.Constants.FEATS_PATH + this._oFeatInfos.g + ".swf";
   }
   function initialize(§\x04\n§, §\x03\x11§, §\x1e\x01§)
   {
      this._nIndex = _loc2_;
      this._nLevel = _loc3_;
      this._aParams = _loc4_;
      this._oFeatInfos = this.api.lang.getAlignmentFeat(_loc2_);
   }
}
