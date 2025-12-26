class ank.gapi.controls.§\x12\x10§.DefaultHighlight extends ank.gapi.core.§\x1e\n\f§
{
   var _mcHighlight;
   var __width;
   var __height;
   static var CLASS_NAME = "DefaultHighlight";
   function DefaultHighlight()
   {
      super();
   }
   function init()
   {
      super.init(false,ank.gapi.controls["\x12\x10"].DefaultHighlight.CLASS_NAME);
   }
   function createChildren()
   {
      this.createEmptyMovieClip("_mcHighlight",10);
   }
   function size()
   {
      super.size();
      this.arrange();
   }
   function arrange()
   {
      this._mcHighlight._width = this.__width;
      this._mcHighlight._height = this.__height;
   }
   function draw()
   {
      this.drawRoundRect(this._mcHighlight,0,0,1,1,0,0,50);
   }
}
