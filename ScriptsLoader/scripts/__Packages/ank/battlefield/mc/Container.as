class ank.battlefield.mc.Container extends MovieClip
{
   var _mcBattlefield;
   var _oDatacenter;
   var _sObjectsFile;
   var maxDepth;
   var minDepth;
   var ExternalContainer;
   var SpriteInfos;
   var Points;
   var Text;
   var OverHead;
   var LoadManager;
   var _mcMask;
   function Container(§\x1c\x1d§, §\x11\x10§, §\x1e\x19\t§)
   {
      super();
      if(_loc3_ != undefined)
      {
         this.initialize(_loc3_,_loc4_,_loc5_);
      }
   }
   function initialize(§\x1c\x1d§, §\x11\x10§, §\x1e\x19\t§)
   {
      if(_loc3_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("pas de _oDatacenter !");
      }
      this._mcBattlefield = _loc2_;
      this._oDatacenter = _loc3_;
      this._sObjectsFile = _loc4_;
      this.clear(true);
   }
   function clear(§\x19\x12§)
   {
      this.maxDepth = 0;
      this.minDepth = -1000;
      this.zoom(100);
      if(this.ExternalContainer == undefined || _loc2_)
      {
         this.createEmptyMovieClip("ExternalContainer",100);
         var _loc3_ = new MovieClipLoader();
         _loc3_.addListener(this._parent);
         if(_loc2_)
         {
            this.ExternalContainer.clear();
         }
         _loc3_.loadClip(this._sObjectsFile,this.ExternalContainer);
      }
      else
      {
         this.ExternalContainer.clear();
      }
      this.SpriteInfos.removeMovieClip();
      this.createEmptyMovieClip("SpriteInfos",200);
      this.Points.removeMovieClip();
      this.createEmptyMovieClip("Points",300);
      this.Text.removeMovieClip();
      this.createEmptyMovieClip("Text",400);
      this.OverHead.removeMovieClip();
      this.createEmptyMovieClip("OverHead",500);
      if(!this.LoadManager)
      {
         this.createEmptyMovieClip("LoadManager",600);
      }
   }
   function applyMask(§\x1a\x06§)
   {
      var _loc3_ = this._oDatacenter.Map.width - 1;
      var _loc4_ = this._oDatacenter.Map.height - 1;
      if(_loc2_ == undefined)
      {
         _loc2_ = true;
      }
      this.createEmptyMovieClip("_mcMask",10);
      if(_loc2_)
      {
         this._mcMask.beginFill(0);
         this._mcMask.moveTo(0,0);
         this._mcMask.lineTo(_loc3_ * ank.battlefield.Constants.CELL_WIDTH,0);
         this._mcMask.lineTo(_loc3_ * ank.battlefield.Constants.CELL_WIDTH,_loc4_ * ank.battlefield.Constants.CELL_HEIGHT);
         this._mcMask.lineTo(0,_loc4_ * ank.battlefield.Constants.CELL_HEIGHT);
         this._mcMask.lineTo(0,0);
         this._mcMask.endFill();
      }
      else
      {
         this._mcMask.beginFill(0);
         this._mcMask.moveTo(-1000,-1000);
         this._mcMask.lineTo(-1000,-999);
         this._mcMask.lineTo(-999,-999);
         this._mcMask.lineTo(-999,-1000);
         this._mcMask.lineTo(-1000,-1000);
         this._mcMask.endFill();
      }
      this.setMask(this._mcMask);
   }
   function adjusteMap(§\x1e\t\x1c§)
   {
      this.zoomMap();
      this.center();
   }
   function setColor(§\x1e\x17\x0e§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = new Object();
         _loc2_.ra = 100;
         _loc2_.rb = 0;
         _loc2_.ga = 100;
         _loc2_.gb = 0;
         _loc2_.ba = 100;
         _loc2_.bb = 0;
      }
      var _loc3_ = new Color(this);
      _loc3_.setTransform(_loc2_);
   }
   function zoom(§\x1e\t\x04§)
   {
      this._xscale = _loc2_;
      this._yscale = _loc2_;
   }
   function getZoom()
   {
      return this._xscale;
   }
   function setXY(§\x1e\t\x14§, §\x1e\t\x0b§)
   {
      this._x = _loc2_;
      this._y = _loc3_;
   }
   function center(§\x1e\t\x1c§)
   {
      var _loc3_ = this._xscale / 100;
      var _loc4_ = this._yscale / 100;
      var _loc5_ = (this._mcBattlefield.screenWidth - ank.battlefield.Constants.CELL_WIDTH * _loc3_ * (this._oDatacenter.Map.width - 1)) / 2;
      var _loc6_ = (this._mcBattlefield.screenHeight - ank.battlefield.Constants.CELL_HEIGHT * _loc4_ * (this._oDatacenter.Map.height - 1)) / 2;
      this.setXY(_loc5_,_loc6_);
   }
   function zoomMap(§\x1e\t\x1c§)
   {
      var _loc3_ = this.getZoomFactor();
      if(_loc3_ == 100)
      {
         return false;
      }
      this.zoom(_loc3_,false);
      return true;
   }
   function getZoomFactor(§\x1e\t\x1c§)
   {
      var _loc3_ = this._oDatacenter.Map.width;
      var _loc4_ = this._oDatacenter.Map.height;
      var _loc5_ = 0;
      if(_loc3_ <= ank.battlefield.Constants.DEFAULT_MAP_WIDTH)
      {
         return 100;
      }
      if(_loc4_ <= ank.battlefield.Constants.DEFAULT_MAP_HEIGHT)
      {
         return 100;
      }
      if(_loc4_ > _loc3_)
      {
         _loc5_ = this._mcBattlefield.screenWidth / (ank.battlefield.Constants.CELL_WIDTH * (_loc3_ - 1)) * 100;
      }
      else
      {
         _loc5_ = this._mcBattlefield.screenHeight / (ank.battlefield.Constants.CELL_HEIGHT * (_loc4_ - 1)) * 100;
      }
      return _loc5_;
   }
}
