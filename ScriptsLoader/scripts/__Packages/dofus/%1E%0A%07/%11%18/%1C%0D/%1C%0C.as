class dofus.§\x1e\n\x07§.§\x11\x18§.§\x1c\r§.§\x1c\f§ extends dofus.§\x1e\n\x07§.§\x1d\x19§ implements dofus.§\x1e\n\x07§.§\x11\x18§.§\f\x1d§
{
   var _sOperator;
   var _nValue;
   function §\x1c\f§(§\x1e\x0f\x0b§, §\x1e\x1b\n§)
   {
      super();
      this._sOperator = _loc3_;
      this._nValue = _loc4_;
   }
   function isFilled()
   {
      var _loc2_ = this.api.datacenter.Basics.aks_current_regional_version;
      switch(this._sOperator)
      {
         case "=":
            return _loc2_ == this._nValue;
         case "!":
            return _loc2_ != this._nValue;
         case ">":
            return _loc2_ > this._nValue;
         case "<":
            return _loc2_ < this._nValue;
         default:
            return false;
      }
   }
   function check()
   {
      return "=!<>".indexOf(this._sOperator) > -1;
   }
}
