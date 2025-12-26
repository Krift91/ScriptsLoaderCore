class dofus.§\r\x14§.gapi.controls.MiniMap extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oMap;
   var _nRandomTag;
   var _nScale;
   var _mcFlagsDirection;
   var _mcFlagsContainer;
   var tooltipText;
   var _mcFlags;
   var _mcHintsContainer;
   var _ldrHints;
   var _ldrBitmapMap;
   var _mcBitmapContainer;
   var _mcCursor;
   var oMap;
   var label;
   var _nCurrentArea;
   var oHint;
   var _bTimerEnable;
   var _mcBgSmall;
   var _mcBg;
   var _mcBgBig;
   static var HIDE_FLAG_ZONE;
   static var CLASS_NAME = "MiniMap";
   static var MAP_IMG_WIDTH = 15;
   static var MAP_IMG_HEIGHT = 15;
   static var SCALE_SMALL = 0;
   static var SCALE_NORMAL = 1;
   static var SCALE_BIG = 2;
   var _aFlags = new Array();
   var _nMapScale = 40;
   var _nTileWidth = 40;
   var _nTileHeight = 23;
   var _nLastDoubleClick = 0;
   function MiniMap()
   {
      super();
   }
   function updateFlags()
   {
      this.updateDataMap();
      if(this._oMap.x == undefined || this._oMap.y == undefined)
      {
         this.addToQueue({object:this,method:this.updateFlags});
         return undefined;
      }
      this.clearFlag();
      if(this.api.datacenter.Basics.banner_targetCoords)
      {
         this.addFlag(this.api.datacenter.Basics.banner_targetCoords[0],this.api.datacenter.Basics.banner_targetCoords[1],255);
      }
      if(this.api.datacenter.Basics.aks_infos_highlightCoords.length)
      {
         var _loc2_ = this.api.datacenter.Basics.aks_infos_highlightCoords;
         for(var i in _loc2_)
         {
            if(_loc2_[i])
            {
               if(_loc2_[i].miniMapTagId == undefined)
               {
                  _loc2_[i].miniMapTagId = this._nRandomTag;
               }
               if(_loc2_[i].miniMapTagId != this._nRandomTag)
               {
                  delete _loc2_[i];
               }
               else
               {
                  switch(_loc2_[i].type)
                  {
                     case 1:
                        if(!_loc3_)
                        {
                           var _loc3_ = _loc2_[i];
                        }
                        else
                        {
                           var _loc4_ = Math.sqrt(Math.pow(_loc3_.x - this._oMap.x,2) + Math.pow(_loc3_.y - this._oMap.y,2));
                           var _loc5_ = Math.sqrt(Math.pow(_loc2_[i].x - this._oMap.x,2) + Math.pow(_loc2_[i].y - this._oMap.y,2));
                           if(_loc5_ < _loc4_)
                           {
                              _loc3_ = _loc2_[i];
                           }
                        }
                        break;
                     case 2:
                        var _loc6_ = _global.API.ui.getUIComponent("Party").getMemberById(_loc2_[i].playerID).name;
                        if(_loc6_ != undefined)
                        {
                           this.addFlag(_loc2_[i].x,_loc2_[i].y,dofus.Constants.FLAG_MAP_GROUP,_loc6_);
                           break;
                        }
                        delete _loc2_[i];
                        continue;
                     case 3:
                        this.addFlag(_loc2_[i].x,_loc2_[i].y,dofus.Constants.FLAG_MAP_SEEK,_loc2_[i].playerName);
                  }
               }
            }
         }
         if(_loc3_)
         {
            this.addFlag(_loc3_.x,_loc3_.y,dofus.Constants.FLAG_MAP_PHOENIX,this.api.lang.getText("BANNER_MAP_PHOENIX"));
         }
      }
   }
   function setScale(§\x1e\x1d\x1a§, §\x14\b§)
   {
      if(this._nScale == _loc2_)
      {
         return undefined;
      }
      this._nScale = _loc2_;
      this.showScaledBackground();
      switch(_loc2_)
      {
         case dofus["\r\x14"].gapi.controls.MiniMap.SCALE_SMALL:
            dofus["\r\x14"].gapi.controls.MiniMap.HIDE_FLAG_ZONE = [[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,0,0,0,1,1],[1,1,0,0,0,1,1],[1,1,0,0,0,1,1],[1,1,0,0,0,1,1],[1,1,0,0,0,1,1],[1,1,0,0,0,1,1],[1,1,0,0,0,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1]];
            break;
         case dofus["\r\x14"].gapi.controls.MiniMap.SCALE_NORMAL:
            dofus["\r\x14"].gapi.controls.MiniMap.HIDE_FLAG_ZONE = [[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,0,1,1,0,0,1],[1,0,0,0,0,0,1],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,1],[1,0,0,0,0,0,1],[1,1,0,0,0,1,1]];
            break;
         case dofus["\r\x14"].gapi.controls.MiniMap.SCALE_BIG:
            dofus["\r\x14"].gapi.controls.MiniMap.HIDE_FLAG_ZONE = [[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,0,0,0,0,0,1],[1,0,0,0,0,0,1],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[1,0,0,0,0,0,1],[1,0,0,0,0,0,1],[1,1,0,0,0,1,1]];
      }
      if(_loc3_)
      {
         this.updateFlagsDirections();
      }
   }
   function clearFlag()
   {
      for(var i in this._mcFlagsDirection)
      {
         this._mcFlagsDirection[i].removeMovieClip();
      }
      for(var i in this._mcFlagsContainer)
      {
         this._mcFlagsContainer[i].removeMovieClip();
      }
      this._aFlags = new Array();
   }
   function addFlag(nX, nY, §\x06\x1d§, §\x1e\x10\x1b§)
   {
      if(_global.isNaN(nX) || _global.isNaN(nY))
      {
         return undefined;
      }
      var _loc6_ = (_loc4_ & 0xFF0000) >> 16;
      var _loc7_ = (_loc4_ & 0xFF00) >> 8;
      var _loc8_ = _loc4_ & 0xFF;
      var _loc9_ = nX + "," + nY + (!_loc5_.length ? "" : " (" + _loc5_ + ")");
      var _loc10_ = new Array();
      var thisMiniMap = this;
      var _loc11_ = function()
      {
         thisMiniMap.dispatchEvent({type:"over"});
         this.gapi.showTooltip(this.tooltipText,this,-20,{bXLimit:false,bYLimit:false});
      };
      var _loc12_ = function()
      {
         this.gapi.hideTooltip();
      };
      var _loc13_ = 0;
      while(_loc13_ <= 2)
      {
         var _loc14_ = this._mcFlagsDirection.getNextHighestDepth();
         var _loc15_ = this._mcFlagsDirection.attachMovie(this.getDirectionLinkageByScale(_loc13_),"dir" + _loc14_,_loc14_);
         _loc15_.stop();
         var _loc16_ = new Color(_loc15_._mcCursor._mc._mcColor);
         var _loc17_ = new Object();
         _loc17_ = {ra:0,ga:0,ba:0,rb:_loc6_,gb:_loc7_,bb:_loc8_};
         _loc16_.setTransform(_loc17_);
         _loc15_.tooltipText = _loc9_;
         _loc15_.gapi = this.gapi;
         _loc15_.mcTarget = _loc15_._mcCursor;
         _loc15_.onRollOver = _loc11_;
         _loc15_.onRollOut = _loc12_;
         _loc15_._visible = false;
         _loc10_.push(_loc15_);
         _loc13_ = _loc13_ + 1;
      }
      if(!this._mcFlagsContainer)
      {
         this._mcFlagsContainer = this._mcFlags.createEmptyMovieClip("_mcFlagsContainer",1);
      }
      var _loc18_ = this._nMapScale / 100 * this._nTileWidth;
      var _loc19_ = this._nMapScale / 100 * this._nTileHeight;
      var _loc20_ = this._mcFlagsContainer.getNextHighestDepth();
      var _loc21_ = this._mcFlagsContainer.attachMovie("UI_MapExplorerFlag","flag" + _loc20_,_loc20_);
      _loc21_._x = _loc18_ * nX + _loc18_ / 2;
      _loc21_._y = _loc19_ * nY + _loc19_ / 2;
      _loc21_._xscale = this._nMapScale;
      _loc21_._yscale = this._nMapScale;
      var _loc22_ = new Color(_loc21_._mcColor);
      var _loc23_ = new Object();
      _loc23_ = {ra:0,ga:0,ba:0,rb:_loc6_,gb:_loc7_,bb:_loc8_};
      _loc22_.setTransform(_loc23_);
      this._aFlags.push({x:nX,y:nY,color:_loc4_,aDirections:_loc10_});
      _loc21_.tooltipText = _loc9_;
      _loc21_.gapi = this.gapi;
      _loc21_.mcTarget = _loc21_;
      _loc21_.onRollOver = _loc11_;
      _loc21_.onRollOut = _loc12_;
      this.updateMap();
   }
   function updateHints()
   {
      if(_global.isNaN(this.dungeonID))
      {
         var _loc2_ = this.api.lang.getHintsCategories();
         _loc2_[-1] = {n:this.api.lang.getText("OPTION_GRID"),c:"Yellow"};
         var _loc3_ = this.api.kernel.OptionsManager.getOption("MapFilters");
         this._mcHintsContainer = this._ldrHints.content;
         var _loc4_ = -1;
         while(_loc4_ < _loc2_.length)
         {
            if(_loc4_ != -1)
            {
               this.showHintsCategory(_loc4_,_loc3_[_loc4_] == 1);
            }
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   function get dungeonID()
   {
      return Number(this.api.lang.getMapText(this.api.datacenter.Map.id).d);
   }
   function get dungeonCurrentMap()
   {
      return this.dungeon.m[this.api.datacenter.Map.id];
   }
   function get dungeon()
   {
      return this.api.lang.getDungeonText(this.dungeonID);
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.MiniMap.CLASS_NAME);
   }
   function createChildren()
   {
      this.setScale(dofus["\r\x14"].gapi.controls.MiniMap.SCALE_NORMAL,false);
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.loadMap});
      this.addToQueue({object:this,method:this.updateFlags});
      this._nRandomTag = Math.random();
   }
   function addListeners()
   {
      this.api.gfx.addEventListener("mapLoaded",this);
      this._ldrBitmapMap.addEventListener("initialization",this);
   }
   function initMap()
   {
      this._mcBitmapContainer.removeMovieClip();
      this._mcBitmapContainer = this._ldrBitmapMap.content.createEmptyMovieClip("_mcBitmapContainer",1);
      this._mcBitmapContainer._visible = false;
      if(this.api.datacenter.Player.isAuthorized)
      {
         this._mcBitmapContainer.onMouseUp = this.onMouseUp;
         this._mcBitmapContainer.onRelease = function()
         {
         };
      }
      else
      {
         this._mcBitmapContainer.onRelease = this.click;
      }
      var thisMiniMap = this;
      this._mcBitmapContainer.onRollOut = function()
      {
         this.gapi.hideTooltip();
      };
      this._mcBitmapContainer.onRollOver = function()
      {
         thisMiniMap.dispatchEvent({type:"over"});
      };
      this._mcCursor._xscale = this._nMapScale;
      this._mcCursor._yscale = this._nMapScale;
      this._mcCursor.oMap = this._oMap;
      this._mcCursor.gapi = this.gapi;
      this._mcCursor.onRollOver = function()
      {
         thisMiniMap.dispatchEvent({type:"over"});
         this.gapi.showTooltip(this.oMap.x + "," + this.oMap.y,this,-20,{bXLimit:false,bYLimit:false});
      };
      this._mcCursor.onRollOut = function()
      {
         this.gapi.hideTooltip();
      };
      this.updateMap();
      this.updateHints();
   }
   function drawMap()
   {
      var _loc2_ = -10;
      while(_loc2_ < 10)
      {
         var _loc3_ = -10;
         while(_loc3_ < 10)
         {
            var _loc4_ = Math.floor(this._oMap.x / dofus["\r\x14"].gapi.controls.MiniMap.MAP_IMG_WIDTH);
            var _loc5_ = Math.floor(this._oMap.y / dofus["\r\x14"].gapi.controls.MiniMap.MAP_IMG_HEIGHT);
            if(_loc4_ < _loc2_ - 2 || (_loc4_ > _loc2_ + 2 || (_loc5_ < _loc3_ - 2 || _loc5_ > _loc3_ + 2)))
            {
               if(this._mcBitmapContainer[_loc2_ + "_" + _loc3_] != undefined)
               {
                  this._mcBitmapContainer[_loc2_ + "_" + _loc3_].removeMovieClip();
               }
            }
            else if(this._mcBitmapContainer[_loc2_ + "_" + _loc3_] == undefined)
            {
               var _loc6_ = this._mcBitmapContainer.attachMovie(_loc2_ + "_" + _loc3_,_loc2_ + "_" + _loc3_,this._mcBitmapContainer.getNextHighestDepth());
               _loc6_._xscale = this._nMapScale;
               _loc6_._yscale = this._nMapScale;
               _loc6_._x = _loc6_._width * _loc2_;
               _loc6_._y = _loc6_._height * _loc3_;
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function getDirectionLinkageByScale(§\x1e\x1d\x1a§)
   {
      switch(_loc2_)
      {
         case dofus["\r\x14"].gapi.controls.MiniMap.SCALE_SMALL:
            return "FlagDirectionSmall";
         case dofus["\r\x14"].gapi.controls.MiniMap.SCALE_NORMAL:
            return "FlagDirection";
         case dofus["\r\x14"].gapi.controls.MiniMap.SCALE_BIG:
            return "FlagDirectionBig";
         default:
            return undefined;
      }
   }
   function initDungeon()
   {
      this._mcBitmapContainer.removeMovieClip();
      this._mcBitmapContainer = this._ldrBitmapMap.createEmptyMovieClip("_mcDongeonContainer",1);
      this._mcCursor._xscale = this._nMapScale;
      this._mcCursor._yscale = this._nMapScale;
      var _loc2_ = this.dungeon.m;
      var _loc3_ = this.dungeonCurrentMap;
      var _loc4_ = 0;
      for(var a in _loc2_)
      {
         var _loc5_ = _loc2_[a];
         if(_loc3_.z == _loc5_.z)
         {
            var _loc6_ = this._mcBitmapContainer.attachMovie("UI_MapExplorerRectangle","dungeonMap" + _loc4_,_loc4_++);
            _loc6_._xscale = this._nMapScale;
            _loc6_._yscale = this._nMapScale;
            _loc6_._x = _loc6_._width * _loc5_.x + _loc6_._width / 2 + 1;
            _loc6_._y = _loc6_._height * _loc5_.y + _loc6_._height / 2 + 1;
            if(_loc5_.n != undefined)
            {
               _loc6_.label = _loc5_.n + " (" + _loc5_.x + "," + _loc5_.y + ")";
               _loc6_.gapi = this.gapi;
               var thisMiniMap = this;
               _loc6_.onRollOver = function()
               {
                  thisMiniMap.dispatchEvent({type:"over"});
                  this.gapi.showTooltip(this.label,this,-20,{bXLimit:false,bYLimit:false});
               };
               _loc6_.onRollOut = function()
               {
                  this.gapi.hideTooltip();
               };
            }
         }
      }
   }
   function loadMap(§\x19\x12§)
   {
      if(this._oMap.superarea == undefined)
      {
         this.addToQueue({object:this,method:this.loadMap,params:[_loc2_]});
         return false;
      }
      if(_global.isNaN(this.dungeonID))
      {
         if(this._oMap.superarea !== this._nCurrentArea || _loc2_)
         {
            this._nCurrentArea = this._oMap.superarea;
            this._ldrBitmapMap.contentPath = dofus.Constants.LOCAL_MAPS_PATH + this._nCurrentArea + ".swf";
            return true;
         }
         return false;
      }
      this.initDungeon();
      this._nCurrentArea = -1;
   }
   function showHintsCategory(categoryID, §\x15\x0e§)
   {
      var _loc4_ = this.api.kernel.OptionsManager.getOption("MapFilters");
      _loc4_[categoryID] = _loc3_;
      this.api.kernel.OptionsManager.setOption("MapFilters",_loc4_);
      var _loc5_ = "hints" + categoryID;
      if(!this._mcHintsContainer[_loc5_])
      {
         this._mcHintsContainer.createEmptyMovieClip(_loc5_,categoryID);
      }
      if(_loc3_)
      {
         var _loc6_ = this.api.lang.getHintsByCategory(categoryID);
         var _loc7_ = this._nMapScale / 100 * this._nTileWidth;
         var _loc8_ = this._nMapScale / 100 * this._nTileHeight;
         var _loc9_ = 0;
         for(; _loc9_ < _loc6_.length; _loc9_ = _loc9_ + 1)
         {
            var _loc10_ = new dofus.datacenter["\r\x05"](_loc6_[_loc9_]);
            if(_loc10_.superAreaID === this._oMap.superarea)
            {
               var _loc11_ = Math.sqrt(Math.pow(_loc10_.x - this._oMap.x,2) + Math.pow(_loc10_.y - this._oMap.y,2));
               if(_loc11_ > 6)
               {
                  this._mcHintsContainer[_loc5_]["hint" + _loc9_].removeMovieClip();
                  continue;
               }
               if(this._mcHintsContainer[_loc5_]["hint" + _loc9_] != undefined)
               {
                  continue;
               }
               var thisMiniMap = this;
               var _loc12_ = this._mcHintsContainer[_loc5_].attachMovie(_loc10_.gfx,"hint" + _loc9_,_loc9_,{_xscale:this._nMapScale,_yscale:this._nMapScale});
               _loc12_._x = _loc7_ * _loc10_.x + _loc7_ / 2;
               _loc12_._y = _loc8_ * _loc10_.y + _loc8_ / 2;
               _loc12_.oHint = _loc10_;
               _loc12_.gapi = this.gapi;
               _loc12_.onRollOver = function()
               {
                  thisMiniMap.dispatchEvent({type:"over"});
                  this.gapi.showTooltip(this.oHint.x + "," + this.oHint.y + " (" + this.oHint.name + ")",this,-20,{bXLimit:false,bYLimit:false});
               };
               _loc12_.onRollOut = function()
               {
                  this.gapi.hideTooltip();
               };
            }
            else
            {
               this._mcHintsContainer[_loc5_]["hint" + _loc9_].removeMovieClip();
            }
         }
      }
      else
      {
         this._ldrHints.content[_loc5_].removeMovieClip();
      }
   }
   function getConquestAreaList()
   {
      var _loc2_ = this.api.datacenter.Conquest.worldDatas;
      var _loc3_ = new Array();
      var _loc4_ = new String();
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.areas.length)
      {
         if(_loc2_.areas[_loc5_].alignment == 1)
         {
            var _loc7_ = this.api.lang.getText("BONTARIAN_PRISM");
            var _loc6_ = 420;
         }
         else
         {
            _loc7_ = this.api.lang.getText("BRAKMARIAN_PRISM");
            _loc6_ = 421;
         }
         _loc3_.push({g:_loc6_,m:_loc2_.areas[_loc5_].prism,n:_loc7_,superAreaID:this.api.lang.getMapAreaText(_loc2_.areas[_loc5_].id).a});
         _loc5_ = _loc5_ + 1;
      }
      return _loc3_;
   }
   function updateDataMap()
   {
      if(_global.isNaN(this.dungeonID))
      {
         this._oMap = this.api.datacenter.Map;
         this._mcHintsContainer._visible = true;
         this._mcFlagsContainer._visible = true;
      }
      else
      {
         this._oMap = this.dungeonCurrentMap;
         this._mcHintsContainer._visible = false;
         this._mcFlagsContainer._visible = false;
      }
      this._mcCursor.oMap = this._oMap;
   }
   function updateMap()
   {
      this.updateDataMap();
      this.updateHints();
      var _loc2_ = this._nMapScale / 100 * this._nTileWidth;
      var _loc3_ = this._nMapScale / 100 * this._nTileHeight;
      this._mcBitmapContainer._x = (- _loc2_) * this._oMap.x - _loc2_ / 2;
      this._mcBitmapContainer._y = (- _loc3_) * this._oMap.y - _loc3_ / 2;
      this._mcHintsContainer._x = this._mcBitmapContainer._x;
      this._mcHintsContainer._y = this._mcBitmapContainer._y;
      this._mcFlagsContainer._x = this._mcBitmapContainer._x;
      this._mcFlagsContainer._y = this._mcBitmapContainer._y;
      this.drawMap();
      this.updateFlagsDirections();
      this._mcBitmapContainer._visible = true;
   }
   function updateFlagsDirections()
   {
      for(var i in this._aFlags)
      {
         var _loc2_ = this._aFlags[i].x - this._oMap.x;
         var _loc3_ = this._aFlags[i].y - this._oMap.y;
         if(!(_global.isNaN(_loc3_) || _global.isNaN(_loc2_)))
         {
            var _loc4_ = this._aFlags[i].aDirections;
            if(dofus["\r\x14"].gapi.controls.MiniMap.HIDE_FLAG_ZONE[_loc3_ + 6][_loc2_ + 3] == undefined || dofus["\r\x14"].gapi.controls.MiniMap.HIDE_FLAG_ZONE[_loc3_ + 6][_loc2_ + 3] == 1)
            {
               var _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  var _loc6_ = _loc4_[_loc5_];
                  if(_loc5_ != this._nScale)
                  {
                     _loc6_._visible = false;
                  }
                  else
                  {
                     _loc6_._visible = true;
                     var _loc7_ = Math.floor(Math.atan2(_loc3_,_loc2_) / Math.PI * 180);
                     if(_loc7_ < 0)
                     {
                        _loc7_ += 360;
                     }
                     if(_loc7_ > 360)
                     {
                        _loc7_ -= 360;
                     }
                     _loc6_.gotoAndStop(_loc7_ + 1);
                     _loc6_._mcCursor.gotoAndStop(_loc7_ + 1);
                  }
                  _loc5_ = _loc5_ + 1;
               }
            }
            else
            {
               var _loc8_ = 0;
               while(_loc8_ < _loc4_.length)
               {
                  var _loc9_ = _loc4_[_loc8_];
                  _loc9_._visible = false;
                  _loc8_ = _loc8_ + 1;
               }
            }
         }
      }
   }
   function onClickTimer(§\x18\x12§)
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"minimap");
      this._bTimerEnable = false;
      if(_loc2_)
      {
         this.click();
      }
   }
   function getCoordinatesFromReal(§\x1e\x1e\x0f§, §\x1e\x1e\x0e§)
   {
      var _loc4_ = this._nMapScale / 100 * this._nTileWidth;
      var _loc5_ = this._nMapScale / 100 * this._nTileHeight;
      var _loc6_ = Math.floor(_loc2_ / _loc4_);
      var _loc7_ = Math.floor(_loc3_ / _loc5_);
      return {x:_loc6_,y:_loc7_};
   }
   function mapLoaded(§\x1e\x19\x0e§)
   {
      this.updateDataMap();
      if(!this.loadMap())
      {
         this.updateMap();
      }
   }
   function initialization(§\x1e\x19\x0e§)
   {
      this.initMap();
   }
   function showScaledBackground()
   {
      var _loc2_ = [this._mcBgSmall,this._mcBg,this._mcBgBig];
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc4_ = _loc2_[_loc3_];
         if(this._nScale == _loc3_)
         {
            _loc4_._visible = true;
            _loc4_.onRelease = this.click;
         }
         else
         {
            _loc4_._visible = false;
            delete _loc4_.onRelease;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function click()
   {
      if(getTimer() - ank.gapi.controls.PopupMenu.LAST_POPUP_VALIDATION < ank.gapi.controls.PopupMenu.LAST_POPUP_VALIDATION_WAIT_DELAY)
      {
         return undefined;
      }
      if(getTimer() - this._nLastDoubleClick < 750)
      {
         return undefined;
      }
      var _loc2_ = new Object();
      _loc2_.target = _global.API.ui.getUIComponent("Banner").illustration;
      _global.API.ui.getUIComponent("Banner").click(_loc2_);
   }
   function doubleClick(§\x1e\x19\x0e§)
   {
      this._nLastDoubleClick = getTimer();
      if(!this.api.datacenter.Game.isFight && _global.isNaN(this.dungeonID))
      {
         var _loc3_ = _loc2_.coordinates.x;
         var _loc4_ = _loc2_.coordinates.y;
         if(_loc3_ != undefined && _loc4_ != undefined)
         {
            this.api.network.Basics.autorisedMoveCommand(_loc3_,_loc4_);
         }
      }
   }
   function getMcBg()
   {
      switch(this._nScale)
      {
         case dofus["\r\x14"].gapi.controls.MiniMap.SCALE_BIG:
            return this._mcBgBig;
         case dofus["\r\x14"].gapi.controls.MiniMap.SCALE_NORMAL:
            return this._mcBg;
         case dofus["\r\x14"].gapi.controls.MiniMap.SCALE_SMALL:
            return this._mcBgSmall;
         default:
            return undefined;
      }
   }
   function isHittingBackground()
   {
      return this.getMcBg().hitTest(_root._xmouse,_root._ymouse,true);
   }
   function onMouseUp()
   {
      if(!this.isHittingBackground())
      {
         return undefined;
      }
      if(this._bTimerEnable != true)
      {
         this._bTimerEnable = true;
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"minimap",this,this.onClickTimer,ank.gapi["\r\x19"].DBLCLICK_DELAY,[true]);
      }
      else
      {
         this.onClickTimer(false);
         var _loc2_ = this._mcBitmapContainer._xmouse;
         var _loc3_ = this._mcBitmapContainer._ymouse;
         var _loc4_ = this.getCoordinatesFromReal(_loc2_,_loc3_);
         this.doubleClick({coordinates:_loc4_});
      }
   }
}
