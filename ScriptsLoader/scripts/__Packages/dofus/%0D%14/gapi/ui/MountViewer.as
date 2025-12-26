class dofus.§\r\x14§.gapi.ui.MountViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oMount;
   var _btnClose;
   var _mvMountViewer;
   static var CLASS_NAME = "MountViewer";
   function MountViewer()
   {
      super();
   }
   function set mount(§\x1e\x18\x14§)
   {
      this._oMount = _loc2_;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   function get mount()
   {
      return this._oMount;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.MountViewer.CLASS_NAME);
   }
   function destroy()
   {
      this.gapi.hideTooltip();
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.updateData});
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
   }
   function updateData()
   {
      this._mvMountViewer.mount = this._oMount;
   }
   function initTexts()
   {
      this._btnClose.label = this.api.lang.getText("CLOSE");
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnClose)
      {
         this.callClose();
      }
   }
}
