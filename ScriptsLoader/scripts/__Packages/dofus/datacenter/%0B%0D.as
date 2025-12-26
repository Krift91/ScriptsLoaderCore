class dofus.datacenter.§\x0b\r§ extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var SpellsManager;
   var InteractionsManager;
   var Inventory;
   var ItemSets;
   var Jobs;
   var Spells;
   var Emotes;
   var _bCraftPublicMode;
   var _bInParty;
   var _nMaxSummonedCreatures;
   var summonedCreaturesID;
   var _sID;
   var _sName;
   var dispatchEvent;
   var _nGuild;
   var _nLevel;
   var _nSex;
   var _nColor1;
   var _nColor2;
   var _nColor3;
   var _nLP;
   var _nLPMax;
   var _nAP;
   var _nMP;
   var _nKama;
   var _nXPLow;
   var _nXP;
   var _nXPHigh;
   var _nInitiative;
   var _nDiscernment;
   var _nForce;
   var _nForceXtra;
   var _nVitality;
   var _nVitalityXtra;
   var _nWisdom;
   var _nWisdomXtra;
   var _nChance;
   var _nChanceXtra;
   var _agility;
   var _nAgilityXtra;
   var _nAgilityTotal;
   var _intelligence;
   var _nIntelligenceXtra;
   var _nBonusPoints;
   var _nBonusPointsSpell;
   var _nRangeModerator;
   var _nEnergy;
   var _nEnergyMax;
   var _nCriticalHitBonus;
   var _oWeaponItem;
   var _aFullStats;
   var _nCurrentJobID;
   var _nCurrentWeight;
   var _nMaxWeight;
   var _nRestrictions;
   var _oSpecialization;
   var _oAlignment;
   var _oFakeAlignment;
   var _oRank;
   var _oMount;
   var _nMountXPPercent;
   var currentUseObject;
   var isAuthorized = false;
   var isSkippingFightAnimations = false;
   var isSkippingLootPanel = false;
   var haveFakeAlignment = false;
   var _nSummonedCreatures = 0;
   var _bIsRiding = false;
   function §\x0b\r§(oAPI)
   {
      super();
      this.initialize(oAPI);
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this.clean();
      eval("\t\x04").events["\x0f\x03"].initialize(this);
   }
   function clean()
   {
      this.SpellsManager = new dofus["\x0b\b"].SpellsManager(this);
      this.InteractionsManager = new dofus["\x0b\b"].InteractionsManager(this,this.api);
      this.Inventory = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this.ItemSets = new ank["\x1e\n\x07"]["\x0e\x1d"]();
      this.Jobs = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this.Spells = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this.Emotes = new ank["\x1e\n\x07"]["\x0e\x1d"]();
      this.clearSummon();
      this._bCraftPublicMode = false;
      this._bInParty = false;
   }
   function clearSummon()
   {
      this._nSummonedCreatures = 0;
      this._nMaxSummonedCreatures = 1;
      this.summonedCreaturesID = new Object();
   }
   function get clip()
   {
      return this.api.datacenter.Sprites.getItemAt(this._sID).mc;
   }
   function get data()
   {
      return this.api.datacenter.Sprites.getItemAt(this._sID);
   }
   function get isCurrentPlayer()
   {
      return this.api.datacenter.Game.currentPlayerID == this._sID;
   }
   function set ID(§\x1e\n\x02§)
   {
      this._sID = _loc2_;
   }
   function get ID()
   {
      return this._sID;
   }
   function set Name(§\x1e\n\x02§)
   {
      this._sName = String(_loc2_);
      this.dispatchEvent({type:"nameChanged",value:_loc2_});
   }
   function get Name()
   {
      return this._sName;
   }
   function set Guild(§\x1e\n\x02§)
   {
      this._nGuild = Number(_loc2_);
   }
   function get Guild()
   {
      return this._nGuild;
   }
   function set Level(§\x1e\n\x02§)
   {
      this._nLevel = Number(_loc2_);
      this.dispatchEvent({type:"levelChanged",value:_loc2_});
   }
   function get Level()
   {
      return this._nLevel;
   }
   function set Sex(§\x1e\n\x02§)
   {
      this._nSex = Number(_loc2_);
   }
   function get Sex()
   {
      return this._nSex;
   }
   function set color1(§\x1e\n\x02§)
   {
      this._nColor1 = Number(_loc2_);
   }
   function get color1()
   {
      return this._nColor1;
   }
   function set color2(§\x1e\n\x02§)
   {
      this._nColor2 = Number(_loc2_);
   }
   function get color2()
   {
      return this._nColor2;
   }
   function set color3(§\x1e\n\x02§)
   {
      this._nColor3 = Number(_loc2_);
   }
   function get color3()
   {
      return this._nColor3;
   }
   function set LP(§\x1e\n\x02§)
   {
      this._nLP = Number(_loc2_) <= 0 ? 0 : Number(_loc2_);
      this.dispatchEvent({type:"lpChanged",value:_loc2_});
   }
   function get LP()
   {
      return this._nLP;
   }
   function set LPmax(§\x1e\n\x02§)
   {
      this._nLPMax = Number(_loc2_);
      this.dispatchEvent({type:"lpMaxChanged",value:_loc2_});
   }
   function get LPmax()
   {
      return this._nLPMax;
   }
   function set AP(§\x1e\n\x02§)
   {
      this._nAP = Number(_loc2_);
      this.data.AP = Number(_loc2_);
      this.dispatchEvent({type:"apChanged",value:_loc2_});
   }
   function get AP()
   {
      return this._nAP;
   }
   function set MP(§\x1e\n\x02§)
   {
      this._nMP = Number(_loc2_);
      this.data.MP = Number(_loc2_);
      this.dispatchEvent({type:"mpChanged",value:_loc2_});
   }
   function get MP()
   {
      return this._nMP;
   }
   function set Kama(§\x1e\n\x02§)
   {
      this._nKama = Number(_loc2_);
      this.dispatchEvent({type:"kamaChanged",value:_loc2_});
   }
   function get Kama()
   {
      return this._nKama;
   }
   function set XPlow(§\x1e\n\x02§)
   {
      this._nXPLow = Number(_loc2_);
   }
   function get XPlow()
   {
      return this._nXPLow;
   }
   function set XP(§\x1e\n\x02§)
   {
      this._nXP = Number(_loc2_);
      this.dispatchEvent({type:"xpChanged",value:_loc2_});
   }
   function get XP()
   {
      return this._nXP;
   }
   function set XPhigh(§\x1e\n\x02§)
   {
      this._nXPHigh = Number(_loc2_);
   }
   function get XPhigh()
   {
      return this._nXPHigh;
   }
   function set Initiative(§\x1e\n\x02§)
   {
      this._nInitiative = Number(_loc2_);
      this.dispatchEvent({type:"initiativeChanged",value:_loc2_});
   }
   function get Initiative()
   {
      return this._nInitiative;
   }
   function set Discernment(§\x1e\n\x02§)
   {
      this._nDiscernment = Number(_loc2_);
      this.dispatchEvent({type:"discernmentChanged",value:_loc2_});
   }
   function get Discernment()
   {
      return this._nDiscernment;
   }
   function set Force(§\x1e\n\x02§)
   {
      this._nForce = Number(_loc2_);
      this.dispatchEvent({type:"forceChanged",value:_loc2_});
   }
   function get Force()
   {
      return this._nForce;
   }
   function set ForceXtra(§\x1e\n\x02§)
   {
      this._nForceXtra = Number(_loc2_);
      this.dispatchEvent({type:"forceXtraChanged",value:_loc2_});
   }
   function get ForceXtra()
   {
      return this._nForceXtra;
   }
   function set Vitality(§\x1e\n\x02§)
   {
      this._nVitality = Number(_loc2_);
      this.dispatchEvent({type:"vitalityChanged",value:_loc2_});
   }
   function get Vitality()
   {
      return this._nVitality;
   }
   function set VitalityXtra(§\x1e\n\x02§)
   {
      this._nVitalityXtra = Number(_loc2_);
      this.dispatchEvent({type:"vitalityXtraChanged",value:_loc2_});
   }
   function get VitalityXtra()
   {
      return this._nVitalityXtra;
   }
   function set Wisdom(§\x1e\n\x02§)
   {
      this._nWisdom = Number(_loc2_);
      this.dispatchEvent({type:"wisdomChanged",value:_loc2_});
   }
   function get Wisdom()
   {
      return this._nWisdom;
   }
   function set WisdomXtra(§\x1e\n\x02§)
   {
      this._nWisdomXtra = Number(_loc2_);
      this.dispatchEvent({type:"wisdomXtraChanged",value:_loc2_});
   }
   function get WisdomXtra()
   {
      return this._nWisdomXtra;
   }
   function set Chance(§\x1e\n\x02§)
   {
      this._nChance = Number(_loc2_);
      this.dispatchEvent({type:"chanceChanged",value:_loc2_});
   }
   function get Chance()
   {
      return this._nChance;
   }
   function set ChanceXtra(§\x1e\n\x02§)
   {
      this._nChanceXtra = Number(_loc2_);
      this.dispatchEvent({type:"chanceXtraChanged",value:_loc2_});
   }
   function get ChanceXtra()
   {
      return this._nChanceXtra;
   }
   function set Agility(§\x1e\n\x02§)
   {
      this._agility = Number(_loc2_);
      this.dispatchEvent({type:"agilityChanged",value:_loc2_});
   }
   function get Agility()
   {
      return this._agility;
   }
   function set AgilityXtra(§\x1e\n\x02§)
   {
      this._nAgilityXtra = Number(_loc2_);
      this.dispatchEvent({type:"agilityXtraChanged",value:_loc2_});
   }
   function get AgilityXtra()
   {
      return this._nAgilityXtra;
   }
   function set AgilityTotal(§\x1e\n\x02§)
   {
      this._nAgilityTotal = Number(_loc2_);
      this.dispatchEvent({type:"agilityTotalChanged",value:_loc2_});
   }
   function get AgilityTotal()
   {
      return this._nAgilityTotal;
   }
   function set Intelligence(§\x1e\n\x02§)
   {
      this._intelligence = Number(_loc2_);
      this.dispatchEvent({type:"intelligenceChanged",value:_loc2_});
   }
   function get Intelligence()
   {
      return this._intelligence;
   }
   function set IntelligenceXtra(§\x1e\n\x02§)
   {
      this._nIntelligenceXtra = Number(_loc2_);
      this.dispatchEvent({type:"intelligenceXtraChanged",value:_loc2_});
   }
   function get IntelligenceXtra()
   {
      return this._nIntelligenceXtra;
   }
   function set BonusPoints(§\x1e\n\x02§)
   {
      this._nBonusPoints = Number(_loc2_);
      this.dispatchEvent({type:"bonusPointsChanged",value:_loc2_});
   }
   function get BonusPoints()
   {
      return this._nBonusPoints;
   }
   function set BonusPointsSpell(§\x1e\n\x02§)
   {
      this._nBonusPointsSpell = Number(_loc2_);
      this.dispatchEvent({type:"bonusSpellsChanged",value:_loc2_});
   }
   function get BonusPointsSpell()
   {
      return this._nBonusPointsSpell;
   }
   function set RangeModerator(§\x1e\n\x02§)
   {
      this._nRangeModerator = Number(_loc2_);
   }
   function get RangeModerator()
   {
      return this._nRangeModerator;
   }
   function set Energy(§\x1e\n\x02§)
   {
      this._nEnergy = Number(_loc2_);
      this.dispatchEvent({type:"energyChanged",value:_loc2_});
   }
   function get Energy()
   {
      return this._nEnergy;
   }
   function set EnergyMax(§\x1e\n\x02§)
   {
      this._nEnergyMax = Number(_loc2_);
      this.dispatchEvent({type:"energyMaxChanged",value:_loc2_});
   }
   function get EnergyMax()
   {
      return this._nEnergyMax;
   }
   function set SummonedCreatures(§\x1e\n\x02§)
   {
      this._nSummonedCreatures = Number(_loc2_);
   }
   function get SummonedCreatures()
   {
      return this._nSummonedCreatures;
   }
   function set MaxSummonedCreatures(§\x1e\n\x02§)
   {
      this._nMaxSummonedCreatures = Number(_loc2_);
   }
   function get MaxSummonedCreatures()
   {
      return this._nMaxSummonedCreatures;
   }
   function set CriticalHitBonus(§\x1e\n\x02§)
   {
      this._nCriticalHitBonus = Number(_loc2_);
   }
   function get CriticalHitBonus()
   {
      return this._nCriticalHitBonus;
   }
   function get weaponItem()
   {
      return this._oWeaponItem;
   }
   function set FullStats(§\x1e\n\x02§)
   {
      this._aFullStats = _loc2_;
      this.dispatchEvent({type:"fullStatsChanged",value:_loc2_});
   }
   function get FullStats()
   {
      return this._aFullStats;
   }
   function set currentJobID(§\x1e\n\x02§)
   {
      if(_loc2_ == undefined)
      {
         delete this._nCurrentJobID;
      }
      else
      {
         this._nCurrentJobID = Number(_loc2_);
      }
      this.dispatchEvent({type:"currentJobChanged",value:_loc2_});
   }
   function get currentJobID()
   {
      return this._nCurrentJobID;
   }
   function get currentJob()
   {
      var _loc2_ = this.Jobs.findFirstItem("id",this._nCurrentJobID);
      return _loc2_.item;
   }
   function set currentWeight(§\x1e\n\x02§)
   {
      this._nCurrentWeight = _loc2_;
      this.dispatchEvent({type:"currentWeightChanged",value:_loc2_});
   }
   function get currentWeight()
   {
      return this._nCurrentWeight;
   }
   function set maxWeight(§\x1e\n\x02§)
   {
      this._nMaxWeight = _loc2_;
      this.dispatchEvent({type:"maxWeightChanged",value:_loc2_});
   }
   function get maxWeight()
   {
      return this._nMaxWeight;
   }
   function get isMutant()
   {
      return this.data instanceof dofus.datacenter["\t\x07"];
   }
   function set restrictions(§\x1e\n\x02§)
   {
      this._nRestrictions = _loc2_;
   }
   function get restrictions()
   {
      return this._nRestrictions;
   }
   function set specialization(§\x1e\n\x02§)
   {
      this._oSpecialization = _loc2_;
      this.dispatchEvent({type:"specializationChanged",value:_loc2_});
   }
   function get specialization()
   {
      return this._oSpecialization;
   }
   function set alignment(§\x1e\n\x02§)
   {
      this._oAlignment = _loc2_;
      this.dispatchEvent({type:"alignmentChanged",alignment:_loc2_});
   }
   function get alignment()
   {
      return this._oAlignment;
   }
   function set fakeAlignment(§\x1e\n\x02§)
   {
      this._oFakeAlignment = _loc2_;
   }
   function get fakeAlignment()
   {
      return this._oFakeAlignment;
   }
   function set rank(§\x1e\n\x02§)
   {
      this._oRank = _loc2_;
      this.dispatchEvent({type:"rankChanged",rank:_loc2_});
   }
   function get rank()
   {
      return this._oRank;
   }
   function set mount(§\x1e\n\x02§)
   {
      this._oMount = _loc2_;
      this.dispatchEvent({type:"mountChanged",mount:_loc2_});
   }
   function get mount()
   {
      return this._oMount;
   }
   function get isRiding()
   {
      return this._bIsRiding;
   }
   function set isRiding(§\x1e\n\x02§)
   {
      this._bIsRiding = _loc2_;
   }
   function set mountXPPercent(§\x1e\n\x02§)
   {
      this._nMountXPPercent = _loc2_;
      this.dispatchEvent({type:"mountXPPercentChanged",value:_loc2_});
   }
   function get mountXPPercent()
   {
      return this._nMountXPPercent;
   }
   function set craftPublicMode(§\x1e\n\x02§)
   {
      this._bCraftPublicMode = _loc2_;
      this.dispatchEvent({type:"craftPublicModeChanged",value:_loc2_});
   }
   function get craftPublicMode()
   {
      return this._bCraftPublicMode;
   }
   function set inParty(§\x1e\n\x02§)
   {
      this._bInParty = _loc2_;
      this.dispatchEvent({type:"inPartyChanged",inParty:_loc2_});
   }
   function get inParty()
   {
      return this._bInParty;
   }
   function get canAssault()
   {
      return (this._nRestrictions & 1) != 1;
   }
   function get canChallenge()
   {
      return (this._nRestrictions & 2) != 2;
   }
   function get canExchange()
   {
      return (this._nRestrictions & 4) != 4;
   }
   function get canAttack()
   {
      return (this._nRestrictions & 8) == 8;
   }
   function get canChatToAll()
   {
      return (this._nRestrictions & 0x10) != 16;
   }
   function get canBeMerchant()
   {
      return (this._nRestrictions & 0x20) != 32;
   }
   function get canUseObject()
   {
      return (this._nRestrictions & 0x40) != 64;
   }
   function get cantInteractWithTaxCollector()
   {
      return (this._nRestrictions & 0x80) == 128;
   }
   function get canUseInteractiveObjects()
   {
      return (this._nRestrictions & 0x0100) != 256;
   }
   function get cantSpeakNPC()
   {
      return (this._nRestrictions & 0x0200) == 512;
   }
   function get canAttackDungeonMonstersWhenMutant()
   {
      return (this._nRestrictions & 0x1000) == 4096;
   }
   function get canMoveInAllDirections()
   {
      return (this._nRestrictions & 0x2000) == 8192;
   }
   function get canAttackMonstersAnywhereWhenMutant()
   {
      return (this._nRestrictions & 0x4000) == 16384;
   }
   function get cantInteractWithPrism()
   {
      return (this._nRestrictions & 0x8000) == 32768;
   }
   function reset()
   {
      this.currentUseObject = null;
   }
   function canReceiveItems(§\x1e\x10§, §\x17\x15§)
   {
      var _loc4_ = !_loc3_ ? this.maxWeight - this.currentWeight : this.mount.podsMax - this.mount.pods;
      var _loc5_ = 0;
      var _loc6_ = 0;
      while(_loc6_ < _loc2_.length)
      {
         var _loc7_ = _loc2_[_loc6_];
         _loc5_ += _loc7_.weight * _loc7_.Quantity;
         _loc6_ = _loc6_ + 1;
      }
      return _loc5_ <= _loc4_;
   }
   function getPossibleItemReceiveQuantity(§\x1e\x18\x03§, §\x17\x15§)
   {
      var _loc4_ = !_loc3_ ? this.maxWeight - this.currentWeight : this.mount.podsMax - this.mount.pods;
      var _loc5_ = _loc2_.weight;
      var _loc6_ = Math.floor(_loc4_ / _loc5_);
      if(_loc6_ > _loc2_.Quantity)
      {
         _loc6_ = _loc2_.Quantity;
      }
      return _loc6_;
   }
   function updateLP(§\x10\x1b§)
   {
      _loc2_ = Number(_loc2_);
      if(this.LP + _loc2_ > this.LPmax)
      {
         _loc2_ = this.LPmax - this.LP;
      }
      this.LP += _loc2_;
   }
   function hasEnoughAP(§\x1e\t\x1a§)
   {
      return this.data.AP >= _loc2_;
   }
   function addItem(§\x1e\x19\x03§)
   {
      if(_loc2_.position == 1)
      {
         this.setWeaponItem(_loc2_);
      }
      this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
      this.Inventory.push(_loc2_);
   }
   function updateItem(§\x1e\x18\x11§)
   {
      var _loc3_ = this.Inventory.findFirstItem("ID",_loc2_.ID);
      if(_loc3_.item.ID == _loc2_.ID && _loc3_.item.maxSkin != _loc2_.maxSkin)
      {
         if(!_loc3_.item.isLeavingItem && _loc2_.isLeavingItem)
         {
            this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_ASSOCIATE);
         }
         if(_loc3_.item.isLeavingItem && _loc2_.isLeavingItem)
         {
            this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_LEVEL_UP);
         }
      }
      this.Inventory.updateItem(_loc3_.index,_loc2_);
   }
   function updateItemQuantity(§\x04\x04§, §\x01\x01§)
   {
      var _loc4_ = this.Inventory.findFirstItem("ID",_loc2_);
      var _loc5_ = _loc4_.item;
      _loc5_.Quantity = _loc3_;
      this.Inventory.updateItem(_loc4_.index,_loc5_);
   }
   function updateItemPosition(§\x04\x04§, §\x01\n§)
   {
      var _loc4_ = this.Inventory.findFirstItem("ID",_loc2_);
      var _loc5_ = _loc4_.item;
      if(_loc5_.position == 1)
      {
         this.setWeaponItem();
      }
      else if(_loc3_ == 1)
      {
         this.setWeaponItem(_loc5_);
      }
      _loc5_.position = _loc3_;
      this.Inventory.updateItem(_loc4_.index,_loc5_);
   }
   function dropItem(§\x04\x04§)
   {
      var _loc3_ = this.Inventory.findFirstItem("ID",_loc2_);
      if(_loc3_.item.position == 1)
      {
         this.setWeaponItem();
      }
      this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
      this.Inventory.removeItems(_loc3_.index,1);
   }
   function updateSpell(§\x1e\x17\x17§)
   {
      var _loc3_ = this.Spells.findFirstItem("ID",_loc2_.ID);
      if(_loc3_.index != -1)
      {
         _loc2_.position = _loc3_.item.position;
         this.Spells.updateItem(_loc3_.index,_loc2_);
      }
      else
      {
         this.Spells.push(_loc2_);
      }
   }
   function updateSpellPosition(§\x1e\x17\x17§)
   {
      var _loc3_ = this.Spells.findFirstItem("position",_loc2_.position);
      var _loc4_ = this.Spells.findFirstItem("ID",_loc2_.ID);
      if(_loc3_.index != -1)
      {
         _loc3_.item.position = undefined;
         this.Spells.updateItem(_loc3_.index,_loc2_);
      }
      if(_loc4_.index != -1)
      {
         this.Spells.updateItem(_loc3_.index,_loc2_);
      }
      else
      {
         this.Spells.push(_loc2_);
      }
   }
   function removeSpell(§\x04\x12§)
   {
      var _loc3_ = this.Spells.findFirstItem("ID",_loc2_);
      if(_loc3_.index != -1)
      {
         this.Spells.removeItems(_loc3_.index,1);
      }
   }
   function canBoost(§\x07\t§)
   {
      if(this.api.datacenter.Game.isRunning)
      {
         return false;
      }
      var _loc3_ = this.getBoostCostAndCountForCharacteristic(_loc2_).cost;
      if(this._nBonusPoints >= _loc3_)
      {
         return true;
      }
      return false;
   }
   function getBoostCostAndCountForCharacteristic(§\x07\t§)
   {
      var _loc3_ = this.api.lang.getClassText(this._nGuild)["b" + _loc2_];
      var _loc4_ = 1;
      var _loc5_ = 1;
      var _loc6_ = 0;
      switch(_loc2_)
      {
         case 10:
            _loc6_ = this._nForce;
            break;
         case 11:
            _loc6_ = this._nVitality;
            break;
         case 12:
            _loc6_ = this._nWisdom;
            break;
         case 13:
            _loc6_ = this._nChance;
            break;
         case 14:
            _loc6_ = this._agility;
            break;
         case 15:
            _loc6_ = this._intelligence;
      }
      var _loc7_ = 0;
      while(_loc7_ < _loc3_.length)
      {
         var _loc8_ = _loc3_[_loc7_][0];
         if(_loc6_ < _loc8_)
         {
            break;
         }
         _loc4_ = _loc3_[_loc7_][1];
         _loc5_ = _loc3_[_loc7_][2] != undefined ? _loc3_[_loc7_][2] : 1;
         _loc7_ = _loc7_ + 1;
      }
      return {cost:_loc4_,count:_loc5_};
   }
   function isAtHome(§\x03\x0b§)
   {
      var _loc3_ = Number(this.api.lang.getHousesMapText(_loc2_));
      if(_loc3_ != undefined)
      {
         return this.api.datacenter.Houses.getItemAt(_loc3_).localOwner;
      }
      return false;
   }
   function clearEmotes()
   {
      this.Emotes = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   }
   function addEmote(§\x05\x15§)
   {
      this.Emotes.addItemAt(_loc2_,true);
   }
   function hasEmote(§\x05\x15§)
   {
      return this.Emotes.getItemAt(_loc2_) == true;
   }
   function updateCloseCombat()
   {
      this.Spells[0] = new dofus.datacenter["\x12\x18"](this._oWeaponItem,this._nGuild);
   }
   function setWeaponItem(§\x1e\x19\x03§)
   {
      this._oWeaponItem = _loc2_;
      this.updateCloseCombat();
   }
}
