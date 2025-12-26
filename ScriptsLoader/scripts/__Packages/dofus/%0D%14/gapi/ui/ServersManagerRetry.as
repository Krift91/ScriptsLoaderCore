class dofus.§\r\x14§.gapi.ui.ServersManagerRetry extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _lblCounter;
   var _lblCounterShadow;
   static var CLASS_NAME = "ServersManagerRetry";
   var _nTimer = 0;
   function ServersManagerRetry()
   {
      super();
   }
   function set timer(§\x1e\x1b\x1a§)
   {
      this.addToQueue({object:this,method:function(§\t\x02§)
      {
         this._nTimer = Number(_loc2_);
         if(this.initialized)
         {
            this.updateLabel();
         }
      },params:[_loc2_]});
   }
   function updateLabel()
   {
      var _loc2_ = this.api.lang.getText("SERVERS_MANAGER_RETRY",[this._nTimer]);
      this._lblCounter.text = _loc2_;
      this._lblCounterShadow.text = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.ServersManagerRetry.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.updateLabel});
   }
}
