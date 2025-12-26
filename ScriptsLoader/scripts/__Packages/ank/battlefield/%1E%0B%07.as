class ank.battlefield.§\x1e\x0b\x07§
{
   var _mcBattlefield;
   var _mcContainer;
   var _oDatacenter;
   static var BUBBLE_TYPE_CHAT = 1;
   static var BUBBLE_TYPE_THINK = 2;
   function §\x1e\x0b\x07§(§\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      this.initialize(_loc2_,_loc3_,_loc4_);
   }
   function initialize(§\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      this._mcBattlefield = _loc2_;
      this._mcContainer = _loc3_;
      this._oDatacenter = _loc4_;
   }
   function clear()
   {
      for(var k in this._mcContainer)
      {
         this._mcContainer[k].removeMovieClip();
      }
   }
   function addBubble(sID, nX, nY, §\x1e\f\x12§, §\x1e\n\x0f§)
   {
      var _loc7_ = (this._oDatacenter.Map.width - 1) * ank.battlefield.Constants.CELL_WIDTH;
      this.removeBubble(sID);
      var _loc8_ = this._mcContainer.attachClassMovie(_loc6_ != ank.battlefield["\x1e\x0b\x07"].BUBBLE_TYPE_THINK ? ank.battlefield.mc["\x14\f"] : ank.battlefield.mc["\x14\x0b"],"bubble" + sID,this._mcContainer.getNextHighestDepth(),[_loc5_,nX,nY,_loc7_]);
      var _loc9_ = this._mcBattlefield.getZoom();
      if(_loc9_ < 100)
      {
         _loc8_._xscale = _loc8_._yscale = 10000 / _loc9_;
      }
   }
   function removeBubble(sID)
   {
      var _loc3_ = this._mcContainer["bubble" + sID];
      _loc3_.remove();
   }
}
