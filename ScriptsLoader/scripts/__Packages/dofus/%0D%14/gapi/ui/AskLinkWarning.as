class dofus.§\r\x14§.gapi.ui.AskLinkWarning extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _sText;
   var _btnOk;
   var _winBackground;
   var _txtText;
   var dispatchEvent;
   static var CLASS_NAME = "AskLinkWarning";
   function AskLinkWarning()
   {
      super();
   }
   function set text(§\x1e\f\x12§)
   {
      this._sText = _loc2_;
   }
   function get text()
   {
      return this._sText;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.AskLinkWarning.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function addListeners()
   {
      this._btnOk.addEventListener("click",this);
   }
   function initTexts()
   {
      this._btnOk.label = this.api.lang.getText("OK");
      this._winBackground.title = this.api.lang.getText("CAUTION");
      this._txtText.text = this._sText;
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "_btnOk")
      {
         this.dispatchEvent({type:"ok",params:this.params});
      }
      this.unloadThis();
   }
}
