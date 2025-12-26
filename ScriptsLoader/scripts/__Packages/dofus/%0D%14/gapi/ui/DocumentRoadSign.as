class dofus.§\r\x14§.gapi.ui.DocumentRoadSign extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oDoc;
   var _txtCore;
   var _mcSmall;
   var _btnClose;
   var _bgHidder;
   var _lblTitle;
   var owner;
   static var CLASS_NAME = "DocumentRoadSign";
   function DocumentRoadSign()
   {
      super();
   }
   function set document(§\x1e\x19\x13§)
   {
      this._oDoc = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.DocumentRoadSign.CLASS_NAME);
   }
   function callClose()
   {
      this.api.network.Documents.leave();
      return true;
   }
   function createChildren()
   {
      this._txtCore.wordWrap = true;
      this._txtCore.multiline = true;
      this._txtCore.embedFonts = true;
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.updateData});
      this._mcSmall._visible = false;
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._bgHidder.addEventListener("click",this);
   }
   function updateData()
   {
      this.setCssStyle(this._oDoc.getPage(0).cssFile);
      if(this._lblTitle.text == undefined)
      {
         return undefined;
      }
      if(this._oDoc.title.substr(0,2) == "//")
      {
         this._mcSmall._visible = false;
         this._lblTitle.text = "";
      }
      else
      {
         this._mcSmall._visible = true;
         this._lblTitle.text = this._oDoc.title;
      }
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
      this._txtCore.styleSheet = _loc2_;
      this._txtCore.htmlText = this._oDoc.getPage(0).text;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_bgHidder":
         case "_btnClose":
            this.callClose();
      }
   }
}
