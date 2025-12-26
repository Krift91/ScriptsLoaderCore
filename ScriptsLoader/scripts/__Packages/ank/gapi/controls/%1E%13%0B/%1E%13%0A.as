class ank.gapi.controls.§\x1e\x13\x0b§.§\x1e\x13\n§ extends MovieClip
{
   var top_mc;
   var middle_mc;
   var bottom_mc;
   function §\x1e\x13\n§()
   {
      super();
   }
   function set height(§\x04\x17§)
   {
      this.top_mc._y = 0;
      this.middle_mc._y = this.top_mc._height;
      this.middle_mc._height = _loc2_ - this.top_mc._height - this.bottom_mc._height;
      this.bottom_mc._y = this.middle_mc._y + this.middle_mc._height;
   }
}
