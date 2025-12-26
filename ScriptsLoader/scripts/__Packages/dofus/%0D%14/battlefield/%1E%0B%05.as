class dofus.§\r\x14§.battlefield.§\x1e\x0b\x05§ extends dofus.§\r\x14§.battlefield.§\x14§
{
   var _nStarsValue;
   var _txtText;
   var _txtTitle;
   var _aStars;
   var _nFullWidth;
   static var STARS_COUNT = 5;
   static var STARS_WIDTH = 10;
   static var STARS_MARGIN = 2;
   static var STARS_COLORS = [-1,16777011,16750848,39168,39372,6697728,2236962,16711680,65280,16777215,16711935];
   function §\x1e\x0b\x05§(§\x1e\f\x12§, §\x1e\x12\x0b§, §\x06\x1d§, §\x04\x1d§, §\x1e\f\x0e§, §\x06\x19§, nStarsValue)
   {
      super();
      this.initialize(nStarsValue);
      this.draw(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
   }
   function initialize(§\x1e\f\x19§)
   {
      super.initialize();
      if(_loc3_ == undefined || _global.isNaN(_loc3_))
      {
         _loc3_ = -1;
      }
      this._nStarsValue = _loc3_;
      this.createTextField("_txtTitle",40,0,-3 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER + 4,0,0);
      this.createTextField("_txtText",30,0,-3 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER * (this._nStarsValue <= -1 ? 1 : 2) + 20 + (this._nStarsValue <= -1 ? 0 : dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_WIDTH),0,0);
      this._txtText.embedFonts = true;
      this._txtTitle.embedFonts = true;
      this._aStars = new Array();
   }
   function draw(§\x1e\f\x12§, §\x1e\x12\x0b§, §\x06\x1d§, §\x04\x1d§, §\x1e\f\x0e§, §\x06\x19§)
   {
      var _loc8_ = _loc3_ != undefined && _loc5_ != undefined;
      this._txtText.autoSize = "center";
      this._txtText.text = _loc2_;
      this._txtText.selectable = false;
      this._txtText.setTextFormat(dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT);
      if(_loc4_ != undefined)
      {
         this._txtText.textColor = _loc4_;
      }
      this._txtTitle.autoSize = "center";
      this._txtTitle.text = _loc6_;
      this._txtTitle.selectable = false;
      this._txtTitle.setTextFormat(dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT);
      if(_loc7_ != undefined)
      {
         this._txtTitle.textColor = _loc7_;
      }
      this._nFullWidth = dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT * dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_WIDTH + (dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT - 1) * dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_MARGIN;
      var _loc9_ = Math.ceil(this._txtText.textHeight + 20 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER * (this._nStarsValue <= -1 ? 3 : 4) + (this._nStarsValue <= -1 ? 0 : dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_WIDTH));
      var _loc10_ = Math.ceil(Math.max(Math.max(this._txtText.textWidth,this._txtTitle.textWidth),this._nStarsValue <= -1 ? 0 : this._nFullWidth) + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER * 2);
      this.drawBackground(_loc10_,_loc9_,dofus["\r\x14"].battlefield["\x14"].BACKGROUND_COLOR);
      if(this._nStarsValue > -1)
      {
         var _loc11_ = this.getStarsColor();
         var _loc12_ = 0;
         while(_loc12_ < dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT)
         {
            var _loc13_ = new Object();
            _loc13_._x = _loc12_ * (dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_WIDTH + dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_MARGIN) - this._nFullWidth / 2 + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER;
            _loc13_._y = dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER * 4 + this._txtTitle.textHeight;
            this._aStars[_loc12_] = this.createEmptyMovieClip("star" + _loc12_,50 + _loc12_);
            this._aStars[_loc12_].attachMovie("StarBorder","star",1,_loc13_);
            var _loc14_ = this._aStars[_loc12_].star.fill;
            if(_loc11_[_loc12_] > -1)
            {
               var _loc15_ = new Color(_loc14_);
               _loc15_.setRGB(_loc11_[_loc12_]);
            }
            else
            {
               _loc14_._alpha = 0;
            }
            _loc12_ = _loc12_ + 1;
         }
      }
      if(_loc8_)
      {
         this.drawGfx(_loc3_,_loc5_);
      }
   }
   function getStarsColor()
   {
      var _loc2_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT)
      {
         var _loc4_ = Math.floor(this._nStarsValue / 100) + (this._nStarsValue - Math.floor(this._nStarsValue / 100) * 100 <= _loc3_ * (100 / dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT) ? 0 : 1);
         _loc2_[_loc3_] = dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COLORS[Math.min(_loc4_,dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COLORS.length - 1)];
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
}
