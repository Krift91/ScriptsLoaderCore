class dofus.§\r\x14§.gapi.ui.PayZone extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nDialogID;
   var _btnInfos;
   static var CLASS_NAME = "PayZone";
   function PayZone()
   {
      super();
   }
   function set dialogID(§\x06\t§)
   {
      this._nDialogID = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.PayZone.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      if(this.api.datacenter.Basics.payzone_isFirst)
      {
         this.gapi.loadUIComponent("PayZoneDialog2","PayZoneDialog2",{name:"El Pemy",gfx:"9059",dialogID:this._nDialogID});
      }
   }
   function addListeners()
   {
      this._btnInfos.addEventListener("click",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      this.gapi.loadUIComponent("PayZoneDialog2","PayZoneDialog2",{name:"El Pemy",gfx:"9059",dialogID:this._nDialogID});
   }
}
