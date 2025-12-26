class dofus.§\r\x14§.gapi.ui.PopupQuantity extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _winBackground;
   var _bgHidder;
   var dispatchEvent;
   var _oParams;
   static var CLASS_NAME = "PopupQuantity";
   var _nValue = 0;
   var _bUseAllStage = false;
   var _nMax = 1;
   var _nMin = 1;
   function PopupQuantity()
   {
      super();
   }
   function set value(§\x1e\x1b\n§)
   {
      this._nValue = _loc2_;
   }
   function set max(§\x03\x07§)
   {
      this._nMax = _loc2_;
   }
   function set min(§\x02\x12§)
   {
      this._nMin = _loc2_;
   }
   function set useAllStage(§\x14\x06§)
   {
      this._bUseAllStage = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.PopupQuantity.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._winBackground.addEventListener("complete",this);
      this._bgHidder.addEventListener("click",this);
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   }
   function initWindowContent()
   {
      var _loc2_ = this._winBackground.content;
      _loc2_._btnOk.addEventListener("click",this);
      _loc2_._btnMax.addEventListener("click",this);
      _loc2_._btnMin.addEventListener("click",this);
      _loc2_._btnMax.label = this.api.lang.getText("MAX_WORD");
      _loc2_._btnMin.label = this.api.lang.getText("MIN_WORD");
      _loc2_._tiInput.restrict = "0-9";
      _loc2_._tiInput.text = this._nValue;
      _loc2_._tiInput.setFocus();
   }
   function placeWindow()
   {
      var _loc2_ = this._xmouse - this._winBackground.width;
      var _loc3_ = this._ymouse - this._winBackground._height;
      var _loc4_ = !this._bUseAllStage ? this.gapi.screenWidth : Stage.width;
      var _loc5_ = !this._bUseAllStage ? this.gapi.screenHeight : Stage.height;
      if(_loc2_ < 0)
      {
         _loc2_ = 0;
      }
      if(_loc3_ < 0)
      {
         _loc3_ = 0;
      }
      if(_loc2_ > _loc4_ - this._winBackground.width)
      {
         _loc2_ = _loc4_ - this._winBackground.width;
      }
      if(_loc3_ > _loc5_ - this._winBackground.height)
      {
         _loc3_ = _loc5_ - this._winBackground.height;
      }
      this._winBackground._x = _loc2_;
      this._winBackground._y = _loc3_;
   }
   function validate()
   {
      this.api.kernel.KeyManager.removeShortcutsListener(this);
      this.dispatchEvent({type:"validate",value:_global.parseInt(this._winBackground.content._tiInput.text,10),params:this._oParams});
   }
   function complete(§\x1e\x19\x0e§)
   {
      this.placeWindow();
      this.addToQueue({object:this,method:this.initWindowContent});
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnOk":
            this.validate();
            break;
         case "_btnMax":
            if(this._winBackground.content._tiInput.text == this._nMax)
            {
               this.validate();
               break;
            }
            this._winBackground.content._tiInput.text = this._nMax;
            this._winBackground.content._tiInput.setFocus();
            return undefined;
         case "_bgHidder":
         default:
            break;
         case "_btnMin":
            this._winBackground.content._tiInput.text = this._nMin;
            this._winBackground.content._tiInput.setFocus();
            return undefined;
      }
      this.unloadThis();
   }
   function onShortcut(§\x1e\r\x14§)
   {
      if(_loc2_ == "ACCEPT_CURRENT_DIALOG")
      {
         this.validate();
         this.unloadThis();
         return false;
      }
      return true;
   }
}
