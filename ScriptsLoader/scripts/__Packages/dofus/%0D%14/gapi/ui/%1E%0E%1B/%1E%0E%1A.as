class dofus.§\r\x14§.gapi.ui.§\x1e\x0e\x1b§.§\x1e\x0e\x1a§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lblName;
   var _lblLevel;
   function §\x1e\x0e\x1a§()
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
         this._oItem = dofus.datacenter["\x1e\x0e\x1c"](_loc4_);
         this._lblName.text = this._oItem.name;
         this._lblLevel.text = String(this._oItem.level);
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._lblLevel.text = "";
      }
   }
}
