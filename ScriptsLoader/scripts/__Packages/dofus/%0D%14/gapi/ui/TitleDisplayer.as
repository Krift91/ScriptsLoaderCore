class dofus.§\r\x14§.gapi.ui.TitleDisplayer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _sTitle;
   var _txtYouHaveWon;
   var _txtTitle;
   static var CLASS_NAME = "TitleDisplayer";
   function TitleDisplayer()
   {
      super();
   }
   function set title(§\x1e\f\x0e§)
   {
      this._sTitle = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.TitleDisplayer.CLASS_NAME);
      this._txtYouHaveWon.text = "";
      this._txtTitle.text = "";
   }
   function createChildren()
   {
      this._txtYouHaveWon._alpha = this._txtTitle._alpha = 0;
      this.addToQueue({object:this,method:this.initText});
   }
   function initText()
   {
      this._txtTitle.text = this._sTitle;
      this._txtYouHaveWon.text = this.api.lang.getText("TITLE_WON");
   }
}
