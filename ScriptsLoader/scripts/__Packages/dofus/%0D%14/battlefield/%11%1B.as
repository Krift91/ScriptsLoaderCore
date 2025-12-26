class dofus.§\r\x14§.battlefield.§\x11\x1b§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcBack;
   var _ldrItem;
   var _mcCross;
   var _mcMiss;
   function §\x11\x1b§(§\x1c\x17§, §\x1e\x19\x03§)
   {
      super();
      this.initialize();
      this.draw(_loc3_,_loc4_);
   }
   function get height()
   {
      return 33;
   }
   function get width()
   {
      return 62;
   }
   function initialize()
   {
      this.attachMovie("CraftResultOverHeadBubble","_mcBack",10);
   }
   function reverseClip()
   {
      this._mcBack._yscale = -100;
      this._mcBack._y += this._mcBack._height - 7;
   }
   function draw(§\x1c\x17§, §\x1e\x19\x03§)
   {
      if(_loc3_ == undefined)
      {
         this.attachMovie("CraftResultOverHeadCross","_mcCross",40);
         this._ldrItem.removeMovieClip();
      }
      else
      {
         this.attachMovie("Loader","_ldrItem",20,{_x:6,_y:4,_width:20,_height:20,scaleContent:true,contentPath:_loc3_.iconFile});
         this._mcCross.removeMovieClip();
      }
      if(!_loc2_)
      {
         this.attachMovie("CraftResultOverHeadMiss","_mcMiss",30);
      }
      else
      {
         this._mcMiss.removeMovieClip();
      }
   }
}
