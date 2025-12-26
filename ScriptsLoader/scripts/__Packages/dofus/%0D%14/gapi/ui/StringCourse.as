class dofus.§\r\x14§.gapi.ui.StringCourse extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _sName;
   var _sLevel;
   var _sGfx;
   var _colors;
   var _ldrStringCourse;
   var _lblName;
   var _lblLevel;
   var _mcAnim;
   static var CLASS_NAME = "StringCourse";
   function StringCourse()
   {
      super();
   }
   function set name(§\x1e\x0f\x16§)
   {
      this._sName = _loc2_;
   }
   function set level(§\x1e\x10\x0f§)
   {
      this._sLevel = _loc2_;
   }
   function set gfx(§\x1e\x11\x1d§)
   {
      this._sGfx = _loc2_;
   }
   function set colors(§\f§)
   {
      this._colors = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.StringCourse.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.loadContent});
   }
   function loadContent()
   {
      this._ldrStringCourse.addEventListener("error",this);
      this._ldrStringCourse.addEventListener("complete",this);
      this._ldrStringCourse.contentPath = this._sGfx;
   }
   function unloadContent()
   {
      this._ldrStringCourse.contentPath = "";
      this._lblName.text = "";
      this._lblLevel.text = "";
   }
   function applyColor(§\n\x1d§, §\x1e\t\x03§)
   {
      var _loc4_ = this._colors[_loc3_];
      if(_loc4_ == -1 || _loc4_ == undefined)
      {
         return undefined;
      }
      var _loc5_ = (_loc4_ & 0xFF0000) >> 16;
      var _loc6_ = (_loc4_ & 0xFF00) >> 8;
      var _loc7_ = _loc4_ & 0xFF;
      var _loc8_ = new Color(_loc2_);
      var _loc9_ = new Object();
      _loc9_ = {ra:0,ga:0,ba:0,rb:_loc5_,gb:_loc6_,bb:_loc7_};
      _loc8_.setTransform(_loc9_);
   }
   function complete(§\x1e\x19\x0e§)
   {
      this._lblName.text = this._sName;
      this._lblLevel.text = this._sLevel;
      var ref = this;
      this._ldrStringCourse.content.stringCourseColor = function(§\n\x1d§, §\x1e\t\x07§)
      {
         ref.applyColor(_loc2_,_loc3_);
      };
      this._mcAnim.play();
   }
   function error(§\x1e\x19\x0e§)
   {
      this.unloadThis();
   }
}
