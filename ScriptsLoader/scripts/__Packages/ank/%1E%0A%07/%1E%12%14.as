class ank.§\x1e\n\x07§.§\x1e\x12\x14§ extends Object
{
   var _nTimeout;
   var _unicID;
   var _nActionIndex;
   var _aActions;
   var _bPlaying;
   var onSequenceEnd;
   var _nTimeModerator = 1;
   function §\x1e\x12\x14§(timeout)
   {
      super();
      this.initialize(timeout);
   }
   function initialize(§\x1e\x1b\x1b§)
   {
      this._nTimeout = _loc2_ != undefined ? _loc2_ : 10000;
      this._unicID = String(getTimer()) + random(10000);
      this._nActionIndex = 0;
      this.clear();
   }
   function clear()
   {
      this._aActions = new Array();
      this._bPlaying = false;
      this._nTimeModerator = 1;
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"sequencer");
   }
   function setTimeModerator(§\x1e\x1b\x1c§)
   {
      this._nTimeModerator = _loc2_;
   }
   function addAction(§\x06\r§, §\x13\x18§, §\t\x10§, §\x0e\x11§, §\x1e\x01§, §\x05\x19§, §\x19\x0f§)
   {
      var _loc9_ = new Object();
      _loc9_.debugId = _loc2_;
      _loc9_.id = this.getActionIndex();
      _loc9_.waitEnd = _loc3_;
      _loc9_.object = _loc4_;
      _loc9_.fn = _loc5_;
      _loc9_.parameters = _loc6_;
      _loc9_.duration = _loc7_;
      _loc9_.forceTimeout = _loc3_ && (_loc8_ != undefined && _loc8_);
      this._aActions.push(_loc9_);
   }
   function printActions()
   {
      var _loc2_ = _global.API;
      var _loc3_ = "Actions : (" + this._aActions.length + ")";
      var _loc4_ = 0;
      while(_loc4_ < this._aActions.length)
      {
         var _loc5_ = this._aActions[_loc4_];
         _loc3_ += "\ni : " + _loc4_ + "\n" + "DebugID : " + _loc5_.debugId + "\n" + "Wait End : " + _loc5_.waitEnd + "\n" + "Force Timeout : " + _loc5_.forceTimeout + "\n" + "Parameters : " + _loc5_.parameters.toString();
         _loc4_ = _loc4_ + 1;
      }
      _loc2_.kernel.showMessage(undefined,_loc3_,"DEBUG_LOG");
   }
   function containsAction(§\t\x10§, §\x0e\x11§)
   {
      var _loc4_ = 0;
      while(_loc4_ < this._aActions.length)
      {
         var _loc5_ = this._aActions[_loc4_];
         if(_loc5_.object == _loc2_ && _loc5_.fn == _loc3_)
         {
            return true;
         }
         _loc4_ = _loc4_ + 1;
      }
      return false;
   }
   function execute(§\x19\x19§)
   {
      if(this._bPlaying && !_loc2_)
      {
         return undefined;
      }
      this._bPlaying = true;
      var _loc3_ = true;
      while(_loc3_)
      {
         if(this._aActions.length > 0)
         {
            var _loc4_ = this._aActions[0];
            if(_loc4_.waitEnd)
            {
               _loc4_.object[this._unicID] = _loc4_.id;
            }
            _loc4_.fn.apply(_loc4_.object,_loc4_.parameters);
            if(!_loc4_.waitEnd)
            {
               this.onActionEnd(true);
            }
            else
            {
               _loc3_ = false;
               ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(_loc4_.object,"sequencer",this,this.onActionTimeOut,_loc4_.duration == undefined ? this._nTimeout : _loc4_.duration * this._nTimeModerator,[_loc4_]);
            }
         }
         else
         {
            _loc3_ = false;
            this.stop();
         }
      }
   }
   function stop()
   {
      this._bPlaying = false;
   }
   function isPlaying()
   {
      return this._bPlaying;
   }
   function clearAllNextActions(§\x1e\t\x1c§)
   {
      this._aActions.splice(1);
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"sequencer");
   }
   function onActionTimeOut(§\x1e\x1a\x0f§)
   {
      if(_loc2_ != undefined && this._aActions[0].id != _loc2_.id)
      {
         return undefined;
      }
      this.onActionEnd(false,true);
   }
   function onActionEnd(§\x1a\x19§, §\x14\x12§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      if(this._aActions.length == 0)
      {
         return undefined;
      }
      if(this._aActions[0].forceTimeout && !_loc3_)
      {
         return undefined;
      }
      if(this._aActions[0].waitEnd)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this._aActions[0].object,"sequencer");
      }
      this._aActions.shift();
      if(this._aActions.length == 0)
      {
         this.clear();
         this.onSequenceEnd();
      }
      else if(_loc2_ != true)
      {
         if(this._bPlaying)
         {
            this.execute(true);
         }
      }
   }
   function toString()
   {
      return "Sequencer unicID:" + this._unicID + " playing:" + this._bPlaying + " actionsCount:" + this._aActions.length + " currentActionID:" + this._aActions[0].id + " currentActionObject:" + this._aActions[0].object + " currentActionParam:" + this._aActions[0].parameters.toString() + " currentActionBlocking:" + this._aActions[0].waitEnd + " currentActionForceTimeout:" + this._aActions[0].forceTimeout;
   }
   function getActionIndex(§\x1e\t\x1c§)
   {
      this._nActionIndex++;
      if(this._nActionIndex > 10000)
      {
         this._nActionIndex = 0;
      }
      return this._nActionIndex;
   }
}
