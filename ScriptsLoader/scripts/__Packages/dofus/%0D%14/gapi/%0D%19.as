class dofus.§\r\x14§.gapi.§\r\x19§ extends ank.gapi.§\r\x19§
{
   function §\r\x19§()
   {
      super();
   }
   function loadUIComponent(§\x1e\x10\x0e§, §\x1e\x11\b§, §\x1e\x19\x1a§, §\x1e\x17\x0b§)
   {
      this.api.kernel.TipsManager.onNewInterface(_loc3_);
      this.api.kernel.StreamingDisplayManager.onNewInterface(_loc3_);
      var _loc7_ = super.loadUIComponent(_loc3_,_loc4_,_loc5_,_loc6_);
      return _loc7_;
   }
   function unloadUIComponent(§\x1e\x11\b§)
   {
      this.api.kernel.StreamingDisplayManager.onInterfaceClose(_loc3_);
      return super.unloadUIComponent(_loc3_);
   }
}
