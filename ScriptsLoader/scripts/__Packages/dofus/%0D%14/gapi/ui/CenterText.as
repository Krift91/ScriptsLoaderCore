class dofus.§\r\x14§.gapi.ui.CenterText extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _mcBackground;
   var _prgbGfxLoad;
   var _lblWhite;
   var _lblBlackTL;
   var _lblBlackTR;
   var _lblBlackBL;
   var _lblBlackBR;
   static var CLASS_NAME = "CenterText";
   var _sText = "";
   var _bBackground = false;
   var _nTimer = 0;
   function CenterText()
   {
      super();
   }
   function set text(§\x1e\f\x12§)
   {
      this._sText = _loc2_;
   }
   function set background(§\x1c\x03§)
   {
      this._bBackground = _loc2_;
   }
   function set timer(§\x1e\x1b\x1a§)
   {
      this._nTimer = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.CenterText.CLASS_NAME);
   }
   function createChildren()
   {
      if(this._sText.length == 0)
      {
         return undefined;
      }
      this.addToQueue({object:this,method:this.initText});
      this._mcBackground._visible = false;
      this._prgbGfxLoad._visible = false;
      if(this._nTimer != 0)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"centertext",this,this.unloadThis,this._nTimer);
      }
   }
   function initText()
   {
      this._lblWhite.text = this._lblBlackTL.text = this._lblBlackTR.text = this._lblBlackBL.text = this._lblBlackBR.text = this._sText;
      var _loc2_ = this._lblWhite.textHeight;
      this._mcBackground._visible = this._bBackground;
      this._mcBackground._height = _loc2_ + 2.5 * (this._lblWhite._y - this._mcBackground._y);
   }
   function updateProgressBar(§\x1e\x10\x1b§, §\x06\x12§, §\x02\x17§)
   {
      var _loc5_ = Math.floor(_loc3_ / _loc4_ * 100);
      if(_global.isNaN(_loc5_))
      {
         _loc5_ = 0;
      }
      this._prgbGfxLoad._visible = true;
      this._prgbGfxLoad["\x1e\n\x11"].text = _loc2_;
      this._prgbGfxLoad["\x1e\n\x10"].text = _loc5_ + "%";
      this._prgbGfxLoad["\n\x12"]._width = _loc5_;
   }
}
