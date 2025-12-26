class dofus.§\x1e\n\x07§.§\x11\x18§.§\x11\x19§
{
   static var MAIN_TYPE_AREA = "A";
   static var TYPE_AREA_ALIGNMENT = "A";
   static var MAIN_TYPE_BASIC = "B";
   static var TYPE_BASIC_EPISOD = "E";
   function §\x11\x19§()
   {
   }
   static function fillingCriterions(§\x1e\x13\f§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = String(_loc3_[_loc4_]).split("&");
         if(_loc5_.length != 0)
         {
            var _loc6_ = 0;
            var _loc7_ = 0;
            while(_loc7_ < _loc5_.length)
            {
               var _loc8_ = dofus["\x1e\n\x07"]["\x11\x18"]["\x11\x19"].parseCriterion(_loc5_[_loc7_]);
               if(_loc8_.isFilled())
               {
                  _loc6_ = _loc6_ + 1;
               }
               _loc7_ = _loc7_ + 1;
            }
            if(_loc6_ == _loc5_.length)
            {
               return true;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      return false;
   }
   static function parseCriterion(§\x1e\x13\r§)
   {
      var _loc3_ = _loc2_.charAt(0);
      var _loc4_ = _loc2_.charAt(1);
      var _loc5_ = _loc2_.charAt(2);
      var _loc6_ = _loc2_.substring(3);
      switch(_loc3_)
      {
         case dofus["\x1e\n\x07"]["\x11\x18"]["\x11\x19"].MAIN_TYPE_AREA:
            var _loc0_ = null;
            if((_loc0_ = _loc4_) !== dofus["\x1e\n\x07"]["\x11\x18"]["\x11\x19"].TYPE_AREA_ALIGNMENT)
            {
               break;
            }
            var _loc7_ = new dofus["\x1e\n\x07"]["\x11\x18"]["\x1e\f\x05"]["\x1e\f\x04"](_loc5_,Number(_loc6_));
            break;
         case dofus["\x1e\n\x07"]["\x11\x18"]["\x11\x19"].MAIN_TYPE_BASIC:
            if((_loc0_ = _loc4_) !== dofus["\x1e\n\x07"]["\x11\x18"]["\x11\x19"].TYPE_BASIC_EPISOD)
            {
               break;
            }
            _loc7_ = new dofus["\x1e\n\x07"]["\x11\x18"]["\x1c\r"]["\x1c\f"](_loc5_,Number(_loc6_));
            break;
      }
      if(_loc7_ == null || !_loc7_.check())
      {
         return null;
      }
      return _loc7_;
   }
}
