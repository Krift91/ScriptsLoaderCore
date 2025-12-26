class dofus.§\x1e\n\x07§.§\x12\x05§.§\x15§
{
   var _oAPI;
   var _aConsoleHistory;
   var _nConsoleHistoryPointer;
   function §\x15§()
   {
   }
   function get api()
   {
      return this._oAPI;
   }
   function set api(§\x1e\x1a\x0b§)
   {
      this._oAPI = _loc2_;
   }
   function initialize(oAPI)
   {
      this._oAPI = oAPI;
      this._aConsoleHistory = new Array();
      this._nConsoleHistoryPointer = 0;
   }
   function process(§\x1e\x13\x19§, §\x1e\x18\x0b§)
   {
      this.pushHistory({value:_loc2_,params:_loc3_});
   }
   function pushHistory(§\x1e\x19\x1b§)
   {
      var _loc3_ = this._aConsoleHistory.slice(-1);
      if(_loc3_[0].value != _loc2_.value)
      {
         var _loc4_ = this._aConsoleHistory.push(_loc2_);
         if(_loc4_ > 50)
         {
            this._aConsoleHistory.shift();
         }
      }
      this.initializePointers();
   }
   function getHistoryUp()
   {
      if(this._nConsoleHistoryPointer > 0)
      {
         this._nConsoleHistoryPointer--;
      }
      var _loc2_ = this._aConsoleHistory[this._nConsoleHistoryPointer];
      return _loc2_;
   }
   function getHistoryDown()
   {
      if(this._nConsoleHistoryPointer < this._aConsoleHistory.length)
      {
         this._nConsoleHistoryPointer++;
      }
      var _loc2_ = this._aConsoleHistory[this._nConsoleHistoryPointer];
      return _loc2_;
   }
   function autoCompletion(§\x1e\n§, §\x1e\x13\x19§)
   {
      return ank["\x1e\n\x07"]["\x12\x04"].autoCompletion(_loc2_,_loc3_);
   }
   function initializePointers()
   {
      this._nConsoleHistoryPointer = this._aConsoleHistory.length;
   }
}
