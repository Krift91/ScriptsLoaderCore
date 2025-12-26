class dofus.§\r\x14§.gapi.ui.BigStoreSearch extends dofus.§\r\x14§.gapi.core.§\x10\x19§
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
   var _aItems;
   var _lblSearchCount;
   static var CLASS_NAME = "BigStoreSearch";
   var _sDefaultText = "";
   function BigStoreSearch()
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
      super.init(false,dofus["\r\x14"].gapi.ui.BigStoreSearch.CLASS_NAME);
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
      this._lblSearch.text = this.api.lang.getText("BIGSTORE_SEARCH_ITEM_NAME");
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
      var _loc3_ = this.api.lang.getItemUnics();
      this._aItems = new Array();
      for(var k in _loc3_)
      {
         var _loc4_ = _loc3_[k];
         if(!(_loc4_.ep == undefined || _loc4_.ep > this.api.datacenter.Basics.aks_current_regional_version))
         {
            if(_loc2_[_loc4_.t] && (_loc4_.h != true && _loc4_.l <= this._nMaxLevel))
            {
               var _loc5_ = _loc4_.n;
               this._aItems.push({id:k,name:_loc5_.toUpperCase()});
            }
         }
      }
   }
   function searchItem(§\x1e\f\x12§)
   {
      var _loc3_ = _loc2_.split(" ");
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = new Object();
      var _loc6_ = 0;
      while(_loc6_ < this._aItems.length)
      {
         var _loc7_ = this._aItems[_loc6_];
         var _loc8_ = this.searchWordsInName(_loc3_,_loc7_.name);
         if(_loc8_)
         {
            _loc5_[_loc7_.id] = true;
         }
         _loc6_ += 1;
      }
      for(var k in _loc5_)
      {
         if(_loc5_[k] == true)
         {
            _loc4_.push(new dofus.datacenter["\f\f"](0,Number(k)));
         }
      }
      this._lstItems.dataProvider = _loc4_;
      this._lblSearchCount.text = _loc4_.length == 0 ? this.api.lang.getText("NO_BIGSTORE_SEARCH_RESULT") : _loc4_.length + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("OBJECTS"),"m",_loc4_ < 2);
      this._btnView.enabled = false;
   }
   function searchWordsInName(§\x1d\x01§, §\x1e\x0f\x16§)
   {
      var _loc4_ = _loc2_.length - 1;
      while(_loc4_ >= 0)
      {
         var _loc5_ = _loc2_[_loc4_];
         var _loc6_ = _loc3_.indexOf(_loc5_);
         if(_loc6_ == -1)
         {
            return false;
         }
         _loc3_ = _loc3_.substr(0,_loc6_) + _loc3_.substr(_loc6_ + _loc5_.length);
         _loc4_ -= 1;
      }
      return true;
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
            this.api.network.Exchange.bigStoreSearch(_loc3_.type,_loc3_.unicID);
            this.api.network.Exchange.getItemMiddlePriceInBigStore(_loc3_.unicID);
      }
   }
   function change(§\x1e\x19\x0e§)
   {
      var _loc3_ = new ank["\x1e\n\x07"]["\x0e\x1c"](this._tiSearch.text).trim().toString();
      if(_loc3_.length >= 2)
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
