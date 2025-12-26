class dofus.§\r\x14§.gapi.controls.StatsViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _winBg;
   var _dgStats;
   static var CLASS_NAME = "StatsViewer";
   function StatsViewer()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.StatsViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
   }
   function initTexts()
   {
      this._winBg.title = this.api.lang.getText("ADVANCED_STATS");
      this._dgStats.columnsNames = [this.api.lang.getText("STAT_WORD"),this.api.lang.getText("BASE_WORD"),this.api.lang.getText("STUFF_WORD"),this.api.lang.getText("FEATS"),this.api.lang.getText("BOOST"),this.api.lang.getText("TOTAL_WORD")];
   }
   function addListeners()
   {
      this.api.datacenter.Player.addEventListener("fullStatsChanged",this);
   }
   function initData()
   {
      var _loc2_ = this.api.datacenter.Player.FullStats;
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      for(var k in _loc2_)
      {
         _loc3_.push({isCat:true,name:this.api.lang.getText("FULL_STATS_CAT" + k)});
         var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         var _loc5_ = 0;
         while(_loc5_ < _loc2_[k].length)
         {
            _loc4_.push({name:this.api.lang.getText("FULL_STATS_ID" + _loc2_[k][_loc5_].id),s:_loc2_[k][_loc5_].s,i:_loc2_[k][_loc5_].i,d:_loc2_[k][_loc5_].d,b:_loc2_[k][_loc5_].b,o:Number(_loc2_[k][_loc5_].o),c:k,p:_loc2_[k][_loc5_].p});
            _loc5_ = _loc5_ + 1;
         }
         _loc4_.sortOn("o",Array.NUMERIC);
         var _loc6_ = _loc3_.concat(_loc4_);
         _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc3_.createFromArray(_loc6_);
      }
      this._dgStats.dataProvider = _loc3_;
   }
   function fullStatsChanged(§\x1e\x19\x0e§)
   {
      this.initData();
   }
}
