class dofus.§\x0b\b§.AreasManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _oAreasCoords;
   var _oSubAreasCoords;
   static var _sSelf = null;
   function AreasManager()
   {
      super();
      dofus["\x0b\b"].AreasManager._sSelf = this;
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].AreasManager._sSelf;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      this._oAreasCoords = new Object();
      this._oSubAreasCoords = new Object();
      var _loc4_ = this.api.lang.getAllMapsInfos();
      for(var k in _loc4_)
      {
         var _loc5_ = _loc4_[k];
         var _loc6_ = this.api.lang.getMapSubAreaText(_loc5_.sa).a;
         var _loc7_ = this.api.lang.getMapAreaText(_loc6_).sua;
         var _loc8_ = _loc7_ + "_" + _loc5_.x + "_" + _loc5_.y;
         if(this._oAreasCoords[_loc8_] == undefined)
         {
            this._oAreasCoords[_loc8_] = _loc6_;
            this._oSubAreasCoords[_loc8_] = _loc5_.sa;
         }
      }
   }
   function getAreaIDFromCoordinates(nX, nY, §\x1e\x1c\x12§)
   {
      if(_loc4_ == undefined)
      {
         _loc4_ = 0;
      }
      return this._oAreasCoords[_loc4_ + "_" + nX + "_" + nY];
   }
   function getSubAreaIDFromCoordinates(nX, nY, §\x1e\x1c\x12§)
   {
      if(_loc4_ == undefined)
      {
         _loc4_ = 0;
      }
      return this._oSubAreasCoords[_loc4_ + "_" + nX + "_" + nY];
   }
}
