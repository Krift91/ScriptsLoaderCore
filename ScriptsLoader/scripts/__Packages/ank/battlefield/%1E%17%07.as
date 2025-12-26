class ank.battlefield.§\x1e\x17\x07§
{
   var _mcBattlefield;
   var _mcContainer;
   function §\x1e\x17\x07§(§\x1c\x1d§, §\x13\x0f§)
   {
      this.initialize(_loc2_,_loc3_);
   }
   function initialize(§\x1c\x1d§, §\x13\x0f§)
   {
      this._mcBattlefield = _loc2_;
      this._mcContainer = _loc3_;
   }
   function clear()
   {
      for(var k in this._mcContainer)
      {
         if(typeof this._mcContainer[k] == "movieclip")
         {
            this._mcContainer[k].swapDepths(0);
            this._mcContainer[k].removeMovieClip();
         }
      }
   }
   function addOverHeadItem(sID, nX, nY, §\n\x0e§, §\x1e\x10\x13§, §\x0e\x15§, §\x1e\x01§, §\x06\x0b§)
   {
      var _loc10_ = this._mcContainer["oh" + sID];
      var _loc11_ = this._mcBattlefield.getZoom();
      if(_loc10_ == undefined)
      {
         _loc10_ = this._mcContainer.attachClassMovie(ank.battlefield.mc.OverHead,"oh" + sID,_loc5_.getDepth(),[_loc5_,_loc11_,this._mcBattlefield]);
      }
      _loc10_._x = nX;
      _loc10_._y = nY;
      if(_loc11_ < 100)
      {
         _loc10_._xscale = _loc10_._yscale = 10000 / _loc11_;
      }
      _loc10_.addItem(_loc6_,_loc7_,_loc8_,_loc9_);
   }
   function removeOverHeadLayer(sID, §\x1e\x10\x13§)
   {
      var _loc4_ = this._mcContainer["oh" + sID];
      _loc4_.removeLayer(_loc3_);
   }
   function removeOverHead(sID)
   {
      var _loc3_ = this._mcContainer["oh" + sID];
      _loc3_.remove();
   }
}
