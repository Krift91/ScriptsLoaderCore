class ank.§\x1e\n\x07§.§\x1e\x0b\x02§ extends Object
{
   static var _nTimerIndex = 0;
   static var _oIDs = new Object();
   static var _tTimer = new ank["\x1e\n\x07"]["\x1e\x0b\x02"]();
   function §\x1e\x0b\x02§()
   {
      super();
   }
   static function setTimer(§\t\x10§, §\x1e\x10\x14§, §\n\x07§, §\x0e\x11§, §\x04\x07§, §\x1e\x01§, §\x16\x05§)
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].garbageCollector();
      var _loc9_ = ank["\x1e\n\x07"]["\x1e\x0b\x02"].getNextTimerIndex();
      var _loc10_ = _global.setInterval(ank["\x1e\n\x07"]["\x1e\x0b\x02"].getInstance(),"onTimer",_loc6_,_loc9_,_loc2_,_loc3_,_loc4_,_loc5_,_loc7_);
      _loc2_.__ANKTIMERID__ = _loc10_;
      _loc2_.__ANKTIMERREPEAT__ = _loc8_;
      if(ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs[_loc3_] == undefined)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs[_loc3_] = new Object();
      }
      ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs[_loc3_][_loc9_] = new Array(_loc2_,_loc10_,_loc3_);
   }
   static function clear(§\x1e\x10\x14§)
   {
      if(_loc2_ != undefined)
      {
         var _loc3_ = ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs[_loc2_];
         for(var k in _loc3_)
         {
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(_loc3_[k][0],_loc2_,_loc3_[k][1]);
         }
      }
      else
      {
         for(var k in ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs)
         {
            var _loc4_ = ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs[k];
            for(var kk in _loc4_)
            {
               ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(_loc4_[kk][0],_loc4_[kk][2],_loc4_[kk][1]);
            }
         }
      }
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].garbageCollector();
   }
   static function clean()
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].garbageCollector();
   }
   static function removeTimer(§\t\x10§, §\x1e\x10\x14§, §\x1e\x1b\x19§)
   {
      if(_loc4_ == undefined)
      {
         if(_loc2_ == undefined)
         {
            return undefined;
         }
         if(_loc2_.__ANKTIMERID__ == undefined)
         {
            return undefined;
         }
         var _loc5_ = _loc2_.__ANKTIMERID__;
      }
      else
      {
         _loc5_ = ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs[_loc3_][_loc4_][1];
      }
      _global.clearInterval(_loc5_);
      delete _loc2_.__ANKTIMERID__;
      delete ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs[_loc3_][_loc4_];
   }
   static function getInstance()
   {
      return ank["\x1e\n\x07"]["\x1e\x0b\x02"]._tTimer;
   }
   static function garbageCollector()
   {
      for(var k in ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs)
      {
         var _loc2_ = ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs[k];
         for(var kk in _loc2_)
         {
            var _loc3_ = _loc2_[kk];
            if(_loc3_[0] == undefined || (typeof _loc3_[0] == "movieclip" && _loc3_[0]._name == undefined || _loc3_[0].__ANKTIMERID__ != _loc3_[1]))
            {
               _global.clearInterval(_loc3_[1]);
               delete _loc2_[kk];
            }
         }
      }
   }
   static function getTimersCount()
   {
      var _loc2_ = 0;
      for(var k in ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs)
      {
         var _loc3_ = ank["\x1e\n\x07"]["\x1e\x0b\x02"]._oIDs[k];
         for(var kk in _loc3_)
         {
            _loc2_ = _loc2_ + 1;
         }
      }
      return _loc2_;
   }
   static function getNextTimerIndex()
   {
      return ank["\x1e\n\x07"]["\x1e\x0b\x02"]._nTimerIndex++;
   }
   function onTimer(§\x1e\x1b\x19§, §\t\x10§, §\x1e\x10\x14§, §\n\x07§, §\x0e\x11§, §\x1e\x01§)
   {
      if(_loc3_ == undefined)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(undefined,_loc4_,_loc2_);
         return undefined;
      }
      if(_loc3_.__ANKTIMERID__ == undefined)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(undefined,_loc4_,_loc2_);
         return undefined;
      }
      if(!_loc3_.__ANKTIMERREPEAT__)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(_loc3_,_loc4_,_loc2_);
         delete _loc3_.__ANKTIMERID__;
      }
      _loc6_.apply(_loc5_,_loc7_);
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].garbageCollector();
   }
}
