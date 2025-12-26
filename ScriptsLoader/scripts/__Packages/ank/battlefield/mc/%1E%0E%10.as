class ank.battlefield.mc.§\x1e\x0e\x10§ extends MovieClip
{
   var _mcGfx;
   var _oData;
   var _mcCarried;
   var _mcChevauchorPos;
   var _bHidden;
   var _mcBattlefield;
   var _oSprites;
   var _mvlLoader;
   var _ACTION;
   var api;
   var _mcXtraBack;
   var _mcXtraTop;
   var _nDistance;
   var _nLastTimer;
   var _nOldCellNum;
   var _mcChevauchor;
   var onEnterFrame;
   var dispatchEvent;
   var _nLastAlphaValue = 100;
   var _bGfxLoaded = false;
   var _bChevauchorGfxLoaded = false;
   static var WALK_SPEEDS = [0.07,0.06,0.06,0.06,0.07,0.06,0.06,0.06];
   static var MOUNT_SPEEDS = [0.23,0.2,0.2,0.2,0.23,0.2,0.2,0.2];
   static var RUN_SPEEDS = [0.17,0.15,0.15,0.15,0.17,0.15,0.15,0.15];
   function §\x1e\x0e\x10§(§\x1c\x1d§, §\x1e\x13\x05§, §\x11\x10§)
   {
      super();
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this.initialize(_loc3_,_loc4_,_loc5_);
   }
   function get gfx()
   {
      return this._mcGfx;
   }
   function get data()
   {
      return this._oData;
   }
   function set mcCarried(§\n\x1d§)
   {
      this._mcCarried = _loc2_;
   }
   function set mcChevauchorPos(§\n\x1d§)
   {
      this._mcChevauchorPos = _loc2_;
   }
   function set isHidden(§\x1c\x1d§)
   {
      this.setHidden(_loc2_);
   }
   function get isHidden()
   {
      return this._bHidden;
   }
   function initialize(§\x1c\x1d§, §\x1e\x13\x05§, §\x11\x10§)
   {
      _global.GAC.addSprite(this,_loc4_);
      this._mcBattlefield = _loc2_;
      this._oSprites = _loc3_;
      this._oData = _loc4_;
      this._mvlLoader = new MovieClipLoader();
      this._mvlLoader.addListener(this);
      this.setPosition(this._oData.cellNum);
      this.draw();
      this._ACTION = _loc4_;
      this.api = _global.API;
   }
   function draw()
   {
      this._mcGfx.removeMovieClip();
      this.createEmptyMovieClip("_mcGfx",20);
      this.setHidden(this._bHidden);
      this._bGfxLoaded = false;
      this._bChevauchorGfxLoaded = false;
      this._mvlLoader.loadClip(!!this._oData.isMounting ? this._oData.mount.gfxFile : this._oData.gfxFile,this._mcGfx);
   }
   function clear()
   {
      this._mcBattlefield.mapHandler.getCellData(this._oData.cellNum).removeSpriteOnID(this._oData.id);
      this._mcGfx.removeMovieClip();
      this._oData.direction = 1;
      this.removeExtraClip();
      this._oData.isClear = true;
   }
   function select(§\x16\x18§)
   {
      var _loc3_ = new Object();
      if(_loc2_)
      {
         _loc3_ = {ra:60,rb:102,ga:60,gb:102,ba:60,bb:102};
      }
      else
      {
         _loc3_ = {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0};
      }
      this.setColorTransform(_loc3_);
   }
   function addExtraClip(§\x1e\x12\x0b§, §\x06\x1d§, §\x14\r§)
   {
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      if(_loc4_ == undefined)
      {
         _loc4_ = false;
      }
      this.removeExtraClip(_loc4_);
      if(_loc4_)
      {
         var _loc5_ = new Object();
         _loc5_.file = _loc2_;
         _loc5_.color = _loc3_;
         this._oData.xtraClipTopParams = _loc5_;
         if(!this._bGfxLoaded)
         {
            return undefined;
         }
      }
      var _loc6_ = !_loc4_ ? this._mcXtraBack : this._mcXtraTop;
      if(_loc3_ != undefined)
      {
         var _loc7_ = new Color(_loc6_);
         _loc7_.setRGB(_loc3_);
      }
      _loc6_.loadMovie(_loc2_);
   }
   function removeExtraClip(§\x14\r§)
   {
      switch(_loc2_)
      {
         case true:
            this._mcXtraTop.removeMovieClip();
            this.createEmptyMovieClip("_mcXtraTop",30);
            break;
         case false:
            this._mcXtraBack.removeMovieClip();
            this.createEmptyMovieClip("_mcXtraBack",10);
            break;
         default:
            this._mcXtraTop.removeMovieClip();
            this._mcXtraBack.removeMovieClip();
            this.createEmptyMovieClip("_mcXtraTop",30);
            this.createEmptyMovieClip("_mcXtraBack",10);
      }
   }
   function setColorTransform(§\x1e\x0b\x12§)
   {
      var _loc3_ = new Color(this);
      _loc3_.setTransform(_loc2_);
   }
   function setNewCellNum(§\x07\x11§)
   {
      this._oData.cellNum = Number(_loc2_);
   }
   function setDirection(§\x06\x07§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = this._oData.direction;
      }
      this._oData.direction = _loc2_;
      this.setAnim(this._oData.animation);
   }
   function setPosition(§\x07\x11§)
   {
      this.updateMap(_loc2_,this._oData.isVisible);
      this.setDepth(_loc2_);
      if(_loc2_ == undefined)
      {
         _loc2_ = this._oData.cellNum;
      }
      else
      {
         this.setNewCellNum(_loc2_);
      }
      var _loc3_ = this._mcBattlefield.mapHandler.getCellData(_loc2_);
      var _loc4_ = this._mcBattlefield.mapHandler.getCellHeight(_loc2_);
      var _loc5_ = _loc4_ - Math.floor(_loc4_);
      this._x = _loc3_.x;
      this._y = _loc3_.y - _loc5_ * ank.battlefield.Constants.LEVEL_HEIGHT;
   }
   function setDepth(§\x07\x11§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = this._oData.cellNum;
      }
      var _loc3_ = ank.battlefield["\x1e\n\x07"]["\x1e\x0e\x0e"].getFreeDepthOnCell(this._mcBattlefield.mapHandler,this._oSprites,_loc2_,this._mcBattlefield.bGhostView);
      this.swapDepths(_loc3_);
      if(this._oData.hasCarriedChild())
      {
         this._oData.carriedChild.mc.setDepth(_loc2_);
      }
   }
   function setVisible(§\x16\x18§)
   {
      this._oData.isVisible = _loc2_;
      this._visible = _loc2_;
      this.updateMap(this._oData.cellNum,_loc2_);
   }
   function setAlpha(§\x1e\n\x02§)
   {
      this._mcGfx._alpha = _loc2_;
   }
   function setHidden(§\x1c\x1d§)
   {
      this._bHidden = _loc2_;
      if(this._bHidden)
      {
         this._mcGfx._x = this._mcGfx._y = -5000;
         this._mcGfx._visible = false;
      }
      else
      {
         this._mcGfx._x = this._mcGfx._y = 0;
         this._mcGfx._visible = true;
      }
   }
   function setGhostView(§\x16\x18§)
   {
      this.setDepth();
      if(_loc2_)
      {
         this._nLastAlphaValue = this._mcGfx._alpha;
         this.setAlpha(ank.battlefield.Constants.GHOSTVIEW_SPRITE_ALPHA);
      }
      else
      {
         this.setAlpha(this._nLastAlphaValue);
      }
   }
   function moveToCell(§\x1e\x12\x15§, §\x13\x05§, §\x14\x19§, §\x1e\r\x0f§, §\x1e\x14\x16§, §\x19\x1a§)
   {
      if(_loc3_ != this._oData.cellNum)
      {
         var _loc8_ = this._mcBattlefield.mapHandler.getCellData(this._oData.cellNum);
         var _loc9_ = this._mcBattlefield.mapHandler.getCellData(_loc3_);
         var _loc10_ = _loc9_.x;
         var _loc11_ = _loc9_.y;
         var _loc12_ = 0.01;
         if(_loc9_.groundSlope != 1)
         {
            _loc11_ -= ank.battlefield.Constants.HALF_LEVEL_HEIGHT;
         }
         if(_loc6_.toLowerCase() != "static")
         {
            this._oData.direction = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getDirectionFromCoordinates(_loc8_.x,_loc8_.rootY,_loc10_,_loc9_.rootY,true);
         }
         var _loc13_ = this.api.electron.isWindowFocused;
         switch(_loc5_)
         {
            case "slide":
               var _loc14_ = 0.25;
               if(_loc13_)
               {
                  this.setAnim(_loc6_);
               }
               else
               {
                  this.setAnim("static");
               }
               break;
            case "walk":
            default:
               _loc14_ = ank.battlefield.mc["\x1e\x0e\x10"].WALK_SPEEDS[this._oData.direction];
               if(_loc13_)
               {
                  this.setAnim(_loc6_ != undefined ? _loc6_ : "walk",undefined,_loc7_);
               }
               else
               {
                  this.setAnim("static");
               }
               break;
            case "run":
               _loc14_ = !!this._oData.isMounting ? ank.battlefield.mc["\x1e\x0e\x10"].MOUNT_SPEEDS[this._oData.direction] : ank.battlefield.mc["\x1e\x0e\x10"].RUN_SPEEDS[this._oData.direction];
               if(_loc13_)
               {
                  this.setAnim(_loc6_ != undefined ? _loc6_ : "run",undefined,_loc7_);
                  break;
               }
               this.setAnim("static");
               break;
         }
         _loc14_ *= this._oData.speedModerator;
         if(_loc9_.groundLevel < _loc8_.groundLevel)
         {
            _loc14_ += _loc12_;
         }
         else if(_loc9_.groundLevel > _loc8_.groundLevel)
         {
            _loc14_ -= _loc12_;
         }
         else if(_loc8_.groundSlope != _loc9_.groundSlope)
         {
            if(_loc9_.groundSlope == 1)
            {
               _loc14_ += _loc12_;
            }
            else if(_loc8_.groundSlope == 1)
            {
               _loc14_ -= _loc12_;
            }
         }
         this._nDistance = Math.sqrt(Math.pow(this._x - _loc10_,2) + Math.pow(this._y - _loc11_,2));
         var _loc15_ = Math.atan2(_loc11_ - this._y,_loc10_ - this._x);
         var _loc16_ = Math.cos(_loc15_);
         var _loc17_ = Math.sin(_loc15_);
         this._nLastTimer = getTimer();
         var _loc18_ = Number(_loc3_) > this._oData.cellNum;
         this.updateMap(_loc3_,this._oData.isVisible,true);
         this.setNewCellNum(_loc3_);
         this._oData.isInMove = true;
         this._oData.moveSpeedType = _loc5_;
         this._oData.moveAnimation = _loc6_;
         if(this._oData.hasCarriedChild())
         {
            var _loc19_ = this._oData.carriedChild;
            var _loc20_ = _loc19_.mc;
            _loc20_.setDirection(this._oData.direction);
            _loc20_.updateMap(_loc3_,_loc19_.isVisible);
            _loc20_.setNewCellNum(_loc3_);
         }
         if(_loc18_)
         {
            this.setDepth(_loc3_);
         }
         ank["\x1e\n\x07"]["\x11\x11"].getInstance().addFunction(this,this,this.basicMove,[_loc14_,_loc16_,_loc17_],this,this.basicMoveEnd,[_loc2_,_loc10_,_loc11_,_loc3_,_loc4_,_loc5_ == "slide",!_loc18_]);
      }
      else
      {
         _loc2_.onActionEnd();
      }
   }
   function basicMove(speed, §\x12\x03§, §\x1e\x11\t§)
   {
      var _loc5_ = getTimer() - this._nLastTimer;
      var _loc6_ = speed * (_loc5_ <= 125 ? _loc5_ : 125);
      this._x += _loc6_ * _loc3_;
      this._y += _loc6_ * _loc4_;
      this._nDistance -= _loc6_;
      this._nLastTimer = getTimer();
      if(this._nDistance <= _loc6_)
      {
         return false;
      }
      return true;
   }
   function basicMoveEnd(§\x1e\x12\x15§, xDest, yDest, §\x13\x05§, §\x14\x19§, §\x15\x04§, §\x15\x12§)
   {
      if(this._nOldCellNum != undefined)
      {
         this._mcBattlefield.mapHandler.getCellData(this._nOldCellNum).removeSpriteOnID(this._oData.id);
         this._nOldCellNum = undefined;
      }
      if(_loc6_)
      {
         this._x = xDest;
         this._y = yDest;
         this._oData.isInMove = false;
         this.setAnim(this._oData.defaultAnimation);
         if(this.api.gfx.spriteHandler.isShowingMonstersTooltip && this.data instanceof dofus.datacenter["\t\x1d"])
         {
            this._rollOver(true);
         }
      }
      if(_loc8_)
      {
         this.setDepth(_loc5_);
      }
      _loc2_.onActionEnd();
   }
   function saveLastAnimation(§\x1e\x14\x17§)
   {
      if(!this._oData.isMounting)
      {
         this._mcGfx.mcAnim.lastAnimation = _loc2_;
      }
      else
      {
         this._mcChevauchor.mcAnim.lastAnimation = _loc2_;
         this._mcGfx.mcAnimFront.lastAnimation = _loc2_;
         this._mcGfx.mcAnimBack.lastAnimation = _loc2_;
      }
   }
   function setAnimTimer(§\x1e\x02§, §\x17\x19§, §\x19\x19§, §\x1e\x1b\x1a§)
   {
      this.setAnim(_loc2_,_loc3_,_loc4_);
      if(_global.isNaN(Number(_loc5_)))
      {
         return undefined;
      }
      if(_loc5_ < 1)
      {
         return undefined;
      }
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"battlefield",this,this.setAnim,_loc5_,[this._oData.defaultAnimation]);
   }
   static function getDirNumByChar(§\x1e\x12\x1d§)
   {
      switch(_loc2_)
      {
         case "S":
            var _loc3_ = 0;
            break;
         case "R":
            _loc3_ = 1;
            break;
         case "F":
            _loc3_ = 2;
            break;
         case "L":
            _loc3_ = 5;
            break;
         case "B":
            _loc3_ = 6;
            break;
         default:
            _loc3_ = -1;
      }
      return _loc3_;
   }
   function setAnim(§\x1e\x02§, §\x17\x19§, §\x19\x19§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = this._oData.defaultAnimation;
      }
      _loc2_ = String(_loc2_).toLowerCase();
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      if(_loc4_ == undefined)
      {
         _loc4_ = false;
      }
      var _loc5_ = this._oData.noFlip;
      this._oData.bAnimLoop = _loc3_;
      var _loc6_ = this._mcGfx;
      var _loc7_ = "";
      if(this._oData.hasCarriedChild())
      {
         _loc7_ += "_C";
      }
      switch(this._oData.direction)
      {
         case 0:
            var _loc10_ = "S";
            var _loc8_ = _loc2_ + _loc7_ + _loc10_;
            var _loc9_ = "staticR";
            this._xscale = 100;
            break;
         case 1:
            _loc10_ = "R";
            _loc8_ = _loc2_ + _loc7_ + _loc10_;
            _loc9_ = "staticR";
            this._xscale = 100;
            break;
         case 2:
            _loc10_ = "F";
            _loc8_ = _loc2_ + _loc7_ + _loc10_;
            _loc9_ = "staticR";
            this._xscale = 100;
            break;
         case 3:
            _loc10_ = "R";
            _loc8_ = _loc2_ + _loc7_ + _loc10_;
            _loc9_ = "staticR";
            if(!_loc5_)
            {
               this._xscale = -100;
            }
            break;
         case 4:
            _loc10_ = "S";
            _loc8_ = _loc2_ + _loc7_ + _loc10_;
            _loc9_ = "staticL";
            if(!_loc5_)
            {
               this._xscale = -100;
            }
            break;
         case 5:
            _loc10_ = "L";
            _loc8_ = _loc2_ + _loc7_ + _loc10_;
            _loc9_ = "staticL";
            this._xscale = 100;
            break;
         case 6:
            _loc10_ = "B";
            _loc8_ = _loc2_ + _loc7_ + _loc10_;
            _loc9_ = "staticL";
            this._xscale = 100;
            break;
         case 7:
            _loc10_ = "L";
            _loc8_ = _loc2_ + _loc7_ + _loc10_;
            _loc9_ = "staticL";
            if(!_loc5_)
            {
               this._xscale = -100;
               break;
            }
      }
      var _loc11_ = this._oData.fullAnimation;
      var _loc12_ = this._oData.animation;
      this._oData.animation = _loc2_;
      this._oData.fullAnimation = _loc8_;
      if(this._oData.xtraClipTopAnimations != undefined)
      {
         if(this._oData.xtraClipTopAnimations[_loc8_])
         {
            this.addExtraClip(this._oData.xtraClipTopParams.file,this._oData.xtraClipTopParams.color,true);
         }
         else if(this._mcXtraTop != undefined)
         {
            this.removeExtraClip(true);
         }
      }
      if(_loc4_ || _loc8_ != _loc11_)
      {
         if(!this._oData.isMounting)
         {
            _loc6_.mcAnim.removeMovieClip();
            if(_loc6_.attachMovie(_loc8_,"mcAnim",10,{lastAnimation:_loc12_}) == undefined)
            {
               _loc6_.attachMovie("static" + _loc10_,"mcAnim",10,{lastAnimation:_loc12_});
               ank["\x1e\n\x07"]["\x0b\f"].err("L\'anim (" + _loc8_ + ") n\'existe pas !");
            }
            if(ank.battlefield["\x1c\n"].useCacheAsBitmapOnStaticAnim)
            {
               MovieClip(_loc6_.mcAnim).cacheAsBitmap = MovieClip(_loc6_.mcAnim)._totalframes == 1;
            }
         }
         else
         {
            this._mcChevauchor.mcAnim.removeMovieClip();
            _loc6_.mcAnimFront.removeMovieClip();
            _loc6_.mcAnimBack.removeMovieClip();
            if(this._mcChevauchor.attachMovie(_loc8_,"mcAnim",1,{lastAnimation:_loc12_}) == undefined)
            {
               this._mcChevauchor.attachMovie("static" + _loc10_,"mcAnim",1,{lastAnimation:_loc12_});
            }
            if(_loc6_.attachMovie(_loc8_ + "_Front","mcAnimFront",30,{lastAnimation:_loc12_}) == undefined)
            {
               _loc6_.attachMovie("static" + _loc10_ + "_Front","mcAnimFront",30,{lastAnimation:_loc12_});
            }
            if(_loc6_.attachMovie(_loc8_ + "_Back","mcAnimBack",10,{lastAnimation:_loc12_}) == undefined)
            {
               _loc6_.attachMovie("static" + _loc10_ + "_Back","mcAnimBack",10,{lastAnimation:_loc12_});
            }
         }
      }
      if(this._oData.hasCarriedChild())
      {
         ank["\x1e\n\x07"]["\x11\x11"].getInstance().addFunction(this,this,this.updateCarriedPosition);
      }
      if(this._oData.isMounting)
      {
         ank["\x1e\n\x07"]["\x11\x11"].getInstance().addFunction(this,this,this.updateChevauchorPosition);
      }
   }
   function updateCarriedPosition()
   {
      if(this._oData.hasCarriedChild())
      {
         if(this._mcCarried != undefined)
         {
            var _loc2_ = {x:this._mcCarried._x,y:this._mcCarried._y};
            this._mcCarried._parent.localToGlobal(_loc2_);
            this._mcBattlefield.container.globalToLocal(_loc2_);
            this._oData.carriedChild.mc._x = _loc2_.x;
            this._oData.carriedChild.mc._y = _loc2_.y;
         }
      }
      return this._oData.animation != "static" || this._oData.isInMove;
   }
   function updateChevauchorPosition()
   {
      if(this._oData.isMounting)
      {
         if(this._mcChevauchorPos != undefined)
         {
            var _loc2_ = {x:this._mcChevauchorPos._x,y:this._mcChevauchorPos._y};
            this._mcChevauchorPos._parent.localToGlobal(_loc2_);
            this._mcGfx.globalToLocal(_loc2_);
            this._mcChevauchor._x = _loc2_.x;
            this._mcChevauchor._y = _loc2_.y;
            this._mcChevauchor._rotation = this._mcChevauchorPos._rotation;
            this._mcChevauchor._xscale = this._mcChevauchorPos._xscale;
            this._mcChevauchor._yscale = this._mcChevauchorPos._yscale;
         }
      }
      return this._oData.animation != "static" || this._oData.isInMove;
   }
   function updateMap(§\x07\x11§, §\x13\x1a§, §\x1a\x17§)
   {
      var _loc5_ = this._mcBattlefield.mapHandler.getCellData(_loc2_);
      if(_loc5_ == undefined)
      {
         if(_loc3_)
         {
            this._mcBattlefield.mapHandler.getCellData(this._oData.cellNum).addSpriteOnID(this._oData.id);
         }
         else
         {
            this._mcBattlefield.mapHandler.getCellData(this._oData.cellNum).removeSpriteOnID(this._oData.id);
         }
         return undefined;
      }
      if(_loc4_ != true)
      {
         this._mcBattlefield.mapHandler.getCellData(this._oData.cellNum).removeSpriteOnID(this._oData.id);
      }
      else
      {
         this._nOldCellNum = this._oData.cellNum;
      }
      if(_loc3_)
      {
         _loc5_.addSpriteOnID(this._oData.id);
      }
   }
   function setScale(§\x1e\x1d\x19§, §\x1e\x1d\x18§)
   {
      this._mcGfx._xscale = _loc2_;
      this._mcGfx._yscale = _loc3_ == undefined ? _loc2_ : _loc3_;
   }
   function onLoadInit(§\n\x1d§)
   {
      this.onEnterFrame = function()
      {
         if(!this._bGfxLoaded)
         {
            this._bGfxLoaded = true;
            if(this._oData.isMounting)
            {
               this._mcChevauchor = this._mcGfx.createEmptyMovieClip("chevauchor",20);
               this._mvlLoader.loadClip(this._oData.mount.chevauchorGfxFile,this._mcChevauchor);
            }
         }
         else
         {
            this._bChevauchorGfxLoaded = true;
         }
         if(this._bGfxLoaded && (!this._oData.isMounting || this._bChevauchorGfxLoaded))
         {
            if(_global.isNaN(Number(this._oData.startAnimationTimer)))
            {
               this.setAnim(this._oData.startAnimation,undefined,true);
            }
            else
            {
               this.setAnimTimer(this._oData.startAnimation,false,false,this._oData.startAnimationTimer);
            }
            delete this.onEnterFrame;
         }
      };
      this.dispatchEvent({type:"onLoadInit",clip:this});
   }
   function _release(§\x1e\t\x1c§)
   {
      this._mcBattlefield.onSpriteRelease(this);
   }
   function _rollOver(§\x1a\b§)
   {
      this._mcBattlefield.onSpriteRollOver(this,_loc2_);
   }
   function _rollOut(§\x1a\b§)
   {
      this._mcBattlefield.onSpriteRollOut(this,_loc2_);
   }
}
