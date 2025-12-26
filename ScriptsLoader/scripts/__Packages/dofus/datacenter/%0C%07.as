class dofus.datacenter.§\f\x07§ extends Object
{
   var _nParams;
   var _nMinSlot;
   var _nMaxSlot;
   function §\f\x07§(§\x01\x14§, §\x02\x0f§, nMaxSlot)
   {
      super();
      this._nParams = _loc3_;
      this._nMinSlot = _loc4_ <= 1 ? 2 : _loc4_;
      this._nMaxSlot = nMaxSlot;
   }
   function get isNotFree()
   {
      return (this._nParams & 1) == 1;
   }
   function get isFreeIfFailed()
   {
      return (this._nParams & 2) == 2;
   }
   function get ressourcesNeeded()
   {
      return (this._nParams & 4) == 4;
   }
   function get minSlots()
   {
      return this._nMinSlot;
   }
   function get maxSlots()
   {
      return this._nMaxSlot;
   }
}
