class dofus.§\r\x14§.gapi.ui.quests.§\x1e\x15\x13§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lblName;
   var _ldrIcon;
   function §\x1e\x15\x13§()
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
         this._lblName.text = _loc4_.label;
         this._ldrIcon.contentPath = _loc4_.iconFile;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._ldrIcon.contentPath = "";
      }
   }
}
