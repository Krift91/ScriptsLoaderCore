class dofus.§\r\x14§.gapi.controls.ClassSelector extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var slideIter;
   var onEnterFrame;
   var dispatchEvent;
   static var CLASS_NAME = "ClassSelector";
   static var MAXIMUM_ZONES = 3;
   var _xRay = 330;
   var _yRay = 95;
   var _minScale = -120;
   var _maxScale = 100;
   var _minAlpha = -100;
   var _maxAlpha = 100;
   var _bAnimation = true;
   var _nAnimationSpeed = 10;
   var _aClipList = new Array();
   var _bMoving = false;
   var _nCurrentPosition = 0;
   var _nCurrentIndex = 0;
   var _aClips = new Array();
   var _aLoaders = new Array();
   var _nLoaded = 0;
   var _aRegisteredColors = new Array();
   var _aUpdateOnLoaded = new Array();
   function ClassSelector()
   {
      super();
   }
   function get xRay()
   {
      return this._xRay;
   }
   function set xRay(§\t\x02§)
   {
      this._xRay = _loc2_;
   }
   function get yRay()
   {
      return this._yRay;
   }
   function set yRay(§\t\x02§)
   {
      this._yRay = _loc2_;
   }
   function get minScale()
   {
      return this._minScale;
   }
   function set minScale(§\t\x02§)
   {
      this._minScale = _loc2_;
   }
   function get maxScale()
   {
      return this._maxScale;
   }
   function set maxScale(§\t\x02§)
   {
      this._maxScale = _loc2_;
   }
   function get minAlpha()
   {
      return this._minAlpha;
   }
   function set minAlpha(§\t\x02§)
   {
      this._minAlpha = _loc2_;
   }
   function get maxAlpha()
   {
      return this._maxAlpha;
   }
   function set maxAlpha(§\t\x02§)
   {
      this._maxAlpha = _loc2_;
   }
   function get clipsList()
   {
      return this._aClipList;
   }
   function set clipsList(§\x1c§)
   {
      if(this._aClipList.length == _loc2_.length)
      {
         this._nLoaded = 0;
         var _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            this._aLoaders[_loc3_] = new MovieClipLoader();
            this._aLoaders[_loc3_].addListener(this);
            this._aLoaders[_loc3_].loadClip(_loc2_[_loc3_ != 0 ? _loc2_.length - _loc3_ : 0],this._aClips[_loc3_]);
            this._aClips[_loc3_]._visible = false;
            _loc3_ = _loc3_ + 1;
         }
      }
      this._aClipList = _loc2_;
   }
   function get animation()
   {
      return this._bAnimation;
   }
   function set animation(§\x1c\x1d§)
   {
      this._bAnimation = _loc2_;
   }
   function get animationSpeed()
   {
      return this._nAnimationSpeed;
   }
   function set animationSpeed(§\t\x02§)
   {
      this._nAnimationSpeed = _loc2_;
   }
   function get currentIndex()
   {
      return this._nCurrentIndex != this._aClipList.length ? this._nCurrentIndex : 0;
   }
   function set currentIndex(§\t\x02§)
   {
      this.swapTo(_loc2_,true);
   }
   function get clips()
   {
      return this._aClips;
   }
   function initialize(§\x05\x10§)
   {
      this._aClipList = _loc2_;
      this.drawComponent();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.ClassSelector.CLASS_NAME);
   }
   function createChildren()
   {
   }
   function drawComponent()
   {
      var _loc2_ = Math.PI / 180 * 90;
      this._nLoaded = 0;
      var _loc3_ = 0;
      while(_loc3_ < this._aClipList.length)
      {
         this._aClips[_loc3_] = this.createEmptyMovieClip("node" + (this._aClipList.length - _loc3_),this._aClipList.length - _loc3_);
         this._aLoaders[_loc3_] = new MovieClipLoader();
         this._aLoaders[_loc3_].addListener(this);
         this._aLoaders[_loc3_].loadClip(this._aClipList[_loc3_ != 0 ? this._aClipList.length - _loc3_ : 0],this._aClips[_loc3_]);
         this._aClips[_loc3_]._visible = false;
         _loc3_ = _loc3_ + 1;
      }
   }
   function update()
   {
      var _loc2_ = Math.PI / 180 * 90;
      var _loc3_ = 0;
      while(_loc3_ < this._aClips.length)
      {
         this._aClips[_loc3_]._x = Math.cos(_loc2_ + this._nCurrentPosition) * this._xRay;
         this._aClips[_loc3_]._y = Math.sin(_loc2_ + this._nCurrentPosition) * this._yRay;
         var _loc4_ = (this._aClips[_loc3_]._y + this._yRay) / (this._yRay * 2) * (this._maxScale - this._minScale) + this._minScale;
         this._aClips[_loc3_]._xscale = this._aClips[_loc3_]._yscale = _loc4_ > 0 ? _loc4_ : 1;
         this._aClips[_loc3_]._alpha = (this._aClips[_loc3_]._y + this._yRay) / (this._yRay * 2) * (this._maxAlpha - this._minAlpha) + this._minAlpha;
         this._aClips[_loc3_]._visible = this._aClips[_loc3_]._y > 0;
         if(this._aClips[_loc3_]._visible)
         {
            var _loc5_ = Math.floor((_loc2_ + this._nCurrentPosition) * 180 / Math.PI % 360);
            var _loc6_ = Math.floor(360 / this._aClips.length);
            this._aClips[_loc3_].slideIter = - Math.ceil((_loc5_ - 90) / _loc6_);
            var ref = this;
            this._aClips[_loc3_].onRelease = function()
            {
               ref.slide(this.slideIter);
            };
         }
         _loc2_ += Math.PI / 180 * (360 / this._aClips.length);
         _loc3_ = _loc3_ + 1;
      }
   }
   function garbageCollector()
   {
      var _loc2_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < this._aRegisteredColors.length)
      {
         if(this._aRegisteredColors[_loc3_].mc != undefined)
         {
            _loc2_.push(this._aRegisteredColors[_loc3_]);
         }
         _loc3_ = _loc3_ + 1;
      }
      this._aRegisteredColors = _loc2_;
   }
   function registerColor(§\n\x1d§, §\x13\x0f§)
   {
      this._aRegisteredColors.push({mc:_loc2_,z:_loc3_});
      this.garbageCollector();
   }
   function updateColor(§\x1e\t\x03§, §\x12\x14§)
   {
      if(this._nLoaded < this._aClipList.length)
      {
         this._aUpdateOnLoaded[_loc2_] = _loc3_;
      }
      else
      {
         var _loc4_ = 0;
         while(_loc4_ < this._aRegisteredColors.length)
         {
            if(this._aRegisteredColors[_loc4_].z == _loc2_)
            {
               this.applyColor(this._aRegisteredColors[_loc4_].mc,this._aRegisteredColors[_loc4_].z,_loc3_);
            }
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   function applyColor(§\n\x1d§, §\x1e\t\x03§, §\x12\x14§)
   {
      if(_loc4_ == -1 || _loc4_ == undefined)
      {
         var _loc5_ = new Color(_loc2_);
         _loc5_.setTransform({ra:100,ga:100,ba:100,rb:0,gb:0,bb:0});
         return undefined;
      }
      var _loc6_ = (_loc4_ & 0xFF0000) >> 16;
      var _loc7_ = (_loc4_ & 0xFF00) >> 8;
      var _loc8_ = _loc4_ & 0xFF;
      var _loc9_ = new Color(_loc2_);
      var _loc10_ = new Object();
      _loc10_ = {ra:0,ga:0,ba:0,rb:_loc6_,gb:_loc7_,bb:_loc8_};
      _loc9_.setTransform(_loc10_);
   }
   function swapTo(§\x04\n§, §\x17\n§)
   {
      if(_loc2_ > this._aClipList.length)
      {
         return undefined;
      }
      this._bMoving = false;
      delete this.onEnterFrame;
      var _loc4_ = Math.PI / 180 * 360 / this._aClipList.length;
      this._nCurrentIndex = _loc2_;
      this.setPosition(_loc4_ * _loc2_);
      this.onMoveEnd(_loc3_);
   }
   function slide(§\x04\n§)
   {
      if(this._bMoving)
      {
         return undefined;
      }
      if(this._nCurrentIndex + _loc2_ > this._aClipList.length)
      {
         this._nCurrentIndex = this._nCurrentIndex + _loc2_ - this._aClipList.length;
      }
      else if(this._nCurrentIndex + _loc2_ < 0)
      {
         this._nCurrentIndex = this._nCurrentIndex + _loc2_ + this._aClipList.length;
      }
      else
      {
         this._nCurrentIndex += _loc2_;
      }
      if(!this._bAnimation)
      {
         this.swapTo(this._nCurrentIndex);
         return undefined;
      }
      this._bMoving = true;
      var _loc3_ = Math.PI / 180 * 360 / this._aClipList.length;
      var t = 0;
      var b = this._nCurrentPosition;
      var c = this._nCurrentPosition + _loc3_ * _loc2_ - this._nCurrentPosition;
      var d = Math.abs(_loc2_) * this._nAnimationSpeed;
      var r = this;
      this.onEnterFrame = function()
      {
         r.setPosition(r.ease(t++,b,c,d));
         if(t > d)
         {
            delete this.onEnterFrame;
            r.onMoveEnd();
         }
      };
   }
   function setPosition(§\t\x02§)
   {
      this._nCurrentPosition = _loc2_;
      this.update();
   }
   function ease(§\x1e\x0b\x12§, §\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      return _loc4_ * _loc2_ / _loc5_ + _loc3_;
   }
   function onMoveEnd(§\x17\n§)
   {
      this._bMoving = false;
      if(!_loc2_)
      {
         this.dispatchEvent({type:"change",value:this.currentIndex});
      }
   }
   function onLoadComplete(§\n\x1d§)
   {
      this.onSubclipLoaded(_loc2_);
   }
   function onLoadError(§\n\x1d§)
   {
      this.onSubclipLoaded(_loc2_);
   }
   function onSubclipLoaded(§\n\x1d§)
   {
      this._nLoaded++;
      delete this._aLoaders[Number(_loc2_._name.substr(4))];
      var ref = this;
      _loc2_.registerColor = function(§\x1e\n\x1c§, §\t\x02§)
      {
         ref.registerColor(_loc2_,_loc3_);
      };
      if(this._nLoaded == this._aClipList.length)
      {
         var _loc3_ = 1;
         while(_loc3_ <= dofus["\r\x14"].gapi.controls.ClassSelector.MAXIMUM_ZONES)
         {
            this.addToQueue({object:this,method:this.updateColor,params:[_loc3_,this._aUpdateOnLoaded[_loc3_]]});
            _loc3_ = _loc3_ + 1;
         }
         this.update();
      }
   }
}
