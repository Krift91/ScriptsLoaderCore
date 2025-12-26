class dofus.§\r\x14§.battlefield.§\x0e\r§ extends MovieClip
{
   var _mc;
   var _tTeam;
   var onEnterFrame;
   static var ICON_WIDTH = 20;
   function §\x0e\r§(§\x1e\n\x18§)
   {
      super();
      this.initialize(_loc3_);
      this.draw();
   }
   function get height()
   {
      return 20;
   }
   function initialize(§\x1e\n\x18§)
   {
      this._mc.removeMovieClip();
      this.createEmptyMovieClip("_mc",10);
      this._tTeam = _loc2_;
   }
   function draw()
   {
      for(var a in this._mc)
      {
         this._mc[a].removeMovieClip();
      }
      var _loc2_ = 0;
      for(var a in this._tTeam.options)
      {
         var _loc3_ = this._tTeam.options[a];
         if(_loc3_ == true)
         {
            var _loc4_ = "UI_FightOption" + a + "Up";
            if(dofus.Constants.DOUBLEFRAMERATE && a == dofus.datacenter.Team.OPT_NEED_HELP)
            {
               _loc4_ += "_DoubleFramerate";
            }
            var _loc5_ = this._mc.attachMovie(_loc4_,"mcOption" + _loc2_,_loc2_);
            _loc5_._x = _loc2_ * dofus["\r\x14"].battlefield["\x0e\r"].ICON_WIDTH;
            _loc5_.onEnterFrame = function()
            {
               this.play();
               delete this.onEnterFrame;
            };
            _loc2_ = _loc2_ + 1;
         }
      }
      this._x = (- _loc2_ * dofus["\r\x14"].battlefield["\x0e\r"].ICON_WIDTH) / 2;
   }
}
