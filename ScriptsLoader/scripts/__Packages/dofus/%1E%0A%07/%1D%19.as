class dofus.§\x1e\n\x07§.§\x1d\x19§ extends Object
{
   var _oAPI;
   static var _aQueue = new Array();
   function §\x1d\x19§()
   {
      super();
   }
   function get api()
   {
      return _global.API;
   }
   function set api(§\x1e\x1a\x0b§)
   {
      this._oAPI = _loc2_;
   }
   function initialize(oAPI)
   {
      this._oAPI = oAPI;
   }
   function addToQueue(§\x1e\x1a\x04§)
   {
      dofus["\x1e\n\x07"]["\x1d\x19"]._aQueue.push(_loc2_);
      if(_root.onEnterFrame == undefined)
      {
         _root.onEnterFrame = this.runQueue;
      }
   }
   function runQueue()
   {
      var _loc2_ = dofus["\x1e\n\x07"]["\x1d\x19"]._aQueue.shift();
      _loc2_.method.apply(_loc2_.object,_loc2_.params);
      if(dofus["\x1e\n\x07"]["\x1d\x19"]._aQueue.length == 0)
      {
         delete _root.onEnterFrame;
      }
   }
}
