class dofus.datacenter.§\x1e\x15\x1a§
{
   var _eaQuests;
   function §\x1e\x15\x1a§()
   {
      this.initialize();
   }
   function get quests()
   {
      return this._eaQuests;
   }
   function getQuest(§\x04\x12§)
   {
      var _loc3_ = this._eaQuests.findFirstItem("id",_loc2_);
      if(_loc3_.index != -1)
      {
         return _loc3_.item;
      }
      return null;
   }
   function initialize()
   {
      this._eaQuests = new ank["\x1e\n\x07"]["\x0f\x01"]();
   }
}
