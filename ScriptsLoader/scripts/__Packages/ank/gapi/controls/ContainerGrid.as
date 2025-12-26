class ank.gapi.controls.ContainerGrid extends ank.gapi.core.§\x1e\n\f§
{
   var _eaDataProvider;
   var _aSelectedIndexes;
   var _mcScrollContent;
   var __height;
   var _mcMask;
   var _sbVertical;
   var __width;
   var dispatchEvent;
   static var CLASS_NAME = "ContainerGrid";
   var _nVisibleRowCount = 3;
   var _nVisibleColumnCount = 3;
   var _nRowCount = 1;
   var _bInvalidateLayout = false;
   var _bScrollBar = true;
   var _bSelectable = true;
   var _bMultiContainerSelection = true;
   var _nScrollPosition = 0;
   var _nStyleMargin = 0;
   function ContainerGrid()
   {
      super();
   }
   function set multipleContainerSelectionEnabled(§\x17\x11§)
   {
      this._bMultiContainerSelection = _loc2_;
   }
   function get multipleContainerSelectionEnabled()
   {
      return this._bMultiContainerSelection;
   }
   function set selectable(§\x15\x15§)
   {
      this._bSelectable = _loc2_;
   }
   function get selectable()
   {
      return this._bSelectable;
   }
   function set visibleRowCount(§\x1e\x1b\x06§)
   {
      this._nVisibleRowCount = _loc2_;
   }
   function get visibleRowCount()
   {
      return this._nVisibleRowCount;
   }
   function set visibleColumnCount(§\x1e\x1b\x07§)
   {
      this._nVisibleColumnCount = _loc2_;
   }
   function get visibleColumnCount()
   {
      return this._nVisibleColumnCount;
   }
   function set dataProvider(§\x10\x0b§)
   {
      this._eaDataProvider = _loc2_;
      this._eaDataProvider.addEventListener("modelChanged",this);
      this.modelChanged();
      var _loc3_ = this.getMaxRow();
      if(this._nScrollPosition > _loc3_)
      {
         this.setVPosition(_loc3_);
      }
   }
   function get dataProvider()
   {
      return this._eaDataProvider;
   }
   function set selectedIndex(§\x1e\x1d\x13§)
   {
      this.setSelectedItem(_loc2_);
   }
   function get selectedIndex()
   {
      return this._aSelectedIndexes[this._aSelectedIndexes.length - 1].index;
   }
   function get selectedItem()
   {
      return this._mcScrollContent["c" + this.selectedIndex];
   }
   function set scrollBar(§\x15\x18§)
   {
      this._bScrollBar = _loc2_;
   }
   function get scrollBar()
   {
      return this._bScrollBar;
   }
   function isSelectedIndex(§\x04\n§)
   {
      var _loc3_ = 0;
      while(_loc3_ < this._aSelectedIndexes.length)
      {
         var _loc4_ = this._aSelectedIndexes[_loc3_].index;
         if(_loc4_ == _loc2_)
         {
            return true;
         }
         _loc3_ = _loc3_ + 1;
      }
      return false;
   }
   function setVPosition(§\x01\n§)
   {
      var _loc3_ = this.getMaxRow();
      if(_loc2_ > _loc3_)
      {
         _loc2_ = _loc3_;
      }
      if(_loc2_ < 0)
      {
         _loc2_ = 0;
      }
      if(this._nScrollPosition != _loc2_)
      {
         this._nScrollPosition = _loc2_;
         this.setScrollBarProperties();
         var _loc4_ = this.__height / this._nVisibleRowCount;
         this.layoutContent();
      }
   }
   function getContainer(§\x04\n§)
   {
      return ank.gapi.controls.Container(this._mcScrollContent["c" + _loc2_]);
   }
   function unSelectAll()
   {
      var _loc2_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < this._nVisibleRowCount)
      {
         var _loc4_ = 0;
         while(_loc4_ < this._nVisibleColumnCount)
         {
            var _loc5_ = this._mcScrollContent["c" + _loc2_];
            if(_loc5_.selected)
            {
               _loc5_.selected = false;
            }
            _loc2_ = _loc2_ + 1;
            _loc4_ = _loc4_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      this._aSelectedIndexes = new Array();
   }
   function init()
   {
      super.init(false,ank.gapi.controls.ContainerGrid.CLASS_NAME);
   }
   function createChildren()
   {
      this.createEmptyMovieClip("_mcScrollContent",10);
      this.createEmptyMovieClip("_mcMask",20);
      this.drawRoundRect(this._mcMask,0,0,1,1,0,0);
      this._mcScrollContent.setMask(this._mcMask);
      if(this._bScrollBar)
      {
         this.attachMovie("ScrollBar","_sbVertical",30);
         this._sbVertical.addEventListener("scroll",this);
      }
      ank["\x1e\n\x07"]["\t\x17"].addListener(this);
      this._aSelectedIndexes = new Array();
   }
   function size()
   {
      super.size();
      this.arrange();
   }
   function arrange()
   {
      if(this._bScrollBar)
      {
         this._sbVertical.setSize(this.__height);
         this._sbVertical.move(this.__width - this._sbVertical.width,0);
      }
      this._mcMask._width = this.__width - (!this._bScrollBar ? 0 : this._sbVertical.width);
      this._mcMask._height = this.__height;
      this.setScrollBarProperties();
      this._bInvalidateLayout = this._bInitialized;
      this.layoutContent();
   }
   function layoutContent()
   {
      var _loc2_ = (this.__width - (!this._bScrollBar ? 0 : this._sbVertical.width)) / this._nVisibleColumnCount;
      var _loc3_ = this.__height / this._nVisibleRowCount;
      var _loc4_ = 0;
      if(!this._bInvalidateLayout)
      {
         var _loc5_ = 0;
         while(_loc5_ < this._nVisibleRowCount)
         {
            var _loc6_ = 0;
            while(_loc6_ < this._nVisibleColumnCount)
            {
               var _loc7_ = this._mcScrollContent["c" + _loc4_];
               if(_loc7_ == undefined)
               {
                  _loc7_ = ank.gapi.controls.Container(this._mcScrollContent.attachMovie("Container","c" + _loc4_,_loc4_,{margin:this._nStyleMargin}));
                  _loc7_.addEventListener("drag",this);
                  _loc7_.addEventListener("drop",this);
                  _loc7_.addEventListener("over",this);
                  _loc7_.addEventListener("out",this);
                  _loc7_.addEventListener("click",this);
                  _loc7_.addEventListener("dblClick",this);
               }
               _loc7_._x = _loc2_ * _loc6_;
               _loc7_._y = _loc3_ * _loc5_;
               _loc7_.setSize(_loc2_,_loc3_);
               _loc4_ = _loc4_ + 1;
               _loc6_ = _loc6_ + 1;
            }
            _loc5_ = _loc5_ + 1;
         }
      }
      var _loc8_ = 0;
      _loc4_ = this._nScrollPosition * this._nVisibleColumnCount;
      var _loc9_ = 0;
      while(_loc9_ < this._nVisibleRowCount)
      {
         var _loc10_ = 0;
         while(_loc10_ < this._nVisibleColumnCount)
         {
            var _loc11_ = this._mcScrollContent["c" + _loc8_];
            _loc11_.showLabel = this._eaDataProvider[_loc4_].label != undefined && this._eaDataProvider[_loc4_].label > 0;
            _loc11_.contentData = this._eaDataProvider[_loc4_];
            _loc11_.id = _loc4_;
            if(this.isSelectedIndex(_loc4_))
            {
               _loc11_.selected = true;
            }
            else
            {
               _loc11_.selected = false;
            }
            _loc11_.enabled = this._bEnabled;
            _loc4_ = _loc4_ + 1;
            _loc8_ = _loc8_ + 1;
            _loc10_ = _loc10_ + 1;
         }
         _loc9_ = _loc9_ + 1;
      }
      if(this._bInvalidateLayout)
      {
      }
      this._bInvalidateLayout = false;
   }
   function draw()
   {
      this._bInvalidateLayout = !this._bInitialized;
      this.layoutContent();
      var _loc2_ = this.getStyle();
      var _loc3_ = _loc2_.containerbackground;
      var _loc4_ = _loc2_.containerborder;
      var _loc5_ = _loc2_.containerhighlight;
      this._nStyleMargin = _loc2_.containermargin;
      for(var k in this._mcScrollContent)
      {
         var _loc6_ = this._mcScrollContent[k];
         _loc6_.backgroundRenderer = _loc3_;
         _loc6_.borderRenderer = _loc4_;
         _loc6_.highlightRenderer = _loc5_;
         _loc6_.margin = this._nStyleMargin;
         _loc6_.styleName = _loc2_.containerstyle;
      }
      if(this._bScrollBar)
      {
         this._sbVertical.styleName = _loc2_.scrollbarstyle;
      }
   }
   function setEnabled()
   {
      for(var k in this._mcScrollContent)
      {
         this._mcScrollContent[k].enabled = this._bEnabled;
      }
      this.addToQueue({object:this,method:function()
      {
         this._sbVertical.enabled = this._bEnabled;
      }});
   }
   function getMaxRow()
   {
      return Math.ceil(this._eaDataProvider.length / this._nVisibleColumnCount) - this._nVisibleRowCount;
   }
   function setScrollBarProperties()
   {
      var _loc2_ = this._nRowCount - this._nVisibleRowCount;
      var _loc3_ = this._nVisibleRowCount * (_loc2_ / this._nRowCount);
      this._sbVertical.setScrollProperties(_loc3_,0,_loc2_);
      this._sbVertical.scrollPosition = this._nScrollPosition;
   }
   function getItemById(§\x04\n§)
   {
      var _loc3_ = 0;
      var _loc4_ = 0;
      var _loc5_ = 0;
      while(_loc5_ < this._nVisibleRowCount)
      {
         var _loc6_ = 0;
         while(_loc6_ < this._nVisibleColumnCount)
         {
            var _loc7_ = this._mcScrollContent["c" + _loc3_];
            if(_loc2_ == _loc7_.id)
            {
               return _loc7_;
            }
            _loc3_ = _loc3_ + 1;
            _loc6_ = _loc6_ + 1;
         }
         _loc5_ = _loc5_ + 1;
      }
   }
   function getSelectedItems()
   {
      var _loc2_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < this._aSelectedIndexes.length)
      {
         var _loc4_ = this._aSelectedIndexes[_loc3_].item;
         _loc2_.push(_loc4_);
         _loc3_ = _loc3_ + 1;
      }
      _loc2_.reverse();
      return _loc2_;
   }
   function selectContainer(§\x1e\x19\x18§)
   {
      _loc2_.selected = true;
      this._aSelectedIndexes.push({index:_loc2_.id,item:_loc2_.contentData});
   }
   function unSelectContainer(§\x1e\x19\x18§)
   {
      _loc2_.selected = false;
      var _loc3_ = new Array();
      var _loc4_ = 0;
      while(_loc4_ < this._aSelectedIndexes.length)
      {
         if(_loc2_.id != this._aSelectedIndexes[_loc4_].index)
         {
            _loc3_.push(this._aSelectedIndexes[_loc4_]);
         }
         _loc4_ = _loc4_ + 1;
      }
      this._aSelectedIndexes = _loc3_;
   }
   function setSelectedItem(§\x04\n§, §\x16\x02§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      while(_loc6_ < this._nVisibleRowCount)
      {
         var _loc7_ = 0;
         while(_loc7_ < this._nVisibleColumnCount)
         {
            var _loc8_ = this._mcScrollContent["c" + _loc4_];
            if(_loc2_ == _loc8_.id)
            {
               _loc2_ = _loc4_;
               _loc5_ = _loc8_.id;
            }
            _loc4_ = _loc4_ + 1;
            _loc7_ = _loc7_ + 1;
         }
         _loc6_ = _loc6_ + 1;
      }
      var _loc9_ = this.getItemById(this.selectedIndex);
      var _loc10_ = this._mcScrollContent["c" + _loc2_];
      if(this._bMultiContainerSelection)
      {
         if(!Key.isDown(dofus.Constants.SELECT_MULTIPLE_ITEMS_KEY))
         {
            this.unSelectAll();
         }
      }
      else
      {
         this.unSelectContainer(_loc9_);
      }
      if(_loc10_.contentData == undefined)
      {
         return undefined;
      }
      if(_loc10_.selected)
      {
         if(_loc3_)
         {
            return undefined;
         }
         this.unSelectContainer(_loc10_);
         return undefined;
      }
      this.selectContainer(_loc10_);
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      this.unSelectAll();
      var _loc3_ = this._nRowCount;
      this._nRowCount = Math.ceil(this._eaDataProvider.length / this._nVisibleColumnCount);
      this._bInvalidateLayout = true;
      this.layoutContent();
      this.draw();
      this.setScrollBarProperties();
   }
   function scroll(§\x1e\x19\x0e§)
   {
      this.setVPosition(_loc2_.target.scrollPosition);
   }
   function drag(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"dragItem",target:_loc2_.target});
   }
   function drop(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"dropItem",target:_loc2_.target});
   }
   function over(§\x1e\x19\x0e§)
   {
      if(this._bSelectable && (this._bMultiContainerSelection && (Key.isDown(dofus.Constants.SELECT_MULTIPLE_ITEMS_KEY) && Key.isDown(Key.SHIFT))))
      {
         this.setSelectedItem(_loc2_.target.id,true);
      }
      this.dispatchEvent({type:"overItem",target:_loc2_.target});
   }
   function out(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"outItem",target:_loc2_.target});
   }
   function click(§\x1e\x19\x0e§)
   {
      if(this._bSelectable)
      {
         this.setSelectedItem(_loc2_.target.id);
      }
      this.dispatchEvent({type:"selectItem",target:_loc2_.target,owner:this});
   }
   function dblClick(§\x1e\x19\x0e§)
   {
      var _loc3_ = this.getSelectedItems();
      this.unSelectAll();
      this.dispatchEvent({type:"dblClickItem",target:_loc2_.target,targets:_loc3_,owner:this});
   }
   function onMouseWheel(§\x06\n§, §\n\x1d§)
   {
      if(dofus["\r\x14"].gapi.ui.Zoom.isZooming())
      {
         return undefined;
      }
      if(String(_loc3_._target).indexOf(this._target) != -1)
      {
         this._sbVertical.scrollPosition -= _loc2_ <= 0 ? -1 : 1;
      }
   }
}
