class dofus.§\r\x14§.gapi.controls.GuildMembersViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _eaData;
   var _dgMembers;
   var _btnShowOfflineMembers;
   var _lblDescription;
   var _lblShowOfflineMembers;
   var _lblCount;
   var _lblSeeAvgMembersLvl;
   static var CLASS_NAME = "GuildMembersViewer";
   function GuildMembersViewer()
   {
      super();
   }
   function set members(§\x10\x03§)
   {
      this._eaData = _loc2_;
      this.updateData(this._eaData);
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.GuildMembersViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._dgMembers.addEventListener("itemSelected",this);
      this._dgMembers.addEventListener("itemRollOver",this);
      this._dgMembers.addEventListener("itemRollOut",this);
      this._btnShowOfflineMembers.addEventListener("click",this);
   }
   function initTexts()
   {
      this._dgMembers.columnsNames = ["","",this.api.lang.getText("NAME_BIG"),this.api.lang.getText("GUILD_RANK"),this.api.lang.getText("LEVEL_SMALL"),this.api.lang.getText("PERCENT_XP"),this.api.lang.getText("WIN_XP"),""];
      this._lblDescription.text = this.api.lang.getText("GUILD_MEMBERS_LIST");
      this._lblShowOfflineMembers.text = this.api.lang.getText("DISPLAY_OFFLINE_GUILD_MEMBERS");
   }
   function updateData(§\x10\x03§)
   {
      var _loc3_ = 0;
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.length)
      {
         if(_loc2_[_loc4_].state != 0)
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
      this._lblCount.text = _loc3_ + " / " + String(_loc2_.length) + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("MEMBERS"),"m",_loc2_.length < 2);
      var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      if(!this._btnShowOfflineMembers.selected)
      {
         var _loc6_ = 0;
         while(_loc6_ < _loc2_.length)
         {
            if(_loc2_[_loc6_].state != 0)
            {
               _loc5_.push(_loc2_[_loc6_]);
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      else
      {
         _loc5_ = _loc2_;
      }
      var _loc7_ = 0;
      var _loc8_ = 0;
      while(_loc8_ < _loc2_.length)
      {
         _loc7_ += _loc2_[_loc8_].level;
         _loc8_ = _loc8_ + 1;
      }
      _loc7_ = Math.floor(_loc7_ / _loc2_.length);
      if(!_global.isNaN(_loc7_))
      {
         this._lblSeeAvgMembersLvl.text = this.api.lang.getText("GUILD_AVG_MEMBERS_LEVEL") + " : " + _loc7_;
      }
      else
      {
         this._lblSeeAvgMembersLvl.text = "";
      }
      this._dgMembers.dataProvider = _loc5_;
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.row.item;
      if(_loc3_.name != this.api.datacenter.Player.Name)
      {
         if(_loc3_.state == 0)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED",[_loc3_.name]),"ERROR_CHAT");
         }
         else
         {
            this.api.kernel.GameManager.showPlayerPopupMenu(_loc3_.name,_loc2_.row.item.name,undefined,undefined,true,undefined,this.api.datacenter.Player.isAuthorized);
         }
      }
   }
   function itemRollOver(§\x1e\x19\x0e§)
   {
      _loc2_.row.cellRenderer_mc.over();
   }
   function itemRollOut(§\x1e\x19\x0e§)
   {
      _loc2_.row.cellRenderer_mc.out();
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnShowOfflineMembers)
      {
         this.updateData(this._eaData);
      }
   }
}
