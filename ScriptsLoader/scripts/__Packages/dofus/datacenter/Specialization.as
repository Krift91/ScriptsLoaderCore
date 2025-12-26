class dofus.datacenter.Specialization extends Object
{
   var api;
   var _nIndex;
   var _oSpecInfos;
   var _eaFeats;
   function Specialization(§\x04\n§)
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
      return this._oSpecInfos.n;
   }
   function get description()
   {
      return this._oSpecInfos.d;
   }
   function get order()
   {
      return new dofus.datacenter["\x1e\x18\x05"](this._oSpecInfos.o);
   }
   function get alignment()
   {
      return new dofus.datacenter["\x1e\f"](this.order.alignment.index,this._oSpecInfos.av);
   }
   function get feats()
   {
      return this._eaFeats;
   }
   function initialize(§\x04\n§)
   {
      this._nIndex = _loc2_;
      this._oSpecInfos = this.api.lang.getAlignmentSpecialization(_loc2_);
      this._eaFeats = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = this._oSpecInfos.f;
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         this._eaFeats.push(new dofus.datacenter["\x0e\x13"](_loc3_[_loc4_][0],_loc3_[_loc4_][1],_loc3_[_loc4_][2]));
         _loc4_ = _loc4_ + 1;
      }
   }
}
