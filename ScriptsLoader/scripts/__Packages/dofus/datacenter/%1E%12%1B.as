class dofus.datacenter.§\x1e\x12\x1b§ extends dofus.datacenter.Exchange
{
   var _eaCoopGarbage;
   var _eaPayGarbage;
   var _eaPayIfSuccessGarbage;
   var dispatchEvent;
   var _nPayKama = 0;
   var _nPayIfSuccessKama = 0;
   function §\x1e\x12\x1b§(§\x05\x1b§)
   {
      super();
      this.initialize(_loc3_);
   }
   function get coopGarbage()
   {
      return this._eaCoopGarbage;
   }
   function get payGarbage()
   {
      return this._eaPayGarbage;
   }
   function get payIfSuccessGarbage()
   {
      return this._eaPayIfSuccessGarbage;
   }
   function set payKama(§\x03\x1d§)
   {
      this._nPayKama = _loc2_;
      this.dispatchEvent({type:"payKamaChange",value:_loc2_});
   }
   function get payKama()
   {
      return this._nPayKama;
   }
   function set payIfSuccessKama(§\x03\x1d§)
   {
      this._nPayIfSuccessKama = _loc2_;
      this.dispatchEvent({type:"payIfSuccessKamaChange",value:_loc2_});
   }
   function get payIfSuccessKama()
   {
      return this._nPayIfSuccessKama;
   }
   function initialize(§\x05\x1b§)
   {
      super.initialize(_loc3_);
      this._eaCoopGarbage = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaPayGarbage = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaPayIfSuccessGarbage = new ank["\x1e\n\x07"]["\x0f\x01"]();
   }
   function clearCoopGarbage()
   {
      this._eaCoopGarbage.removeAll();
   }
   function clearPayGarbage()
   {
      this._eaPayGarbage.removeAll();
   }
   function clearPayIfSuccessGarbage()
   {
      this._eaPayIfSuccessGarbage.removeAll();
   }
}
