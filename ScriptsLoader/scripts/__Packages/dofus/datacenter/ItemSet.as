class dofus.datacenter.ItemSet extends Object
{
   var _nID;
   var api;
   var _aItems;
   var _aEffects;
   var _sEffects;
   function ItemSet(§\x04\x12§, §\x1e\x12\x1a§, §\x1e\x11§)
   {
      super();
      this.initialize(_loc3_,_loc4_,_loc5_);
   }
   function get id()
   {
      return this._nID;
   }
   function get name()
   {
      return this.api.lang.getItemSetText(this._nID).n;
   }
   function get description()
   {
      return this.api.lang.getItemSetText(this._nID).d;
   }
   function get itemCount()
   {
      return this._aItems.length;
   }
   function get items()
   {
      return this._aItems;
   }
   function get effects()
   {
      return dofus.datacenter["\f\f"].getItemDescriptionEffects(this._aEffects);
   }
   function initialize(§\x04\x12§, §\x1e\x12\x1a§, §\x1e\x11§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = "";
      }
      if(_loc4_ == undefined)
      {
         _loc4_ = [];
      }
      this.api = _global.API;
      this._nID = _loc2_;
      this.setEffects(_loc3_);
      this.setItems(_loc4_);
   }
   function setEffects(§\x12\x0f§)
   {
      this._sEffects = _loc2_;
      this._aEffects = new Array();
      var _loc3_ = _loc2_.split(",");
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc4_].split("#");
         _loc5_[0] = _global.parseInt(_loc5_[0],16);
         _loc5_[1] = _loc5_[1] != "0" ? _global.parseInt(_loc5_[1],16) : undefined;
         _loc5_[2] = _loc5_[2] != "0" ? _global.parseInt(_loc5_[2],16) : undefined;
         _loc5_[3] = _loc5_[3] != "0" ? _global.parseInt(_loc5_[3],16) : undefined;
         this._aEffects.push(_loc5_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function setItems(§\x1e\x11§)
   {
      var _loc3_ = this.api.lang.getItemSetText(this._nID).i;
      this._aItems = new Array();
      var _loc4_ = new Object();
      for(var k in _loc2_)
      {
         _loc4_[_loc2_[k]] = true;
      }
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         var _loc6_ = Number(_loc3_[_loc5_]);
         if(!_global.isNaN(_loc6_))
         {
            var _loc7_ = new dofus.datacenter["\f\f"](0,_loc6_,1);
            var _loc8_ = _loc4_[_loc6_] == true;
            this._aItems.push({isEquiped:_loc8_,item:_loc7_});
         }
         _loc5_ = _loc5_ + 1;
      }
   }
}
