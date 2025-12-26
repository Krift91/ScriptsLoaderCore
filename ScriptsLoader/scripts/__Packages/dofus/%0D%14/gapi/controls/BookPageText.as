class dofus.§\r\x14§.gapi.controls.BookPageText extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oPage;
   var _txtPage;
   var owner;
   static var CLASS_NAME = "BookPageText";
   function BookPageText()
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
      super.init(false,dofus["\r\x14"].gapi.controls.BookPageText.CLASS_NAME);
   }
   function createChildren()
   {
      this._txtPage.wordWrap = true;
      this._txtPage.multiline = true;
      this._txtPage.embedFonts = true;
      this.addToQueue({object:this,method:this.updateData});
   }
   function updateData()
   {
      this.setCssStyle(this._oPage.cssFile);
   }
   function setCssStyle(§\x1e\x13\b§)
   {
      var _loc3_ = new TextField.StyleSheet();
      _loc3_.owner = this;
      _loc3_.onLoad = function()
      {
         this.owner.layoutContent(this);
      };
      _loc3_.load(_loc2_);
   }
   function layoutContent(§\x1e\r\n§)
   {
      this._txtPage.styleSheet = _loc2_;
      this._txtPage.htmlText = this._oPage.text;
   }
}
