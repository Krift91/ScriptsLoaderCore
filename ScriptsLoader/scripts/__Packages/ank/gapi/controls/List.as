class ank.gapi.controls.List extends ank.gapi.core.§\x1e\n\f§
{
   var _nSelectedIndex;
   var _eaDataProvider;
   var __height;
   var _mcContent;
   var _sbVertical;
   var _mcMask;
   var __width;
   var _nMaskWidth;
   var dispatchEvent;
   static var CLASS_NAME = "List";
   var _aRows = new Array();
   var _nRowHeight = 20;
   var _bInvalidateLayout = true;
   var _bInvalidateScrollBar = true;
   var _nScrollPosition = 0;
   var _sCellRenderer = "DefaultCellRenderer";
   var _bMultipleSelection = false;
   var _bAutoScroll = false;
   var _bDblClickEnabled = false;
   function List()
   {
      super();
   }
   function set multipleSelection(§\x17\x0f§)
   {
      this._bMultipleSelection = _loc2_;
   }
   function get multipleSelection()
   {
      return this._bMultipleSelection;
   }
   function set rowHeight(§\x1e\x1e\x02§)
   {
      if(_loc2_ == 0)
      {
         return;
      }
      this._nRowHeight = _loc2_;
   }
   function get rowHeight()
   {
      return this._nRowHeight;
   }
   function set cellRenderer(§\x1e\x14\x06§)
   {
      if(_loc2_ != undefined)
      {
         this._sCellRenderer = _loc2_;
      }
   }
   function get cellRenderer()
   {
      return this._sCellRenderer;
   }
   function set dataProvider(§\x10\x10§)
   {
      delete this._nSelectedIndex;
      this._eaDataProvider = _loc2_;
      this._eaDataProvider.addEventListener("modelChanged",this);
      var _loc3_ = Math.ceil(this.__height / this._nRowHeight);
      if(_loc2_.length <= _loc3_)
      {
         this.setVPosition(0);
      }
      this.modelChanged();
   }
   function get dataProvider()
   {
      return this._eaDataProvider;
   }
   function set selectedIndex(§\x04\n§)
   {
      var _loc3_ = this._mcContent["row" + _loc2_];
      this._nSelectedIndex = _loc2_;
      this.layoutSelection(_loc2_,_loc3_);
   }
   function get selectedIndex()
   {
      return this._nSelectedIndex;
   }
   function get selectedItem()
   {
      return this._eaDataProvider[this._nSelectedIndex];
   }
   function set autoScroll(§\x1c\x05§)
   {
      this._bAutoScroll = _loc2_;
   }
   function get autoScroll()
   {
      return this._bAutoScroll;
   }
   function set dblClickEnabled(§\x1b\t§)
   {
      this._bDblClickEnabled = _loc2_;
   }
   function get dblClickEnabled()
   {
      return this._bDblClickEnabled;
   }
   function addItem(§\x1e\x19\x03§)
   {
      this._aRows.push({item:_loc2_,selected:false});
      this.setScrollBarProperties(true);
      this.layoutContent();
   }
   function addItemAt(§\x1e\x19\x03§, §\x04\n§)
   {
      this._aRows.splice(_loc3_,0,{item:_loc2_,selected:false});
      this.setScrollBarProperties(true);
      this.layoutContent();
   }
   function removeItemAt(§\x1e\x19\x03§, §\x04\n§)
   {
      this._aRows.splice(_loc3_,1);
      this.setScrollBarProperties(true);
      this.layoutContent();
   }
   function removeAll()
   {
      this._aRows = new Array();
      this.setScrollBarProperties(true);
      this.layoutContent();
   }
   function setVPosition(§\x01\n§, §\x19\x19§)
   {
      var _loc4_ = this._eaDataProvider.length - Math.floor(this.__height / this._nRowHeight);
      if(_loc2_ > _loc4_)
      {
         _loc2_ = _loc4_;
      }
      if(_loc2_ < 0)
      {
         _loc2_ = 0;
      }
      if(this._nScrollPosition != _loc2_ || _loc3_)
      {
         this._nScrollPosition = _loc2_;
         this.setScrollBarProperties(_loc3_ == true);
         this.layoutContent();
      }
   }
   function sortOn(§\x1e\x0e\n§, §\x01\x1d§)
   {
      this._eaDataProvider.sortOn(_loc2_,_loc3_);
      this.modelChanged();
   }
   function init()
   {
      super.init(false,ank.gapi.controls.List.CLASS_NAME);
   }
   function createChildren()
   {
      this.attachMovie("ScrollBar","_sbVertical",10,{styleName:this.styleName});
      this._sbVertical.addEventListener("scroll",this);
      this.createEmptyMovieClip("_mcContent",20);
      this.createEmptyMovieClip("_mcMask",30);
      this.drawRoundRect(this._mcMask,0,0,100,100,0,16711680);
      this._mcContent.setMask(this._mcMask);
      ank["\x1e\n\x07"]["\t\x17"].addListener(this);
   }
   function size()
   {
      super.size();
      this._bInvalidateScrollBar = true;
      this.arrange();
      if(this.initialized)
      {
         this.setVPosition(this._nScrollPosition,true);
      }
   }
   function draw()
   {
      if(this.styleName == "none")
      {
         return undefined;
      }
      var _loc2_ = this.getStyle();
      for(var k in this._mcContent)
      {
         this._mcContent[k].styleName = this.styleName;
      }
      this._sbVertical.styleName = _loc2_.scrollbarstyle;
   }
   function arrange()
   {
      if(this._bInvalidateScrollBar)
      {
         this.setScrollBarProperties(false);
      }
      if(this._sbVertical._visible)
      {
         this._sbVertical.setSize(this.__height);
         this._sbVertical._x = this.__width - this._sbVertical.width;
         this._sbVertical._y = 0;
      }
      this._nMaskWidth = !this._sbVertical._visible ? this.__width : this.__width - this._sbVertical.width;
      this._mcMask._width = this._nMaskWidth;
      this._mcMask._height = this.__height;
      this._bInvalidateLayout = true;
      this.layoutContent();
   }
   function layoutContent()
   {
      var _loc2_ = Math.ceil(this.__height / this._nRowHeight);
      var _loc3_ = 0;
      while(_loc3_ < _loc2_)
      {
         var _loc4_ = this._mcContent["row" + _loc3_];
         if(_loc4_ == undefined)
         {
            _loc4_ = ank.gapi.controls.list.SelectableRow(this._mcContent.attachMovie("SelectableRow","row" + _loc3_,_loc3_,{_x:0,_y:_loc3_ * this._nRowHeight,index:_loc3_,styleName:this.styleName,enabled:this._bEnabled,gapi:this.gapi}));
            _loc4_.setCellRenderer(this._sCellRenderer);
            _loc4_.addEventListener("itemSelected",this);
            _loc4_.addEventListener("itemdblClick",this);
            _loc4_.addEventListener("itemRollOver",this);
            _loc4_.addEventListener("itemRollOut",this);
            _loc4_.addEventListener("itemDrag",this);
            _loc4_.addEventListener("itemDrop",this);
         }
         var _loc5_ = _loc3_ + this._nScrollPosition;
         if(this._bInvalidateLayout)
         {
            _loc4_.setSize(this._nMaskWidth,this._nRowHeight);
         }
         var _loc6_ = this._aRows[_loc5_];
         var _loc7_ = _loc6_.item;
         var _loc8_ = typeof _loc7_ != "string" ? _loc7_.label : _loc7_;
         var _loc9_ = !((_loc6_.selected || _loc5_ == this._nSelectedIndex) && _loc7_ != undefined) ? "normal" : "selected";
         _loc4_.setValue(_loc8_,_loc7_,_loc9_);
         _loc4_.itemIndex = _loc5_;
         _loc3_ = _loc3_ + 1;
      }
      this._bInvalidateLayout = false;
   }
   function addScrollBar(§\x1c\x0e§)
   {
      if(!this._sbVertical._visible)
      {
         this._sbVertical._visible = true;
         if(_loc2_)
         {
            this.arrange();
         }
      }
   }
   function removeScrollBar(§\x1c\x0e§)
   {
      if(this._sbVertical._visible)
      {
         this._sbVertical._visible = false;
         if(_loc2_)
         {
            this.arrange();
         }
      }
   }
   function setScrollBarProperties(§\x1c\x0e§)
   {
      this._bInvalidateScrollBar = false;
      var _loc3_ = Math.floor(this.__height / this._nRowHeight);
      var _loc4_ = this._aRows.length - _loc3_;
      var _loc5_ = _loc3_ * (_loc4_ / this._aRows.length);
      if(_loc3_ >= this._aRows.length || this._aRows.length == 0)
      {
         this.removeScrollBar(_loc2_);
      }
      else
      {
         this.addScrollBar(_loc2_);
         this._sbVertical.setScrollProperties(_loc5_,0,_loc4_);
         this._sbVertical.scrollPosition = this._nScrollPosition;
      }
   }
   function layoutSelection(§\x04\n§, §\x1e\x0e\x01§, §\x16\x02§)
   {
      if(_loc4_ == undefined)
      {
         _loc4_ = false;
      }
      if(_loc2_ == undefined)
      {
         _loc2_ = this._nSelectedIndex;
      }
      var _loc5_ = this._aRows[_loc2_];
      var _loc6_ = this._bMultipleSelection && Key.isDown(dofus.Constants.SELECT_MULTIPLE_ITEMS_KEY);
      if(!_loc6_)
      {
         this.unSelectAll();
      }
      if(_loc5_.selected && (_loc6_ && !_loc4_))
      {
         _loc5_.selected = false;
         _loc3_.setState("normal");
      }
      else if(!_loc5_.selected)
      {
         _loc5_.selected = true;
         _loc3_.setState("selected");
      }
   }
   function getSelectedItems()
   {
      var _loc2_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < this._aRows.length)
      {
         if(this._aRows[_loc3_].selected)
         {
            var _loc4_ = this._aRows[_loc3_].item;
            _loc2_.push(_loc4_);
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc2_.reverse();
      return _loc2_;
   }
   function unSelectAll()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._aRows.length)
      {
         if(this._aRows[_loc2_].selected)
         {
            this._aRows[_loc2_].selected = false;
            this._mcContent["row" + (_loc2_ - this._nScrollPosition)].setState("normal");
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function modelChanged()
   {
      this.selectedIndex = -1;
      this._aRows = new Array();
      var _loc2_ = this._eaDataProvider.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc2_)
      {
         this._aRows[_loc3_] = {item:this._eaDataProvider[_loc3_],selected:false};
         _loc3_ = _loc3_ + 1;
      }
      if(this._bAutoScroll)
      {
         this.setVPosition(_loc2_,true);
      }
      else
      {
         this.setScrollBarProperties(true);
         this.layoutContent();
      }
   }
   function scroll(§\x1e\x19\x0e§)
   {
      this.setVPosition(_loc2_.target.scrollPosition);
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.itemIndex;
      var _loc4_ = _loc2_.target;
      this._nSelectedIndex = _loc3_;
      this.layoutSelection(_loc3_,_loc4_);
      this.dispatchEvent({type:"itemSelected",row:_loc2_.target,targets:this.getSelectedItems()});
   }
   function itemdblClick(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.itemIndex;
      var _loc4_ = _loc2_.target;
      this._nSelectedIndex = _loc3_;
      this.layoutSelection(_loc3_,_loc4_);
      this.dispatchEvent({type:"itemdblClick",row:_loc2_.target,targets:this.getSelectedItems()});
   }
   function itemRollOver(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._bMultipleSelection && (Key.isDown(dofus.Constants.SELECT_MULTIPLE_ITEMS_KEY) && Key.isDown(Key.SHIFT));
      if(_loc3_)
      {
         var _loc4_ = _loc2_.target.itemIndex;
         var _loc5_ = _loc2_.target;
         this.layoutSelection(_loc4_,_loc5_,true);
      }
      this.dispatchEvent({type:"itemRollOver",row:_loc2_.target,targets:this.getSelectedItems()});
   }
   function itemRollOut(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"itemRollOut",row:_loc2_.target,targets:this.getSelectedItems()});
   }
   function itemDrag(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"itemDrag",row:_loc2_.target});
   }
   function itemDrop(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"itemDrop",row:_loc2_.target});
   }
   function onMouseWheel(§\x06\n§, §\n\x1d§)
   {
      if(dofus["\r\x14"].gapi.ui.Zoom.isZooming())
      {
         return undefined;
      }
      if(String(_loc3_._target).indexOf(this._target) != -1)
      {
         this.setVPosition(this._nScrollPosition - _loc2_);
      }
   }
}
