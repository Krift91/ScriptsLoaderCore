class dofus.datacenter.Storage extends Object
{
   var dispatchEvent;
   var _eaInventory;
   var _nKamas;
   var _bLocalOwner = false;
   var _bLocked = false;
   function Storage()
   {
      super();
      this.initialize();
   }
   function set localOwner(§\x17\x1d§)
   {
      this._bLocalOwner = _loc2_;
   }
   function get localOwner()
   {
      return this._bLocalOwner;
   }
   function set isLocked(§\x17\x1c§)
   {
      this._bLocked = _loc2_;
      this.dispatchEvent({type:"locked",value:_loc2_});
   }
   function get isLocked()
   {
      return this._bLocked;
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
   function set Kama(§\x03\x1b§)
   {
      this._nKamas = _loc2_;
      this.dispatchEvent({type:"kamaChanged",value:_loc2_});
   }
   function get Kama()
   {
      return this._nKamas;
   }
   function initialize()
   {
      eval("\t\x04").events["\x0f\x03"].initialize(this);
   }
}
