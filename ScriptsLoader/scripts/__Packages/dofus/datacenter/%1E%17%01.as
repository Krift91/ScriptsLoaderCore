class dofus.datacenter.§\x1e\x17\x01§ extends dofus.datacenter.§\x1e\x16\x13§
{
   var modelID;
   var _lang;
   function §\x1e\x17\x01§(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID, nModelID)
   {
      super();
      this.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_,gfxID);
      this.modelID = nModelID;
      this._lang = _global.API.lang.getMountText(nModelID);
   }
   function get color1()
   {
      return this._lang.c1;
   }
   function get color2()
   {
      return this._lang.c2;
   }
   function get color3()
   {
      return this._lang.c3;
   }
   function get modelName()
   {
      return this._lang.n;
   }
}
