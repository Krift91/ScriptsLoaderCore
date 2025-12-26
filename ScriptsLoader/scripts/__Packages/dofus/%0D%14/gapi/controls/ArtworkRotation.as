class dofus.§\r\x14§.gapi.controls.ArtworkRotation extends ank.gapi.core.§\x1e\n\f§
{
   var _ariMan;
   var _ariWoman;
   var _i;
   var _nCurrentSex;
   var _di;
   var onEnterFrame;
   static var CLASS_NAME = "ArtworkRotationItem";
   function ArtworkRotation()
   {
      super();
   }
   function set classID(§\x07\x01§)
   {
      this._ariMan.loadArtwork(_loc2_);
      this._ariWoman.loadArtwork(_loc2_);
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.ArtworkRotation.CLASS_NAME);
   }
   function createChildren()
   {
      this._i = 2.02;
   }
   function setPosition(§\x1e\x1d\x0f§)
   {
      if(this._nCurrentSex == _loc2_)
      {
         return undefined;
      }
      this._nCurrentSex = _loc2_;
      var _loc3_ = _loc2_ == 0;
      this._ariWoman.colorize(_loc3_);
      this._ariMan.colorize(!_loc3_);
      if(!_loc3_)
      {
         this._ariMan.swapDepths(this._ariWoman);
      }
      this._i = !_loc3_ ? 5.13 : 2;
      var _loc4_ = -30.4 * (!_loc3_ ? 1 : -1);
      var _loc5_ = 28.7 * (!_loc3_ ? 1 : -1);
      var _loc6_ = -45.6 * (!_loc3_ ? 1 : -1);
      this._ariMan._x = _loc5_;
      this._ariMan._y = _loc6_;
      this._ariWoman._x = - _loc5_;
      this._ariWoman._y = - _loc6_;
      this._ariMan._xscale = 100 + _loc4_;
      this._ariMan._yscale = 100 + _loc4_;
      this._ariWoman._xscale = 100 - _loc4_;
      this._ariWoman._yscale = 100 - _loc4_;
   }
   function rotate(§\x1e\x1d\x0f§)
   {
      if(this._nCurrentSex == _loc2_)
      {
         return undefined;
      }
      this._nCurrentSex = _loc2_;
      var piy = 0;
      var px = 0;
      var py = 0;
      var t = 0;
      var bSwaped = false;
      var _loc3_ = _loc2_ == 0;
      this._ariWoman.colorize(_loc3_);
      this._ariMan.colorize(!_loc3_);
      this._di = !_loc3_ ? 2 + Math.PI : 2;
      this.onEnterFrame = function()
      {
         if(Math.abs(this._i - this._di) > 0.01)
         {
            this._i -= (this._i - this._di) / 3;
            piy = py;
            px = 70 * Math.cos(this._i);
            py = 50 * Math.sin(this._i);
            if(piy < 0 && py >= 0 || piy >= 0 && py < 0)
            {
               if(!bSwaped)
               {
                  this._ariMan.swapDepths(this._ariWoman);
                  bSwaped = true;
               }
            }
            t = py / 1.5;
            this._ariMan._x = px;
            this._ariMan._y = py;
            this._ariWoman._x = - px;
            this._ariWoman._y = - py;
            this._ariMan._xscale = 100 + t;
            this._ariMan._yscale = 100 + t;
            this._ariWoman._xscale = 100 - t;
            this._ariWoman._yscale = 100 - t;
         }
         else
         {
            delete this.onEnterFrame;
         }
      };
   }
}
