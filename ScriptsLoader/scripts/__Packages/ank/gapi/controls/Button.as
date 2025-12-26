class ank.gapi.controls.Button extends ank.gapi.core.§\x1e\n\f§
{
   var _bSelected;
   var _lblLabel;
   var _mcIcon;
   var dispatchEvent;
   var _mcDown;
   var _mcUp;
   var _sIcon;
   var __width;
   var __height;
   static var CLASS_NAME = "Button";
   var _bToggle = false;
   var _bRadio = false;
   var _sLabel = "";
   var _sBackgroundUp = "ButtonNormalUp";
   var _sBackgroundDown = "ButtonNormalDown";
   var _nLabelPadding = 0;
   function Button()
   {
      super();
   }
   function set label(§\x1e\x10\x1b§)
   {
      this._sLabel = _loc2_;
      this.displayLabel();
   }
   function set selected(§\x15\x14§)
   {
      if(this._bSelected != _loc2_)
      {
         this._lblLabel._x += !_loc2_ ? -0.5 : 0.5;
         this._lblLabel._y += !_loc2_ ? -0.5 : 0.5;
         this._mcIcon._x += !_loc2_ ? -0.5 : 0.5;
         this._mcIcon._y += !_loc2_ ? -0.5 : 0.5;
         this.dispatchEvent({type:"stateChanged",target:this,value:_loc2_});
      }
      this._bSelected = _loc2_;
      this._mcDown._visible = this._bSelected;
      this._mcUp._visible = !this._bSelected;
      this.setLabelStyle();
   }
   function get selected()
   {
      return this._bSelected;
   }
   function set toggle(§\x14\x0e§)
   {
      this._bToggle = _loc2_;
   }
   function get toggle()
   {
      return this._bToggle;
   }
   function set radio(§\x16\r§)
   {
      this._bRadio = _loc2_;
   }
   function get radio()
   {
      return this._bRadio;
   }
   function set icon(§\x1e\x11\x0e§)
   {
      this._sIcon = _loc2_;
      if(this.initialized)
      {
         this.displayIcon();
      }
   }
   function get icon()
   {
      return this._sIcon;
   }
   function get iconClip()
   {
      return this._mcIcon;
   }
   function set backgroundUp(§\x1e\x14\f§)
   {
      this._sBackgroundUp = _loc2_;
      if(this.initialized)
      {
         this.drawBackgrounds();
      }
   }
   function get backgroundUp()
   {
      return this._sBackgroundUp;
   }
   function set backgroundDown(§\x1e\x14\r§)
   {
      this._sBackgroundDown = _loc2_;
      if(this.initialized)
      {
         this.drawBackgrounds();
      }
   }
   function get backgroundDown()
   {
      return this._sBackgroundDown;
   }
   function setPreferedSize(§\x03\x15§)
   {
      if(this._sLabel != "")
      {
         if(_global.isNaN(Number(_loc2_)))
         {
            this._nLabelPadding = 0;
         }
         else
         {
            this._nLabelPadding = Number(_loc2_);
         }
         this._lblLabel.setPreferedSize("left");
         this.setSize(this._lblLabel.width + this._nLabelPadding * 2);
      }
   }
   function init()
   {
      super.init(false,ank.gapi.controls.Button.CLASS_NAME);
   }
   function createChildren()
   {
      super.createChildren();
      this.drawBackgrounds();
      this.selected = this._bSelected && this._bToggle;
      this.attachMovie("Label","_lblLabel",30,{styleName:this.getStyle().labelupstyle});
      this._lblLabel.addEventListener("change",this);
      if(this._sLabel == undefined)
      {
         this._sLabel = "Label";
      }
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      this.setLabelStyle();
      this.displayLabel();
      this._mcUp.setStyleColor(_loc2_,"color");
      this._mcDown.setStyleColor(_loc2_,"downcolor");
   }
   function size()
   {
      super.size();
      this.arrange();
   }
   function arrange()
   {
      var _loc2_ = this._mcUp;
      var _loc3_ = this._mcDown;
      _loc2_.setSize(this.__width,this.__height,true);
      _loc3_.setSize(this.__width,this.__height,true);
      this.displayLabel();
      this.displayIcon();
   }
   function setEnabled()
   {
      if(!this._bEnabled)
      {
         this.setMovieClipTransform(this,this.getStyle().disabledtransform);
      }
      else
      {
         this.setMovieClipTransform(this,{ra:100,rb:0,ga:100,gb:0,ba:100,bb:0});
      }
   }
   function drawBackgrounds()
   {
      if(this._sBackgroundDown != "none")
      {
         this.attachMovie(this._sBackgroundDown,"_mcDown",10);
      }
      if(this._sBackgroundUp != "none")
      {
         this.attachMovie(this._sBackgroundUp,"_mcUp",20);
      }
   }
   function displayIcon()
   {
      if(this._mcIcon != undefined)
      {
         this._mcIcon.removeMovieClip();
      }
      if(this._sIcon.length == 0)
      {
         return undefined;
      }
      this.attachMovie(this._sIcon,"_mcIcon",40);
      var _loc2_ = this._mcIcon.getBounds(this);
      this._mcIcon._x = (this.__width - this._mcIcon._width) / 2 - _loc2_.xMin;
      this._mcIcon._y = (this.__height - this._mcIcon._height) / 2 - _loc2_.yMin;
   }
   function setLabelStyle(§\x16\x13§)
   {
      if(this._bSelected)
      {
         this._lblLabel.styleName = this.getStyle().labeldownstyle;
      }
      else if(_loc2_ == true && this.getStyle().labeloverstyle != undefined)
      {
         this._lblLabel.styleName = this.getStyle().labeloverstyle;
      }
      else
      {
         this._lblLabel.styleName = this.getStyle().labelupstyle;
      }
   }
   function displayLabel()
   {
      this._lblLabel.text = this._sLabel;
      if(this._bInitialized)
      {
         this.placeLabel();
      }
   }
   function placeLabel()
   {
      this._lblLabel.setSize(this.__width - 2 * this._nLabelPadding,this._lblLabel.textHeight + 4);
      if(this._sLabel.length == 0)
      {
         this._lblLabel._visible = false;
      }
      else
      {
         this._lblLabel._visible = true;
         this._lblLabel._x = (this.__width - this._lblLabel.width) / 2;
         this._lblLabel._y = (this.__height - this._lblLabel.textHeight) / 2 - 4;
      }
   }
   function change(§\x1e\x19\x0e§)
   {
      this.placeLabel();
   }
   function onPress()
   {
      if(!this.selected && !this._bToggle)
      {
         this.selected = true;
      }
      else if(this._bToggle && !this.selected)
      {
         this._mcUp._visible = false;
         this._mcDown._visible = true;
      }
   }
   function onRelease()
   {
      if(this._bRadio)
      {
         this.selected = true;
      }
      else if(this._bToggle)
      {
         this.selected = !this.selected;
      }
      else
      {
         this.selected = false;
      }
      this.dispatchEvent({type:"click"});
   }
   function onReleaseOutside()
   {
      if(this._bToggle)
      {
         if(!this.selected)
         {
            this._mcUp._visible = true;
            this._mcDown._visible = false;
         }
      }
      else
      {
         this.selected = false;
      }
      this.onRollOut();
   }
   function onRollOver()
   {
      this.setLabelStyle(true);
      this.dispatchEvent({type:"over",target:this});
   }
   function onRollOut()
   {
      this.setLabelStyle(false);
      this.dispatchEvent({type:"out",target:this});
   }
}
