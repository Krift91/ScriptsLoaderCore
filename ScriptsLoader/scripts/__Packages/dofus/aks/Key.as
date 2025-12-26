class dofus.aks.Key extends dofus.aks.Handler
{
   function Key(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function leave()
   {
      this.aks.send("KV",false);
   }
   function sendKey(§\x1e\x1b\x13§, §\x1e\x11\x02§)
   {
      this.aks.send("KK" + _loc2_ + "|" + _loc3_);
   }
   function onCreate(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = Number(_loc3_[1]);
      this.api.ui.loadUIComponent("KeyCode","KeyCode",{title:this.api.lang.getText("TYPE_CODE"),changeType:_loc4_,slotsCount:_loc5_});
   }
   function onKey(§\x14\x16§)
   {
      var _loc3_ = !_loc2_ ? this.api.lang.getText("BAD_CODE") : this.api.lang.getText("CODE_CHANGED");
      this.api.kernel.showMessage(this.api.lang.getText("CODE"),_loc3_,"ERROR_BOX",{name:"Key"});
   }
   function onLeave()
   {
      this.api.ui.unloadUIComponent("KeyCode");
   }
}
