class ank.§\x1e\n\x07§.§\t\x17§
{
   function §\t\x17§()
   {
   }
   static function addListener(§\x1e\x18\x19§)
   {
      Mouse.addListener(_loc2_);
      ank["\x1e\n\x07"]["\t\x17"].garbageCollector();
   }
   static function garbageCollector()
   {
      var _loc2_ = Mouse._listeners;
      var _loc3_ = _loc2_.length;
      while(_loc3_ >= 0)
      {
         var _loc4_ = _loc2_[_loc3_];
         if(_loc4_ == undefined || _loc4_._target == undefined)
         {
            _loc2_.splice(_loc3_,1);
         }
         _loc3_ = _loc3_ - 1;
      }
   }
}
