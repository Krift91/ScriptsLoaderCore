class ank.gapi.controls.CircleChrono extends ank.gapi.core.§\x1e\n\f§
{
   var _nIntervalID;
   var dispatchEvent;
   var _nMaxTime;
   var _nTimerValue;
   var _mcLeft;
   var _mcRight;
   var __width;
   var __height;
   static var CLASS_NAME = "CircleChrono";
   var _sBackgroundLink = "CircleChronoHalfDefault";
   var _nFinalCountDownTrigger = 5;
   var _nBackgroundColor = -1;
   function CircleChrono()
   {
      super();
   }
   function set background(§\x1e\x14\x0e§)
   {
      this._sBackgroundLink = _loc2_;
   }
   function set finalCountDownTrigger(§\x05\x02§)
   {
      _loc2_ = Number(_loc2_);
      if(_global.isNaN(_loc2_))
      {
         return;
      }
      if(_loc2_ < 0)
      {
         return;
      }
      this._nFinalCountDownTrigger = _loc2_;
   }
   function setGaugeChrono(§\x01\x12§, §\x06\x10§)
   {
      _global.clearInterval(this._nIntervalID);
      this.dispatchEvent({type:"finish"});
      if(_loc2_ > 100)
      {
         _loc2_ = 100;
      }
      else if(_loc2_ < 0)
      {
         _loc2_ = 0;
      }
      this._nMaxTime = 100;
      this._nTimerValue = 100 - _loc2_;
      this.draw(_loc3_);
      this.chronoUpdate();
   }
   function startTimer(§\x05\x19§)
   {
      _global.clearInterval(this._nIntervalID);
      _loc2_ = Number(_loc2_);
      if(_global.isNaN(_loc2_))
      {
         return undefined;
      }
      if(_loc2_ < 0)
      {
         return undefined;
      }
      this._nMaxTime = _loc2_;
      this._nTimerValue = _loc2_;
      this.updateTimer();
      this._nIntervalID = _global.setInterval(this,"updateTimer",1000);
   }
   function stopTimer()
   {
      _global.clearInterval(this._nIntervalID);
      this.dispatchEvent({type:"finish"});
      this.addToQueue({object:this,method:this.initialize});
   }
   function redraw()
   {
      this.draw();
   }
   function init()
   {
      super.init(false,ank.gapi.controls.CircleChrono.CLASS_NAME);
   }
   function createChildren()
   {
      this.attachMovie(this._sBackgroundLink,"_mcLeft",10);
      this.attachMovie(this._sBackgroundLink,"_mcRight",20);
   }
   function arrange()
   {
      this._mcLeft._width = this._mcRight._width = this.__width;
      this._mcLeft._height = this._mcRight._height = this.__height;
      this._mcLeft._xscale *= -1;
      this._mcLeft._yscale *= -1;
      this._mcLeft._x = this._mcRight._x = this.__width / 2;
      this._mcLeft._y = this._mcRight._y = this.__height / 2;
   }
   function draw(§\x06\x10§)
   {
      var _loc3_ = _loc2_ == undefined ? this.getStyle().bgcolor : _loc2_;
      if(_loc3_ != undefined && this._nBackgroundColor != _loc2_)
      {
         this._nBackgroundColor = _loc3_;
         this.setMovieClipColor(this._mcLeft.bg_mc,_loc3_);
         this.setMovieClipColor(this._mcRight.bg_mc,_loc3_);
      }
   }
   function chronoUpdate()
   {
      var _loc2_ = this._nTimerValue / this._nMaxTime;
      var _loc3_ = 360 * (1 - this._nTimerValue / this._nMaxTime);
      if(_loc3_ < 180)
      {
         this.setRtation(this._mcRight,_loc3_);
         this.setRtation(this._mcLeft,0);
      }
      else
      {
         this.setRtation(this._mcRight,180);
         this.setRtation(this._mcLeft,_loc3_ - 180);
      }
   }
   function updateTimer()
   {
      this.dispatchEvent({type:"tictac"});
      this.chronoUpdate();
      if(this._nTimerValue - 5 <= this._nFinalCountDownTrigger)
      {
         this.dispatchEvent({type:"beforeFinalCountDown",value:Math.ceil(this._nTimerValue)});
      }
      if(this._nTimerValue <= this._nFinalCountDownTrigger)
      {
         this.dispatchEvent({type:"finalCountDown",value:Math.ceil(this._nTimerValue)});
      }
      this._nTimerValue--;
      if(this._nTimerValue < 0)
      {
         this.stopTimer();
      }
   }
   function initialize()
   {
      this.setRtation(this._mcLeft,0);
      this.setRtation(this._mcRight,0);
   }
   function setRtation(§\n\x1d§, §\b\x13§)
   {
      _loc2_._mcMask._rotation = _loc3_;
   }
}
