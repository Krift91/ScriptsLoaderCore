class dofus.§\x1e\n\x07§.§\x11\x18§.§\x1e\f\x05§.§\x1e\f\x04§ extends dofus.§\x1e\n\x07§.§\x1d\x19§ implements dofus.§\x1e\n\x07§.§\x11\x18§.§\f\x1d§
{
   var _sOperator;
   var _nAlignmentIndex;
   var _aSubarea;
   function §\x1e\f\x04§()
   {
      super();
   }
   function AreaCriterionAlignment(§\x1e\x0f\x0b§, §\b\x1a§)
   {
      this._sOperator = _loc2_;
      this._nAlignmentIndex = _loc3_;
      this._aSubarea = dofus.datacenter["\x1e\f\x06"](this.api.datacenter.Subareas.getItemAt(this.api.datacenter.Map.subarea));
   }
   function isFilled()
   {
      var _loc2_ = this._aSubarea.alignment;
      switch(this._sOperator)
      {
         case "=":
            return this._aSubarea.alignment.index == this._nAlignmentIndex;
         case "!":
            return this._aSubarea.alignment.index != this._nAlignmentIndex;
         default:
            return false;
      }
   }
   function check()
   {
      return "=!".indexOf(this._sOperator) > -1;
   }
}
