class ank.§\x1e\n\x07§.§\x11\x11§ extends Object
{
   var _mcCyclicGameLoop;
   static var _instance = new ank["\x1e\n\x07"]["\x11\x11"]();
   var _aFunctions = new Array();
   var _bPlaying = false;
   function §\x11\x11§()
   {
      super();
   }
   static function getInstance()
   {
      return ank["\x1e\n\x07"]["\x11\x11"]._instance;
   }
   function addFunction(§\x1e\x18\x04§, §\x1e\x18\x0f§, §\x0e\x11§, §\x1e\x01§, §\x1e\x18\x0e§, §\x0e\x10§, §\x1d\x1d§)
   {
      var _loc9_ = new Object();
      _loc9_.objRef = _loc2_;
      _loc9_.objFn = _loc3_;
      _loc9_.fn = _loc4_;
      _loc9_.params = _loc5_;
      _loc9_.objFnEnd = _loc6_;
      _loc9_.fnEnd = _loc7_;
      _loc9_.paramsEnd = _loc8_;
      this._aFunctions.push(_loc9_);
      this.play();
   }
   function removeFunction(§\x1e\x18\x04§)
   {
      var _loc3_ = this._aFunctions.length - 1;
      while(_loc3_ >= 0)
      {
         var _loc4_ = this._aFunctions[_loc3_];
         if(_loc2_ == _loc4_.objRef)
         {
            this._aFunctions.splice(_loc3_,1);
         }
         _loc3_ = _loc3_ - 1;
      }
   }
   function clear()
   {
      this.stop();
      this._aFunctions = new Array();
   }
   function play()
   {
      if(this._bPlaying)
      {
         return undefined;
      }
      this._bPlaying = true;
      if(this._mcCyclicGameLoop == undefined)
      {
         this._mcCyclicGameLoop = _root.createEmptyMovieClip("_mcCyclicGameLoop",_root.getNextHighestDepth());
      }
      if(this._mcCyclicGameLoop.onEnterFrame == undefined)
      {
         var thisObject = this;
         var api = _global.API;
         var FRAMES_TO_SKIP = !dofus.Constants.DOUBLEFRAMERATE ? 1 : 3;
         var nCurrentFrameSkipState = 0;
         this._mcCyclicGameLoop.onEnterFrame = function()
         {
            if(!api.electron.isWindowFocused)
            {
               if(nCurrentFrameSkipState > 0)
               {
                  nCurrentFrameSkipState--;
                  return undefined;
               }
               nCurrentFrameSkipState = FRAMES_TO_SKIP;
            }
            thisObject.doCycle();
         };
      }
   }
   function stop()
   {
      delete this._mcCyclicGameLoop.onEnterFrame;
      this._bPlaying = false;
   }
   function doCycle()
   {
      var _loc2_ = this._aFunctions.length - 1;
      while(_loc2_ >= 0)
      {
         var _loc3_ = this._aFunctions[_loc2_];
         if(!_loc3_.fn.apply(_loc3_.objFn,_loc3_.params))
         {
            this.onFunctionEnd(_loc2_,_loc3_);
         }
         _loc2_ = _loc2_ - 1;
      }
      if(this._aFunctions.length == 0)
      {
         this.stop();
      }
   }
   function onFunctionEnd(§\x04\n§, §\x1e\x19\b§)
   {
      _loc3_.fnEnd.apply(_loc3_.objFnEnd,_loc3_.paramsEnd);
      this._aFunctions.splice(_loc2_,1);
   }
}
