class dofus.§\r\x14§.gapi.ui.ItemFound extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nItemId;
   var _nQty;
   var _nRessourceId;
   var _ldrItem;
   var _txtDescription;
   static var CLASS_NAME = "ItemFound";
   var _nTimer = 0;
   function ItemFound()
   {
      super();
   }
   function set itemId(§\x04\x11§)
   {
      this._nItemId = _loc2_;
   }
   function set qty(§\x01\x02§)
   {
      this._nQty = _loc2_;
   }
   function set ressourceId(§\x1e\x1e\x07§)
   {
      this._nRessourceId = _loc2_;
   }
   function set timer(§\x1e\x1b\x1a§)
   {
      this._nTimer = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.ItemFound.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      if(this._nTimer != 0)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"itemFound",this,this.hide,this._nTimer);
      }
   }
   function initTexts()
   {
      var _loc2_ = new dofus.datacenter["\f\f"](0,this._nItemId,this._nQty);
      var _loc3_ = new dofus.datacenter["\f\f"](0,this._nRessourceId,1);
      this._ldrItem.contentPath = _loc2_.iconFile;
      this._txtDescription.text = this.api.lang.getText("ITEM_FOUND",[this._nQty,_loc2_.name,_loc3_.name]);
   }
   function hide()
   {
      this._alpha -= 5;
      if(this._alpha < 1)
      {
         this.unloadThis();
         return undefined;
      }
      this.addToQueue({object:this,method:this.hide});
   }
}
