class dofus.aks.Documents extends dofus.aks.Handler
{
   function Documents(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function leave()
   {
      this.aks.send("dV");
   }
   function onCreate(§\x14\x16§, §\x1e\x12\r§)
   {
      if(_loc2_)
      {
         var _loc4_ = _loc3_;
         var _loc5_ = this.api.config.language;
         this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("LOADING"),background:false},{bForceLoad:true});
         this.api.kernel.DocumentsServersManager.loadDocument(_loc5_ + "_" + _loc4_);
      }
   }
   function onLeave()
   {
      this.api.ui.unloadUIComponent("Document");
   }
}
