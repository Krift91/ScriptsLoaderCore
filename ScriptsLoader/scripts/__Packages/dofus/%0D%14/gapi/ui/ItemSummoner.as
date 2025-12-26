class dofus.§\r\x14§.gapi.ui.ItemSummoner extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _winBg;
   var _lblSearch;
   var _lblType;
   var _lblQuantity;
   var _btnCancel;
   var _btnSelect;
   var _tiSearch;
   var _btnClose;
   var _cbType;
   var _lst;
   var _cgGrid;
   var _eaItems;
   var _tiQuantity;
   var _eaGridItems;
   var _winItemViewer;
   var _itvItemViewer;
   var _aTypes;
   var _eaItemsOriginal;
   var _lblNumber;
   var dispatchEvent;
   static var CLASS_NAME = "ItemSummoner";
   function ItemSummoner()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.ItemSummoner.CLASS_NAME);
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.hideItemViewer(true);
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
   }
   function initTexts()
   {
      this._winBg.title = "Liste des objets";
      this._lblSearch.text = this.api.lang.getText("BIGSTORE_SEARCH_ITEM_NAME");
      this._lblType.text = this.api.lang.getText("TYPE");
      this._lblQuantity.text = this.api.lang.getText("QUANTITY");
      this._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
      this._btnSelect.label = this.api.lang.getText("VALIDATE");
      this._tiSearch.setFocus();
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnCancel.addEventListener("click",this);
      this._btnSelect.addEventListener("click",this);
      this._tiSearch.addEventListener("change",this);
      this._cbType.addEventListener("itemSelected",this);
      this._lst.addEventListener("itemSelected",this);
      this._lst.addEventListener("itemRollOver",this);
      this._lst.addEventListener("itemRollOut",this);
      this._lst.addEventListener("itemDrag",this);
      this._cgGrid.addEventListener("dropItem",this);
      this._cgGrid.addEventListener("selectItem",this);
      this._cgGrid.addEventListener("dragItem",this);
      this._cgGrid.multipleContainerSelectionEnabled = false;
   }
   function initData()
   {
      this._eaItems = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._tiQuantity.restrict = "0-9";
      this._tiQuantity.text = "1";
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = this.api.lang.getAllItemTypes();
      for(var a in _loc3_)
      {
         _loc2_.push({label:_loc3_[a].n,id:a});
      }
      _loc2_.sortOn("label");
      _loc2_.push({label:"All",id:-1});
      this._cbType.dataProvider = _loc2_;
      this._eaGridItems = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._cgGrid.dataProvider = this._eaGridItems;
   }
   function hideItemViewer(§\x19\t§)
   {
      this._winItemViewer._visible = !_loc2_;
      this._itvItemViewer._visible = !_loc2_;
   }
   function generateIndexes(§\x1c\x1d§)
   {
      var _loc3_ = new Object();
      for(var k in this._aTypes)
      {
         _loc3_[this._aTypes[k]] = true;
      }
      var _loc4_ = this.api.lang.getItemUnics();
      this._eaItems = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._eaItemsOriginal = new ank["\x1e\n\x07"]["\x0f\x01"]();
      for(var k in _loc4_)
      {
         var _loc5_ = _loc4_[k];
         if(!(_loc5_.ep != undefined && _loc5_.ep > this.api.datacenter.Basics.aks_current_regional_version))
         {
            if(_loc3_[_loc5_.t])
            {
               var _loc6_ = _loc5_.n;
               this._eaItems.push({id:k,name:_loc6_.toUpperCase()});
               this._eaItemsOriginal.push(new dofus.datacenter["\f\f"](0,Number(k)));
            }
         }
      }
      this._lblNumber.text = this._eaItemsOriginal.length + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("OBJECTS"),"m",this._eaItemsOriginal.length < 2);
   }
   function searchItem(§\x1e\f\x12§)
   {
      var _loc3_ = _loc2_.split(" ");
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = new Object();
      var _loc6_ = 0;
      var _loc7_ = 0;
      while(_loc7_ < this._eaItems.length)
      {
         var _loc8_ = this._eaItems[_loc7_];
         var _loc9_ = this.searchWordsInName(_loc3_,_loc8_.name,_loc6_);
         if(_loc9_ != 0)
         {
            _loc5_[_loc8_.id] = _loc9_;
            _loc6_ = _loc9_;
         }
         _loc7_ = _loc7_ + 1;
      }
      for(var k in _loc5_)
      {
         if(_loc5_[k] >= _loc6_)
         {
            _loc4_.push(new dofus.datacenter["\f\f"](0,Number(k)));
         }
      }
      this._lst.dataProvider = _loc4_;
   }
   function searchWordsInName(§\x1d\x01§, §\x1e\x0f\x16§, §\x02\x14§)
   {
      var _loc5_ = 0;
      var _loc6_ = _loc2_.length;
      while(_loc6_ >= 0)
      {
         var _loc7_ = _loc2_[_loc6_];
         if(_loc3_.indexOf(_loc7_) != -1)
         {
            _loc5_ = _loc5_ + 1;
         }
         else if(_loc5_ + _loc6_ < _loc4_)
         {
            return 0;
         }
         _loc6_ = _loc6_ - 1;
      }
      return _loc5_;
   }
   function validateDrop(§\f\x17§, §\x01\x01§)
   {
      var _loc4_ = false;
      for(var i in this._eaGridItems)
      {
         if(_loc2_.equals(this._eaGridItems[i]))
         {
            this._eaGridItems[i].Quantity += _loc3_;
            this._cgGrid.modelChanged();
            _loc4_ = true;
            break;
         }
      }
      if(!_loc4_)
      {
         _loc2_.Quantity = _loc3_;
         this._eaGridItems.push(_loc2_);
      }
   }
   function summonItems()
   {
      for(var i in this._eaGridItems)
      {
         var _loc2_ = dofus.datacenter["\f\f"](this._eaGridItems[i]);
         this.api.network.Basics.autorisedCommand("item " + _loc2_.unicID + " " + _loc2_.Quantity);
      }
      this._eaGridItems = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._cgGrid.dataProvider = this._eaGridItems;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
         case "_btnCancel":
            this.dispatchEvent({type:"cancel"});
            this.callClose();
         case "_btnSelect":
            if(this._eaGridItems.length == 0)
            {
               this.dispatchEvent({type:"cancel"});
               this.callClose();
            }
            this.summonItems();
      }
   }
   function change(§\x1e\x19\x0e§)
   {
      if(this._tiSearch.text.length >= 2)
      {
         this.searchItem(this._tiSearch.text.toUpperCase());
      }
      else if(this._lst.dataProvider != this._eaItemsOriginal)
      {
         this._lst.dataProvider = this._eaItemsOriginal;
      }
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._cbType:
            this._aTypes = new Array();
            if(this._cbType.selectedItem.id != -1)
            {
               this._aTypes.push(this._cbType.selectedItem.id);
            }
            else
            {
               var _loc3_ = 0;
               while(_loc3_ < this._cbType.dataProvider.length)
               {
                  if(this._cbType.dataProvider[_loc3_].id != -1)
                  {
                     this._aTypes.push(this._cbType.dataProvider[_loc3_].id);
                  }
                  _loc3_ = _loc3_ + 1;
               }
            }
            this.generateIndexes();
            this.change();
            break;
         case this._lst:
            var _loc4_ = this._lst.selectedItem;
            if(_loc4_ == undefined)
            {
               this.hideItemViewer(true);
               break;
            }
            if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
            {
               this.api.kernel.GameManager.insertItemInChat(_loc4_);
               return undefined;
            }
            this.hideItemViewer(false);
            this._itvItemViewer.itemData = _loc4_;
            break;
      }
   }
   function itemRollOver(§\x1e\x19\x0e§)
   {
      this.gapi.showTooltip(_loc2_.row.item.name + " (" + _loc2_.row.item.unicID + ")",_loc2_.row,20,{bXLimit:true,bYLimit:false});
   }
   function itemRollOut(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function itemDrag(§\x1e\x19\x0e§)
   {
      if(_loc2_.row.item == undefined)
      {
         return undefined;
      }
      this.gapi.removeCursor();
      this.gapi.setCursor(_loc2_.row.item);
   }
   function dragItem(§\x1e\x19\x0e§)
   {
      this.gapi.removeCursor();
      if(_loc2_.target.contentData == undefined)
      {
         return undefined;
      }
      this.gapi.setCursor(_loc2_.target.contentData);
   }
   function dropItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = dofus.datacenter["\f\f"](this.gapi.getCursor());
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      if(String(_loc2_.target).indexOf("_cgGrid") > -1)
      {
         if(Key.isDown(Key.CONTROL))
         {
            var _loc4_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:99,params:{targetType:"validateDrop",item:_loc3_}});
            _loc4_.addEventListener("validate",this);
         }
         else
         {
            this.validateDrop(_loc3_,1);
         }
      }
      this.gapi.removeCursor();
   }
   function validate(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.params.targetType) === "validateDrop")
      {
         this.validateDrop(dofus.datacenter["\f\f"](_loc2_.params.item),_loc2_.value);
      }
   }
   function selectItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = dofus.datacenter["\f\f"](_loc2_.target.contentData);
      if(_loc3_ == undefined)
      {
         this.hideItemViewer(true);
      }
      else
      {
         if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
         {
            this.api.kernel.GameManager.insertItemInChat(_loc3_);
            return undefined;
         }
         if(Key.isDown(Key.CONTROL))
         {
            var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
            for(var i in this._eaGridItems)
            {
               if(this._eaGridItems[i].unicID != _loc3_.unicID)
               {
                  _loc4_.push(this._eaGridItems[i]);
               }
            }
            this._eaGridItems = _loc4_;
            this._cgGrid.modelChanged();
         }
         else
         {
            this.hideItemViewer(false);
            this._itvItemViewer.itemData = _loc3_;
         }
      }
   }
}
