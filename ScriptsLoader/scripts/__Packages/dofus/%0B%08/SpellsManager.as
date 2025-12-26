class dofus.§\x0b\b§.SpellsManager
{
   var _localPlayerData;
   var api;
   var _oSpellsModificators;
   var _aSpellsCountByTurn;
   var _oSpellsCountByTurn_Counter;
   var _aSpellsCountByPlayer;
   var _oSpellsCountByPlayer_Counter;
   var _aSpellsDelay;
   var dispatchEvent;
   function SpellsManager(§\x11\x10§)
   {
      this.initialize(_loc2_);
   }
   function initialize(§\x11\x10§)
   {
      this._localPlayerData = _loc2_;
      this.api = _loc2_.api;
      this.clear();
      this._oSpellsModificators = new Object();
      eval("\t\x04").events["\x0f\x03"].initialize(this);
   }
   function clear()
   {
      this._aSpellsCountByTurn = new Array();
      this._oSpellsCountByTurn_Counter = new Object();
      this._aSpellsCountByPlayer = new Array();
      this._oSpellsCountByPlayer_Counter = new Object();
      this._aSpellsDelay = new Array();
   }
   function addLaunchedSpell(§\x1e\x18\x1c§)
   {
      var _loc3_ = _loc2_.spell;
      var _loc4_ = _loc3_.launchCountByTurn;
      var _loc5_ = _loc3_.launchCountByPlayerTurn;
      var _loc6_ = _loc3_.delayBetweenLaunch;
      if(_loc6_ != 0)
      {
         this._aSpellsDelay.push(_loc2_);
      }
      if(_loc5_ != 0)
      {
         if(_loc2_.spriteOnID != undefined)
         {
            this._aSpellsCountByPlayer.push(_loc2_);
            if(this._oSpellsCountByPlayer_Counter[_loc2_.spriteOnID + "|" + _loc3_.ID] == undefined)
            {
               this._oSpellsCountByPlayer_Counter[_loc2_.spriteOnID + "|" + _loc3_.ID] = 1;
            }
            else
            {
               this._oSpellsCountByPlayer_Counter[_loc2_.spriteOnID + "|" + _loc3_.ID]++;
            }
         }
      }
      if(_loc4_ != 0)
      {
         this._aSpellsCountByTurn.push(_loc2_);
         if(this._oSpellsCountByTurn_Counter[_loc3_.ID] == undefined)
         {
            this._oSpellsCountByTurn_Counter[_loc3_.ID] = 1;
         }
         else
         {
            this._oSpellsCountByTurn_Counter[_loc3_.ID]++;
         }
      }
      this.dispatchEvent({type:"spellLaunched",spell:_loc3_});
   }
   function nextTurn()
   {
      this._aSpellsCountByTurn = new Array();
      this._oSpellsCountByTurn_Counter = new Object();
      this._aSpellsCountByPlayer = new Array();
      this._oSpellsCountByPlayer_Counter = new Object();
      var _loc3_ = this._aSpellsDelay.length;
      while((_loc3_ = _loc3_ - 1) >= 0)
      {
         var _loc2_ = this._aSpellsDelay[_loc3_];
         _loc2_.remainingTurn--;
         if(_loc2_.remainingTurn <= 0)
         {
            this._aSpellsDelay.splice(_loc3_,1);
         }
      }
      this.dispatchEvent({type:"nextTurn"});
   }
   function checkCanLaunchSpell(§\x1e\x0e\x18§, §\x1e\x1c\x1b§)
   {
      var _loc4_ = this.checkCanLaunchSpellReturnObject(_loc2_,_loc3_);
      if(_loc4_.can == false)
      {
         this.api.datacenter.Basics.spellManager_errorMsg = this.api.lang.getText(_loc4_.type,_loc4_.params);
         return false;
      }
      return true;
   }
   function checkCanLaunchSpellReturnObject(§\x1e\x1c\x1d§, §\x1e\x1c\x1b§)
   {
      if(!this.api.datacenter.Game.isRunning || this.api.datacenter.Game.isSpectator)
      {
         return {can:false,type:"NOT_IN_FIGHT"};
      }
      var _loc9_ = this.api.datacenter.Player.Spells.findFirstItem("ID",_loc2_).item;
      var _loc10_ = new Object();
      if(_loc9_.needStates)
      {
         var _loc11_ = _loc9_.requiredStates;
         var _loc12_ = _loc9_.forbiddenStates;
         var _loc13_ = 0;
         while(_loc13_ < _loc11_.length)
         {
            if(!this.api.datacenter.Player.data.isInState(_loc11_[_loc13_]))
            {
               _loc10_ = {can:false,type:"NOT_IN_REQUIRED_STATE",params:[this.api.lang.getStateText(_loc11_[_loc13_])]};
               break;
            }
            _loc13_ = _loc13_ + 1;
         }
         var _loc14_ = 0;
         while(_loc14_ < _loc12_.length)
         {
            if(this.api.datacenter.Player.data.isInState(_loc12_[_loc14_]))
            {
               _loc10_ = {can:false,type:"IN_FORBIDDEN_STATE",params:[this.api.lang.getStateText(_loc12_[_loc14_])]};
               break;
            }
            _loc14_ = _loc14_ + 1;
         }
      }
      var _loc15_ = this._aSpellsDelay.length;
      while((_loc15_ = _loc15_ - 1) >= 0)
      {
         var _loc5_ = this._aSpellsDelay[_loc15_];
         var _loc6_ = _loc5_.spell;
         if(_loc6_.ID == _loc2_)
         {
            if(_loc5_.remainingTurn >= 63)
            {
               if(_loc10_.type)
               {
                  _loc10_.params[1] = _loc5_.remainingTurn;
                  return _loc10_;
               }
               return {can:false,type:"CANT_RELAUNCH"};
            }
            if(_loc10_.type)
            {
               _loc10_.params[1] = _loc5_.remainingTurn;
               return _loc10_;
            }
            return {can:false,type:"CANT_LAUNCH_BEFORE",params:[_loc5_.remainingTurn]};
         }
      }
      if(_loc10_.type)
      {
         return _loc10_;
      }
      if(_loc9_.summonSpell)
      {
         var _loc16_ = this.api.datacenter.Player.data.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.MAX_SUMMONED_CREATURES_BOOST) + this.api.datacenter.Player.MaxSummonedCreatures;
         if(this.api.datacenter.Player.SummonedCreatures >= _loc16_)
         {
            return {can:false,type:"CANT_SUMMON_MORE_CREATURE",params:[_loc16_]};
         }
      }
      _loc15_ = this._aSpellsCountByPlayer.length;
      while((_loc15_ = _loc15_ - 1) >= 0)
      {
         _loc5_ = this._aSpellsCountByPlayer[_loc15_];
         _loc6_ = _loc5_.spell;
         if(_loc6_.ID == _loc2_)
         {
            var _loc8_ = _loc6_.launchCountByPlayerTurn;
            if(_loc5_.spriteOnID == _loc3_ && this._oSpellsCountByPlayer_Counter[_loc5_.spriteOnID + "|" + _loc2_] >= _loc8_)
            {
               return {can:false,type:"CANT_ON_THIS_PLAYER"};
            }
         }
      }
      _loc15_ = this._aSpellsCountByTurn.length;
      while((_loc15_ = _loc15_ - 1) >= 0)
      {
         _loc5_ = this._aSpellsCountByTurn[_loc15_];
         _loc6_ = _loc5_.spell;
         if(_loc6_.ID == _loc2_)
         {
            var _loc7_ = _loc6_.launchCountByTurn;
            if(this._oSpellsCountByTurn_Counter[_loc2_] >= _loc7_)
            {
               return {can:false,type:"CANT_LAUNCH_MORE",params:[_loc7_]};
            }
         }
      }
      if(!this.api.datacenter.Player.hasEnoughAP(_loc9_.apCost))
      {
         return {can:false,type:"NOT_ENOUGH_AP"};
      }
      return {can:true};
   }
   function checkCanLaunchSpellOnCell(mapHandler, §\x1e\x17\x17§, §\x13\x04§, §\x1e\x15\x0b§)
   {
      var _loc6_ = Number(this._localPlayerData.data.cellNum);
      var _loc7_ = Number(_loc4_.mc.num);
      if(_loc6_ == _loc7_ && _loc3_.rangeMin != 0)
      {
         return false;
      }
      if(!this.api.datacenter.Game.isFight)
      {
         return false;
      }
      if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkRange(mapHandler,_loc6_,_loc7_,_loc3_.lineOnly,_loc3_.rangeMin,_loc3_.rangeMax,_loc5_))
      {
         if(_loc3_.freeCell)
         {
            if(_loc4_.movement > 1 && _loc4_.spriteOnID != undefined)
            {
               return false;
            }
            if(_loc4_.movement <= 1)
            {
               return false;
            }
         }
         if(_loc3_.lineOfSight)
         {
            if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkView(mapHandler,_loc6_,_loc7_))
            {
               return this.checkCanLaunchSpell(_loc3_.ID,_loc4_.spriteOnID);
            }
            return false;
         }
         return this.checkCanLaunchSpell(_loc3_.ID,_loc4_.spriteOnID);
      }
      return false;
   }
}
