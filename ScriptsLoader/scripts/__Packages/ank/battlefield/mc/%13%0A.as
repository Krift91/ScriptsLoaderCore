class ank.battlefield.mc.§\x13\n§ extends MovieClip
{
   var data;
   var _mcBattlefield;
   function §\x13\n§()
   {
      super();
   }
   function get num()
   {
      return this.data.num;
   }
   function initialize(§\x1c\x1d§)
   {
      this._mcBattlefield = _loc2_;
   }
   function _release(§\x1e\t\x1c§)
   {
      this._mcBattlefield.onCellRelease(this);
   }
   function _rollOver(§\x1e\t\x1c§)
   {
      this._mcBattlefield.onCellRollOver(this);
   }
   function _rollOut(§\x1e\t\x1c§)
   {
      this._mcBattlefield.onCellRollOut(this);
   }
}
