class ank.battlefield.mc.§\x14\x0b§ extends ank.battlefield.mc.§\x14\f§
{
   var _bg;
   function §\x14\x0b§(§\x1e\x0b\b§, §\x1e\t\x14§, §\x1e\t\x0b§, §\x0b\x01§)
   {
      super(_loc3_,_loc4_,_loc5_,_loc6_);
   }
   function drawCircle(§\n\x1d§, §\x1e\t\x14§, §\x1e\t\x0b§, §\x1e\x15\t§, §\x12\x14§)
   {
      var _loc7_ = _loc3_ + Math.sin(360 / 15 * 0 * Math.PI / 180) * _loc5_;
      var _loc8_ = _loc4_ + Math.cos(360 / 15 * 0 * Math.PI / 180) * _loc5_;
      _loc2_.moveTo(_loc7_,_loc8_);
      _loc2_.beginFill(_loc6_,100);
      var _loc9_ = 0;
      while(_loc9_ <= 15)
      {
         var _loc10_ = _loc3_ + Math.sin(360 / 15 * _loc9_ * Math.PI / 180) * _loc5_;
         var _loc11_ = _loc4_ + Math.cos(360 / 15 * _loc9_ * Math.PI / 180) * _loc5_;
         _loc2_.lineTo(_loc10_,_loc11_);
         _loc9_ = _loc9_ + 1;
      }
      _loc2_.endFill();
   }
   function drawBackground(§\x1e\t\x1b§, §\r\n§)
   {
      var _loc4_ = ank.battlefield.Constants.BUBBLE_MARGIN * 2;
      this.createEmptyMovieClip("_bg",10);
      var _loc5_ = - _loc3_ - _loc4_ - ank.battlefield.Constants.BUBBLE_PIC_HEIGHT;
      var _loc6_ = - ank.battlefield.Constants.BUBBLE_PIC_HEIGHT;
      var _loc7_ = 0;
      var _loc8_ = _loc2_ + _loc4_;
      this._bg.moveTo(_loc7_,_loc5_);
      this._bg.lineStyle(0,16777215);
      this._bg.beginFill(16777215,100);
      this._bg.lineTo(_loc8_,_loc5_);
      this._bg.lineTo(_loc8_,_loc6_);
      this._bg.lineTo(_loc7_,_loc6_);
      this._bg.lineTo(_loc7_,_loc5_);
      this._bg.endFill();
      var _loc9_ = _loc7_;
      while(_loc9_ <= _loc8_)
      {
         this.drawCircle(this._bg,_loc9_,_loc5_,7,16777215);
         _loc9_ += 14;
      }
      var _loc10_ = _loc7_;
      while(_loc10_ <= _loc8_)
      {
         this.drawCircle(this._bg,_loc10_,_loc6_,7,16777215);
         _loc10_ += 14;
      }
      var _loc11_ = _loc5_;
      while(_loc11_ <= _loc6_)
      {
         this.drawCircle(this._bg,_loc8_,_loc11_,7,16777215);
         _loc11_ += 14;
      }
      var _loc12_ = _loc5_;
      while(_loc12_ <= _loc6_)
      {
         this.drawCircle(this._bg,_loc7_,_loc12_,7,16777215);
         _loc12_ += 14;
      }
      this.drawCircle(this._bg,_loc7_,_loc6_ + 5,8,16777215);
      this.drawCircle(this._bg,-5,5,4,16777215);
      var _loc13_ = new Array();
      _loc13_.push(new flash.filters.GlowFilter(0,30,2,2,3,3,false,false));
      this._bg.filters = _loc13_;
      this._bg._alpha = 90;
   }
}
