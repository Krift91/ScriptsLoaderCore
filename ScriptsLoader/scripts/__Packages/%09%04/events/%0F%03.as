class §\t\x04§.events.§\x0f\x03§
{
   static var _fEventDispatcher = undefined;
   function §\x0f\x03§()
   {
   }
   static function _removeEventListener(queue, §\x0f\x04§, §\r\t§)
   {
      if(queue != undefined)
      {
         var _loc5_ = queue.length;
         var _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            var _loc7_ = queue[_loc6_];
            if(_loc7_ == _loc4_)
            {
               queue.splice(_loc6_,1);
               return undefined;
            }
            _loc6_ = _loc6_ + 1;
         }
      }
   }
   static function initialize(§\x1e\x1a\x07§)
   {
      if(eval("\t\x04").events["\x0f\x03"]._fEventDispatcher == undefined)
      {
         eval("\t\x04").events["\x0f\x03"]._fEventDispatcher = new eval("\t\x04").events["\x0f\x03"]();
      }
      _loc2_.__proto__.addEventListener = eval("\t\x04").events["\x0f\x03"]._fEventDispatcher.addEventListener;
      _loc2_.__proto__.removeEventListener = eval("\t\x04").events["\x0f\x03"]._fEventDispatcher.removeEventListener;
      _loc2_.__proto__.dispatchEvent = eval("\t\x04").events["\x0f\x03"]._fEventDispatcher.dispatchEvent;
      _loc2_.__proto__.dispatchQueue = eval("\t\x04").events["\x0f\x03"]._fEventDispatcher.dispatchQueue;
   }
   function dispatchQueue(§\x1e\x15\x10§, §\x0f\x02§)
   {
      var _loc4_ = "__q_" + _loc3_.type;
      var _loc5_ = _loc2_[_loc4_];
      if(_loc5_ != undefined)
      {
         for(var _loc6_ in _loc5_)
         {
            var _loc7_ = _loc5_[_loc6_];
            var _loc8_ = typeof _loc7_;
            if(_loc8_ == "object" || _loc8_ == "movieclip")
            {
               if(_loc7_.handleEvent == undefined)
               {
                  _loc7_[_loc3_.type](_loc3_);
               }
               else
               {
                  _loc7_.handleEvent(_loc3_);
               }
            }
            else
            {
               _loc7_.apply(_loc2_,[_loc3_]);
            }
         }
      }
   }
   function dispatchEvent(§\x0f\x02§)
   {
      if(_loc2_.target == undefined)
      {
         _loc2_.target = this;
      }
      this[_loc2_.type + "Handler"](_loc2_);
      this.dispatchQueue(this,_loc2_);
   }
   function addEventListener(§\x0f\x04§, §\r\t§)
   {
      var _loc4_ = "__q_" + _loc2_;
      if(this[_loc4_] == undefined)
      {
         this[_loc4_] = new Array();
      }
      _global.ASSetPropFlags(this,_loc4_,1);
      eval("\t\x04").events["\x0f\x03"]._removeEventListener(this[_loc4_],_loc2_,_loc3_);
      this[_loc4_].push(_loc3_);
   }
   function removeEventListener(§\x0f\x04§, §\r\t§)
   {
      var _loc4_ = "__q_" + _loc2_;
      eval("\t\x04").events["\x0f\x03"]._removeEventListener(this[_loc4_],_loc2_,_loc3_);
   }
}
