class ank.§\x1e\n\x07§.§\x0e\x1a§.§\t\x16§ extends MovieClip
{
   function §\t\x16§()
   {
      super();
   }
   function attachClassMovie(className, instanceName, §\x11\x03§, §\x1d\x10§)
   {
      var _loc6_ = this.createEmptyMovieClip(instanceName,_loc4_);
      _loc6_.__proto__ = className.prototype;
      className.apply(_loc6_,_loc5_);
      return _loc6_;
   }
   function alignOnPixel()
   {
      var _loc2_ = new Object({x:0,y:0});
      this.localToGlobal(_loc2_);
      _loc2_.x = Math.floor(_loc2_.x);
      _loc2_.y = Math.floor(_loc2_.y);
      this.globalToLocal(_loc2_);
      this._x -= _loc2_.x;
      this._y -= _loc2_.y;
   }
   function playFirstChildren()
   {
      for(var a in this)
      {
         if(this[a].__proto__ == MovieClip.prototype)
         {
            this[a].gotoAndPlay(1);
         }
      }
   }
   function end(§\x1e\x12\x15§)
   {
      var _loc3_ = this.getFirstParentProperty("_ACTION");
      if(_loc2_ == undefined)
      {
         _loc2_ = _loc3_.sequencer;
      }
      _loc2_.onActionEnd();
   }
   function getFirstParentProperty(§\x1e\x16\x07§)
   {
      var _loc3_ = 20;
      var _loc4_ = this;
      while(_loc3_ >= 0)
      {
         if(_loc4_[_loc2_] != undefined)
         {
            return _loc4_[_loc2_];
         }
         _loc4_ = _loc4_._parent;
         _loc3_ = _loc3_ - 1;
      }
   }
   function getActionClip(§\x1e\t\x1c§)
   {
      return this.getFirstParentProperty("_ACTION");
   }
   function playAll(§\n\x1d§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = this;
      }
      _loc2_.gotoAndPlay(1);
      for(var a in _loc2_)
      {
         if(_loc2_[a] instanceof MovieClip)
         {
            this.playAll(_loc2_[a]);
         }
      }
   }
   function stopAll(§\n\x1d§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = this;
      }
      _loc2_.gotoAndStop(1);
      for(var a in _loc2_)
      {
         if(_loc2_[a] instanceof MovieClip)
         {
            this.stopAll(_loc2_[a]);
         }
      }
   }
}
