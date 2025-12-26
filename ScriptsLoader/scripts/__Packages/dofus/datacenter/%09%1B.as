class dofus.datacenter.§\t\x1b§ extends Object
{
   var owner;
   var price;
   var size;
   var items;
   var guildName;
   var guildEmblem;
   function §\t\x1b§(nOwner, §\x01\x07§, §\x1e\x1d\r§, nItems, §\x1e\x11\x18§, §\x1e\x19\x06§)
   {
      super();
      this.owner = nOwner;
      this.price = _loc4_;
      this.size = _loc5_;
      this.items = nItems;
      this.guildName = _loc7_;
      this.guildEmblem = _loc8_;
   }
   function get isPublic()
   {
      return this.owner == -1;
   }
   function get hasNoOwner()
   {
      return this.owner == 0;
   }
   function isMine(§\x1e\x1a\x0b§)
   {
      return this.guildName == _loc2_.datacenter.Player.guildInfos.name;
   }
}
