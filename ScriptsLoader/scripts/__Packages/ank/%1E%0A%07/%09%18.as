class ank.§\x1e\n\x07§.§\t\x18§
{
   static var MAX_CAPACITY = 20;
   var _aMouseClicks = new Array();
   var _aMouseClicksForGather = new Array();
   function §\t\x18§()
   {
   }
   function storeCurrentMouseClick(§\x16\x03§)
   {
      var _loc3_ = new ank["\x1e\n\x07"].datacenter["\t\x19"](getTimer(),_root._xmouse,_root._ymouse,_loc2_);
      this._aMouseClicks.push(_loc3_);
      this._aMouseClicksForGather.push(_loc3_);
      if(this._aMouseClicks.length > ank["\x1e\n\x07"]["\t\x18"].MAX_CAPACITY)
      {
         this._aMouseClicks.shift();
      }
      if(this._aMouseClicksForGather.length > 2)
      {
         this._aMouseClicksForGather.shift();
      }
   }
   function getPreviousMouseClickForGather()
   {
      if(this._aMouseClicksForGather.length < 2)
      {
         return undefined;
      }
      return this._aMouseClicksForGather[this._aMouseClicksForGather.length - 2];
   }
   function resetForGather()
   {
      if(this._aMouseClicksForGather.length == 0)
      {
         return undefined;
      }
      this._aMouseClicksForGather = new Array();
   }
}
