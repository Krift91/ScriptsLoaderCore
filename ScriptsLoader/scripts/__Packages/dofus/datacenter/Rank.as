class dofus.datacenter.Rank extends Object
{
   var api;
   var _nValue;
   var _nHonour;
   var _nDisgrace;
   var _bEnabled;
   function Rank(§\x1e\x1b\n§, §\x04\x16§, §\x06\x04§, §\x1a\r§)
   {
      super();
      this.api = _global.API;
      this.initialize(_loc3_,_loc4_,_loc5_,_loc6_);
   }
   function get value()
   {
      return this._nValue;
   }
   function set value(§\x1e\n\x06§)
   {
      this._nValue = _loc2_;
   }
   function get honour()
   {
      return this._nHonour;
   }
   function set honour(§\x1e\n\x06§)
   {
      this._nHonour = _loc2_;
   }
   function get disgrace()
   {
      return this._nDisgrace;
   }
   function set disgrace(§\x1e\n\x06§)
   {
      this._nDisgrace = _loc2_;
   }
   function get enable()
   {
      return this._bEnabled;
   }
   function set enable(§\x1e\n\x06§)
   {
      this._bEnabled = _loc2_;
   }
   function initialize(§\x1e\x1b\n§, §\x04\x16§, §\x06\x04§, §\x1a\r§)
   {
      this._nValue = !(_global.isNaN(_loc2_) || _loc2_ == undefined) ? _loc2_ : 0;
      this._nHonour = !(_global.isNaN(_loc3_) || _loc3_ == undefined) ? _loc3_ : 0;
      this._nDisgrace = !(_global.isNaN(_loc4_) || _loc4_ == undefined) ? _loc4_ : 0;
      this._bEnabled = _loc5_ != undefined ? _loc5_ : false;
   }
   function clone()
   {
      return new dofus.datacenter.Rank(this._nValue,this._nHonour,this._nDisgrace,this._bEnabled);
   }
}
