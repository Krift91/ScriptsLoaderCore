class dofus.§\r\x14§.gapi.ui.AskAlertServer extends ank.gapi.ui.FlyWindow
{
   var _sText;
   var _winBackground;
   var dispatchEvent;
   static var CLASS_NAME = "AskAlertServer";
   var _bHideNext = false;
   function AskAlertServer()
   {
      super();
   }
   function set text(§\x1e\f\x12§)
   {
      this._sText = _loc2_;
   }
   function set hideNext(§\x19\b§)
   {
      this._bHideNext = _loc2_;
   }
   function initWindowContent()
   {
      var c = this._winBackground.content;
      c._btnClose.addEventListener("click",this);
      c._btnHideNext.addEventListener("click",this);
      c._txtText.text = this._sText;
      c._btnClose.label = this.api.lang.getText("CLOSE");
      c._lblHideNext.text = this.api.lang.getText("ALERT_HIDENEXT");
      SharedObject.getLocal(dofus.Constants.OPTIONS_SHAREDOBJECT_NAME).onStatus = function(§\x1e\x19\x0e§)
      {
         if(_loc2_.level == "status" && _loc2_.code == "SharedObject.Flush.Success")
         {
            c._btnHideNext._visible = true;
            c._lblHideNext._visible = true;
            c._btnHideNext.enabled = true;
            c._btnHideNext.selected = false;
         }
      };
      if(SharedObject.getLocal(dofus.Constants.OPTIONS_SHAREDOBJECT_NAME).flush() != true)
      {
         c._btnHideNext.enabled = false;
         c._btnHideNext.selected = false;
         c._btnHideNext._visible = false;
         c._lblHideNext._visible = false;
      }
      else
      {
         c._btnHideNext.selected = this._bHideNext;
      }
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
            this.api.kernel.KeyManager.removeShortcutsListener(this);
            this.dispatchEvent({type:"close",hideNext:this._bHideNext});
            this.unloadThis();
            break;
         case "_btnHideNext":
            this._bHideNext = _loc2_.target.selected;
      }
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
         this.click(this._winBackground.content._btnClose);
         return false;
      }
      return true;
   }
}
