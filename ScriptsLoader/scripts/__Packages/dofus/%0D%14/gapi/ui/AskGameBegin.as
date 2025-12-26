class dofus.§\r\x14§.gapi.ui.AskGameBegin extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnOk;
   var _winBackground;
   var _lblTitle;
   var _lblIncarnam;
   var _lblTemple;
   var _lblBoon;
   var dispatchEvent;
   static var CLASS_NAME = "AskGameBegin";
   function AskGameBegin()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.AskGameBegin.CLASS_NAME);
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
      this._winBackground.title = this.api.lang.getText("POPUP_GAME_BEGINNING_TITLE");
      this._lblTitle.text = this.api.lang.getText("POPUP_GAME_BEGINNING_SUBTITLE");
      this._lblIncarnam.text = this.api.lang.getText("POPUP_GAME_BEGINNING_PARAGRAPH1");
      this._lblTemple.text = this.api.lang.getText("POPUP_GAME_BEGINNING_PARAGRAPH2");
      this._lblBoon.text = this.api.lang.getText("POPUP_GAME_BEGINNING_PARAGRAPH3");
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "_btnOk")
      {
         this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_START_POPUP);
         this.dispatchEvent({type:"ok",params:this.params});
         this.unloadThis();
      }
   }
}
