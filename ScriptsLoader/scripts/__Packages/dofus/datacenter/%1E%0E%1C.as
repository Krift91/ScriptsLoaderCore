class dofus.datacenter.§\x1e\x0e\x1c§ extends Object
{
   var _nID;
   var _oSpellText;
   var _nLevel;
   var _nMaxLevel;
   var _nPosition;
   var _nAnimID;
   var _bSummonSpell;
   var _bInFrontOfSprite;
   var api;
   var _aEffectZones;
   var _aRequiredStates;
   var _aForbiddenStates;
   var _minPlayerLevel;
   function §\x1e\x0e\x1c§(§\x04\x12§, §\x03\x11§, §\x1e\x13\x12§)
   {
      super();
      this.initialize(_loc3_,_loc4_,_loc5_);
   }
   function get ID()
   {
      return this._nID;
   }
   function get isValid()
   {
      return this._oSpellText["l" + this._nLevel] != undefined;
   }
   function get maxLevel()
   {
      return this._nMaxLevel;
   }
   function set level(§\x03\x11§)
   {
      this._nLevel = _loc2_;
   }
   function get level()
   {
      return this._nLevel;
   }
   function set position(§\x01\n§)
   {
      this._nPosition = _loc2_;
   }
   function get position()
   {
      return this._nPosition;
   }
   function set animID(§\b\x12§)
   {
      this._nAnimID = _loc2_;
   }
   function get animID()
   {
      return this._nAnimID;
   }
   function get summonSpell()
   {
      return this._bSummonSpell;
   }
   function get glyphSpell()
   {
      return this.searchIfGlyph(this.getSpellLevelText(0));
   }
   function get trapSpell()
   {
      return this.searchIfTrap(this.getSpellLevelText(0));
   }
   function set inFrontOfSprite(§\x18\x18§)
   {
      this._bInFrontOfSprite = _loc2_;
   }
   function get inFrontOfSprite()
   {
      return this._bInFrontOfSprite;
   }
   function get iconFile()
   {
      return dofus.Constants.SPELLS_ICONS_PATH + this._nID + ".swf";
   }
   function get file()
   {
      return dofus.Constants.SPELLS_PATH + this._nAnimID + ".swf";
   }
   function get name()
   {
      return this._oSpellText.n;
   }
   function get description()
   {
      return this._oSpellText.d;
   }
   function get apCost()
   {
      var _loc2_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_AP_COST,this._nID);
      var _loc3_ = this.getSpellLevelText(2);
      if(_loc2_ > -1)
      {
         return _loc3_ - _loc2_;
      }
      return _loc3_;
   }
   function get rangeMin()
   {
      return this.getSpellLevelText(3);
   }
   function get rangeMax()
   {
      var _loc2_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_RANGE,this._nID);
      var _loc3_ = this.getSpellLevelText(4);
      if(_loc2_ > -1)
      {
         return _loc3_ + _loc2_;
      }
      return _loc3_;
   }
   function get rangeStr()
   {
      return (this.rangeMin == 0 ? "" : this.rangeMin + " " + this.api.lang.getText("TO_RANGE") + " ") + this.rangeMax;
   }
   function get criticalHit()
   {
      var _loc2_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_CC,this._nID);
      var _loc3_ = this.getSpellLevelText(5);
      if(_loc2_ > -1)
      {
         return _loc3_ <= 0 ? 0 : Math.max(_loc3_ - _loc2_,2);
      }
      return _loc3_;
   }
   function get actualCriticalHit()
   {
      return this.api.kernel.GameManager.getCriticalHitChance(this.criticalHit);
   }
   function get criticalFailure()
   {
      return this.getSpellLevelText(6);
   }
   function get lineOnly()
   {
      var _loc2_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_CASTOUTLINE,this._nID);
      var _loc3_ = this.getSpellLevelText(7);
      if(_loc2_ > 0)
      {
         return false;
      }
      return _loc3_;
   }
   function get lineOfSight()
   {
      var _loc2_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_NOLINEOFSIGHT,this._nID);
      var _loc3_ = this.getSpellLevelText(8);
      if(_loc2_ > 0)
      {
         return false;
      }
      return _loc3_;
   }
   function get freeCell()
   {
      return this.getSpellLevelText(9);
   }
   function get canBoostRange()
   {
      var _loc2_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_RANGEABLE,this._nID);
      var _loc3_ = this.getSpellLevelText(10);
      if(_loc2_ > 0)
      {
         return true;
      }
      return _loc3_;
   }
   function get classID()
   {
      return this.getSpellLevelText(11);
   }
   function get launchCountByTurn()
   {
      var _loc2_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_MAXPERTURN,this._nID);
      var _loc3_ = this.getSpellLevelText(12);
      if(_loc2_ > -1)
      {
         return _loc3_ + _loc2_;
      }
      return _loc3_;
   }
   function get launchCountByPlayerTurn()
   {
      var _loc2_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_MAXPERTARGET,this._nID);
      var _loc3_ = this.getSpellLevelText(13);
      if(_loc2_ > -1)
      {
         return _loc3_ + _loc2_;
      }
      return _loc3_;
   }
   function get delayBetweenLaunch()
   {
      var _loc2_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_CAST_INTVL,this._nID);
      var _loc3_ = this.api.kernel.SpellsBoostsManager.getSpellModificator(dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_SET_INTVL,this._nID);
      var _loc4_ = _loc3_ <= -1 ? this.getSpellLevelText(14) : _loc3_;
      if(_loc2_ > -1)
      {
         return _loc4_ - _loc2_;
      }
      return _loc4_;
   }
   function get descriptionNormalHit()
   {
      return this.api.kernel.GameManager.getSpellDescriptionWithEffects(this.getSpellLevelText(0),false,this._nID);
   }
   function get descriptionCriticalHit()
   {
      return this.api.kernel.GameManager.getSpellDescriptionWithEffects(this.getSpellLevelText(1),false,this._nID);
   }
   function get effectsNormalHit()
   {
      return this.api.kernel.GameManager.getSpellEffects(this.getSpellLevelText(0),this._nID);
   }
   function get effectsCriticalHit()
   {
      return this.api.kernel.GameManager.getSpellEffects(this.getSpellLevelText(1),this._nID);
   }
   function get effectsNormalHitWithArea()
   {
      var _loc2_ = this.api.kernel.GameManager.getSpellEffects(this.getSpellLevelText(0),this._nID);
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = 0;
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.length)
      {
         var _loc6_ = new Object();
         _loc6_.fx = _loc2_[_loc5_];
         _loc6_.at = this._aEffectZones[_loc4_ + _loc5_].shape;
         _loc6_.ar = this._aEffectZones[_loc4_ + _loc5_].size;
         _loc3_.push(_loc6_);
         _loc5_ = _loc5_ + 1;
      }
      return _loc3_;
   }
   function get effectsCriticalHitWithArea()
   {
      var _loc2_ = this.api.kernel.GameManager.getSpellEffects(this.getSpellLevelText(1),this._nID);
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = this.effectsNormalHit.length;
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.length)
      {
         var _loc6_ = new Object();
         _loc6_.fx = _loc2_[_loc5_];
         _loc6_.at = this._aEffectZones[_loc4_ + _loc5_].shape;
         _loc6_.ar = this._aEffectZones[_loc4_ + _loc5_].size;
         _loc3_.push(_loc6_);
         _loc5_ = _loc5_ + 1;
      }
      return _loc3_;
   }
   function get requiredStates()
   {
      return this._aRequiredStates;
   }
   function get forbiddenStates()
   {
      return this._aForbiddenStates;
   }
   function get needStates()
   {
      return this._aRequiredStates.length > 0 || this._aForbiddenStates.length > 0;
   }
   function get minPlayerLevel()
   {
      return Number(this.getSpellLevelText(18));
   }
   function get normalMinPlayerLevel()
   {
      return Number(this.getSpellLevelText(18,1));
   }
   function get criticalFailureEndsTheTurn()
   {
      return this.getSpellLevelText(19);
   }
   function get elements()
   {
      var _loc2_ = {none:false,neutral:false,earth:false,fire:false,water:false,air:false};
      var _loc3_ = this.effectsNormalHit;
      for(var k in _loc3_)
      {
         var _loc4_ = _loc3_[k].element;
         switch(_loc4_)
         {
            case "N":
               _loc2_.neutral = true;
               break;
            case "E":
               _loc2_.earth = true;
               break;
            case "F":
               _loc2_.fire = true;
               break;
            case "W":
               _loc2_.water = true;
               break;
            case "A":
               _loc2_.air = true;
               break;
            default:
               _loc2_.none = true;
         }
      }
      return _loc2_;
   }
   function get effectZones()
   {
      return this._aEffectZones;
   }
   function initialize(§\x04\x12§, §\x03\x11§, §\x1e\x13\x12§)
   {
      this.api = _global.API;
      this._nID = _loc2_;
      this._nLevel = _loc3_;
      this._nPosition = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc4_);
      if(this._nPosition > 29 || this._nPosition < 1)
      {
         this._nPosition = null;
      }
      this._oSpellText = this.api.lang.getSpellText(_loc2_);
      var _loc5_ = this.getSpellLevelText(15);
      var _loc6_ = _loc5_.split("");
      this._aEffectZones = new Array();
      var _loc7_ = 0;
      while(_loc7_ < _loc6_.length)
      {
         this._aEffectZones.push({shape:_loc6_[_loc7_],size:ank["\x1e\n\x07"]["\x12\r"].decode64(_loc6_[_loc7_ + 1])});
         _loc7_ += 2;
      }
      this._bSummonSpell = this.searchIfSummon(this.getSpellLevelText(0)) || this.searchIfSummon(this.getSpellLevelText(1));
      this._nMaxLevel = 1;
      var _loc8_ = 1;
      while(_loc8_ <= dofus.Constants.SPELL_BOOST_MAX_LEVEL)
      {
         if(this._oSpellText["l" + _loc8_] == undefined)
         {
            break;
         }
         this._nMaxLevel = _loc8_;
         _loc8_ = _loc8_ + 1;
      }
      this._aRequiredStates = this.getSpellLevelText(16);
      this._aForbiddenStates = this.getSpellLevelText(17);
      this._minPlayerLevel = this.normalMinPlayerLevel;
   }
   function getSpellLevelText(§\x01\x05§, §\x03\x11§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = this._nLevel;
      }
      return this._oSpellText["l" + _loc3_][_loc2_];
   }
   function searchIfSummon(§\x1e\x1c§)
   {
      var _loc3_ = _loc2_.length;
      if(typeof _loc2_ == "object")
      {
         var _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var _loc5_ = _loc2_[_loc4_][0];
            if(_loc5_ == 180 || _loc5_ == 181)
            {
               return true;
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      return false;
   }
   function searchIfGlyph(§\x1e\x1c§)
   {
      var _loc3_ = _loc2_.length;
      if(typeof _loc2_ == "object")
      {
         var _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var _loc5_ = _loc2_[_loc4_][0];
            if(_loc5_ == 401)
            {
               return true;
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      return false;
   }
   function searchIfTrap(§\x1e\x1c§)
   {
      var _loc3_ = _loc2_.length;
      if(typeof _loc2_ == "object")
      {
         var _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var _loc5_ = _loc2_[_loc4_][0];
            if(_loc5_ == 400)
            {
               return true;
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      return false;
   }
}
