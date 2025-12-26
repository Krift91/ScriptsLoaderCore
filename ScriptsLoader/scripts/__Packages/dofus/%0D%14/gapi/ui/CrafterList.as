class dofus.§\r\x14§.gapi.ui.CrafterList extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _eaJobs;
   var _eaCrafters;
   var _btnClose;
   var _btnClose2;
   var _dgCrafter;
   var _cbJobs;
   var _lblJob;
   var _winBackground;
   static var CLASS_NAME = "CrafterList";
   function CrafterList()
   {
      super();
   }
   function set jobs(§\x10\x05§)
   {
      this._eaJobs = _loc2_;
      if(this.initialized)
      {
         this.updateJobs();
      }
   }
   function set crafters(§\x10\r§)
   {
      this._eaCrafters.removeEventListener("modelChanged",this);
      this._eaCrafters = _loc2_;
      this._eaCrafters.addEventListener("modelChanged",this);
      if(this.initialized)
      {
         this.updateCrafters();
      }
   }
   function get crafters()
   {
      return this._eaCrafters;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.CrafterList.CLASS_NAME);
   }
   function callClose()
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"simulation");
      this.api.network.Exchange.leave();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.updateData});
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnClose2.addEventListener("click",this);
      this._dgCrafter.addEventListener("itemSelected",this);
      this._dgCrafter.addEventListener("itemdblClick",this);
      this._cbJobs.addEventListener("itemSelected",this);
   }
   function initTexts()
   {
      this._lblJob.text = this.api.lang.getText("JOB");
      this._winBackground.title = this.api.lang.getText("CRAFTERS_LIST");
      this._btnClose2.label = this.api.lang.getText("CLOSE");
      this._dgCrafter.columnsNames = ["",this.api.lang.getText("NAME_BIG"),this.api.lang.getText("LEVEL_SMALL"),this.api.lang.getText("SUBAREA"),this.api.lang.getText("COORDINATES"),this.api.lang.getText("IN_WORKSHOP"),this.api.lang.getText("NOT_FREE"),this.api.lang.getText("MIN_ITEM_IN_RECEIPT")];
   }
   function updateData()
   {
      this.updateJobs();
   }
   function updateJobs()
   {
      this._cbJobs.dataProvider = this._eaJobs;
      if(this._eaJobs != undefined && this._eaJobs.length > 0)
      {
         this._cbJobs.selectedIndex = 0;
         this.api.network.Exchange.getCrafterForJob(this._cbJobs.selectedItem.id);
      }
   }
   function updateCrafters()
   {
      this._dgCrafter.dataProvider = this._eaCrafters;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnClose:
         case this._btnClose2:
            this.callClose();
      }
   }
   function itemdblClick(§\x1e\x19\x0e§)
   {
      this.itemSelected(_loc2_);
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._cbJobs:
            this._eaCrafters.removeAll();
            this.api.network.Exchange.getCrafterForJob(this._cbJobs.selectedItem.id);
            break;
         case this._dgCrafter:
            var _loc3_ = _loc2_.row.item;
            this.api.ui.loadUIComponent("CrafterCard","CrafterCard",{crafter:_loc3_});
      }
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      this.updateCrafters();
   }
}
