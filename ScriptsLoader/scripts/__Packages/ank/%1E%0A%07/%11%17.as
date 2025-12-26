class ank.§\x1e\n\x07§.§\x11\x17§
{
   static var HASH = new Array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9","-","_");
   function §\x11\x17§()
   {
   }
   static function cryptPassword(§\x1e\x16\x02§, §\f\x03§)
   {
      var _loc4_ = "#1";
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.length)
      {
         var _loc6_ = _loc2_.charCodeAt(_loc5_);
         var _loc7_ = _loc3_.charCodeAt(_loc5_);
         var _loc8_ = Math.floor(_loc6_ / 16);
         var _loc9_ = _loc6_ % 16;
         _loc4_ += ank["\x1e\n\x07"]["\x11\x17"].HASH[(_loc8_ + _loc7_ % ank["\x1e\n\x07"]["\x11\x17"].HASH.length) % ank["\x1e\n\x07"]["\x11\x17"].HASH.length] + ank["\x1e\n\x07"]["\x11\x17"].HASH[(_loc9_ + _loc7_ % ank["\x1e\n\x07"]["\x11\x17"].HASH.length) % ank["\x1e\n\x07"]["\x11\x17"].HASH.length];
         _loc5_ = _loc5_ + 1;
      }
      return _loc4_;
   }
}
