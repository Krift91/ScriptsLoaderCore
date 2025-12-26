class dofus.datacenter.§\x0b\x18§
{
   var _nRemainingTurn;
   var _sSpriteOnID;
   var _oSpell;
   function §\x0b\x18§(§\x1e\x1c\x1d§, §\x1e\r\f§)
   {
      this.initialize(_loc2_,_loc3_);
   }
   function set remainingTurn(§\x1e\x1e\t§)
   {
      this._nRemainingTurn = Number(_loc2_);
   }
   function get remainingTurn()
   {
      return this._nRemainingTurn;
   }
   function get spriteOnID()
   {
      return this._sSpriteOnID;
   }
   function get spell()
   {
      return this._oSpell;
   }
   function initialize(§\x1e\x1c\x1d§, §\x1e\r\f§)
   {
      this._oSpell = _global.API.datacenter.Player.Spells.findFirstItem("ID",_loc2_).item;
      this._sSpriteOnID = _loc3_;
      var _loc4_ = this._oSpell.delayBetweenLaunch;
      if(_loc4_ == undefined)
      {
         _loc4_ = 0;
      }
      if(_loc4_ >= 63)
      {
         this._nRemainingTurn = Number.MAX_VALUE;
      }
      else
      {
         this._nRemainingTurn = _loc4_;
      }
   }
}
