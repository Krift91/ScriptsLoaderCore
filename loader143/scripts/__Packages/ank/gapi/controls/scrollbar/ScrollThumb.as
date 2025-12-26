class ank.gapi.controls.scrollbar.ScrollThumb extends MovieClip
{
   function ScrollThumb()
   {
      super();
   }
   function set height(nHeight)
   {
      this.top_mc._y = 0;
      this.middle_mc._y = this.top_mc._height;
      this.middle_mc._height = nHeight - this.top_mc._height - this.bottom_mc._height;
      this.bottom_mc._y = this.middle_mc._y + this.middle_mc._height;
   }
}
