class ank.gapi.core.§\x1e\n\r§ extends ank.gapi.core.§\x1e\n\f§
{
   var _oAPI;
   var _sInstanceName;
   function §\x1e\n\r§()
   {
      super();
   }
   function set api(oAPI)
   {
      this._oAPI = oAPI;
   }
   function get api()
   {
      if(this._oAPI == undefined)
      {
         return this._parent.api;
      }
      return this._oAPI;
   }
   function set instanceName(§\x1e\x11\b§)
   {
      this._sInstanceName = _loc2_;
   }
   function get instanceName()
   {
      return this._sInstanceName;
   }
   function callClose()
   {
      return false;
   }
   function unloadThis()
   {
      this.gapi.unloadUIComponent(this._sInstanceName);
   }
}
