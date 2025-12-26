class ank.gapi.controls.TextArea extends ank.gapi.core.§\x1e\n\f§
{
   var _tText;
   var _bBorder;
   var border_mc;
   var _sURL;
   var _sText;
   var _bSettingNewText;
   var _cssStyles;
   var _tfFormatter;
   var __width;
   var __height;
   var _sbVertical;
   var _lvText;
   var parent;
   var dispatchEvent;
   static var CLASS_NAME = "TextArea";
   var _bEditable = true;
   var _bSelectable = true;
   var _bAutoHeight = false;
   var _bWordWrap = true;
   var _bScrollBarRight = true;
   var _bHTML = false;
   var _nScrollBarMargin = 0;
   function TextArea()
   {
      super();
   }
   function get tf()
   {
      return this._tText;
   }
   function set border(§\x1b\x1d§)
   {
      this._bBorder = _loc2_;
      if(this.border_mc == undefined)
      {
         this.drawBorder();
      }
      this.border_mc._visible = _loc2_;
   }
   function get border()
   {
      return this._bBorder;
   }
   function set url(sURL)
   {
      this._sURL = sURL;
      if(this._sURL != "")
      {
         this.loadText();
      }
   }
   function set editable(§\x1a\x11§)
   {
      this._bEditable = _loc2_;
      if(this._bInitialized)
      {
         this.addToQueue({object:this,method:this.setTextFieldProperties});
      }
   }
   function get editable()
   {
      return this._bEditable;
   }
   function set autoHeight(§\x1c\x07§)
   {
      this._bAutoHeight = _loc2_;
      if(this._bInitialized)
      {
         this.addToQueue({object:this,method:this.setTextFieldProperties});
      }
   }
   function get autoHeight()
   {
      return this._bAutoHeight;
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
   function set html(§\x19\x04§)
   {
      this._bHTML = _loc2_;
      if(this._bInitialized)
      {
         this.addToQueue({object:this,method:this.setTextFieldProperties});
      }
   }
   function get html()
   {
      return this._bHTML;
   }
   function set text(§\x1e\f\x12§)
   {
      this._sText = _loc2_;
      this._bSettingNewText = true;
      this.addToQueue({object:this,method:this.setTextFieldProperties});
   }
   function get text()
   {
      return this._tText.text;
   }
   function set scrollBarRight(§\x15\x17§)
   {
      this._bScrollBarRight = _loc2_;
   }
   function get scrollBarRight()
   {
      return this._bScrollBarRight;
   }
   function set scrollBarMargin(§\x1e\x1d\x15§)
   {
      this._nScrollBarMargin = _loc2_;
   }
   function get scrollBarMargin()
   {
      return this._nScrollBarMargin;
   }
   function set styleSheet(§\x1e\x13\t§)
   {
      if(_loc2_ != "")
      {
         var _owner = this;
         this._cssStyles = new TextField.StyleSheet();
         this._cssStyles.load(_loc2_);
         this._cssStyles.onLoad = function(§\x14\x16§)
         {
            if(_owner._tText != undefined)
            {
               _owner.addToQueue({object:_owner,method:_owner.setTextFieldProperties});
            }
         };
      }
      else
      {
         this._cssStyles = undefined;
         this._tText.styleSheet = null;
      }
   }
   function set scrollPosition(§\x1e\x1d\x14§)
   {
      this._tText.scroll = _loc2_;
   }
   function get scrollPosition()
   {
      return this._tText.scroll;
   }
   function set maxscroll(§\x02\x1a§)
   {
      this._tText.maxscroll = _loc2_;
   }
   function get maxscroll()
   {
      return this._tText.maxscroll;
   }
   function set maxChars(§\x03\x05§)
   {
      this._tText.maxChars = _loc2_;
   }
   function get maxChars()
   {
      return this._tText.maxChars;
   }
   function get textHeight()
   {
      return this._tText.textHeight;
   }
   function init()
   {
      super.init(false,ank.gapi.controls.TextArea.CLASS_NAME);
      if(this._sURL != undefined)
      {
         this.loadText();
      }
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
      ank["\x1e\n\x07"]["\t\x17"].addListener(this);
   }
   function size()
   {
      super.size();
      this.arrange();
   }
   function arrange()
   {
      this._sbVertical.setSize(this.__height);
      this._tText._height = this.__height;
      this._tText._width = this.__width;
   }
   function draw()
   {
      if(this._bBorder)
      {
         this.drawBorder();
      }
      if(!this._bBorder != undefined)
      {
         this.border_mc._visible = this._bBorder;
      }
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
   }
   function loadText()
   {
      if(this._sURL == undefined || this._sURL == "")
      {
         return undefined;
      }
      this._lvText = new LoadVars();
      this._lvText.parent = this;
      this._lvText.onData = function(§\x1e\x13\x04§)
      {
         this.parent.text = _loc2_;
      };
      this._lvText.load(this._sURL);
   }
   function setTextFieldProperties()
   {
      if(this._tText != undefined)
      {
         if(this._bAutoHeight)
         {
            this._tText.autoSize = "left";
         }
         this._tText.wordWrap = !this._bWordWrap ? false : true;
         this._tText.multiline = true;
         this._tText.selectable = this._bSelectable;
         this._tText.type = !this._bEditable ? "dynamic" : "input";
         this._tText.html = this._bHTML;
         if(this._cssStyles != undefined)
         {
            this._tText.styleSheet = this._cssStyles;
            if(this._sText != undefined)
            {
               if(this._bHTML)
               {
                  this._tText.htmlText = this._sText;
               }
               else
               {
                  this._tText.text = this._sText;
               }
            }
         }
         else if(this._tfFormatter.font != undefined)
         {
            if(this._sText != undefined)
            {
               if(this._bHTML)
               {
                  this._tText.htmlText = this._sText;
               }
               else
               {
                  this._tText.text = this._sText;
               }
            }
            this._tText.setNewTextFormat(this._tfFormatter);
            this._tText.setTextFormat(this._tfFormatter);
         }
         this.onChanged();
      }
   }
   function addScrollBar()
   {
      if(this._sbVertical == undefined)
      {
         this.attachMovie("ScrollBar","_sbVertical",20,{styleName:this.getStyle().scrollbarstyle});
         this._sbVertical.setSize(this.__height - 2);
         this._sbVertical._y = 1;
         this._sbVertical._x = !this._bScrollBarRight ? 0 : this.__width - this._sbVertical._width - 3;
         this._tText._width = this.__width - this._sbVertical._width - 3 - this._nScrollBarMargin;
         this._tText._x = !this._bScrollBarRight ? this._sbVertical._width + this._nScrollBarMargin : 0;
         this._sbVertical.addEventListener("scroll",this);
      }
      var _loc2_ = this._tText.textHeight;
      var _loc3_ = 0.9 * this._tText._height / _loc2_ * this._tText.maxscroll;
      this._sbVertical.setScrollProperties(_loc3_,0,this._tText.maxscroll);
      this._sbVertical.scrollPosition = this._tText.scroll;
      if(this._bSettingNewText)
      {
         this._sbVertical.scrollPosition = 0;
         this._bSettingNewText = false;
      }
   }
   function removeScrollBar()
   {
      if(this._sbVertical != undefined)
      {
         this._sbVertical.removeMovieClip();
         this._tText._width = this.__width;
      }
   }
   function onChanged()
   {
      if(this._tText.textHeight >= this._tText._height || this._cssStyles != undefined && this._tText.textHeight + 5 >= this._tText._height)
      {
         this.addScrollBar();
      }
      else
      {
         this.removeScrollBar();
      }
      if(this._bAutoHeight && this._tText.textHeight != this.__height)
      {
         this.setSize(this.__width,this._tText.textHeight);
         this.dispatchEvent({type:"resize"});
      }
      this.dispatchEvent({type:"change",target:this});
   }
   function scroll(§\x1e\x19\x0e§)
   {
      if(_loc2_.target == this._sbVertical)
      {
         this._tText.scroll = _loc2_.target.scrollPosition;
      }
   }
   function onMouseWheel(§\x06\n§, §\n\x1d§)
   {
      if(dofus["\r\x14"].gapi.ui.Zoom.isZooming())
      {
         return undefined;
      }
      if(String(_loc3_._target).indexOf(this._target) != -1)
      {
         this._sbVertical.scrollPosition -= _loc2_;
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
