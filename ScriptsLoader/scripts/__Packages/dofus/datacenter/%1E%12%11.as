class dofus.datacenter.§\x1e\x12\x11§ extends Object
{
   var _nID;
   var _nDate;
   var _nType;
   var _nStatus;
   var _aServers;
   var _aHistory;
   var _sType;
   var _sStatus;
   var _sDate;
   function §\x1e\x12\x11§(§\x04\x12§, nDate, §\x1e\x1b\x13§, nStatus, §\x1d\r§, aHistory)
   {
      super();
      this._nID = _loc3_;
      this._nDate = nDate;
      this._nType = _loc5_;
      this._nStatus = nStatus;
      this._aServers = _loc7_;
      this._aHistory = aHistory;
      var _loc9_ = _global.API;
      this._sType = _loc9_.lang.getText("STATUS_PROBLEM_" + this._nType);
      this._sStatus = _loc9_.lang.getText("STATUS_STATE_" + this._nStatus);
      var _loc10_ = _loc9_.lang.getConfigText("LONG_DATE_FORMAT");
      var _loc11_ = _loc9_.config.language;
      var _loc12_ = String(this._nDate);
      var _loc13_ = new Date(Number(_loc12_.substr(0,4)),Number(_loc12_.substr(4,2)) - 1,Number(_loc12_.substr(6,2)));
      this._sDate = eval("\x1e\x18\x01")["\x1e\n\x07"]["\x1e\x11\f"].formatDate(_loc13_,_loc10_,_loc11_);
   }
   function get id()
   {
      return this._nID;
   }
   function get date()
   {
      return this._sDate;
   }
   function get type()
   {
      return this._sType;
   }
   function get status()
   {
      return this._sStatus;
   }
   function get servers()
   {
      return this._aServers;
   }
   function get history()
   {
      return this._aHistory;
   }
}
