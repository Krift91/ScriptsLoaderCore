class ank.gapi.controls.ChatArea extends ank.gapi.core.§\x1e\n\f§
{
   var _sText;
   var _tText;
   var _tfFormatter;
   var __width;
   var __height;
   var _sbVertical;
   var dispatchEvent;
   static var CLASS_NAME = "ChatArea";
   static var STOP_SCROLL_LENGTH = 6;
   var _bSelectable = false;
   var _bWordWrap = true;
   var _sScrollBarSide = "right";
   var _nScrollBarMargin = 0;
   var _bHideScrollBar = false;
   var _bUseMouseWheel = true;
   var _bInvalidateMaxScrollStop = false;
   var _nPreviousMaxscroll = 1;
   var _nScrollPosition = 1;
   function ChatArea()
   {
      super();
   }
   function set selectable(§\x15\x15§)
   {
      this._bSelectable = _loc2_;
      if(this._bInitialized)
      {
         this.addToQueue({object:this,method:this.setTextFieldProperties});
      }
   }
   function get selectable()
   {
      return this._bSelectable;
   }
   function set wordWrap(§\x13\x12§)
   {
      this._bWordWrap = _loc2_;
      if(this._bInitialized)
      {
         this.addToQueue({object:this,method:this.setTextFieldProperties});
      }
   }
   function get wordWrap()
   {
      return this._bWordWrap;
   }
   function set text(§\x1e\f\x12§)
   {
      this._sText = _loc2_;
      if(this.initialized)
      {
         this.addToQueue({object:this,method:this.setTextFieldProperties});
      }
   }
   function get text()
   {
      return this._tText.text;
   }
   function get htmlText()
   {
      return this._tText.htmlText;
   }
   function set scrollBarSide(§\x1e\r\x1b§)
   {
      this._sScrollBarSide = _loc2_;
   }
   function get scrollBarSide()
   {
      return this._sScrollBarSide;
   }
   function set scrollBarMargin(§\x1e\x1d\x15§)
   {
      this._nScrollBarMargin = _loc2_;
   }
   function get scrollBarMargin()
   {
      return this._nScrollBarMargin;
   }
   function set hideScrollBar(§\x19\x07§)
   {
      this._bHideScrollBar = _loc2_;
   }
   function get hideScrollBar()
   {
      return this._bHideScrollBar;
   }
   function set useMouseWheel(§\x14\x02§)
   {
      this._bUseMouseWheel = _loc2_;
   }
   function get useMouseWheel()
   {
      return this._bUseMouseWheel;
   }
   function init()
   {
      super.init(false,ank.gapi.controls.ChatArea.CLASS_NAME);
      this._tfFormatter = new TextFormat();
   }
   function createChildren()
   {
      this.createTextField("_tText",10,0,0,this.__width - 2,this.__height - 2);
      this._tText._x = 1;
      this._tText._y = 1;
      this._tText.addListener(this);
      this._tText.onSetFocus = function()
      {
         this._parent.onSetFocus();
      };
      this._tText.onKillFocus = function()
      {
         this._parent.onKillFocus();
      };
      this._tText.mouseWheelEnabled = true;
      this.addToQueue({object:this,method:this.setTextFieldProperties});
      ank["\x1e\n\x07"]["\t\x17"].addListener(this);
   }
   function size()
   {
      super.size();
      this.arrange();
   }
   function arrange()
   {
      this._tText._height = this.__height;
      this._tText._width = this.__width;
      this._bInvalidateMaxScrollStop = true;
      this.setTextFieldProperties();
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      this._tfFormatter = new TextFormat();
      this._tfFormatter.font = _loc2_.font;
      this._tfFormatter.align = _loc2_.align;
      this._tfFormatter.size = _loc2_.size;
      this._tfFormatter.color = _loc2_.color;
      this._tfFormatter.bold = _loc2_.bold;
      this._tfFormatter.italic = _loc2_.italic;
      this._tText.embedFonts = _loc2_.embedfonts;
      this._tText.antiAliasType = _loc2_.antialiastype;
      this._sbVertical.styleName = _loc2_.scrollbarstyle;
      if(_loc2_.filters != undefined)
      {
         this._tText.filters = _loc2_.filters;
      }
   }
   function setTextFieldProperties()
   {
      if(this._tText == undefined)
      {
         return undefined;
      }
      this._tText._visible = false;
      this._tText.selectable = this._bSelectable;
      this._tText.wordWrap = !this._bWordWrap ? false : true;
      this._tText.multiline = true;
      this._tText.embedFonts = this.getStyle().embedfonts;
      this._tText.type = "dynamic";
      this._tText.html = true;
      if(this._tfFormatter.font != undefined)
      {
         if(this._sText != undefined)
         {
            this._nPreviousMaxscroll = this._tText.maxscroll;
            this.setTextWithBottomStart();
         }
         this._tText.setNewTextFormat(this._tfFormatter);
         this._tText.setTextFormat(this._tfFormatter);
      }
      this.onChanged();
      this._tText._visible = true;
   }
   function addScrollBar()
   {
      if(this._sbVertical == undefined)
      {
         this.attachMovie("ScrollBar","_sbVertical",20,{styleName:this.getStyle().scrollbarstyle,_visible:!this._bHideScrollBar});
         this._sbVertical.addEventListener("scroll",this);
      }
      this._sbVertical.setSize(this.__height - 2);
      this._sbVertical._y = 1;
      this._sbVertical._x = this._sScrollBarSide != "right" ? 0 : this.__width - this._sbVertical._width - 3;
      if(this._bHideScrollBar)
      {
         this._tText._width = this.__width;
         this._tText._x = 0;
      }
      else
      {
         this._tText._width = this.__width - this._sbVertical._width - 3 - this._nScrollBarMargin;
         this._tText._x = this._sScrollBarSide != "right" ? this._sbVertical._width + this._nScrollBarMargin : 0;
      }
      this.setScrollBarPosition();
      if(Math.abs(this._nPreviousMaxscroll - this._tText.scroll) < ank.gapi.controls.ChatArea.STOP_SCROLL_LENGTH || this._bInvalidateMaxScrollStop)
      {
         this._tText.scroll = this._tText.maxscroll;
         this._nScrollPosition = this._tText.maxscroll;
      }
      this._bInvalidateMaxScrollStop = false;
   }
   function setScrollBarPosition()
   {
      var _loc2_ = this._tText.textHeight;
      var _loc3_ = 0.9 * this._tText._height / _loc2_ * this._tText.maxscroll;
      this._sbVertical.setScrollProperties(_loc3_,0,this._tText.maxscroll);
      this._tText.scroll = this._nScrollPosition;
      this._sbVertical.scrollPosition = this._tText.scroll;
   }
   function setTextWithBottomStart()
   {
      this._tText.text = "";
      var _loc2_ = 0;
      while(this._tText.maxscroll == 1 && _loc2_ < 50)
      {
         this._tText.text += "\n";
         _loc2_ = _loc2_ + 1;
      }
      this._tText.htmlText += this._sText;
   }
   function onMouseWheel(§\x06\n§, §\n\x1d§)
   {
      if(dofus["\r\x14"].gapi.ui.Zoom.isZooming())
      {
         return undefined;
      }
      if(!this._bUseMouseWheel)
      {
         return undefined;
      }
      if(String(_loc3_._target).indexOf(this._target) != -1)
      {
         this._sbVertical.scrollPosition -= _loc2_;
      }
   }
   function onChanged()
   {
      this.addScrollBar();
   }
   function onScroller()
   {
      this.setScrollBarPosition();
   }
   function scroll(§\x1e\x19\x0e§)
   {
      if(_loc2_.target == this._sbVertical)
      {
         this._tText.scroll = _loc2_.target.scrollPosition;
         this._nScrollPosition = this._tText.scroll;
      }
   }
   function onHref(§\x1e\x0f\x06§)
   {
      this.dispatchEvent({type:"href",params:_loc2_});
   }
   function onSetFocus()
   {
      fscommand("trapallkeys","false");
   }
   function onKillFocus()
   {
      fscommand("trapallkeys","true");
   }
}
