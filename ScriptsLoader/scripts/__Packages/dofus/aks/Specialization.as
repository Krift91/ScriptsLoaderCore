class dofus.aks.Specialization extends dofus.aks.Handler
{
   function Specialization(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function onSet(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      if(_global.isNaN(_loc3_) || (_loc2_.length == 0 || _loc3_ == 0))
      {
         this.api.datacenter.Player.specialization = undefined;
      }
      else
      {
         var _loc4_ = new dofus.datacenter.Specialization(_loc3_);
         this.api.datacenter.Player.specialization = _loc4_;
      }
   }
   function onChange(§\x1e\x12\r§)
   {
      this.onSet(_loc2_);
      var _loc3_ = this.api.datacenter.Player.specialization;
      if(_loc3_ == undefined)
      {
         this.api.kernel.showMessage(this.api.lang.getText("SPECIALIZATION"),this.api.lang.getText("YOU_HAVE_NO_SPECIALIZATION"),"ERROR_BOX");
      }
      else
      {
         this.api.kernel.showMessage(this.api.lang.getText("SPECIALIZATION"),this.api.lang.getText("YOUR_SPECIALIZATION_CHANGED",[_loc3_.name]),"ERROR_BOX");
      }
   }
}
