class dofus.§\r\x14§.gapi.controls.MountWeight extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _pbWeight;
   var _nCurrentWeight;
   static var CLASS_NAME = "MountWeight";
   function MountWeight()
   {
      super();
   }
   function set styleName(§\x1e\r\x07§)
   {
      this._sStyleName = _loc2_;
      if(this.initialized)
      {
         this._pbWeight.styleName = _loc2_;
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.MountWeight.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
   }
   function addListeners()
   {
      this._pbWeight.addEventListener("over",this);
      this._pbWeight.addEventListener("out",this);
      this.api.datacenter.Player.mount.addEventListener("podsChanged",this);
   }
   function initData()
   {
      if(this._sStyleName != undefined)
      {
         this._pbWeight.styleName = this._sStyleName;
      }
      this.podsChanged();
   }
   function podsChanged(§\x1e\x19\x0e§)
   {
      var _loc3_ = this.api.datacenter.Player.mount.podsMax;
      var _loc4_ = this.api.datacenter.Player.mount.pods;
      this._nCurrentWeight = _loc4_;
      this._pbWeight.maximum = _loc3_;
      this._pbWeight.value = _loc4_;
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._pbWeight)
      {
         var _loc3_ = _loc2_.target.maximum;
         var _loc4_ = new ank["\x1e\n\x07"]["\x0e\x1c"](this._nCurrentWeight).addMiddleChar(" ",3);
         var _loc5_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc3_).addMiddleChar(" ",3);
         this.gapi.showTooltip(this.api.lang.getText("PLAYER_WEIGHT",[_loc4_,_loc5_]),_loc2_.target,-20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
}
