class ank.battlefield.§\x1e\x16\f§
{
   var _mcBattlefield;
   var _mcContainer;
   var _aShapes;
   var _mcZones;
   function §\x1e\x16\f§(§\x1c\x1d§, §\x13\x0f§)
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
      this.hide();
      this._aShapes = new Array();
   }
   function hide(§\x1e\t\x1c§)
   {
      this._mcZones.removeMovieClip();
      this._mcZones = this._mcContainer.createEmptyMovieClip("zones",2);
      this._mcZones.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["Zone/Pointers"];
   }
   function addShape(§\x1e\r\x16§, §\t\r§, §\x06\x1d§, §\x07\x10§)
   {
      this._aShapes.push({shape:_loc2_,size:_loc3_,col:_loc4_,cellNumRef:_loc5_});
   }
   function draw(§\x07\x11§)
   {
      var _loc3_ = this._aShapes;
      if(_loc3_.length == 0)
      {
         return undefined;
      }
      this.hide();
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         this._mcZones.__proto__ = MovieClip.prototype;
         var _loc5_ = this._mcZones.attachClassMovie(ank.battlefield.mc.Zone,"zone" + _loc4_,10 * _loc4_,[this._mcBattlefield.mapHandler]);
         switch(_loc3_[_loc4_].shape)
         {
            case "P":
               _loc5_.drawCircle(0,_loc3_[_loc4_].col,_loc2_);
               break;
            case "C":
               if(typeof _loc3_[_loc4_].size == "number")
               {
                  _loc5_.drawCircle(_loc3_[_loc4_].size,_loc3_[_loc4_].col,_loc2_);
               }
               else if(_loc3_[_loc4_].size[0] == 0 && !_global.isNaN(Number(_loc3_[_loc4_].size[1])))
               {
                  _loc5_.drawCircle(Number(_loc3_[_loc4_].size[1]),_loc3_[_loc4_].col,_loc2_);
               }
               else
               {
                  var _loc6_ = 0;
                  if(_loc3_[_loc4_].size[0] > 0)
                  {
                     _loc6_ = -1;
                  }
                  _loc5_.drawRing(_loc3_[_loc4_].size[0] + _loc6_,_loc3_[_loc4_].size[1],_loc3_[_loc4_].col,_loc2_);
               }
               break;
            case "D":
               var _loc7_ = -1;
               var _loc8_ = -1;
               if(typeof _loc3_[_loc4_].size == "number")
               {
                  _loc8_ = Number(_loc3_[_loc4_].size);
                  _loc7_ = _loc8_ % 2 != 0 ? 0 : 1;
               }
               else
               {
                  _loc7_ = Number(_loc3_[_loc4_].size[1]);
                  _loc8_ = Number(_loc3_[_loc4_].size[0]);
               }
               var _loc9_ = _loc7_;
               while(_loc9_ < _loc8_)
               {
                  _loc5_.drawRing(_loc9_ + 1,_loc9_,_loc3_[_loc4_].col,_loc2_);
                  _loc9_ += 2;
               }
               break;
            case "L":
               _loc5_.drawLine(_loc3_[_loc4_].size,_loc3_[_loc4_].col,_loc2_,_loc3_[_loc4_].cellNumRef);
               break;
            case "X":
               if(typeof _loc3_[_loc4_].size == "number")
               {
                  _loc5_.drawCross(_loc3_[_loc4_].size,_loc3_[_loc4_].col,_loc2_);
               }
               else
               {
                  var _loc10_ = this._mcBattlefield.mapHandler;
                  var _loc12_ = _loc10_.getWidth();
                  var _loc13_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc10_,_loc2_);
                  var _loc11_ = _loc2_ - _loc12_ * _loc3_[_loc4_].size[0];
                  if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc10_,_loc11_).y == _loc13_.y)
                  {
                     _loc5_.drawLine(_loc3_[_loc4_].size[1] - _loc3_[_loc4_].size[0],_loc3_[_loc4_].col,_loc11_,_loc2_,true);
                  }
                  _loc11_ = _loc2_ - (_loc12_ - 1) * _loc3_[_loc4_].size[0];
                  if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc10_,_loc11_).x == _loc13_.x)
                  {
                     _loc5_.drawLine(_loc3_[_loc4_].size[1] - _loc3_[_loc4_].size[0],_loc3_[_loc4_].col,_loc11_,_loc2_,true);
                  }
                  _loc11_ = _loc2_ + _loc12_ * _loc3_[_loc4_].size[0];
                  if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc10_,_loc11_).y == _loc13_.y)
                  {
                     _loc5_.drawLine(_loc3_[_loc4_].size[1] - _loc3_[_loc4_].size[0],_loc3_[_loc4_].col,_loc11_,_loc2_,true);
                  }
                  _loc11_ = _loc2_ + (_loc12_ - 1) * _loc3_[_loc4_].size[0];
                  if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc10_,_loc11_).x == _loc13_.x)
                  {
                     _loc5_.drawLine(_loc3_[_loc4_].size[1] - _loc3_[_loc4_].size[0],_loc3_[_loc4_].col,_loc11_,_loc2_,true);
                  }
               }
               break;
            case "T":
               _loc5_.drawLine(_loc3_[_loc4_].size,_loc3_[_loc4_].col,_loc2_,_loc3_[_loc4_].cellNumRef,false,true);
               break;
            case "R":
               _loc5_.drawRectangle(_loc3_[_loc4_].size[0],_loc3_[_loc4_].size[1],_loc3_[_loc4_].col,_loc2_);
               break;
            case "O":
               _loc5_.drawRing(_loc3_[_loc4_].size,_loc3_[_loc4_].size - 1,_loc3_[_loc4_].col,_loc2_);
         }
         this.movePointerTo(_loc5_,_loc2_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function movePointerTo(§\n\n§, §\x07\x11§)
   {
      var _loc4_ = this._mcBattlefield.mapHandler.getCellData(_loc3_);
      _loc2_._x = _loc4_.x;
      _loc2_._y = _loc4_.y + ank.battlefield.Constants.LEVEL_HEIGHT * (_loc4_.groundLevel - 7);
   }
}
