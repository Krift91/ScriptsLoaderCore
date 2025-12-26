class dofus.§\x0b\b§.DocumentsServersManager extends dofus.§\x0b\b§.§\x1e\x12\x0f§
{
   static var _sSelf = null;
   function DocumentsServersManager()
   {
      super();
      dofus["\x0b\b"].DocumentsServersManager._sSelf = this;
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].DocumentsServersManager._sSelf;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI,"docs","docs/");
   }
   function loadDocument(sID)
   {
      this.loadData(sID + ".swf");
   }
   function getDocumentObject(§\n\x1d§)
   {
      return new dofus.datacenter.Document(_loc2_);
   }
   function onComplete(§\n\x1d§)
   {
      var _loc3_ = this.getDocumentObject(_loc2_);
      this.addToQueue({object:this.api.ui,method:this.api.ui.loadUIComponent,params:[_loc3_.uiType,"Document",{document:_loc3_}]});
   }
   function onFailed()
   {
      this.addToQueue({object:this.api.kernel,method:this.api.kernel.showMessage,params:[undefined,this.api.lang.getText("NO_DOCUMENTDATA_FILE"),"ERROR_BOX",{name:"NoMapData"}]});
      this.api.network.Documents.leave();
   }
}
