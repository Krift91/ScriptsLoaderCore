class dofus.§\x0b\b§.NightManager
{
   var _oApi;
   var _aSequence;
   var _aMonths;
   var _nYearOffset;
   var _mcBattlefield;
   var _cdDate;
   var _nYear;
   var _nMonth;
   var _nDay;
   var _nIntervalID;
   static var STATE_COLORS = [undefined,dofus.Constants.NIGHT_COLOR];
   static var _sSelf = null;
   function NightManager(§\x1e\x1a\x0b§)
   {
      dofus["\x0b\b"].NightManager._sSelf = this;
      this._oApi = _loc2_;
   }
   function get time()
   {
      var _loc2_ = this.getCurrentTime();
      if(new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_[1]).addLeftChar("0",2) == "undefined")
      {
         return "";
      }
      return new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_[0]).addLeftChar("0",2) + ":" + new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_[1]).addLeftChar("0",2);
   }
   function get date()
   {
      return this.getCurrentDateString();
   }
   function initialize(§\x1e\n\x0e§, §\x1e\x06§, §\x1e\x1a\x15§, §\x1c\x1d§)
   {
      this._aSequence = _loc2_;
      this._aMonths = _loc3_;
      this._nYearOffset = _loc4_;
      this._mcBattlefield = _loc5_;
   }
   function setReferenceTime(§\x1e\x1b\x18§)
   {
      this._cdDate = new ank["\x1e\n\x07"]["\x11\x13"](_loc2_,this._aMonths,this._nYearOffset);
      this.clear();
   }
   function setReferenceDate(§\x1e\x1a\x16§, §\x02\x0b§, §\x06\x0f§)
   {
      this._nYear = _loc2_;
      this._nMonth = _loc3_;
      this._nDay = _loc4_;
   }
   function clear()
   {
      _global.clearInterval(this._nIntervalID);
   }
   function noEffects()
   {
      this.clear();
      this._mcBattlefield.setColor();
   }
   function getCurrentTime()
   {
      return this._cdDate.getCurrentTime();
   }
   function getCurrentDateString()
   {
      var _loc2_ = this._cdDate.getCurrentDate();
      if(getTimer() - this._oApi.datacenter.Basics.lastDateUpdate > 60000)
      {
         this._oApi.network.Basics.getDate();
      }
      var _loc3_ = this._nYear == undefined ? _loc2_[2] + " " + _loc2_[1] + " " + _loc2_[0] : this._nDay + " " + this._aMonths[11 - this._nMonth][1] + " " + this._nYear;
      return _loc3_;
   }
   function getDiffDate(§\x1e\x1b\x1d§)
   {
      return this._cdDate.getDiffDate(_loc2_);
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].NightManager._sSelf;
   }
   function setState()
   {
      var _loc2_ = this._cdDate.getCurrentMillisInDay();
      var _loc3_ = 0;
      while(_loc3_ < this._aSequence.length)
      {
         var _loc4_ = this._aSequence[_loc3_][1];
         if(_loc2_ < _loc4_)
         {
            var _loc5_ = this._aSequence[_loc3_][2];
            this.applyState(_loc5_,_loc4_ - _loc2_,_loc4_);
            return undefined;
         }
         _loc3_ = _loc3_ + 1;
      }
      ank["\x1e\n\x07"]["\x0b\f"].err("[setState] ... heu la date " + _loc2_ + " n\'est pas dans la séquence");
   }
   function applyState(§\x1e\x17\x12§, §\x06\x0b§, §\x05\x14§)
   {
      this._mcBattlefield.setColor(_loc2_);
      this.clear();
      this._nIntervalID = _global.setInterval(this,"setState",_loc3_,_loc4_);
   }
}
