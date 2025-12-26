class dofus.§\r\x14§.gapi.controls.§\x1e\x0b§.AlignmentViewerOrder extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oSpec;
   var _lblInfos;
   var _lblSpecializationName;
   var _lblOrderName;
   var _ldrIcon;
   var _txtSpecializationDescription;
   static var CLASS_NAME = "AlignmentViewerOrder";
   function AlignmentViewerOrder()
   {
      super();
   }
   function set specialization(§\x1e\x17\x18§)
   {
      this._oSpec = _loc2_;
      if(this.initialized)
      {
         this.initData();
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls["\x1e\x0b"].AlignmentViewerOrder.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.initData});
   }
   function initTexts()
   {
      this._lblInfos.text = this.api.lang.getText("PLAYER_SPECIALIZATION");
   }
   function initData()
   {
      if(this._oSpec != undefined)
      {
         this._lblSpecializationName.text = this._oSpec.name;
         this._lblOrderName.text = this._oSpec.order.name;
         this._ldrIcon.contentPath = this._oSpec.order.iconFile;
         this._txtSpecializationDescription.text = this._oSpec.description;
      }
   }
}
