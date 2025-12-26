class dofus.§\r\x14§.gapi.ui.AskCancel extends ank.gapi.ui.FlyWindow
{
   var _sText;
   var _winBackground;
   var dispatchEvent;
   static var CLASS_NAME = "AskCancel";
   function AskCancel()
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
      _loc2_._txtText.text = this._sText;
      _loc2_._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
      _loc2_._btnCancel.addEventListener("click",this);
      _loc2_._txtText.addEventListener("change",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "_btnCancel")
      {
         this.dispatchEvent({type:"cancel",params:this.params});
      }
      this.unloadThis();
   }
   function change(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._winBackground.content;
      _loc3_._btnCancel._y = _loc3_._txtText._y + _loc3_._txtText.height + 20;
      this._winBackground.setPreferedSize();
   }
}
