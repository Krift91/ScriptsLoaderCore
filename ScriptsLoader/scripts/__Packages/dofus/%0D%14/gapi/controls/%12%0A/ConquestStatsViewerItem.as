class dofus.§\r\x14§.gapi.controls.§\x12\n§.ConquestStatsViewerItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lblType;
   var _lblBonus;
   var _lblMalus;
   function ConquestStatsViewerItem()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._oItem = _loc4_;
         this._lblType.text = this._oItem.type;
         this._lblBonus.text = this._oItem.bonus;
         this._lblMalus.text = this._oItem.malus;
      }
      else if(this._lblType.text != undefined)
      {
         this._lblType.text = "";
         this._lblBonus.text = "";
         this._lblMalus.text = "";
      }
   }
}
