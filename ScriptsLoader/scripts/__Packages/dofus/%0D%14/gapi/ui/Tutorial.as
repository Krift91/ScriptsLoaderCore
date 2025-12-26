class dofus.§\r\x14§.gapi.ui.Tutorial extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnCancel;
   static var CLASS_NAME = "Tutorial";
   function Tutorial()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Tutorial.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._btnCancel.addEventListener("click",this);
      this._btnCancel.addEventListener("over",this);
      this._btnCancel.addEventListener("out",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "_btnCancel")
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("LEAVE_TUTORIAL"),"CAUTION_YESNO",{name:"Tutorial",listener:this});
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      this.gapi.showTooltip(this.api.lang.getText("CANCEL_TUTORIAL"),_loc2_.target,-20);
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function yes(§\x1e\x19\x0e§)
   {
      this.api.kernel.TutorialManager.cancel();
   }
}
