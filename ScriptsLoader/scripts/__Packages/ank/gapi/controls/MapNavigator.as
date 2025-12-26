class ank.gapi.controls.MapNavigator extends ank.gapi.core.§\x1e\n\r§
{
   var _sURL;
   var _ldrMap;
   var _mcXtra;
   var _nMapWidth;
   var _nMapHeight;
   var _nLastSubAreaID;
   var mn;
   var _mcMap;
   var _mcMask;
   var _mcGrid;
   var _btnNW;
   var _btnN;
   var _btnNE;
   var _btnW;
   var _btnE;
   var _btnSW;
   var _btnS;
   var _btnSE;
   var _btnLocateClick;
   var __width;
   var __height;
   var _mcBorder;
   var _mcMapBorder;
   var _mcMapBackground;
   var dispatchEvent;
   var _oLastCoordsOver;
   var _nXRefPress;
   var _nYRefPress;
   var _bTimerEnable;
   var _sLastMapEvent;
   static var CLASS_NAME = "MapNavigator";
   var _nButtonMargin = 5;
   var _bShowGrid = true;
   var _nZoom = 50;
   var _nWPage = 10;
   var _nHPage = 10;
   var _sInteractionMode = "move";
   var _nXCurrent = 0;
   var _nYCurrent = 0;
   function MapNavigator()
   {
      super();
   }
   function set buttonMargin(§\x07\x1c§)
   {
      this._nButtonMargin = Number(_loc2_);
   }
   function get buttonMargin()
   {
      return this._nButtonMargin;
   }
   function set showGrid(§\x15\x0b§)
   {
      this._bShowGrid = _loc2_;
      if(this.initialized)
      {
         this.drawGrid();
      }
   }
   function get showGrid()
   {
      return this._bShowGrid;
   }
   function set contentPath(sURL)
   {
      this._sURL = sURL;
      if(this.initialized)
      {
         this._ldrMap.contentPath = this._sURL;
      }
   }
   function get contentPath()
   {
      return this._sURL;
   }
   function set wPage(§\x1e\x1a\x1c§)
   {
      this._nWPage = _loc2_;
   }
   function get wPage()
   {
      return this._nWPage;
   }
   function set hPage(§\x1e\x1a\x14§)
   {
      this._nHPage = _loc2_;
   }
   function get hPage()
   {
      return this._nHPage;
   }
   function set zoom(§\x1e\x1a\x11§)
   {
      if(_global.isNaN(_loc2_))
      {
         return;
      }
      if(_loc2_ > 100)
      {
         _loc2_ = 100;
      }
      if(_loc2_ < 10)
      {
         _loc2_ = 10;
      }
      this._nZoom = _loc2_;
      if(this.initialized)
      {
         this.setZoom();
      }
   }
   function get zoom()
   {
      return this._nZoom;
   }
   function set interactionMode(§\x1e\x11\x07§)
   {
      this._sInteractionMode = _loc2_;
      if(this.initialized)
      {
         this.applyInteractionMode();
      }
   }
   function get interactionMode()
   {
      return this._sInteractionMode;
   }
   function get virtualWPage()
   {
      return this._nWPage * this._nZoom / 100;
   }
   function get virtualHPage()
   {
      return this._nHPage * this._nZoom / 100;
   }
   function get currentX()
   {
      return this._nXCurrent;
   }
   function get currentY()
   {
      return this._nYCurrent;
   }
   function get loaderMap()
   {
      return this._ldrMap;
   }
   function setMapPosition(nX, nY)
   {
      this._mcXtra._xscale = this._mcXtra._yscale = this._nZoom;
      if(nX == undefined || nY == undefined)
      {
         return undefined;
      }
      this.removeAreaClip();
      this._nXCurrent = nX;
      this._nYCurrent = nY;
      var _loc4_ = this._ldrMap.content;
      _loc4_._x = this._mcXtra._x = (- this.virtualWPage) * (0.5 + nX);
      _loc4_._y = this._mcXtra._y = (- this.virtualHPage) * (0.5 + nY);
      var _loc5_ = 15;
      var _loc6_ = 15;
      var _loc7_ = Math.floor(nX - this._nMapWidth / (2 * this.virtualWPage) + 0.5);
      var _loc8_ = Math.floor(nY - this._nMapHeight / (2 * this.virtualHPage) + 0.5);
      var _loc9_ = Math.floor(_loc7_ / _loc5_);
      var _loc10_ = Math.floor(_loc8_ / _loc6_);
      var _loc11_ = _loc9_ + Math.ceil(Math.floor(this._nMapWidth / this.virtualWPage) / _loc5_);
      var _loc12_ = _loc10_ + Math.ceil(Math.floor(this._nMapHeight / this.virtualHPage) / _loc6_);
      for(var k in this._ldrMap.content)
      {
         this._ldrMap.content[k].removeMovieClip();
      }
      var _loc13_ = _loc9_;
      while(_loc13_ <= _loc11_)
      {
         var _loc14_ = _loc10_;
         while(_loc14_ <= _loc12_)
         {
            this._ldrMap.content.attachMovie(_loc13_ + "_" + _loc14_,_loc13_ + "_" + _loc14_,this._ldrMap.content.getNextHighestDepth(),{_yscale:this._nZoom,_xscale:this._nZoom,_x:_loc13_ * _loc5_ * this.virtualWPage,_y:_loc14_ * _loc6_ * this.virtualHPage});
            _loc14_ = _loc14_ + 1;
         }
         _loc13_ = _loc13_ + 1;
      }
   }
   function addSubareaClip(§\x1e\x1c\x14§, §\x06\x1d§, §\b\x19§)
   {
      if(_loc2_ == this._nLastSubAreaID)
      {
         return undefined;
      }
      this.removeAreaClip();
      var _loc5_ = this._ldrMap.content.attachMovie("subarea_" + _loc2_,"_mcSubarea",this._ldrMap.content.getNextHighestDepth());
      var _loc6_ = new Color(_loc5_);
      _loc6_.setRGB(_loc3_);
      _loc5_._alpha = _loc4_;
      _loc5_._xscale = _loc5_._yscale = this._nZoom;
      this._nLastSubAreaID = _loc2_;
   }
   function removeAreaClip()
   {
      this._ldrMap.content._mcSubarea.removeMovieClip();
      delete this._nLastSubAreaID;
   }
   function addXtraClip(§\x1e\x10\x0e§, §\x1e\x10\x14§, nX, nY, §\x06\x1d§, §\b\x19§, §\x1b\x07§, §\x1a\x1a§)
   {
      var _loc10_ = this._mcXtra[_loc3_]["clipByCoord_" + nX + "_" + nY];
      if(_loc9_ == true && _loc10_ != undefined)
      {
         return _loc10_;
      }
      var _loc11_ = this._nWPage * (0.5 + nX);
      var _loc12_ = this._nHPage * (0.5 + nY);
      var _loc13_ = this._mcXtra.getNextHighestDepth();
      var _loc14_ = this._mcXtra[_loc3_];
      if(_loc14_ == undefined)
      {
         _loc14_ = this._mcXtra.createEmptyMovieClip(_loc3_,_loc13_);
      }
      _loc13_ = _loc14_.getNextHighestDepth();
      var _loc15_ = _loc14_.attachMovie(_loc2_,"clip" + _loc13_,_loc13_,{_x:_loc11_,_y:_loc12_});
      this._mcXtra[_loc3_]["clipByCoord_" + nX + "_" + nY] = _loc15_;
      if(_loc6_ != undefined)
      {
         var _loc16_ = new Color(_loc15_._mcColor);
         _loc16_.setRGB(_loc6_);
      }
      if(_loc8_)
      {
         _loc15_.mn = this;
         _loc15_.onRelease = function()
         {
            this.mn.click({target:this.mn._btnLocateClick});
         };
      }
      _loc15_._alpha = _loc7_ != undefined ? _loc7_ : 100;
      return _loc15_;
   }
   function loadXtraLayer(§\x1e\x12\x0b§, §\x1e\x10\x14§)
   {
      var _loc4_ = this.createXtraLayer(_loc3_);
      var _loc5_ = new MovieClipLoader();
      _loc5_.addListener(this);
      _loc5_.loadClip(_loc2_,_loc4_);
   }
   function createXtraLayer(§\x1e\x10\x14§)
   {
      var _loc3_ = this._mcXtra.getNextHighestDepth();
      var _loc4_ = this._mcXtra[_loc2_];
      if(_loc4_ == undefined)
      {
         _loc4_ = this._mcXtra.createEmptyMovieClip(_loc2_,_loc3_);
      }
      return _loc4_;
   }
   function getXtraLayer(§\x1e\x10\x14§)
   {
      return this._mcXtra[_loc2_];
   }
   function clear(§\x1e\x10\x14§)
   {
      if(_loc2_ != undefined)
      {
         this._mcXtra[_loc2_].removeMovieClip();
      }
      else
      {
         for(var k in this._mcXtra)
         {
            this._mcXtra[k].removeMovieClip();
         }
      }
   }
   function init()
   {
      super.init(false,ank.gapi.controls.MapNavigator.CLASS_NAME);
   }
   function createChildren()
   {
      var _loc2_ = {styleName:"none",backgroundDown:"ButtonSimpleRectangleUpDown",backgroundUp:"ButtonSimpleRectangleUpDown"};
      this.attachMovie("Rectangle","_mcBorder",0);
      this.attachMovie("Button","_btnNW",10,_loc2_);
      this.attachMovie("Button","_btnN",20,_loc2_);
      this.attachMovie("Button","_btnNE",30,_loc2_);
      this.attachMovie("Button","_btnW",40,_loc2_);
      this.attachMovie("Button","_btnE",50,_loc2_);
      this.attachMovie("Button","_btnSW",60,_loc2_);
      this.attachMovie("Button","_btnS",70,_loc2_);
      this.attachMovie("Button","_btnSE",80,_loc2_);
      this.attachMovie("Button","_btnLocateClick",90,_loc2_);
      this.attachMovie("Rectangle","_mcMapBorder",100);
      this.attachMovie("Rectangle","_mcMapBackground",110);
      this.createEmptyMovieClip("_mcMap",120);
      this._ldrMap = ank.gapi.controls.Loader(this._mcMap.attachMovie("Loader","_ldrMap",10,{centerContent:false,scaleContent:false,autoLoad:true,contentPath:this._sURL}));
      this.attachMovie("Rectangle","_mcMask",130);
      this._mcMap.setMask(this._mcMask);
      this._mcMap.createEmptyMovieClip("_mcGrid",140);
      this._mcGrid = this._mcMap._mcGrid;
      this._mcMap.createEmptyMovieClip("_mcXtra",200);
      this._mcXtra = this._mcMap._mcXtra;
      this._ldrMap.addEventListener("initialization",this);
      this._btnNW.addEventListener("click",this);
      this._btnN.addEventListener("click",this);
      this._btnNE.addEventListener("click",this);
      this._btnW.addEventListener("click",this);
      this._btnE.addEventListener("click",this);
      this._btnSW.addEventListener("click",this);
      this._btnS.addEventListener("click",this);
      this._btnSE.addEventListener("click",this);
      this._btnLocateClick.addEventListener("click",this);
      this._btnNW.addEventListener("over",this);
      this._btnN.addEventListener("over",this);
      this._btnNE.addEventListener("over",this);
      this._btnW.addEventListener("over",this);
      this._btnE.addEventListener("over",this);
      this._btnSW.addEventListener("over",this);
      this._btnS.addEventListener("over",this);
      this._btnSE.addEventListener("over",this);
      this._btnNW.addEventListener("out",this);
      this._btnN.addEventListener("out",this);
      this._btnNE.addEventListener("out",this);
      this._btnW.addEventListener("out",this);
      this._btnE.addEventListener("out",this);
      this._btnSW.addEventListener("out",this);
      this._btnS.addEventListener("out",this);
      this._btnSE.addEventListener("out",this);
      this.applyInteractionMode();
   }
   function arrange()
   {
      var _loc2_ = this.__width - 2;
      var _loc3_ = this.__height - 2;
      var _loc4_ = _loc2_ / 3;
      var _loc5_ = _loc3_ / 3;
      var _loc6_ = _loc2_ - this._nButtonMargin * 2 - 2;
      var _loc7_ = _loc3_ - this._nButtonMargin * 2 - 2;
      this._mcBorder._width = this.__width;
      this._mcBorder._height = this.__height;
      this._btnNW.setSize(_loc4_,_loc5_);
      this._btnN.setSize(_loc4_ - 2,_loc5_);
      this._btnNE.setSize(_loc4_,_loc5_);
      this._btnW.setSize(_loc4_,_loc5_ - 2);
      this._btnE.setSize(_loc4_,_loc5_ - 2);
      this._btnSW.setSize(_loc4_,_loc5_);
      this._btnS.setSize(_loc4_ - 2,_loc5_);
      this._btnSE.setSize(_loc4_,_loc5_);
      this._btnNW._x = this._btnW._x = this._btnSW._x = 1;
      this._btnN._x = this._btnS._x = _loc4_ + 2;
      this._btnNE._x = this._btnE._x = this._btnSE._x = _loc4_ * 2 + 1;
      this._btnNW._y = this._btnN._y = this._btnNE._y = 1;
      this._btnW._y = this._btnE._y = _loc5_ + 2;
      this._btnSW._y = this._btnS._y = this._btnSE._y = _loc5_ * 2 + 1;
      this._mcMapBorder._width = _loc6_ + 2;
      this._mcMapBorder._height = _loc7_ + 2;
      this._mcMapBorder._x = this._mcMapBorder._y = this._nButtonMargin + 1;
      this._mcMask._width = this._mcMapBackground._width = _loc6_;
      this._mcMask._height = this._mcMapBackground._height = _loc7_;
      this._btnLocateClick._x = this._btnLocateClick._y = this._mcMask._x = this._mcMask._y = this._mcMapBackground._x = this._mcMapBackground._y = this._nButtonMargin + 2;
      this._mcMap._x = this.__width / 2;
      this._mcMap._y = this.__height / 2;
      this._mcGrid._x = (- this.__width) / 2 + this._nButtonMargin + 2;
      this._mcGrid._y = (- this.__height) / 2 + this._nButtonMargin + 2;
      this._btnLocateClick.setSize(_loc6_,_loc7_);
      this._nMapWidth = this.__width - this._nButtonMargin * 2 - 4;
      this._nMapHeight = this.__height - this._nButtonMargin * 2 - 4;
      this.setZoom();
      this.setMapPosition(0,0);
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      this._btnNW.styleName = this._btnN.styleName = this._btnNE.styleName = this._btnW.styleName = this._btnE.styleName = this._btnSW.styleName = this._btnS.styleName = this._btnSE.styleName = _loc2_.buttonstyle;
      this.setMovieClipColor(this._mcBorder,_loc2_.bordercolor);
      this.setMovieClipColor(this._mcMapBorder,_loc2_.bordercolor);
      this.setMovieClipColor(this._mcGrid,_loc2_.gridcolor);
      this.setMovieClipColor(this._mcMapBackground,_loc2_.bgcolor);
   }
   function drawGrid(§\x13\x10§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = true;
      }
      this._mcGrid.clear();
      if(this._bShowGrid && _loc2_)
      {
         var _loc3_ = (this._nMapWidth - this.virtualWPage) / 2;
         while(_loc3_ > 0)
         {
            this.drawRoundRect(this._mcGrid,_loc3_,0,1,this._nMapHeight,0,0);
            _loc3_ -= this.virtualWPage;
         }
         _loc3_ = (this._nMapWidth + this.virtualWPage) / 2;
         while(_loc3_ < this._nMapWidth)
         {
            this.drawRoundRect(this._mcGrid,_loc3_,0,1,this._nMapHeight,0,0);
            _loc3_ += this.virtualWPage;
         }
         var _loc4_ = (this._nMapHeight - this.virtualHPage) / 2;
         while(_loc4_ > 0)
         {
            this.drawRoundRect(this._mcGrid,0,_loc4_,this._nMapWidth,1,0,0);
            _loc4_ -= this.virtualHPage;
         }
         _loc4_ = (this._nMapHeight + this.virtualHPage) / 2;
         while(_loc4_ < this._nMapHeight)
         {
            this.drawRoundRect(this._mcGrid,0,_loc4_,this._nMapWidth,1,0,0);
            _loc4_ += this.virtualHPage;
         }
      }
   }
   function setZoom()
   {
      this.setMapPosition(this._nXCurrent,this._nYCurrent);
      this.drawGrid(true);
      this.dispatchEvent({type:"zoom"});
   }
   function moveMap(§\x1e\x1a\x17§, §\x1e\x1a\x13§)
   {
      this.setMapPosition(this._nXCurrent + _loc2_,this._nYCurrent + _loc3_);
   }
   function applyInteractionMode()
   {
      delete this._oLastCoordsOver;
      switch(this._sInteractionMode)
      {
         case "move":
            this._btnNW.enabled = true;
            this._btnN.enabled = true;
            this._btnNE.enabled = true;
            this._btnW.enabled = true;
            this._btnE.enabled = true;
            this._btnSW.enabled = true;
            this._btnS.enabled = true;
            this._btnSE.enabled = true;
            break;
         case "zoom+":
         case "zoom-":
         case "select":
            this._btnNW.enabled = false;
            this._btnN.enabled = false;
            this._btnNE.enabled = false;
            this._btnW.enabled = false;
            this._btnE.enabled = false;
            this._btnSW.enabled = false;
            this._btnS.enabled = false;
            this._btnSE.enabled = false;
      }
   }
   function getRealFromCoordinates(nX, nY)
   {
      var _loc4_ = this.virtualWPage * (nX - this._nXCurrent - 0.5);
      var _loc5_ = this.virtualHPage * (nY - this._nYCurrent - 0.5);
      return {x:_loc4_,y:_loc5_};
   }
   function getCoordinatesFromReal(§\x1e\x1e\x0f§, §\x1e\x1e\x0e§)
   {
      var _loc4_ = Math.floor((_loc2_ + this.virtualWPage * 0.5) / this.virtualWPage) + this._nXCurrent;
      var _loc5_ = Math.floor((_loc3_ + this.virtualHPage * 0.5) / this.virtualHPage) + this._nYCurrent;
      return {x:_loc4_,y:_loc5_};
   }
   function getCoordinatesFromRealWithRef(§\x1e\x1e\x0f§, §\x1e\x1e\x0e§)
   {
      var _loc4_ = Math.floor((_loc2_ + this.virtualWPage * 0.5) / this.virtualWPage) - this._nXRefPress;
      var _loc5_ = Math.floor((_loc3_ + this.virtualHPage * 0.5) / this.virtualHPage) - this._nYRefPress;
      return {x:_loc4_,y:_loc5_};
   }
   function onMouseDown()
   {
      if(this._sInteractionMode == "move")
      {
         if(this._mcMapBackground.hitTest(_root._xmouse,_root._ymouse,true))
         {
            delete this._oLastCoordsOver;
            var _loc2_ = this.getCoordinatesFromReal(this._ldrMap._xmouse,this._ldrMap._ymouse);
            this._nXRefPress = _loc2_.x;
            this._nYRefPress = _loc2_.y;
            this.gapi.hideTooltip();
            this.gapi.setCursor({iconFile:"MapNavigatorMoveCursor"});
         }
      }
   }
   function onMouseUp()
   {
      delete this._nXRefPress;
      delete this._nYRefPress;
      this.gapi.removeCursor();
      if(this._mcMapBackground.hitTest(_root._xmouse,_root._ymouse,true))
      {
         if(this._bTimerEnable != true)
         {
            this._bTimerEnable = true;
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"mapnavigator",this,this.onClickTimer,ank.gapi["\r\x19"].DBLCLICK_DELAY);
         }
         else
         {
            this.onClickTimer();
            var _loc2_ = this._ldrMap._xmouse;
            var _loc3_ = this._ldrMap._ymouse;
            var _loc4_ = this.getCoordinatesFromReal(_loc2_,_loc3_);
            this.dispatchEvent({type:"doubleClick",coordinates:_loc4_});
         }
      }
   }
   function onMouseMove()
   {
      if(this._mcMapBackground.hitTest(_root._xmouse,_root._ymouse,true))
      {
         var _loc2_ = this._ldrMap._xmouse;
         var _loc3_ = this._ldrMap._ymouse;
         if(this._nXRefPress == undefined)
         {
            var _loc4_ = this.getCoordinatesFromReal(_loc2_,_loc3_);
            if(this._oLastCoordsOver.x != _loc4_.x || this._oLastCoordsOver.y != _loc4_.y)
            {
               var _loc5_ = this.getRealFromCoordinates(_loc4_.x,_loc4_.y);
               this._ldrMap.localToGlobal(_loc5_);
               this.gapi.showTooltip(_loc4_.x + ", " + _loc4_.y,_loc5_.x,_loc5_.y - 20);
               this.dispatchEvent({type:"overMap",coordinates:_loc4_});
               this._sLastMapEvent = "overMap";
               this._oLastCoordsOver = _loc4_;
            }
         }
         else
         {
            var _loc6_ = this.getCoordinatesFromRealWithRef(_loc2_,_loc3_);
            this.setMapPosition(- _loc6_.x,- _loc6_.y);
         }
      }
      else if(this._sLastMapEvent != "outMap")
      {
         this.dispatchEvent({type:"outMap"});
         this._sLastMapEvent = "outMap";
         this.gapi.hideTooltip();
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      loop0:
      switch(_loc2_.target._name)
      {
         case "_btnNW":
            this.moveMap(-1,-1);
            break;
         case "_btnN":
            this.moveMap(0,-1);
            break;
         case "_btnNE":
            this.moveMap(1,-1);
            break;
         case "_btnW":
            this.moveMap(-1,0);
            break;
         case "_btnE":
            this.moveMap(1,0);
            break;
         case "_btnSW":
            this.moveMap(-1,1);
            break;
         case "_btnS":
            this.moveMap(0,1);
            break;
         case "_btnSE":
            this.moveMap(1,1);
            break;
         case "_btnLocateClick":
            var _loc3_ = this._ldrMap._xmouse;
            var _loc4_ = this._ldrMap._ymouse;
            var _loc5_ = this.getCoordinatesFromReal(_loc3_,_loc4_);
            switch(this._sInteractionMode)
            {
               case "zoom+":
               case "zoom-":
                  var _loc6_ = this._nZoom + (this._sInteractionMode == "zoom+" ? 5 : -5);
                  if(_loc6_ == 0)
                  {
                     _loc6_ = 5;
                  }
                  this._nZoom = _loc6_;
                  this.setZoom();
                  break loop0;
               case "select":
                  this.dispatchEvent({type:"select",coordinates:_loc5_});
            }
      }
      this.gapi.hideTooltip();
   }
   function over(§\x1e\x19\x0e§)
   {
      this.dispatchEvent(_loc2_);
   }
   function out(§\x1e\x19\x0e§)
   {
      this.dispatchEvent(_loc2_);
   }
   function initialization(§\x1e\x19\x0e§)
   {
      this.setZoom();
   }
   function onLoadInit(§\x0b\t§)
   {
      this.dispatchEvent({type:"xtraLayerLoad",mc:_loc2_});
   }
   function onClickTimer()
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"mapnavigator");
      this._bTimerEnable = false;
   }
}
