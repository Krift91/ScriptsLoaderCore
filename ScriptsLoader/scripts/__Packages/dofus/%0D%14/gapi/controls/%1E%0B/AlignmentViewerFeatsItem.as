class dofus.§\r\x14§.gapi.controls.§\x1e\x0b§.AlignmentViewerFeatsItem extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _mcList;
   var _ldrIcon;
   var _lblName;
   var _lblEffect;
   function AlignmentViewerFeatsItem()
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
         this._ldrIcon.contentPath = _loc4_.iconFile;
         this._lblName.text = _loc4_.name + (_loc4_.level != undefined ? " (" + this._mcList.gapi.api.lang.getText("LEVEL_SMALL") + " " + _loc4_.level + ")" : "");
         this._lblEffect.text = _loc4_.effect.description != undefined ? _loc4_.effect.description : "";
      }
      else if(this._lblName.text != undefined)
      {
         this._ldrIcon.contentPath = "";
         this._lblName.text = "";
         this._lblEffect.text = "";
      }
   }
}
