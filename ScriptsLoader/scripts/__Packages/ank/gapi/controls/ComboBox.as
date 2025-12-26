class ank.gapi.controls.ComboBox extends ank.gapi.core.§\x1e\n\f§
{
   var _btnOpen;
   var _eaDataProvider;
   var _nSelectedIndex;
   var _mcBack;
   var __width;
   var __height;
   var _lblCombo;
   var _nListWidth;
   var _nListHeight;
   var _nListX;
   var _nListY;
   var _mcComboBoxPopup;
   var _lstCombo;
   var dispatchEvent;
   static var CLASS_NAME = "ComboBox";
   var _bButtonLeft = false;
   var _nRowHeight = 20;
   var _nButtonWidth = 20;
   var _nLabelLeftMargin = 4;
   var _nLabelRightMargin = 4;
   var _nLabelTopMargin = 0;
   var _nLabelBottomMargin = 0;
   var _nListLeftMargin = 4;
   var _nListRightMargin = 4;
   var _nRowCount = 4;
   var _sMcListParent = "_root";
   var _sCellRenderer = "DefaultCellRenderer";
   var _sButtonBackgroundUp = "ButtonComboBoxUp";
   var _sButtonBackgroundDown = "ButtonComboBoxDown";
   var _sButtonIcon = "ComboBoxButtonNormalIcon";
   var _sBackground = "ComboBoxNormal";
   function ComboBox()
   {
      super();
   }
   function set cellRenderer(§\x1e\x14\x06§)
   {
      this._sCellRenderer = _loc2_;
   }
   function get cellRenderer()
   {
      return this._sCellRenderer;
   }
   function set isButtonLeft(§\x1b\x19§)
   {
      this._bButtonLeft = _loc2_;
   }
   function get isButtonLeft()
   {
      return this._bButtonLeft;
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
   function set buttonWidth(§\x07\x1b§)
   {
      this._nButtonWidth = _loc2_;
   }
   function get buttonWidth()
   {
      return this._nButtonWidth;
   }
   function set labelLeftMargin(§\x03\x16§)
   {
      this._nLabelLeftMargin = _loc2_;
   }
   function get labelLeftMargin()
   {
      return this._nLabelLeftMargin;
   }
   function set labelRightMargin(§\x03\x14§)
   {
      this._nLabelRightMargin = _loc2_;
   }
   function get labelRightMargin()
   {
      return this._nLabelRightMargin;
   }
   function set labelTopMargin(§\x03\x13§)
   {
      this._nLabelTopMargin = _loc2_;
   }
   function get labelTopMargin()
   {
      return this._nLabelTopMargin;
   }
   function set labelBottomMargin(§\x03\x17§)
   {
      this._nLabelBottomMargin = _loc2_;
   }
   function get labelBottomMargin()
   {
      return this._nLabelBottomMargin;
   }
   function set listLeftMargin(§\x03\x10§)
   {
      this._nListLeftMargin = _loc2_;
   }
   function get listLeftMargin()
   {
      return this._nListLeftMargin;
   }
   function set listRightMargin(§\x03\x0f§)
   {
      this._nListRightMargin = _loc2_;
   }
   function get listRightMargin()
   {
      return this._nListRightMargin;
   }
   function set rowCount(§\x1e\x1e\x03§)
   {
      this._nRowCount = _loc2_;
   }
   function get rowCount()
   {
      return this._nRowCount;
   }
   function set mcListParent(§\x1e\x10\x04§)
   {
      this._sMcListParent = _loc2_;
   }
   function get mcListParent()
   {
      return this._sMcListParent;
   }
   function set background(§\x1e\x14\x0e§)
   {
      this._sBackground = _loc2_;
   }
   function get background()
   {
      return this._sBackground;
   }
   function set buttonBackgroundUp(§\x1e\x14\b§)
   {
      this._sButtonBackgroundUp = _loc2_;
   }
   function get backgroundUp()
   {
      return this._sButtonBackgroundUp;
   }
   function set buttonBackgroundDown(§\x1e\x14\t§)
   {
      this._sButtonBackgroundDown = _loc2_;
   }
   function get buttonBackgroundDown()
   {
      return this._sButtonBackgroundDown;
   }
   function set buttonIcon(§\x1e\x14\x07§)
   {
      this._sButtonIcon = _loc2_;
      if(this.initialized)
      {
         this._btnOpen.icon = _loc2_;
      }
   }
   function get buttonIcon()
   {
      return this._sButtonIcon;
   }
   function set dataProvider(§\x10\x0b§)
   {
      this._eaDataProvider = _loc2_;
      this._eaDataProvider.addEventListener("modelChanged",this);
      this.modelChanged();
      if(this.initialized)
      {
         this.removeList();
         this.calculateListSize();
      }
   }
   function get dataProvider()
   {
      return this._eaDataProvider;
   }
   function set selectedIndex(§\x1e\x1d\x13§)
   {
      this._nSelectedIndex = _loc2_;
      if(this.initialized)
      {
         this.removeList();
         this.setLabel(this.getSelectedItemText());
      }
   }
   function get selectedIndex()
   {
      return this._nSelectedIndex;
   }
   function get selectedItem()
   {
      return this._eaDataProvider[this._nSelectedIndex];
   }
   function init()
   {
      super.init(false,ank.gapi.controls.ComboBox.CLASS_NAME);
   }
   function createChildren()
   {
      this.attachMovie(this._sBackground,"_mcBack",this.getNextHighestDepth());
      this._mcBack.onRelease = function()
      {
         this._parent.autoOpenCloseList();
      };
      this._mcBack.useHandCursor = false;
      this.attachMovie("Button","_btnOpen",this.getNextHighestDepth(),{toggle:true,icon:this._sButtonIcon,backgroundUp:this._sButtonBackgroundUp,backgroundDown:this._sButtonBackgroundDown});
      this._btnOpen.addEventListener("click",this);
      this.attachMovie("Label","_lblCombo",this.getNextHighestDepth(),{text:""});
      Key.addListener(this);
   }
   function size()
   {
      super.size();
      this.arrange();
   }
   function arrange()
   {
      var _loc2_ = Math.max(this.__width - this._nButtonWidth - this._nLabelLeftMargin - this._nLabelRightMargin,0);
      var _loc3_ = Math.max(this.__height - this._nLabelTopMargin - this._nLabelBottomMargin,0);
      this._lblCombo.setSize(_loc2_,_loc3_);
      this._btnOpen.setSize(this._nButtonWidth,this.__height);
      this._lblCombo._y = this._nLabelTopMargin;
      if(this._bButtonLeft)
      {
         this._lblCombo._x = this._nButtonWidth + this._nLabelLeftMargin;
      }
      else
      {
         this._lblCombo._x = this._nLabelLeftMargin;
         this._btnOpen._x = this.__width - this._nButtonWidth;
      }
      this._mcBack.setSize(this.__width,this.__height,true);
      this.calculateListSize();
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      this._lblCombo.styleName = _loc2_.labelstyle;
      this._btnOpen.styleName = _loc2_.buttonstyle;
      this._mcBack.setStyleColor(_loc2_,"color");
   }
   function setEnabled()
   {
      this._btnOpen.enabled = this._bEnabled;
      if(!this._bEnabled)
      {
         this.setMovieClipTransform(this,this.getStyle().disabledtransform);
      }
      else
      {
         this.setMovieClipTransform(this,{ra:100,rb:0,ga:100,gb:0,ba:100,bb:0,aa:100,ab:0});
      }
   }
   function calculateListSize()
   {
      var _loc2_ = this._eaDataProvider != undefined ? this._eaDataProvider.length : 1;
      var _loc3_ = this._nListLeftMargin;
      var _loc4_ = this.__height;
      this._nListWidth = this.__width - this._nListLeftMargin - this._nListRightMargin - 2;
      this._nListHeight = Math.min(_loc2_,this._nRowCount) * this._nRowHeight + 1;
      var _loc5_ = {x:_loc3_,y:_loc4_};
      this.localToGlobal(_loc5_);
      this._nListX = _loc5_.x;
      this._nListY = _loc5_.y;
   }
   function clearDrawedList()
   {
      this._mcComboBoxPopup.removeMovieClip();
   }
   function drawList()
   {
      if(this._sMcListParent == "_parent")
      {
         var _loc2_ = this._parent;
      }
      else
      {
         var _loc3_ = new ank["\x1e\n\x07"]["\x0e\x1c"](String(this._sMcListParent));
         var _loc4_ = _loc3_.replace("this",String(this));
         _loc2_ = eval(String(_loc4_));
      }
      if(_loc2_ == undefined)
      {
         _loc2_ = this._parent;
      }
      if(_loc2_._mcComboBoxPopup != undefined)
      {
         _loc2_._mcComboBoxPopup.comboBox.removeList();
      }
      this._mcComboBoxPopup = _loc2_.createEmptyMovieClip("_mcComboBoxPopup",_loc2_.getNextHighestDepth());
      this._mcComboBoxPopup.comboBox = this;
      this.drawRoundRect(this._mcComboBoxPopup,this._nListX,this._nListY,this._nListWidth,this._nListHeight,0,this.getStyle().listbordercolor);
      this._mcComboBoxPopup.attachMovie("List","_lstCombo",this._mcComboBoxPopup.getNextHighestDepth(),{styleName:this.getStyle().liststyle,rowHeight:this._nRowHeight,_x:this._nListX + 1,_y:this._nListY,_width:this._nListWidth - 2,_height:this._nListHeight - 1,dataProvider:this._eaDataProvider,selectedIndex:this._nSelectedIndex,cellRenderer:this._sCellRenderer});
      this._lstCombo = this._mcComboBoxPopup._lstCombo;
      this._lstCombo.addEventListener("itemSelected",this);
      this._btnOpen.selected = true;
   }
   function removeList()
   {
      this._mcComboBoxPopup.removeMovieClip();
      this._btnOpen.selected = false;
   }
   function autoOpenCloseList()
   {
      if(!this._bEnabled)
      {
         return undefined;
      }
      if(this._btnOpen.selected)
      {
         this.removeList();
      }
      else
      {
         this.drawList();
      }
   }
   function setLabel(§\x1e\f\x12§)
   {
      this._lblCombo.text = _loc2_ != undefined ? _loc2_ : "";
   }
   function getSelectedItemText()
   {
      var _loc2_ = this.selectedItem;
      if(typeof _loc2_ == "string")
      {
         return String(_loc2_);
      }
      if(_loc2_.label != undefined)
      {
         return _loc2_.label;
      }
      return "";
   }
   function modelChanged()
   {
      this.setLabel(this.getSelectedItemText());
   }
   function onKeyUp()
   {
      this.removeList();
   }
   function click(§\x1e\x19\x0e§)
   {
      if(this._btnOpen.selected)
      {
         this.drawList();
      }
      else
      {
         this.removeList();
      }
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      this._nSelectedIndex = this._lstCombo.selectedIndex;
      this.setLabel(this.getSelectedItemText());
      this.removeList();
      this.dispatchEvent({type:"itemSelected",target:this});
   }
}
