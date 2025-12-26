class dofus.§\r\x14§.gapi.ui.InventorySearch extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _aTypes;
   var _nMaxLevel;
   var _oParent;
   var _btnClose;
   var _btnClose2;
   var _btnView;
   var _tiSearch;
   var _lstItems;
   var _winBackground;
   var _lblSearch;
   var _oDataProvider;
   var _aItems;
   var _lblSearchCount;
   var dispatchEvent;
   static var CLASS_NAME = "InventorySearch";
   static var MIN_SEARCH_CHAR = 2;
   var _sDefaultText = "";
   function InventorySearch()
   {
      super();
   }
   function set types(§\x1d\x04§)
   {
      this._aTypes = _loc2_;
   }
   function set maxLevel(§\x02\x1c§)
   {
      this._nMaxLevel = _loc2_;
   }
   function set defaultSearch(§\x1e\f\x12§)
   {
      this._sDefaultText = _loc2_;
   }
   function set oParent(§\x1e\x1a\x10§)
   {
      this._oParent = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.InventorySearch.CLASS_NAME);
   }
   function callClose()
   {
      this.gapi.hideTooltip();
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.generateIndexes();
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnClose2.addEventListener("click",this);
      this._btnView.addEventListener("click",this);
      this._tiSearch.addEventListener("change",this);
      this._lstItems.addEventListener("itemSelected",this);
   }
   function initTexts()
   {
      this._winBackground.title = this.api.lang.getText("BIGSTORE_SEARCH");
      this._lblSearch.text = this.api.lang.getText("INVENTORY_SEARCH_ITEM_NAME",[dofus["\r\x14"].gapi.ui.InventorySearch.MIN_SEARCH_CHAR]);
      this._btnClose2.label = this.api.lang.getText("CLOSE");
      this._btnView.label = this.api.lang.getText("BIGSTORE_SEARCH_VIEW");
      this._tiSearch.text = this._sDefaultText;
      this._tiSearch.setFocus();
   }
   function generateIndexes()
   {
      var _loc2_ = new Object();
      for(var k in this._aTypes)
      {
         _loc2_[this._aTypes[k]] = true;
      }
      var _loc3_ = this._oDataProvider;
      this._aItems = new Array();
      for(var k in _loc3_)
      {
         var _loc4_ = _loc3_[k].name;
         var _loc5_ = _loc3_[k].unicID;
         this._aItems.push({id:_loc5_,name:_loc4_.toUpperCase()});
      }
   }
   function searchItem(§\x1e\f\x12§)
   {
      var _loc3_ = _loc2_.split(" ");
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = new Object();
      var _loc6_ = 0;
      var _loc7_ = 0;
      while(_loc7_ < this._aItems.length)
      {
         var _loc8_ = this._aItems[_loc7_];
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
      this._lstItems.dataProvider = _loc4_;
      this._lblSearchCount.text = _loc4_.length != 0 ? _loc4_.length + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("OBJECTS"),"m",_loc4_ < 2) : this.api.lang.getText("NO_INVENTORY_SEARCH_RESULT");
      this._btnView.enabled = false;
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
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
         case "_btnClose2":
            this.callClose();
            break;
         case "_btnView":
            var _loc3_ = this._lstItems.selectedItem;
            this.dispatchEvent({type:"select",value:_loc3_.unicID});
            this.callClose();
      }
   }
   function change(§\x1e\x19\x0e§)
   {
      var _loc3_ = new ank["\x1e\n\x07"]["\x0e\x1c"](this._tiSearch.text).trim().toString();
      if(_loc3_.length >= dofus["\r\x14"].gapi.ui.InventorySearch.MIN_SEARCH_CHAR)
      {
         this.searchItem(_loc3_.toUpperCase());
      }
      else
      {
         this._lstItems.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
         if(this._lblSearchCount.text != undefined)
         {
            this._lblSearchCount.text = "";
         }
      }
      this._oParent.defaultSearch = this._tiSearch.text;
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      this._btnView.enabled = true;
   }
}
