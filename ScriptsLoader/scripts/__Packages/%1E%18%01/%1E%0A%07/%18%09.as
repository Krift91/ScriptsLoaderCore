class §\x1e\x18\x01§.§\x1e\n\x07§.§\x18\t§
{
   var tmc;
   function §\x18\t§()
   {
   }
   static function loadBitmapSmoothed(§\x1e\n\b§, §\x1e\x0b\x11§)
   {
      var _loc4_ = _loc3_.createEmptyMovieClip("bmc",_loc3_.getNextHighestDepth());
      var _loc5_ = new Object();
      _loc5_.tmc = _loc3_;
      _loc5_.onLoadInit = function(§\n\x1d§)
      {
         _loc2_._visible = false;
         _loc2_.forceSmoothing = true;
         var _loc3_ = new flash.display.BitmapData(_loc2_._width,_loc2_._height,true);
         this.tmc.attachBitmap(_loc3_,this.tmc.getNextHighestDepth(),"auto",true);
         _loc3_.draw(_loc2_);
      };
      var _loc6_ = new MovieClipLoader();
      _loc6_.addListener(_loc5_);
      _loc6_.loadClip(_loc2_,_loc4_);
   }
}
