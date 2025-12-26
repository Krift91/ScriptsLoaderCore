class dofus.datacenter.§\x1e\f§ implements com.ankamagames.§\f\x10§.§\r\x01§
{
   var api;
   var _nIndex;
   var _nValue;
   var fallenAngelDemon = false;
   function §\x1e\f§(§\x04\n§, §\x1e\x1b\n§)
   {
      this.api = _global.API;
      this.initialize(_loc2_,_loc3_);
   }
   function get index()
   {
      return this._nIndex;
   }
   function set index(§\x04\n§)
   {
      this._nIndex = !(_global.isNaN(_loc2_) || _loc2_ == undefined) ? _loc2_ : 0;
   }
   function get name()
   {
      if(this._nIndex == -1)
      {
         return "";
      }
      return this.api.lang.getAlignment(this._nIndex).n;
   }
   function get value()
   {
      return this._nValue;
   }
   function set value(§\x1e\x1b\n§)
   {
      this._nValue = !(_global.isNaN(_loc2_) || _loc2_ == undefined) ? _loc2_ : 0;
   }
   function get frame()
   {
      if(this._nValue <= 20)
      {
         return 1;
      }
      if(this._nValue <= 40)
      {
         return 2;
      }
      if(this._nValue <= 60)
      {
         return 3;
      }
      if(this._nValue <= 80)
      {
         return 4;
      }
      return 5;
   }
   function get iconFile()
   {
      return dofus.Constants.ALIGNMENTS_PATH + this._nIndex + ".swf";
   }
   function initialize(§\x04\n§, §\x1e\x1b\n§)
   {
      this._nIndex = !(_global.isNaN(_loc2_) || _loc2_ == undefined) ? _loc2_ : 0;
      this._nValue = !(_global.isNaN(_loc3_) || _loc3_ == undefined) ? _loc3_ : 0;
   }
   function clone()
   {
      return new dofus.datacenter["\x1e\f"](this._nIndex,this._nValue);
   }
   function compareTo(§\x1e\x1a\t§)
   {
      var _loc3_ = dofus.datacenter["\x1e\f"](_loc2_);
      if(_loc3_.index == this._nIndex)
      {
         return 0;
      }
      return -1;
   }
}
