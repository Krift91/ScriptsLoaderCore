class dofus.datacenter.PlayerShop extends Object
{
   var _eaInventory;
   var dispatchEvent;
   function PlayerShop()
   {
      super();
      this.initialize();
   }
   function set inventory(§\x10\x06§)
   {
      this._eaInventory = _loc2_;
      this.dispatchEvent({type:"modelChanged"});
   }
   function get inventory()
   {
      return this._eaInventory;
   }
   function initialize()
   {
      eval("\t\x04").events["\x0f\x03"].initialize(this);
   }
}
