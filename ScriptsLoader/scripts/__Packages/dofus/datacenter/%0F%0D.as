class dofus.datacenter.§\x0f\r§ extends Object
{
   var _nType;
   var _nParam1;
   var _nParam2;
   var _nParam3;
   var _sParam4;
   var _nRemainingTurn;
   var _nSpellID;
   var api;
   var _sCasterID;
   var _nPropability = 0;
   var _nModificator = -1;
   function §\x0f\r§(sCasterID, §\t\n§, §\t\x15§, §\t\x14§, §\t\x13§, §\t\x12§, §\t\x0f§, §\t\f§, §\x02\r§)
   {
      super();
      this.initialize(sCasterID,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_);
   }
   function get type()
   {
      return this._nType;
   }
   function set probability(§\x01\x06§)
   {
      this._nPropability = _loc2_;
   }
   function get probability()
   {
      return this._nPropability;
   }
   function get param1()
   {
      return this._nParam1;
   }
   function set param1(§\x1e\n\x02§)
   {
      this._nParam1 = _loc2_;
   }
   function get param2()
   {
      return this._nParam2;
   }
   function set param2(§\x1e\n\x02§)
   {
      this._nParam2 = _loc2_;
   }
   function get param3()
   {
      return this._nParam3;
   }
   function set param3(§\x1e\n\x02§)
   {
      this._nParam3 = _loc2_;
   }
   function get param4()
   {
      return this._sParam4;
   }
   function set param4(§\x1e\n\x02§)
   {
      this._sParam4 = _loc2_;
   }
   function set remainingTurn(§\x1e\x1e\x01§)
   {
      this._nRemainingTurn = _loc2_;
   }
   function get remainingTurn()
   {
      return this._nRemainingTurn;
   }
   function get remainingTurnStr()
   {
      return this.getTurnCountStr(true);
   }
   function get spellID()
   {
      return this._nSpellID;
   }
   function get isNothing()
   {
      return this.api.lang.getEffectText(this._nType).d == "NOTHING";
   }
   function get description()
   {
      var _loc2_ = this.api.lang.getEffectText(this._nType).d;
      var _loc3_ = [this._nParam1,this._nParam2,this._nParam3,this._sParam4];
      switch(this._nType)
      {
         case 10:
            _loc3_[2] = this.api.lang.getEmoteText(this._nParam3).n;
            break;
         case 165:
            _loc3_[0] = this.api.lang.getItemTypeText(this._nParam1).n;
            break;
         case 293:
         case 294:
         case 787:
            _loc3_[0] = this.api.lang.getSpellText(this._nParam1).n;
            break;
         case 601:
            var _loc4_ = this.api.lang.getMapText(this._nParam2);
            _loc3_[0] = this.api.lang.getMapSubAreaText(_loc4_.sa).n;
            _loc3_[1] = _loc4_.x;
            _loc3_[2] = _loc4_.y;
            break;
         case 614:
            _loc3_[0] = this._nParam3;
            _loc3_[1] = this.api.lang.getJobText(this._nParam2).n;
            break;
         case 615:
            _loc3_[2] = this.api.lang.getJobText(this._nParam3).n;
            break;
         case 616:
         case 624:
            _loc3_[2] = this.api.lang.getSpellText(this._nParam3).n;
            break;
         case 699:
            _loc3_[0] = this.api.lang.getJobText(this._nParam1).n;
            break;
         case 628:
         case 623:
            _loc3_[2] = this.api.lang.getMonstersText(this._nParam3).n;
            break;
         case 715:
            _loc3_[0] = this.api.lang.getMonstersSuperRaceText(this._nParam1).n;
            break;
         case 716:
            _loc3_[0] = this.api.lang.getMonstersRaceText(this._nParam1).n;
            break;
         case 717:
            _loc3_[0] = this.api.lang.getMonstersText(this._nParam1).n;
            break;
         case 805:
         case 808:
         case 983:
            this._nParam3 = this._nParam3 != undefined ? this._nParam3 : 0;
            var _loc5_ = String(Math.floor(this._nParam2) / 100).split(".");
            var _loc6_ = Number(_loc5_[0]);
            var _loc7_ = this._nParam2 - _loc6_ * 100;
            var _loc8_ = String(Math.floor(this._nParam3) / 100).split(".");
            var _loc9_ = Number(_loc8_[0]);
            var _loc10_ = this._nParam3 - _loc9_ * 100;
            _loc3_[0] = ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this.api.lang.getConfigText("DATE_FORMAT"),[this._nParam1,new ank["\x1e\n\x07"]["\x0e\x1c"](_loc6_ + 1).addLeftChar("0",2),new ank["\x1e\n\x07"]["\x0e\x1c"](_loc7_).addLeftChar("0",2),_loc9_,new ank["\x1e\n\x07"]["\x0e\x1c"](_loc10_).addLeftChar("0",2)]);
            break;
         case 806:
            if(this._nParam2 == undefined && this._nParam3 == undefined)
            {
               _loc3_[0] = this.api.lang.getText("NORMAL");
            }
            else
            {
               _loc3_[0] = this._nParam2 <= 6 ? (this._nParam3 <= 6 ? this.api.lang.getText("NORMAL") : this.api.lang.getText("LEAN")) : this.api.lang.getText("FAT");
            }
            break;
         case 807:
            if(this._nParam3 == undefined)
            {
               _loc3_[0] = this.api.lang.getText("NO_LAST_MEAL");
            }
            else
            {
               _loc3_[0] = this.api.lang.getItemUnicText(this._nParam3).n;
            }
            break;
         case 814:
            _loc3_[0] = this.api.lang.getItemUnicText(this._nParam3).n;
            break;
         case 950:
         case 951:
            _loc3_[2] = this.api.lang.getStateText(this._nParam3);
            break;
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_AP_COST:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_RANGE:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_RANGEABLE:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_DMG:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_HEAL:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_AP_COST:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_CAST_INTVL:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_SET_INTVL:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_CC:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_CASTOUTLINE:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_NOLINEOFSIGHT:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_MAXPERTURN:
         case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_MAXPERTARGET:
            _loc3_[0] = this.api.lang.getSpellText(Number(_loc3_[0])).n;
            break;
         case 939:
         case 940:
         case 969:
            var _loc11_ = new dofus.datacenter["\f\f"](-1,Number(_loc3_[2]),1,0,"",0);
            _loc3_[2] = _loc11_.name;
            break;
         case 960:
            _loc3_[2] = this.api.lang.getAlignment(this._nParam3).n;
            break;
         case 999:
      }
      if(this.api.lang.getEffectText(this._nType).j && this.api.kernel.OptionsManager.getOption("ViewDicesDammages"))
      {
         var _loc12_ = this._sParam4.toLowerCase().split("d");
         _loc12_[1] = _loc12_[1].split("+");
         if(!(_loc12_[0] == undefined || (_loc12_[1] == undefined || (_loc12_[1][0] == undefined || _loc12_[1][0] == undefined))))
         {
            var _loc13_ = "";
            _loc13_ += !(_loc12_[0] != "0" && _loc12_[1][0] != "0") ? "" : _loc12_[0] + "d" + _loc12_[1][0];
            _loc13_ += _loc12_[1][1] == "0" ? "" : (_loc13_ == "" ? "" : "+") + _loc12_[1][1];
            _loc3_[0] = _loc13_;
            var _loc0_ = null;
            _loc3_[4] = _loc0_ = undefined;
            _loc3_[2] = _loc0_;
            _loc3_[1] = _loc0_;
         }
      }
      var _loc14_ = "";
      if(this._nPropability > 0 && this._nPropability != undefined)
      {
         _loc14_ += " - " + this.api.lang.getText("IN_CASE_PERCENT",[this._nPropability]) + ": ";
      }
      if(this._nType == 666)
      {
         _loc14_ += this.api.lang.getText("DO_NOTHING");
      }
      else
      {
         var _loc15_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(_loc2_,_loc3_);
         if(_loc15_ == null || _loc15_ == "null")
         {
            return new String();
         }
         if(_loc15_ != undefined)
         {
            _loc14_ += _loc15_;
         }
      }
      if(this._nModificator > 0 && this.api.kernel.SpellsBoostsManager.isBoostedHealingOrDamagingEffect(this._nType))
      {
         _loc14_ += " " + this.api.lang.getText("BOOSTED_SPELLS_EFFECT_COMPLEMENT",[this._nModificator]);
      }
      var _loc16_ = this.getTurnCountStr(false);
      if(_loc16_.length == 0)
      {
         return _loc14_;
      }
      return _loc14_ + " (" + _loc16_ + ")";
   }
   function get characteristic()
   {
      return this.api.lang.getEffectText(this._nType).c;
   }
   function get operator()
   {
      return this.api.lang.getEffectText(this._nType).o;
   }
   function get element()
   {
      return this.api.lang.getEffectText(this._nType).e;
   }
   function get spellName()
   {
      return this.api.lang.getSpellText(this._nSpellID).n;
   }
   function get spellDescription()
   {
      return this.api.lang.getSpellText(this._nSpellID).d;
   }
   function get showInTooltip()
   {
      return this.api.lang.getEffectText(this._nType).t;
   }
   function get sCasterID()
   {
      return this._sCasterID;
   }
   function initialize(sCasterID, §\t\n§, §\t\x15§, §\t\x14§, §\t\x13§, §\t\x12§, §\t\x0f§, §\t\f§, §\x02\r§)
   {
      this.api = _global.API;
      this._nType = Number(_loc3_);
      this._sCasterID = sCasterID;
      this._nParam1 = !_global.isNaN(Number(_loc4_)) ? Number(_loc4_) : undefined;
      this._nParam2 = !_global.isNaN(Number(_loc5_)) ? Number(_loc5_) : undefined;
      this._nParam3 = !_global.isNaN(Number(_loc6_)) ? Number(_loc6_) : undefined;
      this._sParam4 = _loc7_;
      this._nRemainingTurn = _loc8_ != undefined ? Number(_loc8_) : 0;
      if(this._nRemainingTurn < 0 || this._nRemainingTurn >= 63)
      {
         this._nRemainingTurn = Number.POSITIVE_INFINITY;
      }
      this._nSpellID = Number(_loc9_);
      this._nModificator = Number(_loc10_);
   }
   function getParamWithOperator(§\x01\x15§)
   {
      var _loc3_ = this.operator != "-" ? 1 : -1;
      return this["_nParam" + _loc2_] * _loc3_;
   }
   function getTurnCountStr(§\x15\x06§)
   {
      var _loc3_ = new String();
      if(this._nRemainingTurn == undefined)
      {
         return "";
      }
      if(_global.isFinite(this._nRemainingTurn))
      {
         if(this._nRemainingTurn > 1)
         {
            return String(this._nRemainingTurn) + " " + this.api.lang.getText("TURNS");
         }
         if(this._nRemainingTurn == 0)
         {
            return "";
         }
         if(_loc2_)
         {
            return this.api.lang.getText("LAST_TURN");
         }
         return String(this._nRemainingTurn) + " " + this.api.lang.getText("TURN");
      }
      return this.api.lang.getText("INFINIT");
   }
}
