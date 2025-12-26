class dofus.§\r\x14§.gapi.ui.Storage extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _bMount;
   var _ivInventoryViewer;
   var _ivInventoryViewer2;
   var _itvItemViewer;
   var _pbPods;
   var _btnClose;
   var _winInventory;
   var _winInventory2;
   var _winItemViewer;
   static var CLASS_NAME = "Storage";
   function Storage()
   {
      super();
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oData = _loc2_;
   }
   function set isMount(§\x17\x15§)
   {
      this._bMount = _loc2_;
   }
   function get currentOverItem()
   {
      if(this._ivInventoryViewer != undefined && this._ivInventoryViewer.currentOverItem != undefined)
      {
         return this._ivInventoryViewer.currentOverItem;
      }
      if(this._ivInventoryViewer2 != undefined && this._ivInventoryViewer2.currentOverItem != undefined)
      {
         return this._ivInventoryViewer2.currentOverItem;
      }
      return undefined;
   }
   function get itemViewer()
   {
      return this._itvItemViewer;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Storage.CLASS_NAME);
   }
   function callClose()
   {
      if(this._bMount == true)
      {
         this.api.ui.loadUIComponent("Mount","Mount");
      }
      this.api.network.Exchange.leave();
      return true;
   }
   function createChildren()
   {
      if(this._bMount != true)
      {
         this._pbPods._visible = false;
      }
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTexts});
      this.hideItemViewer(true);
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._ivInventoryViewer.addEventListener("selectedItem",this);
      this._ivInventoryViewer.addEventListener("dblClickItem",this);
      this._ivInventoryViewer.addEventListener("dropItem",this);
      this._ivInventoryViewer.addEventListener("dragKama",this);
      this._ivInventoryViewer2.addEventListener("selectedItem",this);
      this._ivInventoryViewer2.addEventListener("dblClickItem",this);
      this._ivInventoryViewer2.addEventListener("dropItem",this);
      this._ivInventoryViewer2.addEventListener("dragKama",this);
      if(this._oData != undefined)
      {
         this._oData.addEventListener("modelChanged",this);
      }
      else
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[Storage] il n\'y a pas de data");
      }
   }
   function initTexts()
   {
      this._winInventory.title = this.api.datacenter.Player.data.name;
      if(this._bMount != true)
      {
         this._winInventory2.title = this.api.lang.getText("STORAGE");
      }
      else
      {
         this._winInventory2.title = this.api.lang.getText("MY_MOUNT");
      }
   }
   function initData()
   {
      if(this._bMount == true)
      {
         this._ivInventoryViewer.showKamas = false;
         this._ivInventoryViewer2.showKamas = false;
      }
      this._ivInventoryViewer.dataProvider = this.api.datacenter.Player.Inventory;
      this._ivInventoryViewer.kamasProvider = this.api.datacenter.Player;
      this._ivInventoryViewer2.kamasProvider = this._oData;
      this._ivInventoryViewer.checkPlayerPods = true;
      this._ivInventoryViewer2.checkMountPods = this._bMount;
      this.modelChanged();
   }
   function hideItemViewer(§\x19\t§)
   {
      this._itvItemViewer._visible = !_loc2_;
      this._winItemViewer._visible = !_loc2_;
   }
   function click(§\x1e\x19\x0e§)
   {
      this.callClose();
      var _loc0_ = _loc2_.target;
   }
   function selectedItem(§\x1e\x19\x0e§)
   {
      if(_loc2_.item == undefined)
      {
         this.hideItemViewer(true);
      }
      else
      {
         this.hideItemViewer(false);
         this._itvItemViewer.itemData = _loc2_.item;
         switch(_loc2_.target._name)
         {
            case "_ivInventoryViewer":
               this._ivInventoryViewer2.setFilter(this._ivInventoryViewer.currentFilterID);
               break;
            case "_ivInventoryViewer2":
               this._ivInventoryViewer.setFilter(this._ivInventoryViewer2.currentFilterID);
         }
      }
   }
   function dblClickItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.item;
      var _loc4_ = _loc2_.targets;
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      var _loc5_ = Key.isDown(dofus.Constants.SELECT_MULTIPLE_ITEMS_KEY);
      switch(_loc2_.target._name)
      {
         case "_ivInventoryViewer":
            if(_loc5_ && _loc4_.length > 1)
            {
               this.moveItems(_loc4_,true);
            }
            else
            {
               this.moveItem(_loc3_,true,_loc5_);
            }
            break;
         case "_ivInventoryViewer2":
            if(_loc5_ && _loc4_.length > 1)
            {
               this.moveItems(_loc4_,false);
               break;
            }
            this.moveItem(_loc3_,false,_loc5_);
            break;
      }
   }
   function moveItems(§\x1e\x10§, §\x1c\x17§)
   {
      if((_loc3_ && this._bMount || !_loc3_) && !this.api.datacenter.Player.canReceiveItems(_loc2_,_loc3_ && this._bMount))
      {
         this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("SRV_MSG_6"),"ERROR_BOX",{name:undefined});
         return undefined;
      }
      var _loc4_ = new Array();
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.length)
      {
         var _loc6_ = _loc2_[_loc5_];
         _loc4_.push({Add:_loc3_,ID:_loc6_.ID,Quantity:_loc6_.Quantity});
         _loc5_ = _loc5_ + 1;
      }
      this.api.network.Exchange.movementItems(_loc4_);
   }
   function moveItem(§\x1e\x19\x03§, §\x1c\x17§, §\x17\x12§)
   {
      var _loc5_ = _loc2_.Quantity;
      if(_loc3_ && this._bMount || !_loc3_)
      {
         _loc5_ = this.api.datacenter.Player.getPossibleItemReceiveQuantity(_loc2_,_loc3_ && this._bMount);
         if(_loc5_ <= 0)
         {
            this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("SRV_MSG_6"),"ERROR_BOX",{name:undefined});
            return undefined;
         }
      }
      var _loc6_ = 1;
      if(_loc4_)
      {
         _loc6_ = _loc5_;
      }
      this.api.network.Exchange.movementItem(_loc3_,_loc2_,_loc6_);
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      this._ivInventoryViewer2.dataProvider = this._oData.inventory;
   }
   function dropItem(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_ivInventoryViewer":
            this.api.network.Exchange.movementItem(false,_loc2_.item,_loc2_.quantity);
            break;
         case "_ivInventoryViewer2":
            this.api.network.Exchange.movementItem(true,_loc2_.item,_loc2_.quantity);
      }
   }
   function dragKama(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._ivInventoryViewer:
            this.api.network.Exchange.movementKama(_loc2_.quantity);
            break;
         case this._ivInventoryViewer2:
            this.api.network.Exchange.movementKama(- _loc2_.quantity);
      }
   }
}
