class dofus.§\r\x14§.gapi.controls.BuffViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oItem;
   var _lblName;
   var _txtDescription;
   var _ldrIcon;
   var _lstInfos;
   static var CLASS_NAME = "BuffViewer";
   function BuffViewer()
   {
      super();
   }
   function set itemData(§\x1e\x19\x03§)
   {
      this._oItem = _loc2_;
      this.addToQueue({object:this,method:this.showItemData,params:[_loc2_]});
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.BuffViewer.CLASS_NAME);
   }
   function createChildren()
   {
   }
   function showItemData(§\x1e\x19\x03§)
   {
      if(_loc2_ != undefined)
      {
         this._lblName.text = _loc2_.name;
         this._txtDescription.text = _loc2_.description;
         this._ldrIcon.contentPath = _loc2_.iconFile;
         this._lstInfos.dataProvider = _loc2_.effects;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._txtDescription.text = "";
         this._ldrIcon.contentPath = "";
         this._lstInfos.removeAll();
      }
   }
}
