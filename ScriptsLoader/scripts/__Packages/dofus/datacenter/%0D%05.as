class dofus.datacenter.§\r\x05§ extends Object
{
   var api;
   var _oData;
   function §\r\x05§(§\x11\x0e§)
   {
      super();
      this.api = _global.API;
      this._oData = _loc3_;
   }
   function get mapID()
   {
      return this._oData.m;
   }
   function get name()
   {
      return this._oData.n;
   }
   function get category()
   {
      return this.api.lang.getHintsCategory(this.categoryID).n;
   }
   function get categoryID()
   {
      return this._oData.c;
   }
   function get coordinates()
   {
      return this.x + ", " + this.y;
   }
   function get x()
   {
      if(this._oData.m == undefined)
      {
         return this._oData.x;
      }
      return this.api.lang.getMapText(this._oData.m).x;
   }
   function get y()
   {
      if(this._oData.m == undefined)
      {
         return this._oData.y;
      }
      return this.api.lang.getMapText(this._oData.m).y;
   }
   function get superAreaID()
   {
      var _loc2_ = this.api.lang.getMapText(this._oData.m).sa;
      var _loc3_ = this.api.lang.getMapSubAreaText(_loc2_).a;
      var _loc4_ = this.api.lang.getMapAreaText(_loc3_).sua;
      return _loc4_;
   }
   function get gfx()
   {
      return this._oData.g;
   }
}
