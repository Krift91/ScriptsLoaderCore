class ank.battlefield.PointerHandler
{
   function PointerHandler(b, c)
   {
      this.initialize(b,c);
   }
   function initialize(b, c)
   {
      this._mcBattlefield = b;
      this._mcContainer = c;
      this.clear();
   }
   function clear(Void)
   {
      this.hide();
      this._aShapes = [];
   }
   function hide(Void)
   {
      this._mcZones.removeMovieClip();
      this._mcZones = this._mcContainer.createEmptyMovieClip("zones",2);
      this._mcZones.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["Zone/Pointers"];
   }
   function addShape(sShape, mSize, nColor, nCellNumRef)
   {
      this._aShapes.push({shape:sShape,size:mSize,col:nColor,cellNumRef:nCellNumRef});
   }
   function draw(nCellNum)
   {
      var _loc4_ = this._aShapes;
      if(_loc4_.length == 0)
      {
         return undefined;
      }
      this.hide();
      var _loc5_ = 0;
      while(_loc5_ < _loc4_.length)
      {
         this._mcZones.__proto__ = MovieClip.prototype;
         var _loc6_ = ank.battlefield.mc.Zone(this._mcZones.attachClassMovie(ank.battlefield.mc.Zone,"zone" + _loc5_,10 * _loc5_,[this._mcBattlefield.mapHandler]));
         var _loc7_ = _loc4_[_loc5_].shape;
         var _loc8_ = _loc7_.charCodeAt(0);
         switch(_loc8_)
         {
            case 8:
               var _loc9_ = ank.battlefield.mc.Zone.getCellsSquare(this._mcBattlefield.mapHandler,_loc4_[_loc5_].size,nCellNum);
               break;
            case 16:
               _loc9_ = ank.battlefield.mc.Zone.getCellsLineWide(this._mcBattlefield.mapHandler,_loc4_[_loc5_].size,_loc4_[_loc5_].cellNumRef,nCellNum);
               break;
            case 17:
               _loc9_ = ank.battlefield.mc.Zone.getCellsSpike(this._mcBattlefield.mapHandler,_loc4_[_loc5_].size,_loc4_[_loc5_].cellNumRef,nCellNum);
               break;
            case 4:
            case 80:
               _loc6_.drawCircle(0,_loc4_[_loc5_].col,nCellNum);
               break;
            case 3:
            case 67:
               if(typeof _loc4_[_loc5_].size == "number")
               {
                  _loc6_.drawCircle(_loc4_[_loc5_].size,_loc4_[_loc5_].col,nCellNum);
               }
               else if(_loc4_[_loc5_].size[0] == 0 && !_global.isNaN(Number(_loc4_[_loc5_].size[1])))
               {
                  _loc6_.drawCircle(Number(_loc4_[_loc5_].size[1]),_loc4_[_loc5_].col,nCellNum);
               }
               else
               {
                  var _loc10_ = 0;
                  if(_loc4_[_loc5_].size[0] > 0)
                  {
                     _loc10_ = -1;
                  }
                  _loc6_.drawRing(_loc4_[_loc5_].size[0] + _loc10_,_loc4_[_loc5_].size[1],_loc4_[_loc5_].col,nCellNum);
               }
               break;
            case 6:
            case 68:
               var _loc11_ = -1;
               var _loc12_ = -1;
               if(typeof _loc4_[_loc5_].size == "number")
               {
                  _loc12_ = Number(_loc4_[_loc5_].size);
                  _loc11_ = _loc12_ % 2 != 0 ? 0 : 1;
               }
               else
               {
                  _loc11_ = Number(_loc4_[_loc5_].size[1]);
                  _loc12_ = Number(_loc4_[_loc5_].size[0]);
               }
               var _loc13_ = _loc11_;
               while(_loc13_ < _loc12_)
               {
                  _loc6_.drawRing(_loc13_ + 1,_loc13_,_loc4_[_loc5_].col,nCellNum);
                  _loc13_ += 2;
               }
               break;
            case 2:
            case 76:
               _loc6_.drawLine(_loc4_[_loc5_].size,_loc4_[_loc5_].col,nCellNum,_loc4_[_loc5_].cellNumRef);
               break;
            case 1:
            case 88:
               if(typeof _loc4_[_loc5_].size == "number")
               {
                  _loc6_.drawCross(_loc4_[_loc5_].size,_loc4_[_loc5_].col,nCellNum);
               }
               else
               {
                  var _loc14_ = this._mcBattlefield.mapHandler;
                  var _loc15_ = _loc14_.getWidth();
                  var _loc16_ = ank.battlefield.utils.Pathfinding.getCaseCoordonnee(_loc14_,nCellNum);
                  var _loc17_ = nCellNum - _loc15_ * _loc4_[_loc5_].size[0];
                  if(ank.battlefield.utils.Pathfinding.getCaseCoordonnee(_loc14_,_loc17_).y == _loc16_.y)
                  {
                     _loc6_.drawLine(_loc4_[_loc5_].size[1] - _loc4_[_loc5_].size[0],_loc4_[_loc5_].col,_loc17_,nCellNum,true);
                  }
                  _loc17_ = nCellNum - (_loc15_ - 1) * _loc4_[_loc5_].size[0];
                  if(ank.battlefield.utils.Pathfinding.getCaseCoordonnee(_loc14_,_loc17_).x == _loc16_.x)
                  {
                     _loc6_.drawLine(_loc4_[_loc5_].size[1] - _loc4_[_loc5_].size[0],_loc4_[_loc5_].col,_loc17_,nCellNum,true);
                  }
                  _loc17_ = nCellNum + _loc15_ * _loc4_[_loc5_].size[0];
                  if(ank.battlefield.utils.Pathfinding.getCaseCoordonnee(_loc14_,_loc17_).y == _loc16_.y)
                  {
                     _loc6_.drawLine(_loc4_[_loc5_].size[1] - _loc4_[_loc5_].size[0],_loc4_[_loc5_].col,_loc17_,nCellNum,true);
                  }
                  _loc17_ = nCellNum + (_loc15_ - 1) * _loc4_[_loc5_].size[0];
                  if(ank.battlefield.utils.Pathfinding.getCaseCoordonnee(_loc14_,_loc17_).x == _loc16_.x)
                  {
                     _loc6_.drawLine(_loc4_[_loc5_].size[1] - _loc4_[_loc5_].size[0],_loc4_[_loc5_].col,_loc17_,nCellNum,true);
                  }
               }
               break;
            case 5:
            case 84:
               _loc6_.drawLine(_loc4_[_loc5_].size,_loc4_[_loc5_].col,nCellNum,_loc4_[_loc5_].cellNumRef,false,true);
               break;
            case 82:
               _loc9_ = ank.battlefield.mc.Zone.getCellsLineWide(this._mcBattlefield.mapHandler,_loc4_[_loc5_].size,_loc4_[_loc5_].cellNumRef,nCellNum);
               break;
            case 7:
            case 79:
               _loc6_.drawRing(_loc4_[_loc5_].size,_loc4_[_loc5_].size - 1,_loc4_[_loc5_].col,nCellNum);
               break;
         }
         if(_loc9_ != undefined)
         {
            var _loc18_ = this._mcBattlefield.mapHandler.getCellsData();
            var _loc19_ = 0;
            while(_loc19_ < _loc9_.length)
            {
               var _loc20_ = _loc9_[_loc19_];
               if(_loc20_ >= 0)
               {
                  if(_loc20_ <= this._mcBattlefield.mapHandler.getCellCount())
                  {
                     var _loc21_ = _loc18_[_loc20_];
                     if(!(_loc21_ == undefined || !_loc21_.active))
                     {
                        var _loc22_ = _loc6_.createCellMc(_loc20_);
                        _loc6_.drawCircle(0,_loc4_[_loc5_].col,_loc20_,_loc22_);
                        this.movePointerTo(_loc22_,_loc20_);
                     }
                  }
               }
               _loc19_ += 1;
            }
         }
         else
         {
            this.movePointerTo(_loc6_,nCellNum);
         }
         _loc5_ += 1;
      }
   }
   function movePointerTo(mcZone, nCellNum)
   {
      var _loc4_ = this._mcBattlefield.mapHandler.getCellData(nCellNum);
      mcZone._x = _loc4_.x;
      mcZone._y = _loc4_.y + ank.battlefield.Constants.LEVEL_HEIGHT * (_loc4_.groundLevel - 7);
   }
}
