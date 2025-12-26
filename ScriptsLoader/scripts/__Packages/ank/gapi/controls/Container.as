class ank.gapi.controls.Container extends ank.gapi.core.§\x1e\n\f§
{
   var _ldrContent;
   var _oContentData;
   var _mcHighlight;
   var _sBorder;
   var _sLabel;
   var _lblText;
   var __height;
   var __width;
   var _mcLabelBackground;
   var _nId;
   var dispatchEvent;
   var _mcInteraction;
   var _mcBg;
   static var CLASS_NAME = "Container";
   var _sBackground = "DefaultBackground";
   var _sHighlight = "DefaultHighlight";
   var _bDragAndDrop = true;
   var _bShowLabel = false;
   var _bSelected = false;
   var _nMargin = 2;
   var _bHighlightFront = true;
   function Container()
   {
      super();
   }
   function set contentPath(§\x1e\x13\x10§)
   {
      this._ldrContent.contentPath = _loc2_;
   }
   function set forceReload(§\x16\x06§)
   {
      this._ldrContent.forceReload = _loc2_;
   }
   function get contentPath()
   {
      return this._ldrContent.contentPath;
   }
   function set contentData(§\x1e\x19\x17§)
   {
      this._oContentData = _loc2_;
      if(this._oContentData.params != undefined)
      {
         this._ldrContent.contentParams = this._oContentData.params;
      }
      if(_loc2_.iconFile != undefined)
      {
         this.contentPath = _loc2_.iconFile;
      }
      else
      {
         this.contentPath = "";
      }
      if(_loc2_.label != undefined)
      {
         if(this.label != _loc2_.label)
         {
            this.label = _loc2_.label;
         }
      }
      else
      {
         this.label = "";
      }
   }
   function get contentData()
   {
      return this._oContentData;
   }
   function get contentLoaded()
   {
      return this._ldrContent.loaded;
   }
   function get content()
   {
      return this._ldrContent.content;
   }
   function get holder()
   {
      return this._ldrContent.holder;
   }
   function set selected(bSelected)
   {
      this._bSelected = bSelected;
      this.addToQueue({object:this,method:function()
      {
         this._mcHighlight._visible = bSelected;
      }});
   }
   function get selected()
   {
      return this._bSelected;
   }
   function set backgroundRenderer(§\x1e\x14\x0e§)
   {
      if(_loc2_.length == 0 || _loc2_ == undefined)
      {
         return;
      }
      this._sBackground = _loc2_;
      this.attachBackground();
      if(this._bInitialized)
      {
         this.size();
      }
   }
   function set borderRenderer(§\x1e\x14\n§)
   {
      if(_loc2_.length == 0 || _loc2_ == undefined)
      {
         return;
      }
      this._sBorder = _loc2_;
      this.attachBorder();
      if(this._bInitialized)
      {
         this.size();
      }
   }
   function set highlightRenderer(§\x1e\x11\x14§)
   {
      if(_loc2_.length == 0 || _loc2_ == undefined)
      {
         return;
      }
      this._sHighlight = _loc2_;
      this.attachHighlight();
      if(this._bInitialized)
      {
         this.size();
      }
   }
   function set dragAndDrop(§\x1a\x13§)
   {
      if(_loc2_ == undefined)
      {
         return;
      }
      this._bDragAndDrop = _loc2_;
      if(this._bInitialized)
      {
         this.setEnabled();
      }
   }
   function get dragAndDrop()
   {
      return this._bDragAndDrop;
   }
   function set showLabel(§\x15\x07§)
   {
      if(_loc2_ == undefined)
      {
         return;
      }
      this._bShowLabel = _loc2_;
      if(_loc2_)
      {
         if(this._sLabel != undefined)
         {
            if(this._lblText == undefined)
            {
               this.attachMovie("Label","_lblText",30,{_width:this.__width,_height:this.__height,styleName:this.getStyle().labelstyle});
            }
            this.addToQueue({object:this,method:this.setLabel,params:[this._sLabel]});
         }
      }
      else
      {
         this._lblText.removeMovieClip();
         this._mcLabelBackground.clear();
      }
   }
   function get showLabel()
   {
      return this._bShowLabel;
   }
   function set label(§\x1e\x10\x1b§)
   {
      this._sLabel = _loc2_;
      if(this._bShowLabel)
      {
         if(this._lblText == undefined)
         {
            this.attachMovie("Label","_lblText",30,{_width:this.__width,_height:this.__height,styleName:this.getStyle().labelstyle});
         }
         this.addToQueue({object:this,method:this.setLabel,params:[_loc2_]});
      }
   }
   function get label()
   {
      return this._sLabel;
   }
   function set margin(§\x03\n§)
   {
      _loc2_ = Number(_loc2_);
      if(_global.isNaN(_loc2_))
      {
         return;
      }
      this._nMargin = _loc2_;
      if(this.initialized)
      {
         this._ldrContent.move(this._nMargin,this._nMargin);
      }
   }
   function get margin()
   {
      return this._nMargin;
   }
   function set highlightFront(§\x19\x06§)
   {
      this._bHighlightFront = _loc2_;
      if(!_loc2_ && this._mcHighlight != undefined)
      {
         this._mcHighlight.swapDepths(1);
      }
   }
   function get highlightFront()
   {
      return this._bHighlightFront;
   }
   function set id(§\x04\x11§)
   {
      this._nId = _loc2_;
   }
   function get id()
   {
      return this._nId;
   }
   function forceNextLoad()
   {
      this._ldrContent.forceNextLoad();
   }
   function emulateClick()
   {
      this.dispatchEvent({type:"click"});
   }
   function init()
   {
      super.init(false,ank.gapi.controls.Container.CLASS_NAME);
   }
   function createChildren()
   {
      this.createEmptyMovieClip("_mcInteraction",0);
      this.drawRoundRect(this._mcInteraction,0,0,1,1,0,0,0);
      this._mcInteraction.trackAsMenu = true;
      this.attachMovie("Loader","_ldrContent",20,{scaleContent:true});
      this._ldrContent.move(this._nMargin,this._nMargin);
      this._ldrContent.addEventListener("complete",this);
      this.createEmptyMovieClip("_mcLabelBackground",29);
   }
   function complete()
   {
      this.dispatchEvent({type:"onContentLoaded",content:this.content});
   }
   function size()
   {
      super.size();
      if(this._bInitialized)
      {
         this.arrange();
      }
   }
   function arrange()
   {
      this._mcInteraction._width = this.__width;
      this._mcInteraction._height = this.__height;
      this._ldrContent.setSize(this.__width - this._nMargin * 2,this.__height - this._nMargin * 2);
      this._mcBg.setSize(this.__width,this.__height);
      this._mcHighlight.setSize(this.__width,this.__height);
      this._lblText.setSize(this.__width,this.__height);
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      this._mcBg.styleName = _loc2_.backgroundstyle;
      this._lblText.styleName = _loc2_.labelstyle;
   }
   function setEnabled()
   {
      if(this._bEnabled)
      {
         this._mcInteraction.onRelease = function()
         {
            if(this._parent._sLastMouseAction == "DragOver")
            {
               this._parent.dispatchEvent({type:"drop"});
            }
            else if(getTimer() - this._parent._nLastClickTime < ank.gapi["\r\x19"].DBLCLICK_DELAY)
            {
               ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this._parent,"container");
               this._parent.dispatchEvent({type:"dblClick"});
            }
            else
            {
               ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this._parent,"container",this._parent,this._parent.dispatchEvent,ank.gapi["\r\x19"].DBLCLICK_DELAY,[{type:"click"}]);
            }
            this._parent._sLastMouseAction = "Release";
            this._parent._nLastClickTime = getTimer();
         };
         this._mcInteraction.onPress = function()
         {
            this._parent._sLastMouseAction = "Press";
         };
         this._mcInteraction.onRollOver = function()
         {
            this._parent._mcHighlight._visible = true;
            this._parent._sLastMouseAction = "RollOver";
            this._parent.dispatchEvent({type:"over"});
         };
         this._mcInteraction.onRollOut = function()
         {
            if(!this._parent._bSelected)
            {
               this._parent._mcHighlight._visible = false;
            }
            this._parent._sLastMouseAction = "RollOver";
            this._parent.dispatchEvent({type:"out"});
         };
         if(this._bDragAndDrop)
         {
            this._mcInteraction.onDragOver = function()
            {
               this._parent._mcHighlight._visible = true;
               this._parent._sLastMouseAction = "DragOver";
               this._parent.dispatchEvent({type:"over"});
            };
            this._mcInteraction.onDragOut = function()
            {
               if(!this._parent._bSelected)
               {
                  this._parent._mcHighlight._visible = false;
               }
               if(this._parent._sLastMouseAction == "Press")
               {
                  this._parent.dispatchEvent({type:"drag"});
               }
               this._parent._sLastMouseAction = "DragOut";
               this._parent.dispatchEvent({type:"out"});
            };
         }
      }
      else
      {
         delete this._mcInteraction.onRelease;
         delete this._mcInteraction.onPress;
         delete this._mcInteraction.onRollOver;
         delete this._mcInteraction.onRollOut;
         delete this._mcInteraction.onDragOver;
         delete this._mcInteraction.onDragOut;
      }
   }
   function attachBackground()
   {
      this.attachMovie(this._sBackground,"_mcBg",10);
   }
   function attachBorder()
   {
      this.attachMovie(this._sBorder,"_mcBorder",90);
   }
   function attachHighlight()
   {
      this.attachMovie(this._sHighlight,"_mcHighlight",!this._bHighlightFront ? 5 : 100);
      this._mcHighlight._visible = false;
   }
   function setLabel(§\x1e\x10\x1b§)
   {
      if(this._bShowLabel)
      {
         this._lblText.text = _loc2_;
         var _loc3_ = Math.min(this._lblText.textWidth + 2,this.__width - 4);
         var _loc4_ = this._lblText.textHeight;
         this._mcLabelBackground.clear();
         if(_loc3_ > 2 && _loc4_ != 0)
         {
            this.drawRoundRect(this._mcLabelBackground,2,2,_loc3_,_loc4_ + 2,0,0,50);
         }
      }
      else
      {
         this._lblText.removeMovieClip();
         this._mcLabelBackground.clear();
      }
   }
}
