class dofus.datacenter.Shop extends Object
{
   var _sID;
   var _sName;
   var _sGfx;
   var _eaInventory;
   var dispatchEvent;
   function Shop()
   {
      super();
      this.initialize();
   }
   function set id(sID)
   {
      this._sID = sID;
   }
   function get id()
   {
      return this._sID;
   }
   function set name(§\x1e\x0f\x16§)
   {
      this._sName = _loc2_;
   }
   function get name()
   {
      return this._sName;
   }
   function set gfx(§\x1e\x11\x1d§)
   {
      this._sGfx = _loc2_;
   }
   function get gfx()
   {
      return this._sGfx;
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
