class dofus.§\x0b\b§.SpellsBoostsManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _oSpellsModificators;
   static var _aBoostedEffects;
   static var _aDamagingEffects;
   static var _aHealingEffects;
   static var ACTION_BOOST_SPELL_RANGE = 281;
   static var ACTION_BOOST_SPELL_RANGEABLE = 282;
   static var ACTION_BOOST_SPELL_DMG = 283;
   static var ACTION_BOOST_SPELL_HEAL = 284;
   static var ACTION_BOOST_SPELL_AP_COST = 285;
   static var ACTION_BOOST_SPELL_CAST_INTVL = 286;
   static var ACTION_BOOST_SPELL_CC = 287;
   static var ACTION_BOOST_SPELL_CASTOUTLINE = 288;
   static var ACTION_BOOST_SPELL_NOLINEOFSIGHT = 289;
   static var ACTION_BOOST_SPELL_MAXPERTURN = 290;
   static var ACTION_BOOST_SPELL_MAXPERTARGET = 291;
   static var ACTION_BOOST_SPELL_SET_INTVL = 292;
   static var _sSelf = null;
   function SpellsBoostsManager(oAPI)
   {
      super();
      dofus["\x0b\b"].SpellsBoostsManager._sSelf = this;
      this.initialize(oAPI);
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].SpellsBoostsManager._sSelf;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      this.clear();
   }
   function clear()
   {
      this._oSpellsModificators = new Object();
      delete dofus["\x0b\b"].SpellsBoostsManager._aBoostedEffects;
      delete dofus["\x0b\b"].SpellsBoostsManager._aDamagingEffects;
      delete dofus["\x0b\b"].SpellsBoostsManager._aHealingEffects;
   }
   function getSpellModificator(§\x05§, §\x1e\x0e\x17§)
   {
      if(_global.isNaN(this._oSpellsModificators[_loc2_][_loc3_]) || this._oSpellsModificators[_loc2_][_loc3_] == undefined)
      {
         return -1;
      }
      return Number(this._oSpellsModificators[_loc2_][_loc3_]);
   }
   function setSpellModificator(§\x05§, §\x1e\x0e\x17§, §\n\x02§)
   {
      if(typeof this._oSpellsModificators[_loc2_] != "object" && this._oSpellsModificators[_loc2_] == undefined)
      {
         this._oSpellsModificators[_loc2_] = new Object();
      }
      this._oSpellsModificators[_loc2_][_loc3_] = _loc4_;
   }
   function isBoostedDamagingEffect(§\x0f\x0b§)
   {
      if(dofus["\x0b\b"].SpellsBoostsManager._aDamagingEffects == undefined)
      {
         this.computeBoostedEffectsLists();
      }
      var _loc3_ = 0;
      while(_loc3_ < dofus["\x0b\b"].SpellsBoostsManager._aDamagingEffects.length)
      {
         if(dofus["\x0b\b"].SpellsBoostsManager._aDamagingEffects[_loc3_] == _loc2_)
         {
            return true;
         }
         _loc3_ = _loc3_ + 1;
      }
      return false;
   }
   function isBoostedHealingEffect(§\x0f\x0b§)
   {
      if(dofus["\x0b\b"].SpellsBoostsManager._aHealingEffects == undefined)
      {
         this.computeBoostedEffectsLists();
      }
      var _loc3_ = 0;
      while(_loc3_ < dofus["\x0b\b"].SpellsBoostsManager._aHealingEffects.length)
      {
         if(dofus["\x0b\b"].SpellsBoostsManager._aHealingEffects[_loc3_] == _loc2_)
         {
            return true;
         }
         _loc3_ = _loc3_ + 1;
      }
      return false;
   }
   function isBoostedHealingOrDamagingEffect(§\x0f\x0b§)
   {
      if(dofus["\x0b\b"].SpellsBoostsManager._aBoostedEffects == undefined)
      {
         this.computeBoostedEffectsLists();
      }
      var _loc3_ = 0;
      while(_loc3_ < dofus["\x0b\b"].SpellsBoostsManager._aBoostedEffects.length)
      {
         if(dofus["\x0b\b"].SpellsBoostsManager._aBoostedEffects[_loc3_] == _loc2_)
         {
            return true;
         }
         _loc3_ = _loc3_ + 1;
      }
      return false;
   }
   function computeBoostedEffectsLists()
   {
      dofus["\x0b\b"].SpellsBoostsManager._aBoostedEffects = new Array();
      dofus["\x0b\b"].SpellsBoostsManager._aDamagingEffects = this.api.lang.getBoostedDamagingEffects();
      dofus["\x0b\b"].SpellsBoostsManager._aHealingEffects = this.api.lang.getBoostedHealingEffects();
      var _loc2_ = 0;
      while(_loc2_ < dofus["\x0b\b"].SpellsBoostsManager._aDamagingEffects.length)
      {
         dofus["\x0b\b"].SpellsBoostsManager._aBoostedEffects.push(dofus["\x0b\b"].SpellsBoostsManager._aDamagingEffects[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_ = 0;
      while(_loc3_ < dofus["\x0b\b"].SpellsBoostsManager._aHealingEffects.length)
      {
         dofus["\x0b\b"].SpellsBoostsManager._aBoostedEffects.push(dofus["\x0b\b"].SpellsBoostsManager._aHealingEffects[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
   }
}
