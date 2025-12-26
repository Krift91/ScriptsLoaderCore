class §\t\x04§.transitions.easing.Strong
{
   function Strong()
   {
   }
   static function easeIn(_loc2_, _loc3_, c, _loc5_)
   {
      return c * (_loc2_ /= _loc5_) * _loc2_ * _loc2_ * _loc2_ * _loc2_ + _loc3_;
   }
   static function easeOut(_loc2_, _loc3_, c, _loc5_)
   {
      return c * ((_loc2_ = _loc2_ / _loc5_ - 1) * _loc2_ * _loc2_ * _loc2_ * _loc2_ + 1) + _loc3_;
   }
   static function easeInOut(_loc2_, _loc3_, c, _loc5_)
   {
      if((_loc2_ /= _loc5_ / 2) < 1)
      {
         return c / 2 * _loc2_ * _loc2_ * _loc2_ * _loc2_ * _loc2_ + _loc3_;
      }
      return c / 2 * ((_loc2_ -= 2) * _loc2_ * _loc2_ * _loc2_ * _loc2_ + 2) + _loc3_;
   }
}
