class ank.gapi.controls.list.SelectableRow extends ank.gapi.core.§\x1e\n\f§
{
   var _nItemIndex;
   var _oItem;
   var _nIndex;
   var cellRenderer_mc;
   var selected_mc;
   var _bUsed;
   var bg_mc;
   var over_mc;
   var __width;
   var __height;
   var _bDblClickEnabled = false;
   function SelectableRow()
   {
      super();
   }
   function set itemIndex(§\x04\x05§)
   {
      this._nItemIndex = _loc2_;
   }
   function get itemIndex()
   {
      return this._nItemIndex;
   }
   function get item()
   {
      return this._oItem;
   }
   function set index(§\x04\n§)
   {
      this._nIndex = _loc2_;
   }
   function get index()
   {
      return this._nIndex;
   }
   function setCellRenderer(§\x0b\x10§)
   {
      this.cellRenderer_mc.removeMovieClip();
      this.attachMovie(_loc2_,"cellRenderer_mc",100,{styleName:this.getStyle().cellrendererstyle,list:this._parent._parent,row:this});
   }
   function setState(§\x1e\r\t§)
   {
      this.cellRenderer_mc.setState(_loc2_);
      switch(_loc2_)
      {
         case "selected":
            this.selected_mc._visible = true;
            break;
         case "normal":
            this.selected_mc._visible = false;
      }
   }
   function setValue(§\x1e\r\x04§, §\x1e\x19\x03§, §\x1e\r\t§)
   {
      this._bUsed = _loc3_ != undefined;
      this._oItem = _loc3_;
      this.cellRenderer_mc.setValue(this._bUsed,_loc2_,_loc3_);
      this.setState(_loc4_);
   }
   function select()
   {
      this.bg_mc.onRelease();
   }
   function init()
   {
      super.init(false);
   }
   function createChildren()
   {
      this.createEmptyMovieClip("selected_mc",-10);
      this.createEmptyMovieClip("over_mc",-20);
      this.createEmptyMovieClip("bg_mc",-30);
      this.bg_mc.trackAsMenu = true;
      this.over_mc._visible = false;
      this.selected_mc._visible = false;
      this.bg_mc.useHandCursor = false;
      this.bg_mc.onRollOver = function()
      {
         if(this._parent._bUsed && this._parent._bEnabled)
         {
            this._parent.over_mc._visible = true;
            this._parent.dispatchEvent({type:"itemRollOver",target:this._parent});
            this._parent._sLastMouseAction = "RollOver";
         }
      };
      this.bg_mc.onRollOut = this.bg_mc.onReleaseOutside = function()
      {
         if(this._parent._bUsed && this._parent._bEnabled)
         {
            this._parent.dispatchEvent({type:"itemRollOut",target:this._parent});
            this._parent._sLastMouseAction = "RollOut";
         }
         this._parent.over_mc._visible = false;
      };
      this.bg_mc.onPress = function()
      {
         this._parent._sLastMouseAction = "Press";
      };
      this.bg_mc.onRelease = function()
      {
         if(this._parent._bUsed && this._parent._bEnabled)
         {
            if(this._parent._sLastMouseAction == "DragOver")
            {
               this._parent.dispatchEvent({type:"itemDrop"});
            }
            else if(getTimer() - this._parent._nLastClickTime < ank.gapi["\r\x19"].DBLCLICK_DELAY && !this._parent._bDblClickEnabled)
            {
               ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this._parent,"selectablerow");
               this._parent.dispatchEvent({type:"itemdblClick"});
            }
            else if(this._parent._bDblClickEnabled)
            {
               ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this._parent,"selectablerow",this._parent,this._parent.dispatchEvent,ank.gapi["\r\x19"].DBLCLICK_DELAY,[{type:"itemSelected"}]);
            }
            else
            {
               this._parent.dispatchEvent({type:"itemSelected"});
            }
            this._parent._sLastMouseAction = "Release";
            this._parent._nLastClickTime = getTimer();
         }
      };
      this.bg_mc.onDragOver = function()
      {
         if(this._parent._bUsed && this._parent._bEnabled)
         {
            this._parent.over_mc._visible = true;
            this._parent.dispatchEvent({type:"itemRollOver",target:this._parent});
            this._parent._sLastMouseAction = "DragOver";
         }
      };
      this.bg_mc.onDragOut = function()
      {
         if(this._parent._bUsed && this._parent._bEnabled)
         {
            if(this._parent._sLastMouseAction == "Press")
            {
               this._parent.dispatchEvent({type:"itemDrag"});
            }
            this._parent._sLastMouseAction = "DragOut";
            this._parent.dispatchEvent({type:"itemRollOut",target:this._parent});
         }
         this._parent.over_mc._visible = false;
      };
   }
   function size()
   {
      super.size();
      this.cellRenderer_mc.setSize(this.__width,this.__height);
      this.arrange();
   }
   function arrange()
   {
      this.over_mc._width = this.selected_mc._width = this.bg_mc._width = this.__width;
      this.over_mc._height = this.selected_mc._height = this.bg_mc._height = this.__height;
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      var _loc3_ = _loc2_.cellbgcolor;
      var _loc4_ = _loc2_.cellselectedcolor;
      var _loc5_ = _loc2_.cellovercolor;
      this.over_mc.clear();
      this.selected_mc.clear();
      this.bg_mc.clear();
      this.drawRoundRect(this.over_mc,0,0,1,1,0,_loc5_,_loc5_ != -1 ? 100 : 0);
      this.drawRoundRect(this.selected_mc,0,0,1,1,0,_loc4_,_loc4_ != -1 ? 100 : 0);
      this.drawRoundRect(this.bg_mc,0,0,1,1,0,typeof _loc3_ != "object" ? Number(_loc3_) : Number(_loc3_[this._nIndex % _loc3_.length]),_loc3_ != -1 ? 100 : 0);
      this.cellRenderer_mc.styleName = _loc2_.cellrendererstyle;
   }
}
