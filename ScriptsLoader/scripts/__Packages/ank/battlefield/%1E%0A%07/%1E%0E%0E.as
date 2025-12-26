class ank.battlefield.§\x1e\n\x07§.§\x1e\x0e\x0e§
{
   function §\x1e\x0e\x0e§()
   {
   }
   static function getFreeDepthOnCell(mapHandler, §\x1e\x17\x14§, §\x07\x11§, bGhostView)
   {
      if(_loc4_ < 0)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[getFreeDepthOnCell] La cellule ne doit pas être < 0.");
         _loc4_ = 0;
      }
      if(_loc4_ > mapHandler.getCellCount())
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[getFreeDepthOnCell] La cellule ne doit pas être > " + mapHandler.getCellCount());
         _loc4_ = 0;
      }
      var _loc6_ = mapHandler.getCellData(_loc4_).allSpritesOn;
      var _loc7_ = new Object();
      for(var k in _loc6_)
      {
         _loc7_[_loc3_.getItemAt(k).mc.getDepth()] = true;
      }
      var _loc8_ = _loc4_ * 100 + ank.battlefield.Constants.FIRST_SPRITE_DEPTH_ON_CELL + (!bGhostView ? 0 : ank.battlefield.Constants.MAX_DEPTH_IN_MAP);
      var _loc9_ = 0;
      while(_loc9_ < ank.battlefield.Constants.MAX_SPRITES_ON_CELL)
      {
         if(_loc7_[_loc8_ + _loc9_] != true)
         {
            break;
         }
         _loc9_ = _loc9_ + 1;
      }
      if(_loc9_ == ank.battlefield.Constants.MAX_SPRITES_ON_CELL - 1 && _loc7_[_loc8_ + _loc9_] == true)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[getFreeDepthOnCell] plus de place sur cette cellule");
      }
      return _loc8_ + _loc9_;
   }
}
