class dofus.§\x0b\b§.TutorialServersManager extends dofus.§\x0b\b§.§\x1e\x12\x0f§
{
   static var _sSelf = null;
   function TutorialServersManager()
   {
      super();
      dofus["\x0b\b"].TutorialServersManager._sSelf = this;
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].TutorialServersManager._sSelf;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI,"tutorials","tutorials/");
   }
   function loadTutorial(sID)
   {
      this.loadData(sID + ".swf");
   }
   function onComplete(§\n\x1d§)
   {
      var _loc3_ = new dofus.datacenter.Tutorial(_loc2_);
      this.addToQueue({object:this.api.kernel.TutorialManager,method:this.api.kernel.TutorialManager.start,params:[_loc3_]});
   }
   function onFailed()
   {
      this.addToQueue({object:this.api.kernel,method:this.api.kernel.showMessage,params:[undefined,this.api.lang.getText("NO_TUTORIALDATA_FILE"),"ERROR_CHAT"]});
      this.api.kernel.TutorialManager.terminate(0);
   }
}
