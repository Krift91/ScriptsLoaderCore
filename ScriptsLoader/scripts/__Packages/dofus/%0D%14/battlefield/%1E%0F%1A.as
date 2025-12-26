class dofus.§\r\x14§.battlefield.§\x1e\x0f\x1a§ extends MovieClip
{
   function §\x1e\x0f\x1a§(§\x1e\x1d\x04§)
   {
      super();
      this.draw(_loc3_);
   }
   function get height()
   {
      return 20;
   }
   function get width()
   {
      return 20;
   }
   function draw(§\x1e\x1d\x04§)
   {
      this.attachMovie("Loader","_ldrSmiley",10,{_x:-10,_width:20,_height:20,scaleContent:true,contentPath:dofus.Constants.SMILEYS_ICONS_PATH + _loc2_ + ".swf"});
   }
}
