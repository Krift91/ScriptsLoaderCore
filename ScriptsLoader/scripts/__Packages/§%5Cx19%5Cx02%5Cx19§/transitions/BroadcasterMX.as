class §\x19\x02\x19§.transitions.BroadcasterMX
{
   var _listeners;
   function BroadcasterMX()
   {
   }
   static function initialize(_loc2_, dontCreateArray)
   {
      if(_loc2_.broadcastMessage != undefined)
      {
         delete _loc2_.broadcastMessage;
      }
      _loc2_.addListener = eval("\x19\x02\x19").transitions.BroadcasterMX.prototype.addListener;
      _loc2_.removeListener = eval("\x19\x02\x19").transitions.BroadcasterMX.prototype.removeListener;
      if(!dontCreateArray)
      {
         _loc2_._listeners = new Array();
      }
   }
   function addListener(_loc2_)
   {
      this.removeListener(_loc2_);
      if(this.broadcastMessage == undefined)
      {
         this.broadcastMessage = eval("\x19\x02\x19").transitions.BroadcasterMX.prototype.broadcastMessage;
      }
      return this._listeners.push(_loc2_);
   }
   function removeListener(_loc2_)
   {
      var _loc3_ = this._listeners;
      var _loc4_ = _loc3_.length;
      while(true)
      {
         _loc4_;
         _loc4_;
         _loc4_;
         _loc4_;
         _loc4_;
         _loc4_;
         if(!_loc4_--)
         {
            break;
         }
         if(_loc3_[_loc4_] == _loc2_)
         {
            _loc3_.splice(_loc4_,1);
            if(!_loc3_.length)
            {
               this.broadcastMessage = undefined;
            }
            return true;
         }
      }
      return false;
   }
   function broadcastMessage()
   {
      var _loc3_ = String(arguments.shift());
      var _loc4_ = this._listeners.concat();
      var _loc5_ = _loc4_.length;
      var _loc6_ = 0;
      while(_loc6_ < _loc5_)
      {
         _loc4_[_loc6_][_loc3_].apply(_loc4_[_loc6_],arguments);
         _loc6_ += 1;
      }
   }
}
