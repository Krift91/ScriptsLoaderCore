class dofus.datacenter.§\x1e\x19\f§ extends ank.battlefield.datacenter.§\x1e\x0e\x10§
{
   var _sName;
   var _gfxID;
   var _sGuildName;
   var _oEmblem;
   var _sOfflineType;
   var xtraClipTopAnimations = {staticL:true,staticF:true,staticR:true};
   function §\x1e\x19\f§(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID)
   {
      super();
      if(this.__proto__ == dofus.datacenter["\x1e\x19\f"].prototype)
      {
         this.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_,gfxID);
      }
   }
   function set name(§\x1e\x0f\x16§)
   {
      this._sName = _loc2_;
   }
   function get name()
   {
      return this._sName;
   }
   function get gfxID()
   {
      return this._gfxID;
   }
   function set gfxID(§\x1e\n\x02§)
   {
      this._gfxID = _loc2_;
   }
   function initialize(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID)
   {
      super.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_);
      this._gfxID = gfxID;
   }
   function set guildName(§\x1e\x11\x18§)
   {
      this._sGuildName = _loc2_;
   }
   function get guildName()
   {
      return this._sGuildName;
   }
   function set emblem(§\x1e\x19\x10§)
   {
      this._oEmblem = _loc2_;
   }
   function get emblem()
   {
      return this._oEmblem;
   }
   function set offlineType(§\x1e\x0f\r§)
   {
      this._sOfflineType = _loc2_;
   }
   function get offlineType()
   {
      return this._sOfflineType;
   }
}
