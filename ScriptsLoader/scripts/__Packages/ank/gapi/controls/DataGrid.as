class ank.gapi.controls.DataGrid extends ank.gapi.core.§\x1e\n\f§
{
   var _aColumnsWidths;
   var _aColumnsNames;
   var _aColumnsProperties;
   var _lstList;
   var __width;
   var __height;
   var _mcTitle;
   var dispatchEvent;
   static var CLASS_NAME = "DataGrid";
   var _nRowHeight = 20;
   var _nTitleHeight = 20;
   var _sCellRenderer = "DefaultCellRenderer";
   var _bMultipleSelection = false;
   function DataGrid()
   {
      super();
   }
   function set titleHeight(§\x1e\x1b\x15§)
   {
      this._nTitleHeight = _loc2_;
   }
   function get titleHeight()
   {
      return this._nTitleHeight;
   }
   function set columnsWidths(§\t§)
   {
      this._aColumnsWidths = _loc2_;
   }
   function get columnsWidths()
   {
      return this._aColumnsWidths;
   }
   function set columnsNames(§\x0b§)
   {
      this._aColumnsNames = _loc2_;
      this.setLabels();
   }
   function get columnsNames()
   {
      return this._aColumnsNames;
   }
   function set columnsProperties(§\n§)
   {
      this._aColumnsProperties = _loc2_;
   }
   function get columnsProperties()
   {
      return this._aColumnsProperties;
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
      this._sCellRenderer = _loc2_;
   }
   function get cellRenderer()
   {
      return this._sCellRenderer;
   }
   function set dataProvider(§\x10\x0b§)
   {
      this._lstList.dataProvider = _loc2_;
   }
   function get dataProvider()
   {
      return this._lstList.dataProvider;
   }
   function set selectedIndex(§\x04\n§)
   {
      this._lstList.selectedIndex = _loc2_;
   }
   function get selectedIndex()
   {
      return this._lstList.selectedIndex;
   }
   function get selectedItem()
   {
      return this._lstList.selectedItem;
   }
   function addItem(§\x1e\x19\x03§)
   {
      this._lstList.addItem(_loc2_);
   }
   function addItemAt(§\x1e\x19\x03§, §\x04\n§)
   {
      this._lstList.addItemAt(_loc2_,_loc3_);
   }
   function removeItemAt(§\x1e\x19\x03§, §\x04\n§)
   {
      this._lstList.removeItemAt(_loc2_,_loc3_);
   }
   function removeAll()
   {
      this._lstList.removeAll();
   }
   function setVPosition(§\x01\n§)
   {
      this._lstList.setVPosition(_loc2_);
   }
   function sortOn(§\x1e\x0e\n§, §\x01\x1d§)
   {
      this._lstList.selectedIndex = -1;
      this._lstList.sortOn(_loc2_,_loc3_);
   }
   function init()
   {
      super.init(false,ank.gapi.controls.DataGrid.CLASS_NAME);
   }
   function createChildren()
   {
      this.attachMovie("List","_lstList",10,{styleName:"none",multipleSelection:this._bMultipleSelection,rowHeight:this._nRowHeight,cellRenderer:this._sCellRenderer,enabled:this.enabled});
      this._lstList.addEventListener("itemSelected",this);
      this._lstList.addEventListener("itemdblClick",this);
      this._lstList.addEventListener("itemRollOver",this);
      this._lstList.addEventListener("itemRollOut",this);
      this._lstList.addEventListener("itemDrag",this);
      this.createEmptyMovieClip("_mcTitle",20);
   }
   function size()
   {
      super.size();
      this.arrange();
   }
   function arrange()
   {
      this._lstList._y = this._nTitleHeight;
      this._lstList.setSize(this.__width,this.__height - this._nTitleHeight);
      this._mcTitle._width = this.__width;
      this._mcTitle._height = this._nTitleHeight;
      var _loc2_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < this._aColumnsWidths.length)
      {
         var _loc4_ = _loc2_ + this._aColumnsWidths[_loc3_] >= this.__width ? this.__width - _loc2_ : this._aColumnsWidths[_loc3_];
         if(this._aColumnsProperties[_loc3_] != undefined)
         {
            var _loc5_ = this.attachMovie("Button","_btnTitle" + _loc3_,this.getNextHighestDepth(),{_x:_loc2_,styleName:"none",label:"",backgroundDown:"ButtonTransparentUp",backgroundUp:"ButtonTransparentUp",toggle:true,params:{index:_loc3_}});
            _loc5_.setSize(_loc4_,this._nTitleHeight);
            _loc5_.addEventListener("click",this);
         }
         this["_lblTitle" + _loc3_].removeMovieClip();
         var _loc6_ = this.attachMovie("Label","_lblTitle" + _loc3_,this.getNextHighestDepth(),{_x:_loc2_,styleName:this.getStyle().labelstyle,text:this._aColumnsNames[_loc3_]});
         _loc6_.setSize(_loc4_,this._nTitleHeight);
         _loc2_ += _loc4_;
         _loc3_ = _loc3_ + 1;
      }
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      this._lstList.styleName = _loc2_.liststyle;
      if(this.initialized)
      {
         var _loc3_ = this.getStyle().labelstyle;
         var _loc4_ = 0;
         while(_loc4_ < this._aColumnsWidths.length)
         {
            this["_lblTitle" + _loc4_].styleName = _loc3_;
            _loc4_ = _loc4_ + 1;
         }
      }
      this.drawRoundRect(this._mcTitle,0,0,1,1,0,_loc2_.titlebgcolor);
      this._mcTitle._alpha = _loc2_.titlebgcolor != -1 ? 100 : 0;
   }
   function setLabels()
   {
      if(this.initialized)
      {
         var _loc2_ = 0;
         while(_loc2_ < this._aColumnsWidths.length)
         {
            this["_lblTitle" + _loc2_].text = this._aColumnsNames[_loc2_];
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.params.index;
      var _loc4_ = this._aColumnsProperties[_loc3_];
      var _loc5_ = !_loc2_.target.selected ? Array.CASEINSENSITIVE | Array.DESCENDING : Array.CASEINSENSITIVE;
      if(!_global.isNaN(Number(this._lstList.dataProvider[0][_loc4_])))
      {
         _loc5_ |= Array.NUMERIC;
      }
      this.sortOn(_loc4_,_loc5_);
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      _loc2_.list = _loc2_.target;
      _loc2_.target = this;
      this.dispatchEvent(_loc2_);
   }
   function itemRollOver(§\x1e\x19\x0e§)
   {
      this.dispatchEvent(_loc2_);
   }
   function itemRollOut(§\x1e\x19\x0e§)
   {
      this.dispatchEvent(_loc2_);
   }
   function itemDrag(§\x1e\x19\x0e§)
   {
      this.dispatchEvent(_loc2_);
   }
   function itemdblClick(§\x1e\x19\x0e§)
   {
      this.dispatchEvent(_loc2_);
   }
}
