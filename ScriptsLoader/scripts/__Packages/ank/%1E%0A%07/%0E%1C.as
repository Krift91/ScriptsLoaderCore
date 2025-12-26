class ank.§\x1e\n\x07§.§\x0e\x1c§ extends String
{
   var _s;
   static var DEFAULT_SPACECHARS = " \n\r\t";
   function §\x0e\x1c§(§\x1e\x1a\x10§)
   {
      super();
      this._s = String(_loc3_);
   }
   function replace(§\x1e\x16\x15§, §\x1e\x16\x04§)
   {
      if(arguments.length == 0)
      {
         return this._s;
      }
      if(arguments.length == 1)
      {
         if(!(_loc2_ instanceof Array))
         {
            return this._s.split(_loc2_).join("");
         }
         _loc3_ = new Array(_loc2_.length);
      }
      if(!(_loc2_ instanceof Array))
      {
         return this._s.split(_loc2_).join(_loc3_);
      }
      var _loc4_ = _loc2_.length;
      var _loc5_ = this._s;
      if(_loc3_ instanceof Array)
      {
         var _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ = _loc5_.split(_loc2_[_loc6_]).join(_loc3_[_loc6_]);
            _loc6_ = _loc6_ + 1;
         }
      }
      else
      {
         var _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc5_ = _loc5_.split(_loc2_[_loc7_]).join(_loc3_);
            _loc7_ = _loc7_ + 1;
         }
      }
      return _loc5_;
   }
   function addLeftChar(§\x1e\x14\x05§, §\x02\x18§)
   {
      var _loc4_ = _loc3_ - this._s.length;
      var _loc5_ = new String();
      var _loc6_ = 0;
      while(_loc6_ < _loc4_)
      {
         _loc5_ += _loc2_;
         _loc6_ = _loc6_ + 1;
      }
      _loc5_ += this._s;
      return _loc5_;
   }
   function addMiddleChar(§\x07\n§, nCount)
   {
      if(_global.isNaN(nCount))
      {
         nCount = Number(nCount);
      }
      nCount = Math.abs(nCount);
      var _loc5_ = new Array();
      var _loc4_ = this._s.length;
      while(_loc4_ > 0)
      {
         if(Math.max(0,_loc4_ - nCount) == 0)
         {
            _loc5_.push(this._s.substr(0,_loc4_));
         }
         else
         {
            _loc5_.push(this._s.substr(_loc4_ - nCount,nCount));
         }
         _loc4_ -= nCount;
      }
      _loc5_.reverse();
      return _loc5_.join(_loc2_);
   }
   function lTrim(§\x1d§)
   {
      this._clearOutOfRange();
      this._lTrim(this.spaceStringToObject(_loc2_));
      return this;
   }
   function rTrim(§\x1d§)
   {
      this._clearOutOfRange();
      this._rTrim(this.spaceStringToObject(_loc2_));
      return this;
   }
   function trim(§\x1d§)
   {
      var _loc3_ = this.spaceStringToObject(_loc2_);
      this._clearOutOfRange();
      this._rTrim(_loc3_);
      this._lTrim(_loc3_);
      return this;
   }
   function toString()
   {
      return this._s;
   }
   function spaceStringToObject(§\x1d§)
   {
      var _loc3_ = new Object();
      if(_loc2_ == undefined)
      {
         _loc2_ = ank["\x1e\n\x07"]["\x0e\x1c"].DEFAULT_SPACECHARS;
      }
      if(typeof _loc2_ == "string")
      {
         var _loc4_ = _loc2_.length;
         while((_loc4_ = _loc4_ - 1) >= 0)
         {
            _loc3_[_loc2_.charAt(_loc4_)] = true;
         }
      }
      else
      {
         _loc3_ = _loc2_;
      }
      return _loc3_;
   }
   function _lTrim(§\x1d§)
   {
      var _loc3_ = this._s.length;
      var _loc4_ = 0;
      while(_loc3_ > 0)
      {
         if(!_loc2_[this._s.charAt(_loc4_)])
         {
            break;
         }
         _loc4_ = _loc4_ + 1;
         _loc3_ = _loc3_ - 1;
      }
      this._s = this._s.slice(_loc4_);
   }
   function _rTrim(§\x1d§)
   {
      var _loc3_ = this._s.length;
      var _loc4_ = _loc3_ - 1;
      while(_loc3_ > 0)
      {
         if(!_loc2_[this._s.charAt(_loc4_)])
         {
            break;
         }
         _loc4_ = _loc4_ - 1;
         _loc3_ = _loc3_ - 1;
      }
      this._s = this._s.slice(0,_loc4_ + 1);
   }
   function _clearOutOfRange()
   {
      var _loc2_ = "";
      var _loc3_ = 0;
      while(_loc3_ < this._s.length)
      {
         if(this._s.charCodeAt(_loc3_) >= 32 && this._s.charCodeAt(_loc3_) <= 255)
         {
            _loc2_ += this._s.charAt(_loc3_);
         }
         _loc3_ = _loc3_ + 1;
      }
      this._s = _loc2_;
   }
}
