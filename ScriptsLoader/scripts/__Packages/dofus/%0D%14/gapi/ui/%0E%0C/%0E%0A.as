class dofus.§\r\x14§.gapi.ui.§\x0e\f§.§\x0e\n§ extends ank.gapi.core.§\x1e\n\f§
{
   var _lblName;
   var _lblLevel;
   function §\x0e\n§()
   {
      super();
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._lblName.text = _loc4_.name;
         this._lblLevel.text = _loc4_.level;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._lblLevel.text = "";
      }
   }
   function init()
   {
      super.init(false);
   }
}
