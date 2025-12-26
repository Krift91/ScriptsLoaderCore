class ank.gapi.controls.button.ButtonBackground extends ank.gapi.core.§\x1e\n\f§
{
   var left_mc;
   var middle_mc;
   var right_mc;
   function ButtonBackground()
   {
      super();
   }
   function setSize(§\x1e\x1b\x02§, §\x04\x17§, §\x1b\x1c§)
   {
      this.left_mc._x = this.left_mc._y = this.middle_mc._y = this.right_mc._y = 0;
      this.left_mc._height = this.middle_mc._height = this.right_mc._height = _loc3_;
      if(_loc4_)
      {
         this.left_mc._xscale = this.left_mc._yscale;
         this.right_mc._xscale = this.right_mc._yscale;
      }
      this.middle_mc._x = this.left_mc != undefined ? this.left_mc._width : 0;
      this.middle_mc._width = _loc2_ - (this.left_mc != undefined ? this.left_mc._width : 0) - (this.right_mc != undefined ? this.right_mc._width : 0);
      this.right_mc._x = _loc2_ - this.right_mc._width;
   }
   function setStyleColor(§\x1e\x17\x10§, §\x1e\r\x05§)
   {
      var _loc4_ = this.left_mc;
      for(var k in _loc4_)
      {
         var _loc5_ = k.split("_")[0];
         var _loc6_ = _loc2_[_loc5_ + _loc3_];
         if(_loc6_ != undefined)
         {
            this.setMovieClipColor(_loc4_[k],_loc6_);
         }
      }
      _loc4_ = this.middle_mc;
      for(var k in _loc4_)
      {
         var _loc7_ = k.split("_")[0];
         var _loc8_ = _loc2_[_loc7_ + _loc3_];
         if(_loc8_ != undefined)
         {
            this.setMovieClipColor(_loc4_[k],_loc8_);
         }
      }
      _loc4_ = this.right_mc;
      for(var k in _loc4_)
      {
         var _loc9_ = k.split("_")[0];
         var _loc10_ = _loc2_[_loc9_ + _loc3_];
         if(_loc10_ != undefined)
         {
            this.setMovieClipColor(_loc4_[k],_loc10_);
         }
      }
   }
}
