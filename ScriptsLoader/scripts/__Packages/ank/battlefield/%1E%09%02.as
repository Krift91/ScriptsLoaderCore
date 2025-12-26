class ank.battlefield.§\x1e\t\x02§
{
   var _mcBattlefield;
   var _mcContainer;
   var _mcZones;
   var _nNextLayerDepth;
   function §\x1e\t\x02§(§\x1c\x1d§, §\x13\x0f§)
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
      this._mcZones.removeMovieClip();
      this._mcZones = this._mcContainer.createEmptyMovieClip("zones",10);
      this._nNextLayerDepth = 0;
   }
   function clearZone(§\x07\x11§, §\x1e\x15\x0e§, §\x0b\x17§)
   {
      _loc2_ = Number(_loc2_);
      _loc3_ = Number(_loc3_);
      if(_loc2_ < 0)
      {
         return undefined;
      }
      if(_loc2_ > this._mcBattlefield.mapHandler.getCellCount())
      {
         return undefined;
      }
      var _loc5_ = _loc2_ * 1000 + _loc3_ * 100;
      this._mcZones[_loc4_]["zone" + _loc5_].clear();
   }
   function clearZoneLayer(§\x0b\x17§)
   {
      this._mcZones[_loc2_].removeMovieClip();
   }
   function drawZone(§\x07\x11§, §\x1e\x15\r§, §\x1e\x15\f§, §\x0b\x17§, §\x12\x15§, §\x1e\x11\x17§)
   {
      _loc2_ = Number(_loc2_);
      _loc3_ = Number(_loc3_);
      _loc4_ = Number(_loc4_);
      _loc6_ = Number(_loc6_);
      if(_loc2_ < 0)
      {
         return undefined;
      }
      if(_loc2_ > this._mcBattlefield.mapHandler.getCellCount())
      {
         return undefined;
      }
      if(_global.isNaN(_loc3_) || _global.isNaN(_loc4_))
      {
         return undefined;
      }
      var _loc8_ = _loc2_ * 1000 + _loc4_ * 100;
      if(this._mcZones[_loc5_] == undefined)
      {
         this._mcZones.createEmptyMovieClip(_loc5_,this._nNextLayerDepth++);
      }
      this._mcZones[_loc5_].__proto__ = MovieClip.prototype;
      this._mcZones[_loc5_].cacheAsBitmap = this._mcZones.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["Zone/Zone"];
      var _loc9_ = this._mcZones[_loc5_].attachClassMovie(ank.battlefield.mc.Zone,"zone" + _loc8_,_loc8_,[this._mcBattlefield.mapHandler]);
      switch(_loc7_)
      {
         case "C":
            if(_loc3_ == 0)
            {
               _loc9_.drawCircle(_loc4_,_loc6_,_loc2_);
            }
            else
            {
               if(_loc3_ > 0)
               {
                  _loc3_ -= 1;
               }
               _loc9_.drawRing(_loc3_,_loc4_,_loc6_,_loc2_);
            }
            break;
         case "X":
            if(_loc3_ == 0)
            {
               _loc9_.drawCross(_loc4_,_loc6_,_loc2_);
            }
            else
            {
               var _loc10_ = this._mcBattlefield.mapHandler;
               var _loc12_ = _loc10_.getWidth();
               var _loc13_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc10_,_loc2_);
               var _loc11_ = _loc2_ - _loc12_ * _loc3_;
               if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc10_,_loc11_).y == _loc13_.y)
               {
                  _loc9_.drawLine(_loc4_ - _loc3_,_loc6_,_loc11_,_loc2_,true);
               }
               _loc11_ = _loc2_ - (_loc12_ - 1) * _loc3_;
               if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc10_,_loc11_).x == _loc13_.x)
               {
                  _loc9_.drawLine(_loc4_ - _loc3_,_loc6_,_loc11_,_loc2_,true);
               }
               _loc11_ = _loc2_ + _loc12_ * _loc3_;
               if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc10_,_loc11_).y == _loc13_.y)
               {
                  _loc9_.drawLine(_loc4_ - _loc3_,_loc6_,_loc11_,_loc2_,true);
               }
               _loc11_ = _loc2_ + (_loc12_ - 1) * _loc3_;
               if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc10_,_loc11_).x == _loc13_.x)
               {
                  _loc9_.drawLine(_loc4_ - _loc3_,_loc6_,_loc11_,_loc2_,true);
               }
            }
            break;
         default:
            _loc9_.drawCircle(_loc4_,_loc6_,_loc2_);
      }
      this.moveZoneTo(_loc9_,_loc2_);
   }
   function moveZoneTo(§\x1e\t\x03§, §\x07\x11§)
   {
      var _loc4_ = this._mcBattlefield.mapHandler.getCellData(_loc3_);
      _loc2_._x = _loc4_.x;
      _loc2_._y = _loc4_.y + ank.battlefield.Constants.LEVEL_HEIGHT * (_loc4_.groundLevel - 7);
   }
}
