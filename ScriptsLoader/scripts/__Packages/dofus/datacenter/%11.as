class dofus.datacenter.§\x11§ extends Object
{
   var api;
   var _nUnicID;
   var _nType;
   var _oItemText;
   var _nFrame;
   function §\x11§(§\x1e\x1b\x10§, §\x1e\x1b\x13§, §\x04\x1d§)
   {
      super();
      this.api = _global.API;
      this.initialize(_loc3_,_loc4_,_loc5_);
   }
   function get unicID()
   {
      return this._nUnicID;
   }
   function get type()
   {
      if(this._nType != undefined)
      {
         return this._nType;
      }
      return this._oItemText.t;
   }
   function get gfxID()
   {
      return this._oItemText.g;
   }
   function get gfx()
   {
      return this.type + "_" + this.gfxID;
   }
   function get frame()
   {
      return this._nFrame;
   }
   function initialize(§\x1e\x1b\x10§, §\x1e\x1b\x13§, §\x04\x1d§)
   {
      this._nUnicID = _loc2_;
      if(_loc4_ != undefined)
      {
         this._nFrame = _loc4_;
      }
      if(_loc3_ != undefined)
      {
         this._nType = _loc3_;
      }
      this._oItemText = this.api.lang.getItemUnicText(_loc2_);
   }
}
