class dofus.§\r\x14§.gapi.controls.TaxCollectorsViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _dgTaxCollectors;
   var _lblDescription;
   var _lblHowDefend;
   var _lblCount;
   static var CLASS_NAME = "TaxCollectorsViewer";
   function TaxCollectorsViewer()
   {
      super();
   }
   function set taxCollectors(§\x0f\x11§)
   {
      this.updateData(_loc2_);
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.TaxCollectorsViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
   }
   function initTexts()
   {
      this._dgTaxCollectors.columnsNames = ["",this.api.lang.getText("NAME_BIG") + " / " + this.api.lang.getText("LOCALISATION"),this.api.lang.getText("ATTACKERS_SMALL"),this.api.lang.getText("DEFENDERS")];
      this._lblDescription.text = this.api.lang.getText("GUILD_TAXCOLLECTORS_LIST");
      this._lblHowDefend.text = this.api.lang.getText("HELP_HOW_DEFEND_TAX");
   }
   function updateData(§\x0f\x11§)
   {
      this._lblCount.text = String(_loc2_.length) + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("TAXCOLLECTORS"),"m",_loc2_.length < 2);
      _loc2_.sortOn("state",Array.NUMERIC | Array.DESCENDING);
      this._dgTaxCollectors.dataProvider = _loc2_;
   }
}
