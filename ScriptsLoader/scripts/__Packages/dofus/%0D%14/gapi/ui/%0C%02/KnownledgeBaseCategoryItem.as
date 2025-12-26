class dofus.§\r\x14§.gapi.ui.§\f\x02§.KnownledgeBaseCategoryItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcPicto;
   var _lblCategory;
   function KnownledgeBaseCategoryItem()
   {
      super();
      this._mcPicto._visible = false;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._lblCategory.text = _loc4_.n;
         this._mcPicto._visible = true;
      }
      else if(this._lblCategory.text != undefined)
      {
         this._lblCategory.text = "";
         this._mcPicto._visible = false;
      }
   }
   function init()
   {
      super.init(false);
   }
}
