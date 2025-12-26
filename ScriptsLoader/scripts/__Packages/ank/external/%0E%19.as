class ank.external.§\x0e\x19§
{
   var _oParams;
   var dispatchEvent;
   function §\x0e\x19§()
   {
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      ank.external.ExternalConnector.getInstance().addEventListener("onExternalConnectionFaild",this);
   }
   function getParams()
   {
      return this._oParams;
   }
   function setParams(§\x1e\x18\x0b§)
   {
      this._oParams = _loc2_;
   }
   function removeListeners()
   {
      ank.external.ExternalConnector.getInstance().removeEventListener("onExternalConnectionFaild",this);
   }
   function onExternalConnectionFaild(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"onExternalError"});
   }
}
