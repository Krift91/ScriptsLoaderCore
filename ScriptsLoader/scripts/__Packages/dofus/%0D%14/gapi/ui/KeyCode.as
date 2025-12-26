class dofus.§\r\x14§.gapi.ui.KeyCode extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _winCode;
   var _nChangeType;
   var _nSlotsCount;
   var _mcSlotPlacer;
   var _btnNoCode;
   var _btnValidate;
   var _btnClose;
   var _txtDescription;
   var _mcSlots;
   static var CLASS_NAME = "KeyCode";
   static var CODE_SLOT_WIDTH = 40;
   var _aKeyCode = new Array();
   var _nCurrentSelectedSlot = -1;
   function KeyCode()
   {
      super();
   }
   function set title(sTitle)
   {
      this.addToQueue({object:this,method:function()
      {
         this._winCode.title = sTitle;
      }});
   }
   function set changeType(§\x07\f§)
   {
      this._nChangeType = _loc2_;
   }
   function set slotsCount(§\x1e\x1d\x05§)
   {
      if(_loc2_ > 8)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[slotsCount] doit être au max 8");
         return;
      }
      this._nSlotsCount = _loc2_;
      this._aKeyCode = new Array();
      var _loc3_ = 0;
      while(_loc3_ < _loc2_)
      {
         this._aKeyCode[_loc3_] = "_";
         _loc3_ = _loc3_ + 1;
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.KeyCode.CLASS_NAME);
      this.gapi.getUIComponent("Banner").chatAutoFocus = false;
   }
   function destroy()
   {
      this.gapi.getUIComponent("Banner").chatAutoFocus = true;
   }
   function callClose()
   {
      this.api.network.Key.leave();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTexts});
      this.drawCodeSlots();
      this.selectNextSlot();
      this._mcSlotPlacer._visible = false;
      this._btnNoCode._visible = false;
   }
   function addListeners()
   {
      var _loc2_ = 0;
      while(_loc2_ < 10)
      {
         var _loc3_ = this["_ctrSymbol" + _loc2_];
         _loc3_.addEventListener("drag",this);
         _loc3_.addEventListener("click",this);
         _loc3_.addEventListener("dblClick",this);
         _loc3_.params = {index:_loc2_};
         _loc2_ = _loc2_ + 1;
      }
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
      this.api.kernel.KeyManager.addKeysListener("onKeys",this);
      this._btnValidate.addEventListener("click",this);
      this._btnNoCode.addEventListener("click",this);
      this._btnClose.addEventListener("click",this);
   }
   function initTexts()
   {
      switch(this._nChangeType)
      {
         case 0:
            this._btnValidate.label = this.api.lang.getText("UNLOCK");
            this._txtDescription.text = this.api.lang.getText("UNLOCK_INFOS");
            break;
         case 1:
            this._btnValidate.label = this.api.lang.getText("CHANGE");
            this._btnNoCode.label = this.api.lang.getText("NO_CODE");
            this._txtDescription.text = this.api.lang.getText("LOCK_INFOS");
      }
   }
   function initData()
   {
      var _loc2_ = 0;
      while(_loc2_ < 10)
      {
         this["_ctrSymbol" + _loc2_].contentData = {iconFile:"UI_KeyCodeSymbol" + _loc2_,value:String(_loc2_)};
         _loc2_ = _loc2_ + 1;
      }
      switch(this._nChangeType)
      {
         case 0:
            this._btnNoCode._visible = false;
            break;
         case 1:
            this._btnNoCode._visible = true;
      }
   }
   function drawCodeSlots()
   {
      this._mcSlots.removeMovieClip();
      this.createEmptyMovieClip("_mcSlots",10);
      var _loc2_ = 0;
      while(_loc2_ < this._nSlotsCount)
      {
         var _loc3_ = this._mcSlots.attachMovie("Container","_ctrCode" + _loc2_,_loc2_,{_x:_loc2_ * dofus["\r\x14"].gapi.ui.KeyCode.CODE_SLOT_WIDTH,backgroundRenderer:"UI_KeyCodeContainer",dragAndDrop:true,highlightRenderer:"UI_KeyCodeHighlight",styleName:"none",enabled:true,_width:30,_height:30});
         _loc3_.addEventListener("drop",this);
         _loc3_.addEventListener("drag",this);
         _loc3_.params = {index:_loc2_};
         _loc2_ = _loc2_ + 1;
      }
      this._mcSlots._x = this._mcSlotPlacer._x - this._mcSlots._width;
      this._mcSlots._y = this._mcSlotPlacer._y;
   }
   function selectPreviousSlot()
   {
      var _loc2_ = this._nCurrentSelectedSlot;
      this._nCurrentSelectedSlot--;
      if(this._nCurrentSelectedSlot < 0)
      {
         this._nCurrentSelectedSlot = this._nSlotsCount - 1;
      }
      this.selectSlot(_loc2_,this._nCurrentSelectedSlot);
   }
   function selectNextSlot()
   {
      var _loc2_ = this._nCurrentSelectedSlot;
      this._nCurrentSelectedSlot = ++this._nCurrentSelectedSlot % this._nSlotsCount;
      this.selectSlot(_loc2_,this._nCurrentSelectedSlot);
   }
   function selectSlot(§\x03\x12§, §\x1e\x1d\x06§)
   {
      var _loc4_ = this._mcSlots["_ctrCode" + _loc2_];
      _loc4_.selected = false;
      this._mcSlots["_ctrCode" + _loc3_].selected = true;
   }
   function setKeyInCurrentSlot(§\x03\x1a§)
   {
      var _loc3_ = this._mcSlots["_ctrCode" + this._nCurrentSelectedSlot];
      var _loc4_ = this["_ctrSymbol" + _loc2_];
      _loc3_.contentData = _loc4_.contentData;
      this._aKeyCode[this._nCurrentSelectedSlot] = _loc2_;
      this.selectNextSlot();
   }
   function validate()
   {
      var _loc2_ = true;
      var _loc3_ = 0;
      while(_loc3_ < this._aKeyCode.length)
      {
         if(this._aKeyCode[_loc3_] != "_")
         {
            _loc2_ = false;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.api.network.Key.sendKey(this._nChangeType,!_loc2_ ? this._aKeyCode.join("") : "-");
   }
   function dblClick(§\x1e\x19\x0e§)
   {
      this.click(_loc2_);
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnNoCode":
            this.api.network.Key.sendKey(this._nChangeType,"-");
            break;
         case "_btnValidate":
            this.validate();
            break;
         case "_btnClose":
            this.callClose();
            break;
         default:
            this.setKeyInCurrentSlot(_loc2_.target.params.index);
      }
   }
   function drop(§\x1e\x19\x0e§)
   {
      var _loc3_ = this.gapi.getCursor();
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      this.gapi.removeCursor();
      _loc2_.target.contentData = _loc3_;
      this._aKeyCode[_loc2_.target.params.index] = _loc3_.value;
   }
   function drag(§\x1e\x19\x0e§)
   {
      this.gapi.removeCursor();
      var _loc3_ = _loc2_.target.contentData;
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      this.gapi.setCursor(_loc3_);
      if(_loc2_.target._parent != this)
      {
         _loc2_.target.contentData = undefined;
         this._aKeyCode[_loc2_.target.params.index] = "_";
      }
   }
   function onShortcut(§\x1e\r\x14§)
   {
      if(Selection.getFocus() != null)
      {
         return true;
      }
      if(_loc2_ == "CODE_CLEAR")
      {
         this.setKeyInCurrentSlot();
         return false;
      }
      if(_loc2_ == "CODE_NEXT")
      {
         this.selectNextSlot();
         return false;
      }
      if(_loc2_ == "CODE_PREVIOUS")
      {
         this.selectPreviousSlot();
         return false;
      }
      if(_loc2_ == "ACCEPT_CURRENT_DIALOG")
      {
         this.validate();
         return false;
      }
      return true;
   }
   function onKeys(§\x1e\x11\x03§)
   {
      if(Selection.getFocus() != null)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.charCodeAt(0) - 48;
      if(_loc3_ < 0 || _loc3_ > 9)
      {
         return undefined;
      }
      this.setKeyInCurrentSlot(_loc3_);
   }
}
