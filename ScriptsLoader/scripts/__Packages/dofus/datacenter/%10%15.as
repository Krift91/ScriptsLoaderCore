class dofus.datacenter.§\x10\x15§ extends ank.battlefield.datacenter.Map
{
   var id;
   function §\x10\x15§(§\x04\x12§)
   {
      super(_loc3_);
   }
   function get coordinates()
   {
      var _loc2_ = _global.API.lang.getMapText(this.id);
      return _global.API.lang.getText("COORDINATES") + " : " + _loc2_.x + ", " + _loc2_.y;
   }
   function get x()
   {
      return _global.API.lang.getMapText(this.id).x;
   }
   function get y()
   {
      return _global.API.lang.getMapText(this.id).y;
   }
   function get superarea()
   {
      var _loc2_ = _global.API.lang;
      return _loc2_.getMapAreaInfos(this.subarea).superareaID;
   }
   function get area()
   {
      var _loc2_ = _global.API.lang;
      return _loc2_.getMapAreaInfos(this.subarea).areaID;
   }
   function get subarea()
   {
      var _loc2_ = _global.API.lang;
      return _loc2_.getMapText(this.id).sa;
   }
   function get musics()
   {
      var _loc2_ = _global.API.lang;
      return _loc2_.getMapSubAreaText(this.subarea).m;
   }
   static function isJail(§\x03\f§)
   {
      switch(_loc2_)
      {
         case 10240:
         case 8726:
         case 666:
            return true;
         default:
            return false;
      }
   }
}
