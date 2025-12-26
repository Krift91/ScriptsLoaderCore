class dofus.§\r\x14§.gapi.controls.GuildMountParkViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _dgMountParks;
   var _lblDescription;
   var _lblCount;
   static var CLASS_NAME = "GuildMountParkViewer";
   function GuildMountParkViewer()
   {
      super();
   }
   function set mountParks(§\x10\x01§)
   {
      this.updateData(_loc2_);
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.GuildMountParkViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
   }
   function initTexts()
   {
      this._dgMountParks.columnsNames = [this.api.lang.getText("LOCALISATION"),this.api.lang.getText("MOUTPARK_ITEM"),this.api.lang.getText("MOUNTS")];
      this._lblDescription.text = this.api.lang.getText("GUILD_MOUNTPARKS_LIST");
   }
   function updateData(§\x10\x01§)
   {
      this._lblCount.text = this.api.lang.getText("GUILD_MOUNTPARKS_COUNT",[_loc2_.length,this.api.datacenter.Player.guildInfos.maxMountParks]);
      _loc2_.sortOn("size",Array.NUMERIC | Array.DESCENDING);
      this._dgMountParks.dataProvider = _loc2_;
   }
}
