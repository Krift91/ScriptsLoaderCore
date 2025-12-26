class ank.battlefield.§\x1e\x12\x19§
{
   var _mcBattlefield;
   var _oDatacenter;
   var _mcContainer;
   function §\x1e\x12\x19§(§\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      this.initialize(_loc2_,_loc3_,_loc4_);
   }
   function initialize(§\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      this._mcBattlefield = _loc2_;
      this._oDatacenter = _loc4_;
      this._mcContainer = _loc3_;
      this.clear();
   }
   function clear(§\x1e\t\x1c§)
   {
      for(var k in this._mcContainer.Select)
      {
         var _loc3_ = this._mcContainer.Select[k];
         if(_loc3_ != undefined)
         {
            var _loc4_ = _loc3_.inObjectClips;
            for(var l in _loc4_)
            {
               _loc4_[l].removeMovieClip();
            }
         }
         _loc3_.removeMovieClip();
      }
   }
   function clearLayer(§\x1e\x10\x14§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = "default";
      }
      var _loc3_ = this._mcContainer.Select[_loc2_];
      if(_loc3_ != undefined)
      {
         var _loc4_ = _loc3_.inObjectClips;
         for(var k in _loc4_)
         {
            _loc4_[k].removeMovieClip();
         }
      }
      _loc3_.removeMovieClip();
   }
   function select(§\x15\x14§, §\x07\x11§, §\x06\x1d§, §\x1e\x10\x14§, §\b\x19§)
   {
      var _loc7_ = this._mcBattlefield.mapHandler.getCellData(_loc3_);
      if(_loc5_ == undefined)
      {
         _loc5_ = "default";
      }
      var _loc8_ = this._mcContainer.Select[_loc5_];
      if(_loc8_ == undefined)
      {
         _loc8_ = this._mcContainer.Select.createEmptyMovieClip(_loc5_,this._mcContainer.Select.getNextHighestDepth());
         _loc8_.inObjectClips = new Array();
      }
      if(_loc7_ != undefined && _loc7_.x != undefined)
      {
         var _loc9_ = _loc7_.movement > 1 && _loc7_.layerObject2Num != 0;
         var _loc10_ = "cell" + String(_loc3_);
         if(_loc2_)
         {
            if(_loc9_)
            {
               var _loc12_ = this._mcContainer.Object2["select" + _loc3_];
               if(_loc12_ == undefined)
               {
                  _loc12_ = this._mcContainer.Object2.createEmptyMovieClip("select" + _loc3_,_loc3_ * 100 + 2);
               }
               var _loc11_ = _loc12_[_loc5_];
               if(_loc11_ == undefined)
               {
                  _loc11_ = _loc12_.attachMovie("s" + _loc7_.groundSlope,_loc5_,_loc12_.getNextHighestDepth());
               }
               _loc8_.inObjectClips.push(_loc11_);
            }
            else
            {
               _loc11_ = _loc8_.attachMovie("s" + _loc7_.groundSlope,_loc10_,_loc3_ * 100);
            }
            _loc11_._x = _loc7_.x;
            _loc11_._y = _loc7_.y;
            var _loc13_ = new Color(_loc11_);
            _loc13_.setRGB(Number(_loc4_));
            _loc11_._alpha = _loc6_ == undefined ? 100 : _loc6_;
         }
         else if(_loc9_)
         {
            this._mcContainer.Object2["select" + _loc3_][_loc5_].unloadMovie();
            this._mcContainer.Object2["select" + _loc3_][_loc5_].removeMovieClip();
         }
         else
         {
            _loc8_[_loc10_].unloadMovie();
            _loc8_[_loc10_].removeMovieClip();
         }
      }
   }
   function selectMultiple(§\x15\x16§, §\x0f§, §\x06\x1d§, §\x1e\x10\x14§, §\b\x19§)
   {
      for(var i in _loc3_)
      {
         this.select(_loc2_,_loc3_[i],_loc4_,_loc5_,_loc6_);
      }
   }
   function getLayers()
   {
      var _loc2_ = new Array();
      for(var k in this._mcContainer.Select)
      {
         var _loc3_ = this._mcContainer.Select[k];
         if(_loc3_ != undefined)
         {
            _loc2_.push(_loc3_._name);
         }
      }
      return _loc2_;
   }
}
