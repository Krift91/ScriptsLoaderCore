class dofus.§\r\x14§.gapi.controls.BookPageTitle extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oPage;
   var _txtTitle;
   var _lblSubTitle;
   var _lblAuthor;
   static var CLASS_NAME = "BookPageTitle";
   function BookPageTitle()
   {
      super();
   }
   function set page(§\x1e\x18\f§)
   {
      this._oPage = _loc2_;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.BookPageTitle.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.updateData});
   }
   function updateData()
   {
      this._txtTitle.text = this._oPage.title != undefined ? this._oPage.title : "";
      this._lblSubTitle.text = this._oPage.subtitle != undefined ? this._oPage.subtitle : "";
      this._lblAuthor.text = this._oPage.author != undefined ? this._oPage.author : "";
   }
}
