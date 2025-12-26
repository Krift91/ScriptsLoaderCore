class dofus.§\r\x14§.battlefield.§\x14§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcTxtBackground;
   var _mcGfx;
   static var BACKGROUND_ALPHA = 70;
   static var BACKGROUND_COLOR = 0;
   static var TEXT_SMALL_FORMAT = new TextFormat("Font1",10,16777215,false,false,false,null,null,"left");
   static var TEXT_FORMAT2 = new TextFormat("Font2",9,16777215,false,false,false,null,null,"center");
   static var TEXT_FORMAT = new TextFormat("Font2",10,16777215,false,false,false,null,null,"center");
   static var CORNER_RADIUS = 0;
   static var WIDTH_SPACER = 4;
   static var HEIGHT_SPACER = 4;
   function §\x14§()
   {
      super();
   }
   function get height()
   {
      return Math.ceil(this._height);
   }
   function get width()
   {
      return Math.ceil(this._width);
   }
   function initialize()
   {
      this.createEmptyMovieClip("_mcGfx",10);
      this.createEmptyMovieClip("_mcTxtBackground",20);
   }
   function drawBackground(§\x1e\x1b\x02§, §\x04\x17§, §\x06\x1d§)
   {
      this.drawRoundRect(this._mcTxtBackground,(- _loc2_) / 2,0,_loc2_,_loc3_,3,_loc4_,dofus["\r\x14"].battlefield["\x14"].BACKGROUND_ALPHA);
   }
   function drawGfx(§\x1e\x12\x0b§, §\x04\x1d§)
   {
      this._mcGfx.attachClassMovie(ank["\x1e\n\x07"]["\x1e\x0b\x15"],"_mcSwfLoader",10);
      this._mcGfx._mcSwfLoader.loadSWF(_loc2_,_loc3_);
   }
   function addPvpGfxEffect(§\x01\x04§, §\x04\x1d§)
   {
      switch(_loc2_)
      {
         case -1:
            var _loc4_ = 0.5;
            var _loc5_ = new Array();
            _loc5_ = _loc5_.concat([_loc4_,0,0,0,0]);
            _loc5_ = _loc5_.concat([0,_loc4_,0,0,0]);
            _loc5_ = _loc5_.concat([0,0,_loc4_,0,0]);
            _loc5_ = _loc5_.concat([0,0,0,1,0]);
            var _loc6_ = new flash.filters.ColorMatrixFilter(_loc5_);
            this._mcGfx.filters = new Array(_loc6_);
            break;
         case 1:
            switch(Math.floor((_loc3_ - 1) / 10))
            {
               case 0:
                  var _loc7_ = 11201279;
                  break;
               case 1:
                  _loc7_ = 13369344;
                  break;
               case 2:
                  _loc7_ = 0;
            }
            var _loc8_ = 0.5;
            var _loc9_ = 10;
            var _loc10_ = 10;
            var _loc11_ = 2;
            var _loc12_ = 3;
            var _loc13_ = false;
            var _loc14_ = false;
            var _loc15_ = new flash.filters.GlowFilter(_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_);
            var _loc16_ = new Array();
            _loc16_.push(_loc15_);
            this._mcGfx.filters = _loc16_;
      }
   }
}
