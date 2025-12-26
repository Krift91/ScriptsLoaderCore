class ank.battlefield.mc.OverHead extends MovieClip
{
   var _mcBattlefield;
   var _mcSprite;
   var _nZoom;
   var _nCurrentItemID;
   var _oLayers;
   var _mcItems;
   static var TOP_Y = -50;
   static var BOTTOM_Y = 10;
   static var MODERATOR_Y = 15;
   function OverHead(§\n\x0e§, §\x1e\x1a\x11§, mcBattlefield)
   {
      super();
      this._mcBattlefield = mcBattlefield;
      this._mcSprite = _loc3_;
      this._nZoom = _loc4_ != undefined ? _loc4_ : 100;
      this.initialize();
   }
   function get top()
   {
      return ank.battlefield.mc.OverHead.TOP_Y * this._nZoom / 100;
   }
   function get bottom()
   {
      return ank.battlefield.mc.OverHead.BOTTOM_Y * this._nZoom / 100;
   }
   function get moderator()
   {
      return ank.battlefield.mc.OverHead.MODERATOR_Y * this._nZoom / 100;
   }
   function initialize()
   {
      this._nCurrentItemID = 0;
      this.clear();
   }
   function clear()
   {
      this._oLayers = new Object();
      this.clearView();
   }
   function clearView()
   {
      this.createEmptyMovieClip("_mcItems",10);
   }
   function setPosition(§\x04\x03§, §\x02\x15§)
   {
      var _loc4_ = {x:this._parent._parent._x,y:this._parent._parent._y};
      this._parent._parent.localToGlobal(_loc4_);
      this._x = this._mcSprite._x;
      this._y = this._mcSprite._y;
      var _loc5_ = 100 / this._nZoom;
      var _loc6_ = this.top;
      var _loc7_ = this.moderator;
      _loc2_ *= _loc5_;
      if(this._mcSprite._y < - _loc6_ + _loc2_ - _loc4_.y + _loc7_)
      {
         this._mcItems._y += this.bottom + _loc2_;
         var _loc8_ = 0;
         for(var k in this._oLayers)
         {
            var _loc9_ = this._mcItems["item" + _loc8_];
            _loc9_.reverseClip();
            _loc8_ = _loc8_ + 1;
         }
      }
      else
      {
         var _loc10_ = Math.abs(_loc6_);
         if(this._mcSprite._height > _loc10_ + _loc7_)
         {
            this._mcItems._y += _loc6_ - _loc7_;
         }
         else if(this._mcSprite._height < _loc10_ - _loc7_)
         {
            this._mcItems._y += _loc6_ + _loc7_;
         }
         else
         {
            this._mcItems._y += _loc6_;
         }
      }
      var _loc11_ = _loc3_ * _loc5_ / 2;
      if(this._mcSprite._x < _loc11_ - _loc4_.x)
      {
         this._x = _loc11_;
      }
      if(this._mcSprite._x > this._mcBattlefield.screenWidth * _loc5_ - _loc11_ + _loc4_.x)
      {
         this._x = this._mcBattlefield.screenWidth * _loc5_ - _loc11_;
      }
   }
   function addItem(§\x1e\x10\x13§, className, §\x1d\x11§, §\x11\x05§)
   {
      var _loc6_ = new Object();
      _loc6_.id = this._nCurrentItemID;
      _loc6_.className = className;
      _loc6_.args = _loc4_;
      if(_loc5_ != undefined)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(_loc6_,"battlefield",this,this.removeItem,_loc5_,[this._nCurrentItemID]);
      }
      this._oLayers[_loc2_] = _loc6_;
      this._nCurrentItemID++;
      this.refresh();
   }
   function remove(§\x1e\t\x1c§)
   {
      this.swapDepths(1);
      this.removeMovieClip();
   }
   function refresh()
   {
      this.clearView();
      var _loc2_ = 0;
      var _loc3_ = 0;
      var _loc4_ = 0;
      for(var k in this._oLayers)
      {
         var _loc5_ = this._oLayers[k];
         var _loc6_ = this._mcItems.attachClassMovie(_loc5_.className,"item" + _loc2_,_loc2_,_loc5_.args);
         _loc3_ -= _loc6_.height;
         _loc4_ = Math.max(_loc4_,_loc6_.width);
         _loc6_._y = _loc3_;
         _loc2_ = _loc2_ + 1;
      }
      this.setPosition(Math.abs(_loc3_),_loc4_);
   }
   function removeLayer(§\x0b\x16§)
   {
      delete this._oLayers[_loc2_];
      this.refresh();
   }
   function removeItem(§\x04\x06§)
   {
      for(var _loc3_ in this._oLayers)
      {
         if(this._oLayers[_loc3_].id == _loc2_)
         {
            delete this._oLayers[_loc3_];
            this.refresh();
            break;
         }
      }
   }
}
