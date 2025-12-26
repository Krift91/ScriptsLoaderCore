class dofus.§\r\x14§.gapi.ui.BuffInfos extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _btnClose2;
   var _btnClose;
   var _bvBuffViewer;
   static var CLASS_NAME = "BuffInfos";
   function BuffInfos()
   {
      super();
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oData = _loc2_;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.BuffInfos.CLASS_NAME);
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.updateData});
   }
   function initTexts()
   {
      this._btnClose2.label = this.api.lang.getText("CLOSE");
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnClose2.addEventListener("click",this);
   }
   function updateData()
   {
      this._bvBuffViewer.itemData = this._oData;
   }
   function click(§\x1e\x19\x0e§)
   {
      this.callClose();
   }
}
