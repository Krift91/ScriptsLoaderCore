class dofus.§\r\x14§.gapi.ui.CenterInfo extends dofus.§\r\x14§.gapi.ui.CenterText
{
   var _sDesc;
   var _lblWhiteDesc;
   static var CLASS_NAME = "CenterInfo";
   function CenterInfo()
   {
      super();
   }
   function set textInfo(§\x1e\f\x12§)
   {
      this._sDesc = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.CenterInfo.CLASS_NAME);
   }
   function initText()
   {
      super.initText();
      this._lblWhiteDesc.text = this._sDesc;
   }
}
