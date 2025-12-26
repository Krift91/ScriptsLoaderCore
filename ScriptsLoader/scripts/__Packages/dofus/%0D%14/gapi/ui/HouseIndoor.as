class dofus.§\r\x14§.gapi.ui.HouseIndoor extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oHouse;
   var _mcForSale;
   var _mcLock;
   var _aSkills;
   var _mcHouse;
   static var CLASS_NAME = "HouseIndoor";
   function HouseIndoor()
   {
      super();
   }
   function set house(§\x1e\x19\x05§)
   {
      this._oHouse = _loc2_;
      _loc2_.addEventListener("forsale",this);
      _loc2_.addEventListener("locked",this);
      this._mcForSale._visible = _loc2_.isForSale;
      this._mcLock._visible = _loc2_.isLocked;
   }
   function set skills(§\x1d\x0b§)
   {
      this._aSkills = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.HouseIndoor.CLASS_NAME);
   }
   function createChildren()
   {
      this._mcHouse.onRelease = this.click;
      if(this._oHouse == undefined)
      {
         this._mcForSale._visible = false;
         this._mcLock._visible = false;
      }
   }
   function click()
   {
      var _loc2_ = this._parent.gapi.createPopupMenu();
      var _loc3_ = this._parent._oHouse;
      var _loc4_ = this._parent.api;
      _loc2_.addStaticItem(_loc3_.name);
      for(var k in this._parent._aSkills)
      {
         var _loc5_ = this._parent._aSkills[k];
         var _loc6_ = _loc5_.getState(true,_loc3_.localOwner,_loc3_.isForSale,_loc3_.isLocked,true);
         if(_loc6_ != "X")
         {
            _loc2_.addItem(_loc5_.description,_loc4_.kernel.GameManager,_loc4_.kernel.GameManager.useSkill,[_loc5_.id],_loc6_ == "V");
         }
      }
      if(_loc4_.datacenter.Player.guildInfos != undefined && _loc4_.datacenter.Player.guildInfos.isValid)
      {
         _loc2_.addItem(_loc4_.lang.getText("GUILD_HOUSE_CONFIGURATION"),this._parent,this._parent.guildHouse);
      }
      _loc2_.show(_root._xmouse,_root._ymouse);
   }
   function guildHouse()
   {
      this.api.ui.loadUIComponent("GuildHouseRights","GuildHouseRights",{house:this._oHouse});
   }
   function forsale(§\x1e\x19\x0e§)
   {
      this._mcForSale._visible = _loc2_.value;
   }
   function locked(§\x1e\x19\x0e§)
   {
      this._mcLock._visible = _loc2_.value;
   }
}
