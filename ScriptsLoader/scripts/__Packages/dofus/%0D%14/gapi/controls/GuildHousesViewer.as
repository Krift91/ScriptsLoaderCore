class dofus.§\r\x14§.gapi.controls.GuildHousesViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _lblDescription;
   var _lblHouse;
   var _lblOwner;
   var _lblCoordsTitle;
   var _lblOwnerTitle;
   var _lblSkillsTitle;
   var _lblRightsTitle;
   var _lblSelectHouse;
   var _btnTeleport;
   var _lstHouses;
   var _hSelectedHouse;
   var _lblHouseName;
   var _lblHouseCoords;
   var _lblHouseOwner;
   var _lstSkills;
   var _lstRights;
   var _mcHouseIcon;
   var _mcMask;
   static var CLASS_NAME = "GuildHousesViewer";
   function GuildHousesViewer()
   {
      super();
   }
   function set houses(§\x10\x07§)
   {
      this.updateData(_loc2_);
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.GuildHousesViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
   }
   function initTexts()
   {
      this._lblDescription.text = this.api.lang.getText("GUILD_HOUSES_LIST");
      this._lblHouse.text = this.api.lang.getText("HOUSE_WORD");
      this._lblOwner.text = this.api.lang.getText("OWNER_WORD");
      this._lblCoordsTitle.text = this.api.lang.getText("COORDINATES");
      this._lblOwnerTitle.text = this.api.lang.getText("OWNER_WORD");
      this._lblSkillsTitle.text = this.api.lang.getText("SKILLS");
      this._lblRightsTitle.text = this.api.lang.getText("RIGHTS");
      this._lblSelectHouse.text = this.api.lang.getText("SELECT_A_HOUSE");
      this._btnTeleport.label = this.api.lang.getText("JOIN_SMALL");
   }
   function addListeners()
   {
      this._lstHouses.addEventListener("itemSelected",this);
      this._btnTeleport.addEventListener("click",this);
   }
   function updateData(§\x10\x07§)
   {
      this._lstHouses.dataProvider = _loc2_;
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      this._hSelectedHouse = dofus.datacenter["\r\x04"](_loc2_.row.item);
      this._lblHouseName.text = this._hSelectedHouse.name;
      this._lblHouseCoords.text = this._hSelectedHouse.coords.x + ";" + this._hSelectedHouse.coords.y;
      this._lblHouseOwner.text = this._hSelectedHouse.ownerName;
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = 0;
      while(_loc4_ < this._hSelectedHouse.skills.length)
      {
         var _loc5_ = new dofus.datacenter["\x1e\x10\x1d"](this._hSelectedHouse.skills[_loc4_]);
         if(!_global.isNaN(_loc5_.id))
         {
            _loc3_.push({id:_loc5_.id,label:_loc5_.description});
         }
         _loc4_ = _loc4_ + 1;
      }
      this._lstSkills.dataProvider = _loc3_;
      this._lstRights.dataProvider = this._hSelectedHouse.getHumanReadableRightsList();
      this._btnTeleport._visible = this._hSelectedHouse.hasRight(dofus.datacenter["\r\x04"].GUILDSHARE_TELEPORT);
      if(!this._btnTeleport._visible)
      {
         if(!this._mcHouseIcon.moved)
         {
            this._mcHouseIcon.moved = true;
            this._mcHouseIcon._y += this._btnTeleport._height / 2;
         }
      }
      this._mcMask._visible = false;
      this._lblSelectHouse._visible = false;
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnTeleport)
      {
         if(this._hSelectedHouse == null)
         {
            return undefined;
         }
         if(!this._hSelectedHouse.hasRight(dofus.datacenter["\r\x04"].GUILDSHARE_TELEPORT))
         {
            return undefined;
         }
         this.api.network.Guild.teleportToGuildHouse(this._hSelectedHouse.id);
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnTeleport)
      {
         this.gapi.showTooltip(this.api.lang.getText("GUILD_HOUSE_TELEPORT_TOOLTIP"),this._btnTeleport,-20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
}
