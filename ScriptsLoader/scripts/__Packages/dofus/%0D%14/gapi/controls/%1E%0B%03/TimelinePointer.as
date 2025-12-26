class dofus.§\r\x14§.gapi.controls.§\x1e\x0b\x03§.TimelinePointer extends ank.gapi.core.§\x1e\n\f§
{
   var _destX;
   var onEnterFrame;
   static var CLASS_NAME = "Timeline";
   function TimelinePointer()
   {
      super();
   }
   function moveTween(§\x11\x01§, destScale)
   {
      var nDir = _loc2_ <= this._x ? -1 : 1;
      var i = 0;
      this._destX = _loc2_;
      this.onEnterFrame = function()
      {
         i++;
         this._x += i * i * nDir;
         this._xscale += (destScale - this._xscale) / 2;
         this._yscale += (destScale - this._yscale) / 2;
         if(this._x * nDir > this._destX * nDir)
         {
            this._x = this._destX;
            this._xscale = destScale;
            this._yscale = destScale;
            delete this.onEnterFrame;
         }
      };
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls["\x1e\x0b\x03"].TimelinePointer.CLASS_NAME);
   }
}
