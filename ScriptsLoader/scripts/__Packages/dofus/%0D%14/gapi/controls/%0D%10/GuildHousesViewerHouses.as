class dofus.§\r\x14§.gapi.controls.§\r\x10§.GuildHousesViewerHouses extends ank.gapi.core.§\x1e\n\f§
{
   var _mcIcon;
   var _oItem;
   var _lblName;
   var _lblOwner;
   function GuildHousesViewerHouses()
   {
      super();
      this._mcIcon._visible = false;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._oItem = dofus.datacenter["\r\x04"](_loc4_);
         this._lblName.text = this._oItem.name;
         this._lblOwner.text = this._oItem.ownerName;
         this._mcIcon._visible = true;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._lblOwner.text = "";
         this._mcIcon._visible = false;
      }
   }
   function init()
   {
      super.init(false);
   }
}
