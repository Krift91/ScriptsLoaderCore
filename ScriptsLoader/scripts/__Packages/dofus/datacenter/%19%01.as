class dofus.datacenter.§\x19\x01§ extends dofus.datacenter.Shop
{
   var _nQuantity1;
   var _nQuantity2;
   var _nQuantity3;
   var _aTypes;
   var _nTax;
   var _nMaxLevel;
   var _nMaxItemCount;
   var _eaInventory2;
   var dispatchEvent;
   function §\x19\x01§()
   {
      super();
      this.initialize();
   }
   function set quantity1(§\x1e\x1e\x1d§)
   {
      this._nQuantity1 = _loc2_;
   }
   function get quantity1()
   {
      return this._nQuantity1;
   }
   function set quantity2(§\x1e\x1e\x1c§)
   {
      this._nQuantity2 = _loc2_;
   }
   function get quantity2()
   {
      return this._nQuantity2;
   }
   function set quantity3(§\x1e\x1e\x1b§)
   {
      this._nQuantity3 = _loc2_;
   }
   function get quantity3()
   {
      return this._nQuantity3;
   }
   function set types(§\x1d\x04§)
   {
      this._aTypes = _loc2_;
   }
   function get types()
   {
      return this._aTypes;
   }
   function get typesObj()
   {
      var _loc2_ = new Object();
      for(var k in this._aTypes)
      {
         _loc2_[this._aTypes[k]] = true;
      }
      return _loc2_;
   }
   function set tax(§\x1e\x1c\t§)
   {
      this._nTax = _loc2_;
   }
   function get tax()
   {
      return this._nTax;
   }
   function set maxLevel(§\x02\x1c§)
   {
      this._nMaxLevel = _loc2_;
   }
   function get maxLevel()
   {
      return this._nMaxLevel;
   }
   function set maxItemCount(§\x03\x01§)
   {
      this._nMaxItemCount = _loc2_;
   }
   function get maxItemCount()
   {
      return this._nMaxItemCount;
   }
   function set inventory2(§\x10\x06§)
   {
      this._eaInventory2 = _loc2_;
      this.dispatchEvent({type:"modelChanged2"});
   }
   function get inventory2()
   {
      return this._eaInventory2;
   }
}
