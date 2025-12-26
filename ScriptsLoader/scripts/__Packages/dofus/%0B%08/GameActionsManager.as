class dofus.§\x0b\b§.GameActionsManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _data;
   var _id;
   var _bNextAction;
   var _state;
   var _currentType;
   static var STATE_TRANSMITTING = 2;
   static var STATE_IN_PROGRESS = 1;
   static var STATE_READY = 0;
   function GameActionsManager(§\x11\x10§, oAPI)
   {
      super();
      this.initialize(_loc3_,oAPI);
   }
   function initialize(§\x11\x10§, oAPI)
   {
      super.initialize(oAPI);
      this._data = _loc3_;
      this.clear();
   }
   function clear(§\x1e\t\x1c§)
   {
      this._id = undefined;
      this._bNextAction = false;
      this._state = dofus["\x0b\b"].GameActionsManager.STATE_READY;
      this._currentType = null;
   }
   function transmittingMove(§\x1e\n\x0f§, §\x1e\x17\x02§)
   {
      if(!this.isWaiting())
      {
         this.api.network.GameActions.sendActions(_loc2_,_loc3_);
         this._state = dofus["\x0b\b"].GameActionsManager.STATE_TRANSMITTING;
         this._currentType = _loc2_;
      }
      else if(this.canCancel(_loc2_))
      {
         this.cancel(this._data.cellNum);
         this.transmittingMove(_loc2_,_loc3_);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("L\'état de l\'action ne permet pas de faire ceci");
      }
   }
   function isOnUncancelableAction(§\x1e\n\x0f§)
   {
      return this.isWaiting() && !this.canCancel(_loc2_);
   }
   function transmittingOther(§\x1e\n\x0f§, §\x1e\x17\x02§)
   {
      if(!this.isWaiting())
      {
         this.api.network.GameActions.sendActions(_loc2_,_loc3_);
         this._state = dofus["\x0b\b"].GameActionsManager.STATE_TRANSMITTING;
         this._currentType = _loc2_;
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("L\'état de l\'action ne permet pas de faire ceci " + _loc2_ + " " + _loc3_);
      }
   }
   function onServerResponse(§\f\x1c§)
   {
      this._id = _loc2_;
      this._state = dofus["\x0b\b"].GameActionsManager.STATE_IN_PROGRESS;
   }
   function cancel(§\x1e\x17\x02§, §\x19\x10§)
   {
      this._currentType = null;
      if(this.canCancel())
      {
         this.api.network.GameActions.actionCancel(this._id,_loc2_);
         var _loc4_ = this._data.sequencer;
         var _loc5_ = this._data.mc;
         _loc4_.clearAllNextActions();
         if(_loc3_ == true)
         {
            _loc4_.addAction(125,false,_loc5_,_loc5_.setAnim,["Static"]);
         }
         this.clear();
      }
   }
   function end(§\x19\x03§)
   {
      if(this._bNextAction == false || !_loc2_)
      {
         this.clear();
      }
      else
      {
         this._state = dofus["\x0b\b"].GameActionsManager.STATE_TRANSMITTING;
         this._id = undefined;
      }
   }
   function ack(§\f\x1b§)
   {
      this.api.network.GameActions.actionAck(_loc2_);
      this.end(true);
   }
   function isWaiting(§\x1e\t\x1c§)
   {
      switch(this._state)
      {
         case dofus["\x0b\b"].GameActionsManager.STATE_READY:
            return false;
         case dofus["\x0b\b"].GameActionsManager.STATE_TRANSMITTING:
         case dofus["\x0b\b"].GameActionsManager.STATE_IN_PROGRESS:
            return true;
         default:
            return false;
      }
   }
   function canCancel(§\x1e\n\x0f§)
   {
      if(_loc2_ != this._currentType)
      {
         return false;
      }
      if(this._id == undefined)
      {
         return false;
      }
      switch(this._state)
      {
         case dofus["\x0b\b"].GameActionsManager.STATE_TRANSMITTING:
            return false;
         case dofus["\x0b\b"].GameActionsManager.STATE_READY:
         case dofus["\x0b\b"].GameActionsManager.STATE_IN_PROGRESS:
            return true;
         default:
            return false;
      }
   }
}
