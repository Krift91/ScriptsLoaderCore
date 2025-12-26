class dofus.§\r\x14§.gapi.controls.ListInventoryViewer extends dofus.§\r\x14§.gapi.controls.§\f\x0e§
{
   var _oOverItem;
   var _lstInventory;
   var _mcLstPlacer;
   var _oDataViewer;
   var _lblFilter;
   var _oKamasProvider;
   var _lblKama;
   var _mcKamaSymbol;
   var _cbTypes;
   var dispatchEvent;
   static var CLASS_NAME = "ListInventoryViewer";
   var _bDisplayKama = true;
   var _bDisplayPrices = true;
   function ListInventoryViewer()
   {
      super();
   }
   function get currentOverItem()
   {
      return this._oOverItem;
   }
   function get lstInventory()
   {
      return this._lstInventory;
   }
   function set displayKamas(§\x1b\x02§)
   {
      this._bDisplayKama = _loc2_;
      if(this.initialized)
      {
         this.showKamas(_loc2_);
      }
   }
   function set displayPrices(§\x1a\x1d§)
   {
      if(this.initialized)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[displayPrices] impossible après init");
         return;
      }
      this._bDisplayPrices = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.ListInventoryViewer.CLASS_NAME);
   }
   function createChildren()
   {
      var _loc3_ = !this._bDisplayPrices ? "ListInventoryViewerItemNoPrice" : "ListInventoryViewerItem";
      this.attachMovie("List","_lstInventory",10,{styleName:"LightBrownList",cellRenderer:_loc3_,rowHeight:20});
      this._lstInventory.move(this._mcLstPlacer._x,this._mcLstPlacer._y);
      this._lstInventory.setSize(this._mcLstPlacer._width,this._mcLstPlacer._height);
      this._oDataViewer = this._lstInventory;
      this.showKamas(this._bDisplayKama);
      this.addToQueue({object:this,method:this.addListeners});
      super.createChildren();
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function addListeners()
   {
      super.addListeners();
      this._lstInventory.addEventListener("itemSelected",this);
      this._lstInventory.addEventListener("itemdblClick",this);
      this._lstInventory.addEventListener("itemRollOver",this);
      this._lstInventory.addEventListener("itemRollOut",this);
   }
   function initTexts()
   {
      this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
   }
   function initData()
   {
      this.kamaChanged({value:this._oKamasProvider.Kama});
   }
   function showKamas(§\x15\x0e§)
   {
      this._lblKama._visible = _loc2_;
      this._mcKamaSymbol._visible = _loc2_;
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      super.itemSelected(_loc3_);
      if(_loc3_.target != this._cbTypes)
      {
         if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc3_.row.item != undefined)
         {
            this.api.kernel.GameManager.insertItemInChat(_loc3_.row.item);
            return undefined;
         }
         this.dispatchEvent({type:"selectedItem",item:_loc3_.row.item,targets:_loc3_.targets});
      }
   }
   function itemdblClick(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"itemdblClick",item:_loc2_.row.item,targets:_loc2_.targets});
   }
   function itemRollOver(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.row.item;
      this._oOverItem = _loc3_;
      this.dispatchEvent({type:"rollOverItem",item:_loc2_.row.item,targets:_loc2_.targets});
   }
   function itemRollOut(§\x1e\x19\x0e§)
   {
      this._oOverItem = undefined;
      var _loc3_ = _loc2_.row.item;
      this.dispatchEvent({type:"rollOutItem",item:_loc2_.row.item,targets:_loc2_.targets});
   }
}
