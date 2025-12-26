class dofus.§\r\x14§.gapi.ui.WaitingMessage extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _lblWhite;
   var _lblBlackTL;
   var _lblBlackTR;
   var _lblBlackBL;
   var _lblBlackBR;
   static var CLASS_NAME = "WaitingMessage";
   var _sText = "";
   function WaitingMessage()
   {
      super();
   }
   function set text(§\x1e\f\x12§)
   {
      this._sText = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.WaitingMessage.CLASS_NAME);
   }
   function createChildren()
   {
      if(this._sText.length == 0)
      {
         return undefined;
      }
      this.addToQueue({object:this,method:this.initText});
   }
   function initText()
   {
      this._lblWhite.text = this._lblBlackTL.text = this._lblBlackTR.text = this._lblBlackBL.text = this._lblBlackBR.text = this._sText;
   }
}
