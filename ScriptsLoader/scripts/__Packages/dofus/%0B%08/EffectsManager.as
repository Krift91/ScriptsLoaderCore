class dofus.§\x0b\b§.EffectsManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _oSprite;
   var _aEffects;
   function EffectsManager(oSprite, oAPI)
   {
      super();
      var _loc5_ = new flash.display.BitmapData();
      this.initialize(oSprite,oAPI);
   }
   function initialize(oSprite, oAPI)
   {
      super.initialize(oAPI);
      this._oSprite = oSprite;
      this._aEffects = new Array();
   }
   function getEffects()
   {
      return this._aEffects;
   }
   function addEffect(§\x1e\x19\x12§)
   {
      var _loc3_ = 0;
      while(_loc3_ < this._aEffects.length)
      {
         var _loc4_ = this._aEffects[_loc3_];
         if(_loc4_.spellID == _loc2_.spellID && (_loc4_.type == _loc2_.type && _loc4_.remainingTurn == _loc2_.remainingTurn))
         {
            _loc4_.param1 += _loc2_.param1;
            return undefined;
         }
         _loc3_ = _loc3_ + 1;
      }
      this._aEffects.push(_loc2_);
   }
   function terminateAllEffects()
   {
      var _loc2_ = this._aEffects.length;
      while((_loc2_ = _loc2_ - 1) >= 0)
      {
         var _loc3_ = this._aEffects[_loc2_];
         this._aEffects.splice(_loc2_,_loc2_ + 1);
      }
   }
   function removeEffectsByCasterID(sCasterID)
   {
      if(sCasterID == undefined)
      {
         return undefined;
      }
      var _loc3_ = this._aEffects.length;
      while((_loc3_ = _loc3_ - 1) >= 0)
      {
         var _loc4_ = this._aEffects[_loc3_];
         if(_loc4_.sCasterID == sCasterID)
         {
            this._aEffects.splice(_loc3_,1);
         }
      }
   }
   function nextTurn()
   {
      var _loc2_ = this._aEffects.length;
      while((_loc2_ = _loc2_ - 1) >= 0)
      {
         var _loc3_ = this._aEffects[_loc2_];
         _loc3_.remainingTurn--;
         if(_loc3_.remainingTurn <= 0)
         {
            this._aEffects.splice(_loc2_,1);
         }
      }
   }
}
