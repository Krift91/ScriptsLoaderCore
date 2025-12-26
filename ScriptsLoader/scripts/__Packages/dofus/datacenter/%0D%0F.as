class dofus.datacenter.§\r\x0f§ extends Object
{
   var api;
   var _eaMembers;
   var _eaTaxCollectors;
   var _eaMountParks;
   var _sName;
   var _bValid;
   var _nUpEmblemColor;
   var _nUpEmblemID;
   var _nBackEmblemColor;
   var _nBackEmblemID;
   var _grPlayerRights;
   var _nLevel;
   var _nXPMin;
   var _nXPMax;
   var _nXP;
   var _nTaxCount;
   var _nTaxCountMax;
   var _eaTaxSpells;
   var _nTaxLP;
   var _nTaxBonusDamage;
   var _nTaxHireCost;
   var _nTaxPods;
   var _nTaxPP;
   var _nTaxSagesse;
   var _nTaxPercepteur;
   var _nBoostPoints;
   var _nMaxMountParks;
   var _eaHouses;
   var _nDefendedTaxCollectorID;
   var dispatchEvent;
   function §\r\x0f§(§\x1e\x0f\x16§, §\b\x0b§, §\b\f§, §\x1e\x1b\f§, §\x1e\x1b\r§, §\x01\r§)
   {
      super();
      this.api = _global.API;
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this.initialize(false,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      this._eaMembers = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaTaxCollectors = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaMountParks = new ank["\x1e\n\x07"]["\x0f\x01"]();
   }
   function get name()
   {
      return this._sName;
   }
   function get isValid()
   {
      return this._bValid;
   }
   function get emblem()
   {
      return {backID:this._nBackEmblemID,backColor:this._nBackEmblemColor,upID:this._nUpEmblemID,upColor:this._nUpEmblemColor};
   }
   function get playerRights()
   {
      return this._grPlayerRights;
   }
   function get level()
   {
      return this._nLevel;
   }
   function get xpmin()
   {
      return this._nXPMin;
   }
   function get xpmax()
   {
      return this._nXPMax;
   }
   function get xp()
   {
      return this._nXP;
   }
   function get members()
   {
      return this._eaMembers;
   }
   function get taxCount()
   {
      return this._nTaxCount;
   }
   function get taxCountMax()
   {
      return this._nTaxCountMax;
   }
   function get taxSpells()
   {
      return this._eaTaxSpells;
   }
   function get taxLp()
   {
      return this._nTaxLP;
   }
   function get taxBonus()
   {
      return this._nTaxBonusDamage;
   }
   function get taxcollectorHireCost()
   {
      return this._nTaxHireCost;
   }
   function get taxPod()
   {
      return this._nTaxPods;
   }
   function get taxPP()
   {
      return this._nTaxPP;
   }
   function get taxWisdom()
   {
      return this._nTaxSagesse;
   }
   function get taxPopulation()
   {
      return this._nTaxPercepteur;
   }
   function get boostPoints()
   {
      return this._nBoostPoints;
   }
   function get taxCollectors()
   {
      return this._eaTaxCollectors;
   }
   function get mountParks()
   {
      return this._eaMountParks;
   }
   function get maxMountParks()
   {
      return this._nMaxMountParks;
   }
   function get houses()
   {
      return this._eaHouses;
   }
   function set defendedTaxCollectorID(§\x06\f§)
   {
      this._nDefendedTaxCollectorID = _loc2_;
   }
   function get defendedTaxCollectorID()
   {
      return this._nDefendedTaxCollectorID;
   }
   function get isLocalPlayerDefender()
   {
      return this._nDefendedTaxCollectorID != undefined;
   }
   function initialize(§\x14\t§, §\x1e\x0f\x16§, §\b\x0b§, §\b\f§, §\x1e\x1b\f§, §\x1e\x1b\r§, §\x01\r§)
   {
      this._sName = _loc3_;
      this._nBackEmblemID = _loc4_;
      this._nBackEmblemColor = _loc5_;
      this._nUpEmblemID = _loc6_;
      this._nUpEmblemColor = _loc7_;
      this._grPlayerRights = new dofus.datacenter["\r\x0b"](_loc8_);
      if(_loc2_)
      {
         this.dispatchEvent({type:"modelChanged",eventName:"infosUpdate"});
      }
   }
   function setGeneralInfos(§\x13\x1c§, §\x03\x11§, §\x1e\x1a\x19§, §\x1e\x1a\x1d§, §\x1e\x1a\x1b§)
   {
      this._bValid = _loc2_;
      this._nLevel = _loc3_;
      this._nXPMin = _loc4_;
      this._nXP = _loc5_;
      this._nXPMax = _loc6_;
      this.dispatchEvent({type:"modelChanged",eventName:"general"});
   }
   function setMembers()
   {
      this.dispatchEvent({type:"modelChanged",eventName:"members"});
   }
   function setMountParks(§\x02\x1b§, §\x10\x01§)
   {
      this._nMaxMountParks = _loc2_;
      this._eaMountParks = _loc3_;
      this.dispatchEvent({type:"modelChanged",eventName:"mountParks"});
   }
   function setBoosts(§\x1e\x1c\b§, §\x1e\x1c\x07§, §\x03\r§, §\b\x05§, §\x01\f§, §\x01\b§, §\x1e\x1d\x1c§, §\x01\x11§, §\b\x03§, §\x1e\x1c\x06§, §\x0f\x14§)
   {
      this._nTaxCount = _loc2_;
      this._nTaxCountMax = _loc3_;
      this._nTaxLP = _loc4_;
      this._nTaxBonusDamage = _loc5_;
      this._nTaxPods = _loc6_;
      this._nTaxPP = _loc7_;
      this._nTaxSagesse = _loc8_;
      this._nTaxPercepteur = _loc9_;
      this._nBoostPoints = _loc10_;
      this._nTaxHireCost = _loc11_;
      this._eaTaxSpells = _loc12_;
      this.dispatchEvent({type:"modelChanged",eventName:"boosts"});
   }
   function setNoBoosts()
   {
      this.dispatchEvent({type:"modelChanged",eventName:"noboosts"});
   }
   function canBoost(§\x1e\x14\x04§, §\x01\x14§)
   {
      var _loc4_ = this.getBoostCostAndCountForCharacteristic(_loc2_,_loc3_).cost;
      if(this._nBoostPoints >= _loc4_ && _loc4_ != undefined)
      {
         return true;
      }
      return false;
   }
   function getBoostCostAndCountForCharacteristic(§\x1e\x14\x04§, §\x01\x14§)
   {
      var _loc4_ = this.api.lang.getGuildBoosts(_loc2_);
      var _loc5_ = 1;
      var _loc6_ = 1;
      var _loc7_ = 0;
      switch(_loc2_)
      {
         case "w":
            _loc7_ = this._nTaxPods;
            break;
         case "p":
            _loc7_ = this._nTaxPP;
            break;
         case "c":
            _loc7_ = this._nTaxPercepteur;
            break;
         case "x":
            _loc7_ = this._nTaxSagesse;
            break;
         case "s":
            var _loc8_ = this._eaTaxSpells.findFirstItem("ID",_loc3_);
            if(_loc8_ != -1)
            {
               _loc7_ = _loc8_.item.level;
               break;
            }
      }
      var _loc9_ = this.api.lang.getGuildBoostsMax(_loc2_);
      if(_loc7_ < _loc9_)
      {
         var _loc10_ = 0;
         while(_loc10_ < _loc4_.length)
         {
            var _loc11_ = _loc4_[_loc10_][0];
            if(_loc7_ < _loc11_)
            {
               break;
            }
            _loc5_ = _loc4_[_loc10_][1];
            _loc6_ = _loc4_[_loc10_][2] != undefined ? _loc4_[_loc10_][2] : 1;
            _loc10_ = _loc10_ + 1;
         }
         return {cost:_loc5_,count:_loc6_};
      }
      return null;
   }
   function setTaxCollectors()
   {
      this.dispatchEvent({type:"modelChanged",eventName:"taxcollectors"});
   }
   function setNoTaxCollectors()
   {
      this.dispatchEvent({type:"modelChanged",eventName:"notaxcollectors"});
   }
   function setHouses(§\x10\x07§)
   {
      this._eaHouses = _loc2_;
      this.dispatchEvent({type:"modelChanged",eventName:"houses"});
   }
   function setNoHouses()
   {
      this._eaHouses = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this.dispatchEvent({type:"modelChanged",eventName:"nohouses"});
   }
}
