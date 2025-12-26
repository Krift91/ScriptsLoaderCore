class dofus.§\r\x14§.gapi.ui.AskOk extends ank.gapi.ui.FlyWindow
{
   var _sText;
   var _winBackground;
   var dispatchEvent;
   static var CLASS_NAME = "AskOk";
   function AskOk()
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
   function initWindowContent()
   {
      var _loc2_ = this._winBackground.content;
      _loc2_._btnOk.addEventListener("click",this);
      _loc2_._txtText.addEventListener("change",this);
      _loc2_._txtText.text = this._sText;
      _loc2_._btnOk.label = this.api.lang.getText("OK");
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      this.api.kernel.KeyManager.removeShortcutsListener(this);
      this.dispatchEvent({type:"ok"});
      this.unloadThis();
   }
   function change(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._winBackground.content;
      _loc3_._btnOk._y = _loc3_._txtText._y + _loc3_._txtText.height + 20;
      this._winBackground.setPreferedSize();
   }
   function onShortcut(§\x1e\r\x14§)
   {
      if(_loc2_ == "ACCEPT_CURRENT_DIALOG")
      {
         Selection.setFocus();
         this.click();
         return false;
      }
      return true;
   }
}
