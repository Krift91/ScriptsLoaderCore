class ank.battlefield.datacenter.Map extends Object
{
   var id;
   var originalsCellsBackup;
   var data;
   function Map(§\x04\x12§)
   {
      super();
      this.initialize(_loc3_);
   }
   function initialize(§\x04\x12§)
   {
      this.id = _loc2_;
      this.originalsCellsBackup = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   }
   function cleanSpritesOn()
   {
      if(this.data != undefined)
      {
         for(var k in this.data)
         {
            this.data[k].removeAllSpritesOnID();
         }
      }
   }
}
