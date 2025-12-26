class dofus.§\r\x14§.gapi.ui.login.§\x0b\x0b§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lblDate;
   var _lblTitle;
   var _ldrImage;
   var _mcSeparator;
   function §\x0b\x0b§()
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
         this._lblDate.text = _loc4_.getPubDateStr(_global.API.lang.getConfigText("LONG_DATE_FORMAT"),_global.API.config.language);
         this._lblTitle.bDisplayDebug = true;
         this._lblTitle.text = _loc4_.getTitle();
         this._ldrImage.contentPath = _loc4_.getIcon();
         this._mcSeparator._visible = true;
      }
      else if(this._lblDate.text != undefined)
      {
         this._lblDate.text = "";
         this._lblTitle.text = "";
         this._ldrImage.contentPath = "";
         this._mcSeparator._visible = false;
      }
   }
   function init()
   {
      super.init(false);
      this._mcSeparator._visible = false;
   }
}
