class ank.gapi.controls.Label extends ank.gapi.core.§\x1e\n\f§
{
   var _bHTML;
   var _sText;
   var _bSettingNewText;
   var _tText;
   var _tfFormatter;
   var __width;
   var __height;
   var _tDotText;
   var _mcDot;
   var dispatchEvent;
   static var CLASS_NAME = "Label";
   var _sTextfiledType = "dynamic";
   var _bMultiline = false;
   var _bWordWrap = false;
   var bDisplayDebug = false;
   function Label()
   {
      super();
   }
   function set html(§\x19\x04§)
   {
      this._bHTML = _loc2_;
      this.setTextFieldProperties();
   }
   function get html()
   {
      return this._bHTML;
   }
   function set multiline(§\x17\x10§)
   {
      this._bMultiline = _loc2_;
      this.setTextFieldProperties();
   }
   function get multiline()
   {
      return this._bMultiline;
   }
   function set wordWrap(§\x13\x12§)
   {
      this._bWordWrap = _loc2_;
      this.setTextFieldProperties();
   }
   function get wordWrap()
   {
      return this._bWordWrap;
   }
   function set text(§\x1e\f\x12§)
   {
      this._sText = _loc2_;
      this._bSettingNewText = true;
      this.setTextFieldProperties();
   }
   function get text()
   {
      return this._tText.text != undefined ? this._tText.text : this._sText;
   }
   function get textHeight()
   {
      return this._tText.textHeight;
   }
   function get textWidth()
   {
      return this._tText.textWidth;
   }
   function set textColor(§\x06\x1d§)
   {
      this._tText.textColor = _loc2_;
   }
   function setPreferedSize(§\x1e\x14\x10§)
   {
      this._tText.autoSize = _loc2_;
      this.setSize(this.textWidth + 5,this.textHeight);
   }
   function init()
   {
      super.init(false,ank.gapi.controls.Label.CLASS_NAME);
      this._tfFormatter = new TextFormat();
   }
   function createChildren()
   {
      this.createTextField("_tText",10,0,1,this.__width,this.__height - 1);
      this._tText.addListener(this);
      this._tText.onKillFocus = function()
      {
         this._parent.onKillFocus();
      };
      this._tText.onSetFocus = function()
      {
         this._parent.onSetFocus();
      };
      this.setTextFieldProperties();
   }
   function size()
   {
      super.size();
      this._tText._height = this.__height - 1;
      this._tDotText.removeTextField();
      this._mcDot.removeMovieClip();
      if(this._tText.textWidth > this.__width && this._sTextfiledType == "dynamic")
      {
         this.createTextField("_tDotText",20,0,1,this.__width,this.__height - 1);
         this._tDotText.selectable = false;
         this._tDotText.autoSize = "right";
         this._tDotText.embedFonts = this.getStyle().labelembedfonts;
         this._tDotText.text = "...";
         this._tDotText.setNewTextFormat(this._tfFormatter);
         this._tDotText.setTextFormat(this._tfFormatter);
         this._tText._width = this.__width - this._tDotText.textWidth;
         this.createEmptyMovieClip("_mcDot",30);
         this.drawRoundRect(this._mcDot,this.__width - this._tDotText.textWidth,0,this._tDotText.textWidth + 5,this.__height,0,0,0);
         this._mcDot.onRollOver = function()
         {
            this._parent.gapi.showTooltip(this._parent._sText,this._parent,0);
         };
         this._mcDot.onRollOut = function()
         {
            this._parent.gapi.hideTooltip();
         };
      }
      else
      {
         this._tText._width = this.__width;
      }
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      this._tfFormatter = this._tText.getTextFormat();
      this._tfFormatter.font = _loc2_.labelfont;
      this._tfFormatter.align = _loc2_.labelalign;
      this._tfFormatter.size = _loc2_.labelsize;
      if(!this._bHTML)
      {
         this._tfFormatter.color = _loc2_.labelcolor;
      }
      this._tfFormatter.bold = _loc2_.labelbold;
      this._tfFormatter.italic = _loc2_.labelitalic;
      this._tText.embedFonts = _loc2_.labelembedfonts;
      this._tText.antiAliasType = _loc2_.antialiastype;
      this.setTextFieldProperties();
   }
   function setTextFieldProperties()
   {
      if(this._tText != undefined)
      {
         this._tText.wordWrap = this._bWordWrap;
         this._tText.multiline = this._bMultiline;
         this._tText.selectable = this._sTextfiledType == "input";
         this._tText.type = this._sTextfiledType;
         this._tText.html = !this._bHTML ? false : true;
         if(this._tfFormatter.font != undefined)
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
         if(this._tText.textWidth > this.__width && this._sTextfiledType == "dynamic")
         {
            this.size();
         }
         else
         {
            this._tDotText.removeTextField();
            this._mcDot.removeMovieClip();
         }
         this.onChanged();
      }
   }
   function onChanged()
   {
      this.dispatchEvent({type:"change"});
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
