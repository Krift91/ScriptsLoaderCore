class ank.gapi.controls.VolumeSlider extends ank.gapi.core.§\x1e\n\f§
{
   var __height;
   var __width;
   var _mcMarkers;
   var _mcOvers;
   var dispatchEvent;
   static var CLASS_NAME = "VolumeSlider";
   var _nMin = 0;
   var _nMax = 100;
   var _nValue = 0;
   var _nMarkerCount = 5;
   var _nMarkerWidthRatio = 0.7;
   var _sMarkerSkin = "VolumeSliderMarkerDefault";
   function VolumeSlider()
   {
      super();
   }
   function set min(§\x02\x12§)
   {
      this._nMin = Number(_loc2_);
   }
   function get min()
   {
      return this._nMin;
   }
   function set max(§\x03\x07§)
   {
      this._nMax = Number(_loc2_);
   }
   function get max()
   {
      return this._nMax;
   }
   function set value(§\x1e\x1b\n§)
   {
      _loc2_ = Number(_loc2_);
      if(_global.isNaN(_loc2_))
      {
         return;
      }
      if(_loc2_ > this.max)
      {
         _loc2_ = this.max;
      }
      if(_loc2_ < this.min)
      {
         _loc2_ = this.min;
      }
      this._nValue = _loc2_;
      if(this._bInitialized)
      {
         var _loc3_ = Math.floor((this._nMarkerCount - 1) * (_loc2_ - this._nMin) / (this._nMax - this._nMin));
         this.setValueByIndex(_loc3_);
      }
   }
   function get value()
   {
      return this._nValue;
   }
   function set markerCount(§\x03\t§)
   {
      if(Number(_loc2_) > 0)
      {
         this._nMarkerCount = Number(_loc2_);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[markerCount] ne peut être < à 0");
      }
   }
   function get markerWidth()
   {
      return this._nMarkerCount;
   }
   function set markerWidthRatio(§\x03\b§)
   {
      if(Number(_loc2_) >= 0 && Number(_loc2_) <= 1)
      {
         this._nMarkerWidthRatio = Number(_loc2_);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[markerCount] ne peut être < à 0 et > 1");
      }
   }
   function get markerWidthRatio()
   {
      return this._nMarkerWidthRatio;
   }
   function set markerSkin(§\x1e\x10\x07§)
   {
      this._sMarkerSkin = _loc2_;
   }
   function get markerSkin()
   {
      return this._sMarkerSkin;
   }
   function redraw()
   {
      this.createMarkers();
      this.arrange();
   }
   function init()
   {
      super.init(false,ank.gapi.controls.VolumeSlider.CLASS_NAME);
   }
   function createChildren()
   {
      this.createMarkers();
   }
   function arrange()
   {
      var _loc2_ = this.__height;
      var _loc3_ = this.__height / 2;
      var _loc4_ = this.__width / this._nMarkerCount;
      var _loc5_ = (this.__width + _loc4_ * (1 - this._nMarkerWidthRatio)) / this._nMarkerCount;
      var _loc6_ = 0;
      while(_loc6_ < this._nMarkerCount)
      {
         var _loc7_ = this._mcMarkers["mcMarker" + _loc6_];
         var _loc8_ = this._mcOvers["mcOver" + _loc6_];
         var _loc9_ = _loc8_.index;
         var _loc10_ = _loc9_ / this._nMarkerCount;
         _loc7_._width = _loc5_ * this._nMarkerWidthRatio;
         _loc8_._width = _loc5_;
         _loc7_._height = _loc3_ + _loc10_ * (_loc2_ - _loc3_);
         _loc8_._height = this.__height;
         _loc7_._x = _loc9_ * _loc5_;
         _loc7_._y = this.__height;
         _loc8_._x = _loc9_ * _loc5_;
         _loc8_._y = 0;
         _loc6_ = _loc6_ + 1;
      }
   }
   function draw()
   {
      this.addToQueue({object:this,method:function()
      {
         this.value = this._nValue;
      }});
   }
   function createMarkers()
   {
      this._mcMarkers.removeMovieClip();
      this.createEmptyMovieClip("_mcOvers",10);
      this.createEmptyMovieClip("_mcMarkers",20);
      var _loc2_ = 0;
      while(_loc2_ < this._nMarkerCount)
      {
         var _loc3_ = this._mcMarkers.attachMovie(this._sMarkerSkin,"mcMarker" + _loc2_,_loc2_);
         var _loc4_ = this._mcOvers.createEmptyMovieClip("mcOver" + _loc2_,_loc2_);
         this.drawRoundRect(_loc4_,0,0,1,1,0,16711935,0);
         _loc4_.index = _loc2_;
         this.setMovieClipColor(_loc3_,this.getStyle().offcolor);
         _loc4_.trackAsMenu = true;
         _loc4_.onDragOver = function()
         {
            this._parent._parent.dragOver({target:this});
         };
         _loc4_.onPress = function()
         {
            this._parent._parent.press({target:this});
         };
         _loc2_ = _loc2_ + 1;
      }
   }
   function setValueByIndex(§\x04\n§)
   {
      if(_loc2_ > this._nMarkerCount - 1)
      {
         return undefined;
      }
      if(_loc2_ < 0)
      {
         return undefined;
      }
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      var _loc3_ = this.getStyle().oncolor;
      var _loc4_ = this.getStyle().offcolor;
      var _loc5_ = 0;
      while(_loc5_ <= _loc2_)
      {
         this.setMovieClipColor(this._mcMarkers["mcMarker" + _loc5_],_loc3_);
         _loc5_ = _loc5_ + 1;
      }
      var _loc6_ = _loc2_ + 1;
      while(_loc6_ < this._nMarkerCount)
      {
         this.setMovieClipColor(this._mcMarkers["mcMarker" + _loc6_],_loc4_);
         _loc6_ = _loc6_ + 1;
      }
   }
   function getValueByIndex(§\x04\n§)
   {
      return _loc2_ * (this._nMax - this._nMin) / (this._nMarkerCount - 1) + this._nMin;
   }
   function dragOver(§\x1e\x19\x0e§)
   {
      this.value = this.getValueByIndex(_loc2_.target.index);
      this.dispatchEvent({type:"change"});
   }
   function press(§\x1e\x19\x0e§)
   {
      this.value = this.getValueByIndex(_loc2_.target.index);
      this.dispatchEvent({type:"change"});
   }
}
