class ank.battlefield.§\x0b\x06§
{
   var _nLoadRequest;
   var _mcBattlefield;
   var _oDatacenter;
   var _mcContainer;
   var api;
   var _nLastCellCount;
   var _nAdjustTimer;
   static var OBJECT_TYPE_BACKGROUND = 1;
   static var OBJECT_TYPE_GROUND = 2;
   static var OBJECT_TYPE_OBJECT1 = 3;
   static var OBJECT_TYPE_OBJECT2 = 4;
   static var TIME_BEFORE_AJUSTING_MAP = 500;
   var _oLoadingCells = new Object();
   var _oSettingFrames = new Object();
   var _mclLoader = new MovieClipLoader();
   var _nMaxMapRender = 1;
   var _bShowingFightCells = false;
   function §\x0b\x06§(§\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      if(_loc2_ != undefined)
      {
         this.initialize(_loc2_,_loc3_,_loc4_);
      }
      this._mclLoader.addListener(this);
   }
   function get showingFightCells()
   {
      return this._bShowingFightCells;
   }
   function set showingFightCells(§\x15\n§)
   {
      this._bShowingFightCells = _loc2_;
   }
   function get LoaderRequestLeft()
   {
      return this._nLoadRequest;
   }
   function initialize(§\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      this._mcBattlefield = _loc2_;
      this._oDatacenter = _loc4_;
      this._mcContainer = _loc3_;
      this.api = _global.API;
   }
   function build(§\x1e\x18\x17§, §\x07\x11§, §\x1b\x1b§)
   {
      this._oDatacenter.Map = _loc2_;
      var _loc5_ = ank.battlefield.Constants.CELL_WIDTH;
      var _loc6_ = ank.battlefield.Constants.CELL_HALF_WIDTH;
      var _loc7_ = ank.battlefield.Constants.CELL_HALF_HEIGHT;
      var _loc8_ = ank.battlefield.Constants.LEVEL_HEIGHT;
      var _loc9_ = -1;
      var _loc10_ = 0;
      var _loc11_ = 0;
      var _loc12_ = _loc2_.data;
      var _loc13_ = _loc12_.length;
      var _loc14_ = _loc2_.width - 1;
      var _loc15_ = this._mcContainer.ExternalContainer;
      var _loc16_ = _loc3_ != undefined;
      var _loc17_ = false;
      var _loc18_ = this._nLastCellCount == _loc13_;
      this._nLoadRequest = 0;
      if(!_loc16_ && (ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod"))
      {
         this._mcContainer.applyMask(false);
      }
      if(_loc2_.backgroundNum != 0)
      {
         if(ank.battlefield.Constants.USE_STREAMING_FILES && (ank.battlefield.Constants.STREAMING_METHOD == "explod" && !_loc16_))
         {
            var _loc19_ = _loc15_.Ground.createEmptyMovieClip("background",-1);
            _loc19_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/BACKGROUND"];
            this._mclLoader.loadClip(ank.battlefield.Constants.STREAMING_GROUNDS_DIR + _loc2_.backgroundNum + ".swf",_loc19_);
            this._nLoadRequest++;
         }
         else if(ank.battlefield.Constants.STREAMING_METHOD != "")
         {
            _loc15_.Ground.attachMovie(_loc2_.backgroundNum,"background",-1).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/BACKGROUND"];
         }
         else
         {
            _loc15_.Ground.attach(_loc2_.backgroundNum,"background",-1).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/BACKGROUND"];
         }
      }
      var _loc20_ = -1;
      while((_loc20_ = _loc20_ + 1) < _loc13_)
      {
         if(_loc9_ == _loc14_)
         {
            _loc9_ = 0;
            _loc10_ += 1;
            if(_loc11_ == 0)
            {
               _loc11_ = _loc6_;
               _loc14_ -= 1;
            }
            else
            {
               _loc11_ = 0;
               _loc14_ += 1;
            }
         }
         else
         {
            _loc9_ = _loc9_ + 1;
         }
         if(_loc16_)
         {
            if(_loc20_ < _loc3_)
            {
               continue;
            }
            if(_loc20_ > _loc3_)
            {
               return undefined;
            }
         }
         var _loc21_ = _loc12_[_loc20_];
         if(_loc21_.active)
         {
            var _loc22_ = _loc9_ * _loc5_ + _loc11_;
            var _loc23_ = _loc10_ * _loc7_ - _loc8_ * (_loc21_.groundLevel - 7);
            _loc21_.x = _loc22_;
            _loc21_.y = _loc23_;
            if(_loc21_.movement || _loc4_)
            {
               if(!_loc18_ && !_loc15_.InteractionCell["cell" + _loc20_])
               {
                  if(!_loc17_)
                  {
                     if(ank.battlefield.Constants.STREAMING_METHOD != "")
                     {
                        var _loc24_ = _loc15_.InteractionCell.attachMovie("i" + _loc21_.groundSlope,"cell" + _loc20_,_loc20_,{_x:_loc22_,_y:_loc23_});
                     }
                     else
                     {
                        _loc24_ = _loc15_.InteractionCell.attachMovie("i" + _loc21_.groundSlope,"cell" + _loc20_,_loc20_,{_x:_loc22_,_y:_loc23_});
                     }
                  }
                  else
                  {
                     _loc24_ = _loc15_.InteractionCell.createEmptyMovieClip("cell" + _loc20_,_loc20_,{_x:_loc22_,_y:_loc23_});
                  }
                  _loc24_.__proto__ = ank.battlefield.mc["\x13\n"].prototype;
                  _loc24_.initialize(this._mcBattlefield);
               }
               else
               {
                  _loc24_ = _loc15_.InteractionCell["cell" + _loc20_];
               }
               _loc21_.mc = _loc24_;
               _loc24_.data = _loc21_;
            }
            else
            {
               _loc15_.InteractionCell["cell" + _loc20_].removeMovieClip();
            }
            if(_loc21_.layerGroundNum != 0)
            {
               if(ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod")
               {
                  var _loc26_ = true;
                  if(_loc16_)
                  {
                     var _loc25_ = _loc15_.Ground["cell" + _loc20_];
                     if(_loc25_ != undefined && _loc25_.lastGroundID == _loc21_.layerGroundNum)
                     {
                        _loc25_.fullLoaded = _loc26_ = false;
                        this._oLoadingCells[_loc25_] = _loc21_;
                        this.onLoadInit(_loc25_);
                     }
                  }
                  if(_loc26_)
                  {
                     _loc25_ = _loc15_.Ground.createEmptyMovieClip("cell" + _loc20_,_loc20_);
                     _loc25_.fullLoaded = false;
                     this._oLoadingCells[_loc25_] = _loc21_;
                     this._mclLoader.loadClip(ank.battlefield.Constants.STREAMING_GROUNDS_DIR + _loc21_.layerGroundNum + ".swf",_loc25_);
                     this._nLoadRequest++;
                  }
               }
               else
               {
                  if(!_loc17_)
                  {
                     if(ank.battlefield.Constants.STREAMING_METHOD != "")
                     {
                        _loc25_ = _loc15_.Ground.attachMovie(_loc21_.layerGroundNum,"cell" + _loc20_,_loc20_);
                     }
                     else
                     {
                        _loc25_ = _loc15_.Ground.attach(_loc21_.layerGroundNum,"cell" + _loc20_,_loc20_);
                     }
                  }
                  else
                  {
                     _loc25_ = new MovieClip();
                  }
                  _loc25_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Ground"];
                  _loc25_._x = _loc22_;
                  _loc25_._y = _loc23_;
                  if(_loc21_.groundSlope != 1)
                  {
                     _loc25_.gotoAndStop(_loc21_.groundSlope);
                  }
                  else if(_loc21_.layerGroundRot != 0)
                  {
                     _loc25_._rotation = _loc21_.layerGroundRot * 90;
                     if(_loc25_._rotation % 180)
                     {
                        _loc25_._yscale = 192.86;
                        _loc25_._xscale = 51.85;
                     }
                  }
                  if(_loc21_.layerGroundFlip)
                  {
                     _loc25_._xscale *= -1;
                  }
               }
            }
            else
            {
               _loc15_.Ground["cell" + _loc20_].removeMovieClip();
            }
            if(_loc21_.layerObject1Num != 0)
            {
               if(ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod")
               {
                  var _loc28_ = true;
                  if(_loc16_)
                  {
                     var _loc27_ = _loc15_.Object1["cell" + _loc20_];
                     if(_loc27_ != undefined && _loc27_.lastObject1ID == _loc21_.layerObject1Num)
                     {
                        _loc27_.fullLoaded = _loc28_ = false;
                        this._oLoadingCells[_loc27_] = _loc21_;
                        this.onLoadInit(_loc27_);
                     }
                  }
                  if(_loc28_)
                  {
                     _loc27_ = _loc15_.Object1.createEmptyMovieClip("cell" + _loc20_,_loc20_);
                     _loc27_.fullLoaded = false;
                     this._oLoadingCells[_loc27_] = _loc21_;
                     this._mclLoader.loadClip(ank.battlefield.Constants.STREAMING_OBJECTS_DIR + _loc21_.layerObject1Num + ".swf",_loc27_);
                     this._nLoadRequest++;
                  }
               }
               else
               {
                  if(!_loc17_)
                  {
                     _loc27_ = _loc15_.Object1.attachMovie(_loc21_.layerObject1Num,"cell" + _loc20_,_loc20_);
                  }
                  else
                  {
                     _loc27_ = new MovieClip();
                  }
                  _loc27_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Object1"];
                  _loc27_._x = _loc22_;
                  _loc27_._y = _loc23_;
                  if(_loc21_.groundSlope == 1 && _loc21_.layerObject1Rot != 0)
                  {
                     _loc27_._rotation = _loc21_.layerObject1Rot * 90;
                     if(_loc27_._rotation % 180)
                     {
                        _loc27_._yscale = 192.86;
                        _loc27_._xscale = 51.85;
                     }
                  }
                  if(_loc21_.layerObject1Flip)
                  {
                     _loc27_._xscale *= -1;
                  }
               }
               _loc21_.mcObject1 = _loc27_;
            }
            else
            {
               _loc15_.Object1["cell" + _loc20_].removeMovieClip();
            }
            if(_loc21_.layerObjectExternal != "")
            {
               if(!_loc17_)
               {
                  var _loc29_ = _loc15_.Object2.attachClassMovie(ank.battlefield.mc["\f\x11"],"cellExt" + _loc20_,_loc20_ * 100 + 1);
               }
               _loc29_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/ObjectExternal"];
               _loc29_.initialize(this._mcBattlefield,_loc21_,_loc21_.layerObjectExternalInteractive);
               _loc29_.loadExternalClip(_loc21_.layerObjectExternal,_loc21_.layerObjectExternalAutoSize);
               _loc29_._x = _loc22_;
               _loc29_._y = _loc23_;
               _loc21_.mcObjectExternal = _loc29_;
            }
            else
            {
               _loc15_.Object2["cellExt" + _loc20_].removeMovieClip();
               delete _loc21_.mcObjectExternal;
            }
            if(_loc21_.layerObject2Num != 0)
            {
               if(ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod")
               {
                  var _loc31_ = true;
                  if(_loc16_)
                  {
                     var _loc30_ = _loc15_.Object2["cell" + _loc20_];
                     if(_loc30_ != undefined && _loc30_.lastObject2ID == _loc21_.layerObject2Num)
                     {
                        _loc30_.fullLoaded = _loc31_ = false;
                        this._oLoadingCells[_loc30_] = _loc21_;
                        this.onLoadInit(_loc30_);
                     }
                  }
                  if(_loc31_)
                  {
                     _loc30_ = _loc15_.Object2.createEmptyMovieClip("cell" + _loc20_,_loc20_ * 100);
                     _loc30_.fullLoaded = false;
                     this._oLoadingCells[_loc30_] = _loc21_;
                     this._mclLoader.loadClip(ank.battlefield.Constants.STREAMING_OBJECTS_DIR + _loc21_.layerObject2Num + ".swf",_loc30_);
                     this._nLoadRequest++;
                  }
               }
               else
               {
                  if(!_loc17_)
                  {
                     _loc30_ = _loc15_.Object2.attachMovie(_loc21_.layerObject2Num,"cell" + _loc20_,_loc20_ * 100);
                  }
                  else
                  {
                     _loc30_ = new MovieClip();
                  }
                  _loc30_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Object2"];
                  if(_loc21_.layerObject2Interactive)
                  {
                     _loc30_.__proto__ = ank.battlefield.mc["\f\x11"].prototype;
                     _loc30_.initialize(this._mcBattlefield,_loc21_,true);
                  }
                  _loc30_._x = _loc22_;
                  _loc30_._y = _loc23_;
                  if(_loc21_.layerObject2Flip)
                  {
                     _loc30_._xscale = -100;
                  }
               }
               _loc21_.mcObject2 = _loc30_;
            }
            else
            {
               _loc15_.Object2["cell" + _loc20_].removeMovieClip();
               delete _loc21_.mcObject2;
            }
         }
         else if(_loc4_)
         {
            var _loc32_ = _loc9_ * _loc5_ + _loc11_;
            var _loc33_ = _loc10_ * _loc7_;
            _loc21_.x = _loc32_;
            _loc21_.y = _loc33_;
            var _loc34_ = _loc15_.InteractionCell.attachMovie("i1","cell" + _loc20_,_loc20_,{_x:_loc32_,_y:_loc33_});
            _loc34_.__proto__ = ank.battlefield.mc["\x13\n"].prototype;
            _loc34_.initialize(this._mcBattlefield);
            _loc21_.mc = _loc34_;
            _loc34_.data = _loc21_;
         }
      }
      if(!_loc16_)
      {
         if(ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod")
         {
            if(this._nAdjustTimer != undefined)
            {
               return undefined;
            }
            this._nAdjustTimer = _global.setInterval(this,"adjustAndMaskMap",ank.battlefield["\x0b\x06"].TIME_BEFORE_AJUSTING_MAP);
         }
         else
         {
            this.adjustAndMaskMap();
         }
      }
   }
   function tacticMode(§\x16\x15§)
   {
      var _loc3_ = this._oDatacenter.Map;
      var _loc4_ = _loc3_.data;
      if(_loc2_)
      {
         this._mcContainer.ExternalContainer.clearGround();
         if(_loc3_.savedBackgroundNum == undefined && _loc3_.backgroundNum != 631)
         {
            _loc3_.savedBackgroundNum = _loc3_.backgroundNum;
         }
         _loc3_.backgroundNum = 631;
      }
      else if(_loc3_.savedBackgroundNum != undefined)
      {
         if(_loc3_.savedBackgroundNum == 0)
         {
            _loc3_.backgroundNum = 632;
         }
         else
         {
            _loc3_.backgroundNum = _loc3_.savedBackgroundNum;
         }
      }
      for(var mapCell in _loc4_)
      {
         this.tacticModeRefreshCell(Number(mapCell),_loc2_);
      }
   }
   function tacticModeRefreshCell(§\x07\x11§, §\x16\x15§)
   {
      if(_loc2_ > this.getCellCount())
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[updateCell] Cellule " + _loc2_ + " inexistante");
         return undefined;
      }
      var _loc4_ = this._oDatacenter.Map;
      var _loc5_ = _loc4_.data[_loc2_];
      if(!_loc5_.active)
      {
         return undefined;
      }
      if(!_loc3_)
      {
         var _loc6_ = ank.battlefield.datacenter["\x13\n"](_loc4_.originalsCellsBackup.getItemAt(String(_loc2_)));
         if(_loc6_ == undefined)
         {
            ank["\x1e\n\x07"]["\x0b\f"].err("La case est déjà dans son état init");
            return undefined;
         }
         _loc5_.layerGroundNum = _loc6_.layerGroundNum;
         _loc5_.groundSlope = _loc6_.groundSlope;
         _loc5_.layerObject1Rot = _loc6_.layerObject1Rot;
         _loc5_.layerObject1Num = _loc6_.layerObject1Num;
         if(_loc5_.layerObject2Num != 25)
         {
            _loc5_.layerObject2Num = _loc6_.layerObject2Num;
         }
      }
      else
      {
         if(_loc5_.nPermanentLevel == 0)
         {
            var _loc7_ = new ank.battlefield.datacenter["\x13\n"]();
            for(var cellData in _loc5_)
            {
               _loc7_[cellData] = _loc5_[cellData];
            }
            _loc4_.originalsCellsBackup.addItemAt(String(_loc2_),_loc7_);
         }
         _loc5_.turnTactic(this);
      }
      this.build(_loc4_,_loc2_);
   }
   function updateCell(§\x07\x11§, §\x1e\x18\x12§, §\x1e\x10\x06§, nPermanentLevel)
   {
      if(_loc2_ > this.getCellCount())
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[updateCell] Cellule " + _loc2_ + " inexistante");
         return undefined;
      }
      if(nPermanentLevel == undefined || _global.isNaN(nPermanentLevel))
      {
         nPermanentLevel = 0;
      }
      else
      {
         nPermanentLevel = Number(nPermanentLevel);
      }
      var _loc6_ = _global.parseInt(_loc4_,16);
      var _loc7_ = (_loc6_ & 0x010000) != 0;
      var _loc8_ = (_loc6_ & 0x8000) != 0;
      var _loc9_ = (_loc6_ & 0x4000) != 0;
      var _loc10_ = (_loc6_ & 0x2000) != 0;
      var _loc11_ = (_loc6_ & 0x1000) != 0;
      var _loc12_ = (_loc6_ & 0x0800) != 0;
      var _loc13_ = (_loc6_ & 0x0400) != 0;
      var _loc14_ = (_loc6_ & 0x0200) != 0;
      var _loc15_ = (_loc6_ & 0x0100) != 0;
      var _loc16_ = (_loc6_ & 0x80) != 0;
      var _loc17_ = (_loc6_ & 0x40) != 0;
      var _loc18_ = (_loc6_ & 0x20) != 0;
      var _loc19_ = (_loc6_ & 0x10) != 0;
      var _loc20_ = (_loc6_ & 8) != 0;
      var _loc21_ = (_loc6_ & 4) != 0;
      var _loc22_ = (_loc6_ & 2) != 0;
      var _loc23_ = (_loc6_ & 1) != 0;
      var _loc24_ = this._oDatacenter.Map.data[_loc2_];
      if(nPermanentLevel > 0)
      {
         if(_loc24_.nPermanentLevel == 0)
         {
            var _loc25_ = new ank.battlefield.datacenter["\x13\n"]();
            for(var k in _loc24_)
            {
               _loc25_[k] = _loc24_[k];
            }
            this._oDatacenter.Map.originalsCellsBackup.addItemAt(_loc2_,_loc25_);
            _loc24_.nPermanentLevel = nPermanentLevel;
         }
      }
      if(_loc10_)
      {
         _loc24_.active = _loc3_.active;
      }
      if(_loc11_)
      {
         _loc24_.lineOfSight = _loc3_.lineOfSight;
      }
      if(_loc12_)
      {
         _loc24_.movement = _loc3_.movement;
      }
      if(_loc13_)
      {
         _loc24_.groundLevel = _loc3_.groundLevel;
      }
      if(_loc14_)
      {
         _loc24_.groundSlope = _loc3_.groundSlope;
      }
      if(_loc15_)
      {
         _loc24_.layerGroundNum = _loc3_.layerGroundNum;
      }
      if(_loc16_)
      {
         _loc24_.layerGroundFlip = _loc3_.layerGroundFlip;
      }
      if(_loc17_)
      {
         _loc24_.layerGroundRot = _loc3_.layerGroundRot;
      }
      if(_loc18_)
      {
         _loc24_.layerObject1Num = _loc3_.layerObject1Num;
      }
      if(_loc20_)
      {
         _loc24_.layerObject1Rot = _loc3_.layerObject1Rot;
      }
      if(_loc19_)
      {
         _loc24_.layerObject1Flip = _loc3_.layerObject1Flip;
      }
      if(_loc22_)
      {
         _loc24_.layerObject2Flip = _loc3_.layerObject2Flip;
      }
      if(_loc23_)
      {
         _loc24_.layerObject2Interactive = _loc3_.layerObject2Interactive;
      }
      if(_loc21_)
      {
         _loc24_.layerObject2Num = _loc3_.layerObject2Num;
      }
      if(_loc9_)
      {
         _loc24_.layerObjectExternal = _loc3_.layerObjectExternal;
      }
      if(_loc8_)
      {
         _loc24_.layerObjectExternalInteractive = _loc3_.layerObjectExternalInteractive;
      }
      if(_loc7_)
      {
         _loc24_.layerObjectExternalAutoSize = _loc3_.layerObjectExternalAutoSize;
      }
      _loc24_.layerObjectExternalData = _loc3_.layerObjectExternalData;
      this.build(this._oDatacenter.Map,_loc2_);
   }
   function initializeMap(nPermanentLevel)
   {
      if(nPermanentLevel == undefined)
      {
         nPermanentLevel = Number.POSITIVE_INFINITY;
      }
      else
      {
         nPermanentLevel = Number(nPermanentLevel);
      }
      var _loc3_ = this._oDatacenter.Map;
      if(_loc3_.savedBackgroundNum != undefined)
      {
         if(_loc3_.savedBackgroundNum == 0)
         {
            _loc3_.backgroundNum = 632;
         }
         else
         {
            _loc3_.backgroundNum = _loc3_.savedBackgroundNum;
         }
      }
      var _loc4_ = _loc3_.data;
      var _loc5_ = _loc3_.originalsCellsBackup.getItems();
      for(var k in _loc5_)
      {
         this.initializeCell(Number(k),nPermanentLevel);
      }
   }
   function initializeCell(§\x07\x11§, nPermanentLevel, §\x15\x1a§)
   {
      if(nPermanentLevel == undefined)
      {
         nPermanentLevel = Number.POSITIVE_INFINITY;
      }
      else
      {
         nPermanentLevel = Number(nPermanentLevel);
      }
      var _loc5_ = this._oDatacenter.Map;
      var _loc6_ = _loc5_.data;
      var _loc7_ = _loc5_.originalsCellsBackup.getItemAt(String(_loc2_));
      if(_loc7_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("La case est déjà dans son état init");
         return undefined;
      }
      if(_loc6_[_loc2_].nPermanentLevel <= nPermanentLevel)
      {
         if(_loc4_ == true)
         {
            var _loc8_ = _loc6_[_loc2_].isTactic;
            var _loc9_ = new ank.battlefield.datacenter["\x13\n"]();
            for(var cellData in _loc7_)
            {
               _loc9_[cellData] = _loc7_[cellData];
            }
            if(_loc8_)
            {
               _loc9_.turnTactic(this);
            }
            _loc6_[_loc2_] = _loc9_;
            this.build(_loc5_,_loc2_);
            if(!_loc8_)
            {
               _loc5_.originalsCellsBackup.removeItemAt(String(_loc2_));
            }
         }
         else
         {
            _loc6_[_loc2_] = _loc7_;
            this.build(_loc5_,_loc2_);
            _loc5_.originalsCellsBackup.removeItemAt(String(_loc2_));
         }
      }
   }
   function setObject2Frame(§\x07\x11§, §\x0e\x04§)
   {
      if(typeof _loc3_ == "number" && _loc3_ < 1)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setObject2Frame] frame " + _loc3_ + " incorecte");
         return undefined;
      }
      if(_loc2_ > this.getCellCount())
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setObject2Frame] Cellule " + _loc2_ + " inexistante");
         return undefined;
      }
      var _loc4_ = this._oDatacenter.Map.data[_loc2_];
      var _loc5_ = _loc4_.mcObject2;
      if(ank.battlefield.Constants.USE_STREAMING_FILES && (ank.battlefield.Constants.STREAMING_METHOD == "explod" && !_loc5_.fullLoaded))
      {
         this._oSettingFrames[_loc2_] = _loc3_;
      }
      else if(ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod")
      {
         for(var s in _loc5_)
         {
            if(_loc5_[s] instanceof MovieClip)
            {
               _loc5_[s].gotoAndStop(_loc3_);
            }
         }
      }
      else
      {
         _loc5_.gotoAndStop(_loc3_);
      }
   }
   function setObjectExternalFrame(§\x07\x11§, §\x0e\x04§)
   {
      if(typeof _loc3_ == "number" && _loc3_ < 1)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setObject2Frame] frame " + _loc3_ + " incorecte");
         return undefined;
      }
      if(_loc2_ > this.getCellCount())
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setObject2Frame] Cellule " + _loc2_ + " inexistante");
         return undefined;
      }
      var _loc4_ = this._oDatacenter.Map.data[_loc2_];
      var _loc5_ = _loc4_.mcObjectExternal._mcExternal;
      _loc5_.gotoAndStop(_loc3_);
   }
   function setObject2Interactive(§\x07\x11§, §\x18\x17§, nPermanentLevel)
   {
      if(_loc2_ > this.getCellCount())
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setObject2State] Cellule " + _loc2_ + " inexistante");
         return undefined;
      }
      var _loc5_ = this._oDatacenter.Map.data[_loc2_];
      if(_loc5_.mcObject2 == this.api.gfx.rollOverMcObject)
      {
         this.api.gfx.onObjectRollOut(_loc5_.mcObject2);
      }
      var _loc6_ = new ank.battlefield.datacenter["\x13\n"]();
      _loc6_.layerObject2Interactive = _loc3_;
      this.updateCell(_loc2_,_loc6_,"1",nPermanentLevel);
   }
   function getCellCount(§\x1e\t\x1c§)
   {
      return this._oDatacenter.Map.data.length;
   }
   function getCellData(§\x07\x11§)
   {
      return this._oDatacenter.Map.data[_loc2_];
   }
   function getCellsData(§\x1e\t\x1c§)
   {
      return this._oDatacenter.Map.data;
   }
   function getWidth(§\x1e\t\x1c§)
   {
      return this._oDatacenter.Map.width;
   }
   function getHeight(§\x1e\t\x1c§)
   {
      return this._oDatacenter.Map.height;
   }
   function getCaseNum(nX, nY)
   {
      var _loc4_ = this.getWidth();
      return nX * _loc4_ + nY * (_loc4_ - 1);
   }
   function getCellHeight(§\x07\x11§)
   {
      var _loc3_ = this.getCellData(_loc2_);
      var _loc4_ = !(_loc3_.groundSlope == undefined || _loc3_.groundSlope == 1) ? 0.5 : 0;
      var _loc5_ = _loc3_.groundLevel != undefined ? _loc3_.groundLevel - 7 : 0;
      return _loc5_ + _loc4_;
   }
   function getLayerByCellPropertyName(§\x1e\x1a\x02§)
   {
      var _loc3_ = new Array();
      for(var i in this._oDatacenter.Map.data)
      {
         _loc3_.push(this._oDatacenter.Map.data[i][_loc2_]);
      }
      return _loc3_;
   }
   function resetEmptyCells()
   {
      var _loc2_ = this._mcBattlefield.spriteHandler.getSprites().getItems();
      var _loc3_ = new Array();
      for(var k in _loc2_)
      {
         var _loc4_ = _loc2_[k];
         if(!(_loc4_.isPendingClearing || (_loc4_.isClear || _loc4_.mc.gfx._width == 0)))
         {
            _loc3_[_loc4_.cellNum] = true;
         }
      }
      var _loc5_ = this.getCellCount();
      var _loc6_ = 0;
      var _loc7_ = 0;
      while(_loc7_ < _loc5_)
      {
         if(_loc3_[_loc7_] != true)
         {
            var _loc8_ = this._mcBattlefield.mapHandler.getCellData(_loc7_);
            var _loc9_ = _loc8_.spriteOnCount;
            if(_loc9_ != 0)
            {
               _loc6_ += _loc9_;
               _loc8_.removeAllSpritesOnID();
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      if(_loc6_ > 0)
      {
      }
   }
   function adjustAndMaskMap()
   {
      if(this._nAdjustTimer != undefined)
      {
         _global.clearInterval(this._nAdjustTimer);
         this._nAdjustTimer = undefined;
      }
      this._mcContainer.applyMask(true);
      this._mcContainer.adjusteMap();
   }
   function onLoadInit(§\n\x1d§)
   {
      this._nLoadRequest--;
      if(this._oLoadingCells[_loc2_] == undefined)
      {
         return undefined;
      }
      var _loc3_ = String(_loc2_).split(".");
      var _loc4_ = _loc3_[_loc3_.length - 2];
      var _loc5_ = this._oLoadingCells[_loc2_];
      switch(_loc4_)
      {
         case "Ground":
            _loc2_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Ground"];
            _loc2_._x = Number(_loc5_.x);
            _loc2_._y = Number(_loc5_.y);
            if(_loc5_.groundSlope == 1 && _loc5_.layerGroundRot != 0)
            {
               _loc2_._rotation = _loc5_.layerGroundRot * 90;
               if(_loc2_._rotation % 180)
               {
                  _loc2_._yscale = 192.86;
                  _loc2_._xscale = 51.85;
               }
               else
               {
                  var _loc0_ = null;
                  _loc2_._xscale = _loc0_ = 100;
                  _loc2_._yscale = _loc0_;
               }
            }
            else
            {
               _loc2_._rotation = 0;
               _loc2_._xscale = _loc0_ = 100;
               _loc2_._yscale = _loc0_;
            }
            if(_loc5_.layerGroundFlip)
            {
               _loc2_._xscale *= -1;
            }
            else
            {
               _loc2_._xscale *= 1;
            }
            if(_loc5_.groundSlope != 1)
            {
               _loc2_.gotoAndStop(_loc5_.groundSlope);
            }
            _loc2_.lastGroundID = _loc5_.layerGroundNum;
            break;
         case "Object1":
            _loc2_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Object1"];
            _loc2_._x = Number(_loc5_.x);
            _loc2_._y = Number(_loc5_.y);
            if(_loc5_.groundSlope == 1 && _loc5_.layerObject1Rot != 0)
            {
               _loc2_._rotation = _loc5_.layerObject1Rot * 90;
               if(_loc2_._rotation % 180)
               {
                  _loc2_._yscale = 192.86;
                  _loc2_._xscale = 51.85;
               }
               else
               {
                  _loc2_._xscale = _loc0_ = 100;
                  _loc2_._yscale = _loc0_;
               }
            }
            else
            {
               _loc2_._rotation = 0;
               _loc2_._xscale = _loc0_ = 100;
               _loc2_._yscale = _loc0_;
            }
            if(_loc5_.layerObject1Flip)
            {
               _loc2_._xscale *= -1;
            }
            else
            {
               _loc2_._xscale *= 1;
            }
            _loc2_.lastObject1ID = _loc5_.layerObject1Num;
            break;
         case "Object2":
            _loc2_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Object2"];
            _loc2_._x = Number(_loc5_.x);
            _loc2_._y = Number(_loc5_.y);
            if(_loc5_.layerObject2Interactive)
            {
               _loc2_.__proto__ = ank.battlefield.mc["\f\x11"].prototype;
               _loc2_.initialize(this._mcBattlefield,_loc5_,true);
            }
            else
            {
               _loc2_.__proto__ = MovieClip.prototype;
            }
            if(_loc5_.layerObject2Flip)
            {
               _loc2_._xscale = -100;
            }
            else
            {
               _loc2_._xscale = 100;
            }
            _loc2_.lastObject2ID = _loc5_.layerObject2Num;
      }
      if(this._oSettingFrames[_loc5_.num] != undefined)
      {
         var _loc6_ = this._oDatacenter.Map.data[_loc5_.num].mcObject2;
         for(var s in _loc6_)
         {
            if(_loc6_[s] instanceof MovieClip)
            {
               _loc6_[s].gotoAndStop(this._oSettingFrames[_loc5_.num]);
            }
         }
         delete this._oSettingFrames[_loc5_.num];
      }
      _loc2_.fullLoaded = true;
      delete this._oLoadingCells[_loc2_];
   }
   function showTriggers()
   {
      var _loc2_ = this.getCellsData();
      for(var i in _loc2_)
      {
         var _loc3_ = _loc2_[i];
         var _loc4_ = _loc3_.isTrigger;
         if(_loc4_)
         {
            this.flagCellNonBlocking(_loc3_.num);
         }
      }
   }
   function showFightCells(§\x1e\f\x14§, §\x1e\f\x13§)
   {
      if(_loc2_ == undefined || _loc3_ == undefined)
      {
         var _loc4_ = this.api.lang.getMapText(this._oDatacenter.Map.id);
         if(_loc4_.p1 == undefined || _loc4_.p2 == undefined)
         {
            return undefined;
         }
         _loc2_ = _loc4_.p1;
         _loc3_ = _loc4_.p2;
      }
      this._bShowingFightCells = true;
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.length)
      {
         var _loc6_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc2_.charAt(_loc5_)) << 6;
         _loc6_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc2_.charAt(_loc5_ + 1));
         this.api.gfx.select(_loc6_,dofus.Constants.TEAMS_COLOR[0],"startPosition");
         _loc5_ += 2;
      }
      var _loc7_ = 0;
      while(_loc7_ < _loc3_.length)
      {
         var _loc8_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc3_.charAt(_loc7_)) << 6;
         _loc8_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc3_.charAt(_loc7_ + 1));
         this.api.gfx.select(_loc8_,dofus.Constants.TEAMS_COLOR[1],"startPosition");
         _loc7_ += 2;
      }
   }
   function flagCellNonBlocking(§\x07\x11§)
   {
      var _loc3_ = this.api.datacenter.Player.ID;
      var _loc4_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
      _loc4_.file = dofus.Constants.CLIPS_PATH + "flag.swf";
      _loc4_.bInFrontOfSprite = true;
      _loc4_.bTryToBypassContainerColor = true;
      this.api.gfx.spriteLaunchVisualEffect(_loc3_,_loc4_,_loc2_,11,undefined,undefined,undefined,true,false);
   }
}
