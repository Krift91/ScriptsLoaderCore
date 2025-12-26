class ank.battlefield.§\x1e\t\x1d§
{
   var _mcBattlefield;
   var _mcContainer;
   var _incIndex;
   var attachMovie;
   var shoot;
   var end;
   var onEnterFrame;
   var move;
   static var MAX_INDEX = 21;
   function §\x1e\t\x1d§(§\x1c\x1d§, §\x13\x0f§)
   {
      this.initialize(_loc2_,_loc3_);
   }
   function initialize(§\x1c\x1d§, §\x13\x0f§)
   {
      this._mcBattlefield = _loc2_;
      this._mcContainer = _loc3_;
      this.clear();
   }
   function clear(§\x1e\t\x1c§)
   {
      this._incIndex = 0;
   }
   function addEffect(§\x1e\x0e\x0f§, §\x1e\x17\x06§, §\x07\x11§, displayType, §\x1e\x0b\x0e§, §\x13\x1a§)
   {
      if(displayType < 10)
      {
         return undefined;
      }
      var _loc8_ = !_loc3_.bInFrontOfSprite ? -1 : 1;
      var _loc9_ = this.getNextIndex() + ank.battlefield.Constants.MAX_SPRITES_ON_CELL / 2 + 1;
      this._mcContainer["eff" + _loc9_].removeMovieClip();
      this._mcContainer.createEmptyMovieClip("eff" + _loc9_,_loc4_ * 100 + 50 + _loc8_ * _loc9_);
      var _loc10_ = this._mcContainer["eff" + _loc9_];
      _loc10_.createEmptyMovieClip("mc",10);
      _loc10_._visible = _loc7_ != undefined ? _loc7_ : true;
      var _loc11_ = new MovieClipLoader();
      _loc11_.addListener(this);
      _loc10_.sprite = _loc2_;
      _loc10_.targetSprite = _loc6_;
      _loc10_.cellNum = _loc4_;
      _loc10_.displayType = displayType;
      _loc10_.level = _loc3_.level;
      _loc10_.params = _loc3_.params;
      if(_loc3_.bTryToBypassContainerColor == true)
      {
         var _loc12_ = new Color(_loc10_);
         _loc12_.setTransform({ra:200,rb:0,ga:200,gb:0,ba:200,bb:0});
      }
      _loc11_.loadClip(_loc3_.file,_loc10_.mc);
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(_loc10_,"battlefield",_loc10_,_loc10_.removeMovieClip,ank.battlefield.Constants.VISUAL_EFFECT_MAX_TIMER);
   }
   function onLoadInit(§\n\x1d§)
   {
      var _loc3_ = _loc2_._parent.sprite;
      var _loc4_ = _loc2_._parent.targetSprite;
      var _loc5_ = _loc2_._parent.cellNum;
      var displayType = _loc2_._parent.displayType;
      var _loc6_ = _loc2_._parent.level;
      var _loc7_ = _loc2_._parent.params;
      var _loc8_ = _loc2_._parent.ignoreTargetInHeight;
      var _loc9_ = _loc3_.cellNum;
      var _loc10_ = this._mcBattlefield.mapHandler.getCellData(_loc9_);
      var _loc11_ = this._mcBattlefield.mapHandler.getCellData(_loc5_);
      var _loc12_ = !!_loc3_ ? {x:_loc3_.mc._x,y:_loc3_.mc._y} : {x:_loc10_.x,y:_loc10_.y};
      var _loc13_ = !!_loc4_ ? {x:_loc4_.mc._x,y:_loc4_.mc._y} : {x:_loc11_.x,y:_loc11_.y};
      _loc2_.level = _loc6_;
      _loc2_.angle = Math.atan2(_loc13_.y - _loc12_.y,_loc13_.x - _loc12_.x) * 180 / Math.PI;
      _loc2_.params = _loc7_;
      switch(displayType)
      {
         case 10:
         case 12:
            _loc2_._ACTION = _loc3_;
            _loc2_._x = _loc12_.x;
            _loc2_._y = _loc12_.y;
            break;
         case 11:
            _loc2_._ACTION = _loc3_;
            _loc2_._x = _loc13_.x;
            _loc2_._y = _loc13_.y;
            break;
         case 20:
         case 21:
            _loc2_._x = _loc12_.x;
            _loc2_._y = _loc12_.y;
            var _loc14_ = Math.PI / 2;
            var _loc15_ = _loc13_.x - _loc12_.x;
            var _loc16_ = _loc13_.y - _loc12_.y;
            _loc2_.rotate._rotation = _loc2_.angle;
            var _loc17_ = _loc2_.attachMovie("shoot","shoot",10);
            _loc17_._x = _loc15_;
            _loc17_._y = _loc16_;
            break;
         case 30:
         case 31:
            _loc2_._ACTION = _loc3_;
            _loc2_._x = _loc12_.x;
            _loc2_._y = _loc12_.y - 10;
            _loc2_.level = _loc6_;
            var _loc18_ = !(displayType == 31 || displayType == 33) ? 0.5 : 0.9;
            var speed = !(displayType == 31 || displayType == 33) ? 0.675 : 0.5;
            if(dofus.Constants.DOUBLEFRAMERATE)
            {
               speed /= 2;
            }
            var _loc19_ = Math.PI / 2;
            var _loc20_ = _loc13_.x - _loc12_.x;
            var _loc21_ = _loc13_.y - _loc12_.y;
            var _loc22_ = (Math.atan2(_loc21_,Math.abs(_loc20_)) + _loc19_) * _loc18_;
            var _loc23_ = _loc22_ - _loc19_;
            var xDest = Math.abs(_loc20_);
            var yDest = _loc21_;
            _loc2_.startangle = _loc23_;
            if(_loc20_ <= 0)
            {
               if(_loc20_ == 0 && _loc21_ < 0)
               {
                  _loc2_._yscale = - _loc2_._yscale;
                  yDest = - yDest;
               }
               _loc2_._xscale = - _loc2_._xscale;
            }
            _loc2_.attachMovie("move","move",2);
            var vyi;
            var x;
            var y;
            var g = 9.81;
            var halfg = g / 2;
            var t = 0;
            var vx = Math.sqrt(Math.abs(halfg * Math.pow(xDest,2) / Math.abs(yDest - Math.tan(_loc23_) * xDest)));
            var vy = Math.tan(_loc23_) * vx;
            _loc2_.onEnterFrame = function()
            {
               vyi = vy + g * t;
               x = t * vx;
               y = halfg * Math.pow(t,2) + vy * t;
               t += speed;
               if(Math.abs(y) >= Math.abs(yDest) && x >= xDest || x > xDest)
               {
                  this.attachMovie("shoot","shoot",2);
                  this.shoot._x = xDest;
                  this.shoot._y = yDest;
                  this.shoot._rotation = Math.atan(vyi / vx) * 180 / Math.PI;
                  this.end();
                  delete this.onEnterFrame;
               }
               else
               {
                  this.move._x = x;
                  this.move._y = y;
                  this.move._rotation = Math.atan(vyi / vx) * 180 / Math.PI;
               }
            };
            break;
         case 40:
         case 41:
            _loc2_._ACTION = _loc3_;
            _loc2_._x = _loc12_.x;
            _loc2_._y = _loc12_.y;
            var _loc24_ = 20;
            if(dofus.Constants.DOUBLEFRAMERATE)
            {
               _loc24_ /= 2;
            }
            var xStart = _loc12_.x;
            var yStart = _loc12_.y;
            var xDest = _loc13_.x;
            var yDest = _loc13_.y;
            var rot = Math.atan2(yDest - yStart,xDest - xStart);
            var fullDist = Math.sqrt(Math.pow(xStart - xDest,2) + Math.pow(yStart - yDest,2));
            var interval = fullDist / Math.floor(fullDist / _loc24_);
            var dist = 0;
            var inc = 1;
            var bNoDupliFrame = false;
            _loc2_.onEnterFrame = function()
            {
               dist += interval;
               if(!dofus.Constants.DOUBLEFRAMERATE || !bNoDupliFrame)
               {
                  if(dist > fullDist)
                  {
                     this.end();
                     if(displayType == 41)
                     {
                        this.attachMovie("shoot","shoot",10);
                        this.shoot._x = xDest - xStart;
                        this.shoot._y = yDest - yStart;
                     }
                     delete this.onEnterFrame;
                  }
                  else
                  {
                     var _loc2_ = this.attachMovie("duplicate","duplicate" + inc,inc);
                     _loc2_._x = dist * Math.cos(rot);
                     _loc2_._y = dist * Math.sin(rot);
                     inc++;
                  }
               }
               bNoDupliFrame = !bNoDupliFrame;
            };
            break;
         case 50:
         case 51:
            _loc2_._ACTION = _loc3_;
            _loc2_.cellFrom = _loc12_;
            _loc2_.cellTo = _loc13_;
      }
   }
   function getNextIndex(§\x1e\t\x1c§)
   {
      this._incIndex++;
      if(this._incIndex > ank.battlefield["\x1e\t\x1d"].MAX_INDEX)
      {
         this._incIndex = 0;
      }
      return this._incIndex;
   }
}
