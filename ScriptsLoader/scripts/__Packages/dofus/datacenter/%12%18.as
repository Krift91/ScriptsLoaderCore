class dofus.datacenter.§\x12\x18§ extends Object
{
   var _oItem;
   var api;
   var _aEffectZones;
   var _aRequiredStates;
   var _aForbiddenStates;
   var _oCloseCombatClassInfos;
   function §\x12\x18§(§\x1e\x19\x03§, §\x07\x01§)
   {
      super();
      this.initialize(_loc3_,_loc4_);
   }
   function get ID()
   {
      return 0;
   }
   function get isValid()
   {
      return true;
   }
   function get maxLevel()
   {
      return 1;
   }
   function get position()
   {
      return 0;
   }
   function get item()
   {
      return this._oItem;
   }
   function get summonSpell()
   {
      return false;
   }
   function get glyphSpell()
   {
      return false;
   }
   function get trapSpell()
   {
      return false;
   }
   function get iconFile()
   {
      if(this._oItem == undefined)
      {
         return dofus.Constants.DEFAULT_CC_ICON_FILE;
      }
      return this._oItem.iconFile;
   }
   function get name()
   {
      return this.api.lang.getText("CC_DAMAGES");
   }
   function get apCost()
   {
      if(this._oItem == undefined)
      {
         return this.getDefaultProperty(2);
      }
      return this._oItem.apCost;
   }
   function get rangeMin()
   {
      if(this._oItem == undefined)
      {
         return this.getDefaultProperty(3);
      }
      return this._oItem.rangeMin;
   }
   function get rangeMax()
   {
      if(this._oItem == undefined)
      {
         return this.getDefaultProperty(4);
      }
      return this._oItem.rangeMax;
   }
   function get rangeStr()
   {
      return (this.rangeMin == 0 ? "" : this.rangeMin + " " + this.api.lang.getText("TO_RANGE") + " ") + this.rangeMax;
   }
   function get criticalHit()
   {
      if(this._oItem == undefined)
      {
         return this.getDefaultProperty(5);
      }
      return this._oItem.criticalHit;
   }
   function get criticalFailure()
   {
      if(this._oItem == undefined)
      {
         return this.getDefaultProperty(6);
      }
      return this._oItem.criticalFailure;
   }
   function get lineOnly()
   {
      if(this._oItem == undefined)
      {
         return this.getDefaultProperty(7);
      }
      return this._oItem.lineOnly;
   }
   function get lineOfSight()
   {
      if(this._oItem == undefined)
      {
         return this.getDefaultProperty(8);
      }
      return this._oItem.lineOfSight;
   }
   function get freeCell()
   {
      return false;
   }
   function get canBoostRange()
   {
      return false;
   }
   function get classID()
   {
      return -1;
   }
   function get launchCountByTurn()
   {
      return 0;
   }
   function get launchCountByPlayerTurn()
   {
      return 0;
   }
   function get delayBetweenLaunch()
   {
      return 0;
   }
   function get descriptionVisibleEffects()
   {
      if(this._oItem == undefined)
      {
         var _loc2_ = this.getDefaultProperty(0);
         return this.api.kernel.GameManager.getSpellDescriptionWithEffects(_loc2_,true,0);
      }
      var _loc3_ = this._oItem.visibleEffects;
      var _loc4_ = new Array();
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         _loc4_.push(_loc3_[_loc5_].description);
         _loc5_ = _loc5_ + 1;
      }
      return _loc4_.join(", ");
   }
   function get descriptionNormalHit()
   {
      if(this._oItem == undefined)
      {
         var _loc2_ = this.getDefaultProperty(0);
         return this.api.kernel.GameManager.getSpellDescriptionWithEffects(_loc2_,false,0);
      }
      var _loc3_ = this._oItem.normalHit;
      var _loc4_ = new Array();
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         _loc4_.push(_loc3_.description);
         _loc5_ = _loc5_ + 1;
      }
      return _loc4_.join(", ");
   }
   function get descriptionCriticalHit()
   {
      if(this._oItem == undefined)
      {
         var _loc2_ = this.getDefaultProperty(1);
      }
      else
      {
         _loc2_ = this._oItem.criticalHitBonus;
      }
      return this.api.kernel.GameManager.getSpellDescriptionWithEffects(_loc2_,false,0);
   }
   function get effectsNormalHit()
   {
      if(this._oItem == undefined)
      {
         var _loc2_ = this.getDefaultProperty(0);
      }
      else
      {
         _loc2_ = this._oItem.normalHit;
      }
      return this.api.kernel.GameManager.getSpellEffects(_loc2_,0);
   }
   function get effectsCriticalHit()
   {
      if(this._oItem == undefined)
      {
         var _loc2_ = this.getDefaultProperty(1);
      }
      else
      {
         _loc2_ = this._oItem.criticalHitBonus;
      }
      return this.api.kernel.GameManager.getSpellEffects(_loc2_,0);
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
   function initialize(§\x1e\x19\x03§, §\x07\x01§)
   {
      this.api = _global.API;
      this._oItem = _loc2_;
      if(_loc2_ == undefined)
      {
         this._oCloseCombatClassInfos = this.api.lang.getClassText(_loc3_).cc;
      }
      var _loc4_ = this.api.lang.getItemTypeText(this._oItem.type).z;
      if(_loc4_ == undefined)
      {
         _loc4_ = "Pa";
      }
      var _loc5_ = _loc4_.split("");
      this._aEffectZones = new Array();
      var _loc6_ = 0;
      while(_loc6_ < _loc5_.length)
      {
         this._aEffectZones.push({shape:_loc5_[_loc6_],size:ank["\x1e\n\x07"]["\x12\r"].decode64(_loc5_[_loc6_ + 1])});
         _loc6_ += 2;
      }
      var _loc7_ = this.api.lang.getClassText(this.api.datacenter.Player.Guild).cc;
      this._aRequiredStates = _loc7_[9];
      this._aForbiddenStates = _loc7_[10];
   }
   function getDefaultProperty(§\x01\x05§)
   {
      return this._oCloseCombatClassInfos[_loc2_];
   }
}
