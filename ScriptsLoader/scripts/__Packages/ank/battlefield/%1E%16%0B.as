class ank.battlefield.§\x1e\x16\x0b§
{
   var _mcBattlefield;
   var _mcContainer;
   var _oDatacenter;
   var _oList;
   function §\x1e\x16\x0b§(§\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      this.initialize(_loc2_,_loc3_,_loc4_);
   }
   function initialize(§\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      this._mcBattlefield = _loc2_;
      this._mcContainer = _loc3_;
      this._oDatacenter = _loc4_;
      this._oList = new Object();
   }
   function clear()
   {
      for(var k in this._mcContainer)
      {
         this._mcContainer[k].removeMovieClip();
      }
   }
   function addPoints(sID, nX, nY, §\x1e\x0b\x19§, §\x06\x1d§)
   {
      var _loc7_ = this._mcContainer.getNextHighestDepth();
      var _loc8_ = this._mcContainer.attachClassMovie(ank.battlefield.mc.Points,"points" + _loc7_,_loc7_,[this,sID,nY,_loc5_,_loc6_]);
      _loc8_._x = nX;
      _loc8_._y = nY;
      if(this._oList[sID] == undefined)
      {
         this._oList[sID] = new Array();
      }
      this._oList[sID].push(_loc8_);
      if(this._oList[sID].length == 1)
      {
         _loc8_.animate();
      }
   }
   function onAnimateFinished(sID)
   {
      var _loc3_ = this._oList[sID];
      _loc3_.shift();
      if(_loc3_.length != 0)
      {
         _loc3_[0].animate();
      }
   }
}
