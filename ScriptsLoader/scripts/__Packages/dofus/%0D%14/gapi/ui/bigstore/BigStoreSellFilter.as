class dofus.§\r\x14§.gapi.ui.bigstore.BigStoreSellFilter implements dofus.§\r\x14§.gapi.controls.§\f\x0f§.§\f\x18§
{
   var _nMaximalLevel = null;
   var _aAllowedTypes = null;
   function BigStoreSellFilter(maximalLevel, allowedTypes)
   {
      this._nMaximalLevel = maximalLevel;
      this._aAllowedTypes = allowedTypes;
   }
   function isItemListed(§\f\x0b§)
   {
      if(this._nMaximalLevel != null && _loc2_.level > this._nMaximalLevel)
      {
         return false;
      }
      var _loc3_ = false;
      for(var i in this._aAllowedTypes)
      {
         if(_loc2_.type == Number(this._aAllowedTypes[i]))
         {
            _loc3_ = true;
            break;
         }
      }
      if(!_loc3_)
      {
         return false;
      }
      return true;
   }
}
