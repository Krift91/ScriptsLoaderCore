class dofus.datacenter.§\x12\x01§ extends Object
{
   var api;
   var id;
   var _sName;
   var _oJob;
   var _nBreedId;
   var _nSex;
   var _nColor1;
   var _nColor2;
   var _nColor3;
   var _aAccessories;
   var _nMapId;
   function §\x12\x01§(sId, §\x1e\x0f\x16§)
   {
      super();
      this.api = _global.API;
      this.id = sId;
      this._sName = _loc4_;
   }
   function get name()
   {
      return this._sName;
   }
   function set name(§\x1e\x0f\x16§)
   {
      this._sName = _loc2_;
   }
   function get job()
   {
      return this._oJob;
   }
   function set job(§\x1e\n\x02§)
   {
      this._oJob = _loc2_;
   }
   function get breedId()
   {
      return this._nBreedId;
   }
   function set breedId(§\b\x01§)
   {
      this._nBreedId = _loc2_;
   }
   function get gfxFile()
   {
      var _loc2_ = this._nBreedId * 10 + this._nSex;
      return dofus.Constants.CLIPS_PERSOS_PATH + _loc2_ + ".swf";
   }
   function get gfxBreedFile()
   {
      return dofus.Constants.GUILDS_MINI_PATH + (this._nBreedId * 10 + this._nSex) + ".swf";
   }
   function get sex()
   {
      return this._nSex;
   }
   function set sex(§\x1e\n\x02§)
   {
      this._nSex = Number(_loc2_);
   }
   function get color1()
   {
      return this._nColor1;
   }
   function set color1(§\x1e\n\x02§)
   {
      this._nColor1 = Number(_loc2_);
   }
   function get color2()
   {
      return this._nColor2;
   }
   function set color2(§\x1e\n\x02§)
   {
      this._nColor2 = Number(_loc2_);
   }
   function get color3()
   {
      return this._nColor3;
   }
   function set color3(§\x1e\n\x02§)
   {
      this._nColor3 = Number(_loc2_);
   }
   function get accessories()
   {
      return this._aAccessories;
   }
   function set accessories(§\x1e\n\x02§)
   {
      this._aAccessories = _loc2_;
   }
   function set mapId(§\x03\f§)
   {
      this._nMapId = _loc2_;
   }
   function get subarea()
   {
      if(this._nMapId == 0)
      {
         return undefined;
      }
      var _loc2_ = this.api.lang.getMapText(this._nMapId);
      var _loc3_ = this.api.lang.getMapSubAreaText(_loc2_.sa);
      var _loc4_ = this.api.lang.getMapAreaText(_loc3_.a);
      return !(_loc3_.n.charAt(0) == "/" && _loc3_.n.charAt(1) == "/") ? _loc4_.n + " (" + _loc3_.n + ")" : _loc4_.n;
   }
   function get coord()
   {
      if(this._nMapId == 0)
      {
         return undefined;
      }
      var _loc2_ = this.api.lang.getMapText(this._nMapId);
      return {x:_loc2_.x,y:_loc2_.y};
   }
}
