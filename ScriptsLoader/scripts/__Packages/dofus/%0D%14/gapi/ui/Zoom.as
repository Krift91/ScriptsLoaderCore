class dofus.§\r\x14§.gapi.ui.Zoom extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnCancel;
   var _vsZoom;
   var _nXScreenPos;
   var _nYScreenPos;
   static var CLASS_NAME = "Zoom";
   function Zoom()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Zoom.CLASS_NAME);
      this._visible = false;
   }
   function callClose()
   {
      Mouse.removeListener(this);
      this.unloadThis();
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._btnCancel.addEventListener("click",this);
      this._btnCancel.addEventListener("over",this);
      this._btnCancel.addEventListener("out",this);
      this._vsZoom.addEventListener("change",this);
      this._vsZoom.min = this.api.gfx.getZoom();
      var _loc2_ = this.createEmptyMovieClip("mouseupevent",this.getNextHighestDepth());
      var oAPI = this.api;
      _loc2_.onMouseUp = function()
      {
         oAPI.mouseClicksMemorizer.storeCurrentMouseClick(false);
      };
      Mouse.addListener(this);
   }
   function setZoom()
   {
      this.api.kernel.GameManager.zoomGfxRoot(this._vsZoom.value,this._nXScreenPos,this._nYScreenPos);
   }
   function onMouseWheel(§\x1e\x1b\n§, §\n\x1d§)
   {
      if(!dofus["\r\x14"].gapi.ui.Zoom.isZooming())
      {
         return undefined;
      }
      if(this._vsZoom.value == 100)
      {
         this._nXScreenPos = _root._xmouse;
         this._nYScreenPos = _root._ymouse;
      }
      this._vsZoom.value += _loc2_ * 10;
      this.setZoom();
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnCancel)
      {
         this.callClose();
      }
   }
   static function isZooming()
   {
      return Key.isDown(Key.CONTROL) && !Key.isDown(Key.SHIFT);
   }
}
