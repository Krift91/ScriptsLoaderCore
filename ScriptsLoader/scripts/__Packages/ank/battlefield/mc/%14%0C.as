class ank.battlefield.mc.§\x14\f§ extends MovieClip
{
   var _maxW;
   var _txtf;
   var _bg;
   function §\x14\f§(§\x1e\x0b\b§, §\x1e\t\x14§, §\x1e\t\x0b§, §\x0b\x01§)
   {
      super();
      this.initialize(_loc3_,_loc4_,_loc5_,_loc6_);
   }
   function initialize(§\x1e\x0b\b§, §\x1e\t\x14§, §\x1e\t\x0b§, §\x0b\x01§)
   {
      this._maxW = _loc5_;
      this.createTextField("_txtf",20,0,0,150,100);
      this._txtf.autoSize = "left";
      this._txtf.wordWrap = true;
      this._txtf.embedFonts = true;
      this._txtf.multiline = true;
      this._txtf.selectable = false;
      this._txtf.html = true;
      this.draw(_loc2_,_loc3_,_loc4_);
   }
   function draw(§\x1e\x0b\b§, §\x1e\t\x14§, §\x1e\t\x0b§)
   {
      this._txtf.htmlText = _loc2_;
      this._txtf.setTextFormat(ank.battlefield.Constants.BUBBLE_TXTFORMAT);
      var _loc5_ = this._txtf.textHeight > 10 ? this._txtf.textHeight : 11;
      var _loc6_ = this._txtf.textWidth > 10 ? this._txtf.textWidth + 4 : 11;
      this.drawBackground(_loc6_,_loc5_);
      this.adjust(_loc6_ + ank.battlefield.Constants.BUBBLE_MARGIN * 2,_loc5_ + ank.battlefield.Constants.BUBBLE_MARGIN * 2 + ank.battlefield.Constants.BUBBLE_PIC_HEIGHT,_loc3_,_loc4_);
      var _loc7_ = ank.battlefield.Constants.BUBBLE_REMOVE_TIMER + _loc2_.length * ank.battlefield.Constants.BUBBLE_REMOVE_CHAR_TIMER;
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"battlefield",this,this.remove,_loc7_);
   }
   function remove()
   {
      this.swapDepths(1);
      this.removeMovieClip();
   }
   function drawBackground(§\x1e\t\x1b§, §\r\n§)
   {
      var _loc4_ = ank.battlefield.Constants.BUBBLE_MARGIN * 2;
      this.createEmptyMovieClip("_bg",10);
      this._bg.lineStyle(1,ank.battlefield.Constants.BUBBLE_BORDERCOLOR,100);
      this._bg.beginFill(ank.battlefield.Constants.BUBBLE_BGCOLOR,100);
      this._bg.moveTo(0,- ank.battlefield.Constants.BUBBLE_PIC_HEIGHT);
      this._bg.lineTo(ank.battlefield.Constants.BUBBLE_PIC_WIDTH / 2,- ank.battlefield.Constants.BUBBLE_PIC_HEIGHT);
      this._bg.lineTo(0,0);
      this._bg.lineTo(ank.battlefield.Constants.BUBBLE_PIC_WIDTH,- ank.battlefield.Constants.BUBBLE_PIC_HEIGHT);
      this._bg.lineTo(_loc2_ + _loc4_,- ank.battlefield.Constants.BUBBLE_PIC_HEIGHT);
      this._bg.lineTo(_loc2_ + _loc4_,- _loc3_ - _loc4_ - ank.battlefield.Constants.BUBBLE_PIC_HEIGHT);
      this._bg.lineTo(0,- _loc3_ - _loc4_ - ank.battlefield.Constants.BUBBLE_PIC_HEIGHT);
      this._bg.endFill();
   }
   function adjust(§\x1e\t\x1b§, §\r\n§, §\x1e\t\x14§, §\x1e\t\x0b§)
   {
      var _loc6_ = this._maxW - _loc2_;
      var _loc7_ = _loc3_ + ank.battlefield.Constants.BUBBLE_Y_OFFSET;
      if(_loc4_ > _loc6_)
      {
         this._txtf._x = - _loc2_ + ank.battlefield.Constants.BUBBLE_MARGIN;
         this._bg._xscale = -100;
      }
      else
      {
         this._txtf._x = ank.battlefield.Constants.BUBBLE_MARGIN;
      }
      if(_loc5_ < _loc7_)
      {
         this._txtf._y = ank.battlefield.Constants.BUBBLE_PIC_HEIGHT + ank.battlefield.Constants.BUBBLE_MARGIN - 3;
         this._bg._yscale = -100;
      }
      else
      {
         this._txtf._y = - _loc3_ + ank.battlefield.Constants.BUBBLE_MARGIN - 3 - ank.battlefield.Constants.BUBBLE_Y_OFFSET;
         this._bg._y = - ank.battlefield.Constants.BUBBLE_Y_OFFSET;
      }
      this._x = _loc4_;
      this._y = _loc5_;
   }
}
