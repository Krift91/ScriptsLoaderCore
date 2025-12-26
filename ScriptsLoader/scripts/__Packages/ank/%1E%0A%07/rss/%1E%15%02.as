class ank.§\x1e\n\x07§.rss.§\x1e\x15\x02§ extends XML
{
   var _oData;
   var _aChannels;
   var dispatchEvent;
   function §\x1e\x15\x02§()
   {
      super();
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this.ignoreWhite = true;
      this.initialize();
   }
   function get data()
   {
      return this._oData;
   }
   function getChannels()
   {
      return this._aChannels;
   }
   function load(§\x1e\x0b\x1b§, §\x1e\x19\x15§)
   {
      super.load(_loc3_);
      this._oData = _loc4_;
   }
   function initialize()
   {
      this._aChannels = new Array();
   }
   function parse()
   {
      this.initialize();
      if(this.childNodes.length == 0)
      {
         return false;
      }
      var _loc2_ = this.firstChild;
      if(_loc2_.nodeName.toLowerCase() != "rss")
      {
         return false;
      }
      var _loc3_ = _loc2_.firstChild;
      while(_loc3_ != null)
      {
         if(_loc3_.nodeName.toLowerCase() == "channel")
         {
            var _loc4_ = new ank["\x1e\n\x07"].rss["\x1e\x15\x04"]();
            if(_loc4_.parse(_loc3_))
            {
               this._aChannels.push(_loc4_);
            }
         }
         _loc3_ = _loc3_.nextSibling;
      }
      return true;
   }
   function onLoad(§\x14\x16§)
   {
      if(_loc2_)
      {
         if(this.parse())
         {
            this.dispatchEvent({type:"onRSSLoaded",data:this._oData});
         }
         else
         {
            this.dispatchEvent({type:"onBadRSSFile",data:this._oData});
         }
      }
      else
      {
         this.dispatchEvent({type:"onRSSLoadError",data:this._oData});
      }
   }
}
