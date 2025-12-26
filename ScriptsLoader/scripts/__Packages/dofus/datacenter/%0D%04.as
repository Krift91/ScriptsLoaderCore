class dofus.datacenter.§\r\x04§ extends Object
{
   var _nID;
   var _sName;
   var api;
   var _sDescription;
   var _nPrice;
   var dispatchEvent;
   var _oGuildEmblem;
   var _nGuildRights;
   var _pCoords;
   var _aSkills;
   static var GUILDSHARE_VISIBLE_GUILD_BRIEF = 1;
   static var GUILDSHARE_DOORSIGN_GUILD = 2;
   static var GUILDSHARE_DOORSIGN_OTHERS = 4;
   static var GUILDSHARE_ALLOWDOOR_GUILD = 8;
   static var GUILDSHARE_FORBIDDOOR_OTHERS = 16;
   static var GUILDSHARE_ALLOWCHESTS_GUILD = 32;
   static var GUILDSHARE_FORBIDCHESTS_OTHERS = 64;
   static var GUILDSHARE_TELEPORT = 128;
   static var GUILDSHARE_RESPAWN = 256;
   var _bLocalOwner = false;
   var _sOwnerName = new String();
   var _sGuildName = new String();
   var _bForSale = false;
   var _bLocked = false;
   var _bShared = false;
   function §\r\x04§(§\x04\x12§)
   {
      super();
      this.initialize(_loc3_);
   }
   function get id()
   {
      return this._nID;
   }
   function get name()
   {
      return this.api.lang.fetchString(this._sName);
   }
   function get description()
   {
      return this.api.lang.fetchString(this._sDescription);
   }
   function set price(§\x01\x07§)
   {
      this._nPrice = Number(_loc2_);
   }
   function get price()
   {
      return this._nPrice;
   }
   function set localOwner(§\x17\x1d§)
   {
      this._bLocalOwner = _loc2_;
   }
   function get localOwner()
   {
      return this._bLocalOwner;
   }
   function set ownerName(§\x1e\x0f\t§)
   {
      this._sOwnerName = _loc2_;
   }
   function get ownerName()
   {
      if(typeof this._sOwnerName == "string")
      {
         if(this._sOwnerName.length > 0)
         {
            return this._sOwnerName;
         }
      }
      return null;
   }
   function set guildName(§\x1e\x11\x18§)
   {
      this._sGuildName = _loc2_;
      this.dispatchEvent({type:"guild",value:this});
   }
   function get guildName()
   {
      if(typeof this._sGuildName == "string")
      {
         if(this._sGuildName.length > 0)
         {
            return this._sGuildName;
         }
      }
      return null;
   }
   function set guildEmblem(§\x1e\x19\x06§)
   {
      this._oGuildEmblem = _loc2_;
      this.dispatchEvent({type:"guild",value:this});
   }
   function get guildEmblem()
   {
      return this._oGuildEmblem;
   }
   function set guildRights(§\x1e\x1e\x04§)
   {
      this._nGuildRights = Number(_loc2_);
      this.dispatchEvent({type:"guild",value:this});
   }
   function get guildRights()
   {
      return this._nGuildRights;
   }
   function set isForSale(§\x19\f§)
   {
      this._bForSale = _loc2_;
      this.dispatchEvent({type:"forsale",value:_loc2_});
   }
   function get isForSale()
   {
      return this._bForSale;
   }
   function set isLocked(§\x17\x1c§)
   {
      this._bLocked = _loc2_;
      this.dispatchEvent({type:"locked",value:_loc2_});
   }
   function get isLocked()
   {
      return this._bLocked;
   }
   function set isShared(§\x15\x10§)
   {
      this._bShared = _loc2_;
      this.dispatchEvent({type:"shared",value:_loc2_});
   }
   function get isShared()
   {
      return this._bShared;
   }
   function set coords(§\x1e\x16\x18§)
   {
      this._pCoords = _loc2_;
   }
   function get coords()
   {
      return this._pCoords;
   }
   function set skills(§\x1d\n§)
   {
      this._aSkills = _loc2_;
   }
   function get skills()
   {
      return this._aSkills;
   }
   function initialize(§\x04\x12§)
   {
      this.api = _global.API;
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this._nID = _loc2_;
      var _loc3_ = this.api.lang.getHouseText(_loc2_);
      this._sName = _loc3_.n;
      this._sDescription = _loc3_.d;
   }
   function hasRight(§\x1e\x1e\x05§)
   {
      return (this._nGuildRights & _loc2_) == _loc2_;
   }
   function getHumanReadableRightsList()
   {
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = 1;
      while(_loc3_ < 8192)
      {
         if(this.hasRight(_loc3_))
         {
            _loc2_.push({id:_loc3_,label:this.api.lang.getText("GUILD_HOUSE_RIGHT_" + _loc3_)});
         }
         _loc3_ *= 2;
      }
      return _loc2_;
   }
}
