class dofus.datacenter.Exchange extends Object
{
   var _eaInventory;
   var _eaLocalGarbage;
   var _eaDistantGarbage;
   var _eaCoopGarbage;
   var _eaReadyStates;
   var _nDistantPlayerID;
   var dispatchEvent;
   var _nLocalKama = 0;
   var _nDistantKama = 0;
   function Exchange(§\x05\x1b§)
   {
      super();
      this.initialize(_loc3_);
   }
   function set inventory(§\x10\x06§)
   {
      this._eaInventory = _loc2_;
   }
   function get inventory()
   {
      return this._eaInventory;
   }
   function get localGarbage()
   {
      return this._eaLocalGarbage;
   }
   function get distantGarbage()
   {
      return this._eaDistantGarbage;
   }
   function get coopGarbage()
   {
      return this._eaCoopGarbage;
   }
   function get readyStates()
   {
      return this._eaReadyStates;
   }
   function get distantPlayerID()
   {
      return this._nDistantPlayerID;
   }
   function set localKama(§\x03\x0e§)
   {
      this._nLocalKama = _loc2_;
      this.dispatchEvent({type:"localKamaChange",value:_loc2_});
   }
   function get localKama()
   {
      return this._nLocalKama;
   }
   function set distantKama(§\x05\x1c§)
   {
      this._nDistantKama = _loc2_;
      this.dispatchEvent({type:"distantKamaChange",value:_loc2_});
   }
   function get distantKama()
   {
      return this._nDistantKama;
   }
   function initialize(§\x05\x1b§)
   {
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this._nDistantPlayerID = _loc2_;
      this._eaLocalGarbage = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaDistantGarbage = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaCoopGarbage = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaReadyStates = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaReadyStates[0] = false;
      this._eaReadyStates[1] = false;
   }
   function clearLocalGarbage()
   {
      this._eaLocalGarbage.removeAll();
   }
   function clearDistantGarbage()
   {
      this._eaDistantGarbage.removeAll();
   }
   function clearCoopGarbage()
   {
      this._eaCoopGarbage.removeAll();
   }
}
