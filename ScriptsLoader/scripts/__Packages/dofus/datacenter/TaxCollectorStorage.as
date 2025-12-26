class dofus.datacenter.TaxCollectorStorage extends dofus.datacenter.Shop
{
   var _nKamas;
   var dispatchEvent;
   function TaxCollectorStorage()
   {
      super();
      this.initialize();
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
}
