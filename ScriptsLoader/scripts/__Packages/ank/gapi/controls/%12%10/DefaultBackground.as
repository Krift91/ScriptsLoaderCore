class ank.gapi.controls.§\x12\x10§.DefaultBackground extends ank.gapi.core.§\x1e\n\f§
{
   static var CLASS_NAME = "DefaultBackground";
   function DefaultBackground()
   {
      super();
   }
   function init()
   {
      super.init(false,ank.gapi.controls["\x12\x10"].DefaultBackground.CLASS_NAME);
   }
   function createChildren()
   {
   }
   function size()
   {
      super.size();
      this.arrange();
   }
   function arrange()
   {
      this.draw();
   }
   function draw()
   {
      this.drawBorder();
   }
}
