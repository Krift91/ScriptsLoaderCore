class ank.gapi.controls.Compass extends ank.gapi.core.§\x1e\n\f§
{
   var _aCurrentCoords;
   var _aTargetCoords;
   var _mcArrow;
   var __width;
   var __height;
   var _ldrBack;
   var dispatchEvent;
   static var CLASS_NAME = "Compass";
   var _bUpdateOnLoad = true;
   var _sBackground = "CompassNormalBackground";
   var _sArrow = "CompassNormalArrow";
   var _sNoArrow = "CompassNormalNoArrow";
   function Compass()
   {
      super();
   }
   function set updateOnLoad(§\x14\x07§)
   {
      this._bUpdateOnLoad = _loc2_;
   }
   function get updateOnLoad()
   {
      return this._bUpdateOnLoad;
   }
   function set background(§\x1e\x14\x0e§)
   {
      this._sBackground = _loc2_;
   }
   function get background()
   {
      return this._sBackground;
   }
   function set arrow(§\x1e\x14\x14§)
   {
      this._sArrow = _loc2_;
   }
   function get arrow()
   {
      return this._sArrow;
   }
   function set noArrow(§\x1e\x0f\x11§)
   {
      this._sNoArrow = _loc2_;
   }
   function get noArrow()
   {
      return this._sNoArrow;
   }
   function set currentCoords(§\x04§)
   {
      this._aCurrentCoords = _loc2_;
      if(this.initialized)
      {
         this.layoutContent();
      }
   }
   function set targetCoords(§\x1d\x07§)
   {
      this._aTargetCoords = _loc2_;
      if(this.initialized)
      {
         this.layoutContent();
      }
   }
   function get targetCoords()
   {
      return this._aTargetCoords;
   }
   function set allCoords(§\x1e\x1a\f§)
   {
      this._aTargetCoords = _loc2_.targetCoords;
      this._aCurrentCoords = _loc2_.currentCoords;
      if(this.initialized)
      {
         this.addToQueue({object:this,method:this.layoutContent});
      }
   }
   function init()
   {
      super.init(false,ank.gapi.controls.Compass.CLASS_NAME);
   }
   function createChildren()
   {
      this.attachMovie("Loader","_ldrBack",10,{contentPath:this._sBackground,centerContent:false,scaleContent:true});
      this.createEmptyMovieClip("_mcArrow",20);
      this._mcArrow.attachMovie("Loader","_ldrArrow",10,{contentPath:this._sNoArrow,centerContent:false,scaleContent:true});
      if(this._bUpdateOnLoad)
      {
         this.addToQueue({object:this,method:this.layoutContent});
      }
   }
   function size()
   {
      super.size();
      this.arrange();
   }
   function arrange()
   {
      this._ldrBack.setSize(this.__width,this.__height);
      this._mcArrow._x = this.__width / 2;
      this._mcArrow._y = this.__height / 2;
      this._mcArrow._ldrArrow.setSize(this.__width,this.__height);
      this._mcArrow._ldrArrow._x = (- this.__width) / 2;
      this._mcArrow._ldrArrow._y = (- this.__height) / 2;
   }
   function layoutContent()
   {
      if(this._aCurrentCoords == undefined)
      {
         return undefined;
      }
      if(this._aCurrentCoords.length == 0)
      {
         return undefined;
      }
      if(this._aTargetCoords == undefined)
      {
         return undefined;
      }
      if(this._aTargetCoords.length == 0)
      {
         return undefined;
      }
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"compass");
      var _loc2_ = this._aTargetCoords[0] - this._aCurrentCoords[0];
      var _loc3_ = this._aTargetCoords[1] - this._aCurrentCoords[1];
      if(_loc2_ == 0 && _loc3_ == 0)
      {
         this._mcArrow._ldrArrow.contentPath = this._sNoArrow;
         this._mcArrow._ldrArrow.content._rotation = this._mcArrow._rotation;
         this._mcArrow._rotation = 0;
         this.smoothRotation(0,1);
      }
      else
      {
         var _loc4_ = Math.atan2(_loc3_,_loc2_) * (180 / Math.PI);
         this._mcArrow._ldrArrow.contentPath = this._sArrow;
         this._mcArrow._ldrArrow.content._rotation = this._mcArrow._rotation - _loc4_;
         this._mcArrow._rotation = _loc4_;
         this.smoothRotation(_loc4_,1);
      }
   }
   function smoothRotation(§\x03\x06§, §\x1e\x1d\x02§)
   {
      this._mcArrow._ldrArrow.content._rotation += _loc3_;
      _loc3_ = (- this._mcArrow._ldrArrow.content._rotation) * 0.2 + _loc3_ * 0.7;
      if(Math.abs(_loc3_) > 0.01)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"compass",this,this.smoothRotation,50,[_loc2_,_loc3_]);
      }
      else
      {
         this._mcArrow._ldrArrow.content._rotation = 0;
      }
   }
   function onRelease()
   {
      this.dispatchEvent({type:"click"});
   }
   function onReleaseOutside()
   {
      this.onRollOut();
   }
   function onRollOver()
   {
      this.dispatchEvent({type:"over"});
   }
   function onRollOut()
   {
      this.dispatchEvent({type:"out"});
   }
}
