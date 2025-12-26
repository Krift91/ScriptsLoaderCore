class ank.battlefield.mc.§\f\x11§ extends MovieClip
{
   var _battlefield;
   var _oCell;
   var _bInteractive;
   var _mclLoader;
   var _mcExternal;
   function §\f\x11§()
   {
      super();
   }
   function initialize(§\x1c\x1d§, §\x1e\x1a\x03§, §\x18\x17§)
   {
      this._battlefield = _loc2_;
      this._oCell = _loc3_;
      this._bInteractive = _loc4_ != undefined ? _loc4_ : true;
   }
   function select(§\x16\x18§)
   {
      var _loc3_ = new Color(this);
      var _loc4_ = new Object();
      if(_loc2_)
      {
         _loc4_ = {ra:60,rb:80,ga:60,gb:80,ba:60,bb:80};
      }
      else
      {
         _loc4_ = {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0};
      }
      _loc3_.setTransform(_loc4_);
   }
   function loadExternalClip(§\x1e\x12\x0b§, §\x1c\x04§)
   {
      _loc3_ = _loc3_ != undefined ? _loc3_ : true;
      this.createEmptyMovieClip("_mcExternal",10);
      this._mclLoader = new MovieClipLoader();
      if(_loc3_)
      {
         this._mclLoader.addListener(this);
      }
      this._mclLoader.loadClip(_loc2_,this._mcExternal);
   }
   function get cellData()
   {
      return this._oCell;
   }
   function _release(§\x1e\t\x1c§)
   {
      if(this._bInteractive)
      {
         this._battlefield.onObjectRelease(this);
      }
   }
   function _rollOver(§\x1e\t\x1c§)
   {
      if(this._bInteractive)
      {
         this._battlefield.onObjectRollOver(this);
      }
   }
   function _rollOut(§\x1e\t\x1c§)
   {
      if(this._bInteractive)
      {
         this._battlefield.onObjectRollOut(this);
      }
   }
   function onLoadInit(§\n\x1d§)
   {
      var _loc3_ = _loc2_._width;
      var _loc4_ = _loc2_._height;
      var _loc5_ = _loc3_ / _loc4_;
      var _loc6_ = ank.battlefield.Constants.EXTERNAL_OBJECT2_SIZE / ank.battlefield.Constants.EXTERNAL_OBJECT2_SIZE;
      if(_loc5_ == _loc6_)
      {
         _loc2_._width = ank.battlefield.Constants.EXTERNAL_OBJECT2_SIZE;
         _loc2_._height = ank.battlefield.Constants.EXTERNAL_OBJECT2_SIZE;
      }
      else if(_loc5_ > _loc6_)
      {
         _loc2_._width = ank.battlefield.Constants.EXTERNAL_OBJECT2_SIZE;
         _loc2_._height = ank.battlefield.Constants.EXTERNAL_OBJECT2_SIZE / _loc5_;
      }
      else
      {
         _loc2_._width = ank.battlefield.Constants.EXTERNAL_OBJECT2_SIZE * _loc5_;
         _loc2_._height = ank.battlefield.Constants.EXTERNAL_OBJECT2_SIZE;
      }
      var _loc7_ = _loc2_.getBounds(_loc2_._parent);
      _loc2_._x = - _loc7_.xMin - _loc2_._width / 2;
      _loc2_._y = - _loc7_.yMin - _loc2_._height;
   }
}
