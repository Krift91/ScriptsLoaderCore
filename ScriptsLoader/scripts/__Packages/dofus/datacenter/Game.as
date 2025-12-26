class dofus.datacenter.Game extends Object
{
   var api;
   var _nPlayerCount;
   var _nCurrentTableTurn;
   var _sCurrentPlayerID;
   var _sLastPlayerID;
   var _nState;
   var dispatchEvent;
   var _nFightType;
   var _bSpectator;
   var _aTurnSequence;
   var _oResults;
   var _nInteractionType;
   static var INTERACTION_TYPE_MOVE = 1;
   static var INTERACTION_TYPE_SPELL = 2;
   static var INTERACTION_TYPE_CC = 3;
   static var INTERACTION_TYPE_PLACE = 4;
   static var INTERACTION_TYPE_TARGET = 5;
   static var INTERACTION_TYPE_FLAG = 6;
   static var _bTacticMode = false;
   static var _bLogMapDisconnections = false;
   var _bRunning = false;
   var _bFirstTurn = true;
   function Game()
   {
      super();
      this.initialize();
   }
   function get isLoggingMapDisconnections()
   {
      return dofus.datacenter.Game._bLogMapDisconnections;
   }
   function set isLoggingMapDisconnections(§\x17\x1a§)
   {
      dofus.datacenter.Game._bLogMapDisconnections = _loc2_;
   }
   function get isFirstTurn()
   {
      return this._bFirstTurn;
   }
   function set isFirstTurn(§\x1a\x01§)
   {
      this._bFirstTurn = _loc2_;
   }
   function get isTacticMode()
   {
      return dofus.datacenter.Game._bTacticMode;
   }
   function set isTacticMode(§\x14\x14§)
   {
      dofus.datacenter.Game._bTacticMode = _loc2_;
      this.api.gfx.activateTacticMode(_loc2_);
   }
   function set playerCount(§\x01\x0f§)
   {
      this._nPlayerCount = Number(_loc2_);
   }
   function get playerCount()
   {
      return this._nPlayerCount;
   }
   function set currentTableTurn(§\x06\x13§)
   {
      this._nCurrentTableTurn = Number(_loc2_);
   }
   function get currentTableTurn()
   {
      return this._nCurrentTableTurn;
   }
   function set currentPlayerID(§\x1e\x13\x07§)
   {
      this._sCurrentPlayerID = _loc2_;
   }
   function get currentPlayerID()
   {
      return this._sCurrentPlayerID;
   }
   function set lastPlayerID(§\x1e\x10\x15§)
   {
      this._sLastPlayerID = _loc2_;
   }
   function get lastPlayerID()
   {
      return this._sLastPlayerID;
   }
   function set state(§\x1e\x1c\x17§)
   {
      this._nState = Number(_loc2_);
      this.dispatchEvent({type:"stateChanged",value:this._nState});
   }
   function get state()
   {
      return this._nState;
   }
   function set fightType(§\x05\x07§)
   {
      this._nFightType = _loc2_;
   }
   function get fightType()
   {
      return this._nFightType;
   }
   function set isSpectator(§\x15\x01§)
   {
      this._bSpectator = _loc2_;
   }
   function get isSpectator()
   {
      return this._bSpectator;
   }
   function set turnSequence(§\x1d\x05§)
   {
      this._aTurnSequence = _loc2_;
   }
   function get turnSequence()
   {
      return this._aTurnSequence;
   }
   function set results(§\x1e\x18\x02§)
   {
      this._oResults = _loc2_;
   }
   function get results()
   {
      return this._oResults;
   }
   function set isRunning(§\x15\x1d§)
   {
      this._bRunning = _loc2_;
   }
   function get isRunning()
   {
      return this._bRunning;
   }
   function get isFight()
   {
      return this._nState != undefined && this._nState > 1;
   }
   function get interactionType()
   {
      return this._nInteractionType;
   }
   function initialize()
   {
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this.api = _global.API;
      this._bRunning = false;
      this._nPlayerCount = 0;
      this._sCurrentPlayerID = null;
      this._sLastPlayerID = null;
      this._nState = 0;
      this._aTurnSequence = new Array();
      this._oResults = new Object();
      this._nInteractionType = 0;
      this._nCurrentTableTurn = 0;
   }
   function setInteractionType(§\x1e\f\x07§)
   {
      switch(_loc2_)
      {
         case "move":
            this._nInteractionType = dofus.datacenter.Game.INTERACTION_TYPE_MOVE;
            break;
         case "spell":
            this._nInteractionType = dofus.datacenter.Game.INTERACTION_TYPE_SPELL;
            break;
         case "cc":
            this._nInteractionType = dofus.datacenter.Game.INTERACTION_TYPE_CC;
            break;
         case "place":
            this._nInteractionType = dofus.datacenter.Game.INTERACTION_TYPE_PLACE;
            break;
         case "target":
            this._nInteractionType = dofus.datacenter.Game.INTERACTION_TYPE_TARGET;
            break;
         case "flag":
            this._nInteractionType = dofus.datacenter.Game.INTERACTION_TYPE_FLAG;
      }
   }
}
