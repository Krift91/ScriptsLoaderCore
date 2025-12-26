class ank.external.display.§\x1e\x13\x0e§ extends ank.external.§\x0e\x19§
{
   var dispatchEvent;
   function §\x1e\x13\x0e§()
   {
      super();
      ank.external.ExternalConnector.getInstance().addEventListener("onScreenResolutionError",this);
      ank.external.ExternalConnector.getInstance().addEventListener("onScreenResolutionSuccess",this);
   }
   function removeListeners()
   {
      super.removeListeners();
      ank.external.ExternalConnector.getInstance().removeEventListener("onScreenResolutionError",this);
      ank.external.ExternalConnector.getInstance().removeEventListener("onScreenResolutionSuccess",this);
   }
   function enable(§\x1e\x1b\x02§, §\x04\x17§, §\b\x07§)
   {
      ank.external.ExternalConnector.getInstance().pushCall("ScreenResolutionEnable",_loc2_,_loc3_,_loc4_);
   }
   function disable()
   {
      ank.external.ExternalConnector.getInstance().pushCall("ScreenResolutionDisable");
   }
   function onScreenResolutionError(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"onScreenResolutionError"});
   }
   function onScreenResolutionSuccess(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"onScreenResolutionSuccess"});
   }
}
