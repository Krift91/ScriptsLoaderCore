class ank.§\x1e\n\x07§.§\x1e\x0b\x15§ extends MovieClip
{
   var _frameStart;
   var _aArgs;
   var swf_mc;
   var broadcastMessage;
   function §\x1e\x0b\x15§()
   {
      super();
      AsBroadcaster.initialize(this);
      this.initialize(0);
   }
   function initialize(§\x0e\x04§, §\x1d\x11§)
   {
      this.clear();
      this._frameStart = _loc2_;
      this._aArgs = _loc3_;
   }
   function clear()
   {
      this.createEmptyMovieClip("swf_mc",10);
   }
   function remove()
   {
      this.swf_mc.__proto__ = MovieClip.prototype;
      this.swf_mc.removeMovieClip();
   }
   function loadSWF(§\x0e\t§, §\x0e\x04§, §\x1d\x11§)
   {
      this.initialize(_loc3_,_loc4_);
      var _loc5_ = new MovieClipLoader();
      _loc5_.addListener(this);
      _loc5_.loadClip(_loc2_,this.swf_mc);
   }
   function onLoadComplete(§\n\x1d§)
   {
      this.broadcastMessage("onLoadComplete",_loc2_,this._aArgs);
   }
   function onLoadInit(§\n\x1d§)
   {
      if(this._frameStart != undefined)
      {
         _loc2_.gotoAndStop(this._frameStart);
      }
      this.broadcastMessage("onLoadInit",_loc2_,this._aArgs);
   }
}
