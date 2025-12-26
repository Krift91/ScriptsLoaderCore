class dofus.datacenter.§\x1e\x12\x10§ extends Object
{
   var _nTimestamp;
   var _nID;
   var _bTranslated;
   var _sContent;
   var _sTitle;
   var _sHour;
   function §\x1e\x12\x10§(nTimestamp, nEventID, bTranslated, §\x1e\x13\x11§)
   {
      super();
      this._nTimestamp = nTimestamp;
      this._nID = nEventID;
      this._bTranslated = bTranslated;
      this._sContent = _loc6_;
      var _loc7_ = _global.API;
      this._sTitle = _loc7_.lang.getText("STATUS_EVENT_" + this._nID);
      var _loc8_ = _loc7_.lang.getConfigText("HOUR_FORMAT");
      var _loc9_ = _loc7_.config.language;
      var _loc10_ = new Date(this._nTimestamp);
      this._sHour = eval("\x1e\x18\x01")["\x1e\n\x07"]["\x1e\x11\f"].formatDate(_loc10_,_loc8_,_loc9_);
   }
   function get timestamp()
   {
      return this._nTimestamp;
   }
   function get hour()
   {
      return this._sHour;
   }
   function get id()
   {
      return this._nID;
   }
   function get title()
   {
      return this._sTitle;
   }
   function get translated()
   {
      return this._bTranslated;
   }
   function get content()
   {
      return this._sContent;
   }
}
