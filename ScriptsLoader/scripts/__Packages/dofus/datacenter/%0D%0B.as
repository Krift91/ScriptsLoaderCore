class dofus.datacenter.§\r\x0b§ extends Object
{
   var _nRights;
   function §\r\x0b§(§\x1e\x1e\x04§)
   {
      super();
      this._nRights = _loc3_;
   }
   function get value()
   {
      return this._nRights;
   }
   function set value(§\x1e\x1b\n§)
   {
      this._nRights = _loc2_;
   }
   function get isBoss()
   {
      return (this._nRights & 1) == 1;
   }
   function get canManageBoost()
   {
      return this.isBoss || (this._nRights & 2) == 2;
   }
   function get canManageRights()
   {
      return this.isBoss || (this._nRights & 4) == 4;
   }
   function get canInvite()
   {
      return this.isBoss || (this._nRights & 8) == 8;
   }
   function get canBann()
   {
      return this.isBoss || (this._nRights & 0x10) == 16;
   }
   function get canManageXPContitribution()
   {
      return this.isBoss || (this._nRights & 0x20) == 32;
   }
   function get canManageRanks()
   {
      return this.isBoss || (this._nRights & 0x40) == 64;
   }
   function get canHireTaxCollector()
   {
      return this.isBoss || (this._nRights & 0x80) == 128;
   }
   function get canManageOwnXPContitribution()
   {
      return this.isBoss || (this._nRights & 0x0100) == 256;
   }
   function get canCollect()
   {
      return this.isBoss || (this._nRights & 0x0200) == 512;
   }
   function get canUseMountPark()
   {
      return this.isBoss || (this._nRights & 0x1000) == 4096;
   }
   function get canArrangeMountPark()
   {
      return this.isBoss || (this._nRights & 0x2000) == 8192;
   }
   function get canManageOtherMount()
   {
      return this.isBoss || (this._nRights & 0x4000) == 16384;
   }
}
