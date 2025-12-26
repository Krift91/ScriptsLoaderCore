class ank.battlefield.mc.Points extends MovieClip
{
   var _pointsHandler;
   var _nRefY;
   var _nID;
   var _tf;
   var _nI;
   var _nSz;
   var _nVy;
   var _nOpacity;
   var _nY;
   var _nCurrentFrame;
   var onEnterFrame;
   var _nT;
   var _bFinished = false;
   function Points(pointsHandler, §\x04\x12§, §\x1e\x1e\f§, §\x1e\x0b\x19§, §\x06\x1d§)
   {
      super();
      this.initialize(pointsHandler,_loc4_,_loc5_,_loc6_,_loc7_);
   }
   function initialize(pointsHandler, §\x04\x12§, §\x1e\x1e\f§, §\x1e\x0b\x19§, §\x06\x1d§)
   {
      this._pointsHandler = pointsHandler;
      this._nRefY = _loc4_;
      this._nID = _loc3_;
      this.createTextField("_tf",10,0,0,150,100);
      this._tf.autoSize = "left";
      this._tf.embedFonts = true;
      this._tf.selectable = false;
      this._tf.textColor = _loc6_;
      this._tf.text = _loc5_;
      this._tf.setTextFormat(ank.battlefield.Constants.SPRITE_POINTS_TEXTFORMAT);
      this._tf._x = - this._tf.textWidth / 2;
      this._tf._y = - this._tf.textHeight / 2;
      this._visible = false;
      this._nI = 0;
      if(dofus.Constants.DOUBLEFRAMERATE)
      {
         this._nSz = 200;
         this._nVy = -20;
         this._nOpacity = 100;
      }
      else
      {
         this._nSz = 100;
         this._nVy = -20;
      }
      this._nY = _loc4_;
   }
   function animate()
   {
      this._visible = true;
      this._nCurrentFrame = 0;
      this.onEnterFrame = function()
      {
         this._nCurrentFrame++;
         if(dofus.Constants.DOUBLEFRAMERATE)
         {
            this._xscale = this._nT;
            this._yscale = this._nT;
            this._alpha = this._nOpacity;
            this._nT = 100 + this._nSz * Math.sin(this._nI += 0.25);
            this._nSz *= 0.95;
            this._nY += this._nVy *= 0.7;
            this._y = this._nY;
            var _loc2_ = this._nRefY - this._nY;
            if(_loc2_ > ank.battlefield.Constants.SPRITE_POINTS_OFFSET)
            {
               this._nOpacity -= 0;
            }
            if(this._nSz <= 0 || this._nCurrentFrame > 15)
            {
               this._bFinished = true;
               this._pointsHandler.onAnimateFinished(this._nID);
               this.removeMovieClip();
               delete this.onEnterFrame;
            }
         }
         else
         {
            this._xscale = this._nT;
            this._yscale = this._nT;
            this._nT = 100 + this._nSz * Math.sin(this._nI += 1.2);
            this._nSz *= 0.85;
            this._nY += this._nVy *= 0.7;
            this._y = this._nY;
            var _loc3_ = this._nRefY - this._nY;
            if(_loc3_ > ank.battlefield.Constants.SPRITE_POINTS_OFFSET)
            {
               this.remove();
            }
            if(!this._bFinished)
            {
               if(_loc3_ > ank.battlefield.Constants.SPRITE_POINTS_OFFSET - 2)
               {
                  this._bFinished = true;
                  this._pointsHandler.onAnimateFinished(this._nID);
               }
            }
         }
      };
   }
   function remove()
   {
      delete this.onEnterFrame;
      this.removeMovieClip();
   }
}
