class dofus.datacenter.§\x1e\n\x14§ extends dofus.datacenter.§\x1e\n\x16§
{
   var _nTimeout;
   var _oCases;
   function §\x1e\n\x14§(sID, §\x1e\x1b\x1b§, §\x12§)
   {
      super(sID,dofus.datacenter["\x1e\n\x16"].TYPE_WAITING);
      this._nTimeout = _loc4_;
      this.setCases(_loc5_);
   }
   function get timeout()
   {
      return this._nTimeout != undefined ? this._nTimeout : 0;
   }
   function get cases()
   {
      return this._oCases;
   }
   function setCases(§\x12§)
   {
      this._oCases = new Object();
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc4_ = _loc2_[_loc3_];
         var _loc5_ = _loc4_[0];
         var _loc6_ = _loc4_[1];
         var _loc7_ = _loc4_[2];
         var _loc8_ = new dofus.datacenter["\x1e\n\x13"](_loc5_,_loc6_,_loc7_);
         this._oCases[_loc5_] = _loc8_;
         _loc3_ = _loc3_ + 1;
      }
   }
}
