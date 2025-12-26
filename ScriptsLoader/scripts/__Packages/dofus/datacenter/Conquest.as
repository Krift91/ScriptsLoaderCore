class dofus.datacenter.Conquest extends Object
{
   var _eaPlayers;
   var _eaAttackers;
   var _cbdAlignBonus;
   var dispatchEvent;
   var _cbdAlignMalus;
   var _cbdRankMultiplicator;
   var _cwdDatas;
   function Conquest()
   {
      super();
      this.clear();
      eval("\t\x04").events["\x0f\x03"].initialize(this);
   }
   function clear()
   {
      this._eaPlayers = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaAttackers = new ank["\x1e\n\x07"]["\x0f\x01"]();
   }
   function get alignBonus()
   {
      return this._cbdAlignBonus;
   }
   function set alignBonus(§\x13\r§)
   {
      this._cbdAlignBonus = _loc2_;
      this.dispatchEvent({type:"bonusChanged"});
   }
   function get alignMalus()
   {
      return this._cbdAlignMalus;
   }
   function set alignMalus(§\x13\r§)
   {
      this._cbdAlignMalus = _loc2_;
      this.dispatchEvent({type:"bonusChanged"});
   }
   function get rankMultiplicator()
   {
      return this._cbdRankMultiplicator;
   }
   function set rankMultiplicator(§\x13\r§)
   {
      this._cbdRankMultiplicator = _loc2_;
      this.dispatchEvent({type:"bonusChanged"});
   }
   function get players()
   {
      return this._eaPlayers;
   }
   function set players(§\x1e\n\x02§)
   {
      this._eaPlayers = _loc2_;
   }
   function get attackers()
   {
      return this._eaAttackers;
   }
   function set attackers(§\x1e\n\x02§)
   {
      this._eaAttackers = _loc2_;
   }
   function get worldDatas()
   {
      return this._cwdDatas;
   }
   function set worldDatas(§\x1e\n\x02§)
   {
      this._cwdDatas = _loc2_;
      this.dispatchEvent({type:"worldDataChanged",value:_loc2_});
   }
}
