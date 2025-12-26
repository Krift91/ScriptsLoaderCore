class ank.§\x1e\n\x07§.§\x1e\x15\x11§ extends MovieClip
{
   static var _aQueue = new Array();
   static var _mcEnterFrame = _root.createEmptyMovieClip("_mcQueueEnterFrame",_root.getNextHighestDepth());
   function §\x1e\x15\x11§()
   {
      super();
   }
   function addToQueue(§\x1e\x1a\x04§)
   {
      ank["\x1e\n\x07"]["\x1e\x15\x11"]._aQueue.push(_loc2_);
      if(ank["\x1e\n\x07"]["\x1e\x15\x11"]._mcEnterFrame.onEnterFrame == undefined)
      {
         ank["\x1e\n\x07"]["\x1e\x15\x11"]._mcEnterFrame.onEnterFrame = this.runQueue;
      }
   }
   function runQueue()
   {
      for(var k in ank["\x1e\n\x07"]["\x1e\x15\x11"]._aQueue)
      {
         var _loc2_ = ank["\x1e\n\x07"]["\x1e\x15\x11"]._aQueue.shift();
         _loc2_.method.apply(_loc2_.object,_loc2_.params);
         if(ank["\x1e\n\x07"]["\x1e\x15\x11"]._aQueue.length == 0)
         {
            delete ank["\x1e\n\x07"]["\x1e\x15\x11"]._mcEnterFrame.onEnterFrame;
         }
      }
   }
}
