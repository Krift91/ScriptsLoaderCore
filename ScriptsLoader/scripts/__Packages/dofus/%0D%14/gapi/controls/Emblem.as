class dofus.§\r\x14§.gapi.controls.Emblem extends ank.gapi.core.§\x1e\n\f§
{
   var _sBackFile;
   var _nBackColor;
   var _sUpFile;
   var _nUpColor;
   var _ldrEmblemBack;
   var _ldrEmblemUp;
   var _ldrEmblemShadow;
   static var CLASS_NAME = "Emblem";
   var _bShadow = false;
   function Emblem()
   {
      super();
   }
   function set shadow(§\x15\x11§)
   {
      this._bShadow = _loc2_;
   }
   function get shadow()
   {
      return this._bShadow;
   }
   function set backID(§\b\t§)
   {
      if(_loc2_ < 1 || _loc2_ > dofus.Constants.EMBLEM_BACKS_COUNT)
      {
         _loc2_ = 1;
      }
      this._sBackFile = dofus.Constants.EMBLEMS_BACK_PATH + _loc2_ + ".swf";
      if(this.initialized)
      {
         this.layoutBack();
      }
   }
   function set backColor(§\b\r§)
   {
      this._nBackColor = _loc2_;
      if(this.initialized)
      {
         this.layoutBack();
      }
   }
   function set upID(§\x1e\x1b\x0b§)
   {
      if(_loc2_ < 1 || _loc2_ > dofus.Constants.EMBLEM_UPS_COUNT)
      {
         _loc2_ = 1;
      }
      this._sUpFile = dofus.Constants.EMBLEMS_UP_PATH + _loc2_ + ".swf";
      if(this.initialized)
      {
         this.layoutUp();
      }
   }
   function set upColor(§\x1e\x1b\x0e§)
   {
      this._nUpColor = _loc2_;
      if(this.initialized)
      {
         this.layoutUp();
      }
   }
   function set data(§\x1e\x19\x15§)
   {
      this._sBackFile = dofus.Constants.EMBLEMS_BACK_PATH + _loc2_.backID + ".swf";
      this._nBackColor = _loc2_.backColor;
      this._sUpFile = dofus.Constants.EMBLEMS_UP_PATH + _loc2_.upID + ".swf";
      this._nUpColor = _loc2_.upColor;
      if(this.initialized)
      {
         this.layoutBack();
         this.layoutUp();
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.Emblem.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.layoutContent});
   }
   function initScale()
   {
   }
   function addListeners()
   {
      this._ldrEmblemBack.addEventListener("initialization",this);
      this._ldrEmblemUp.addEventListener("initialization",this);
   }
   function layoutContent()
   {
      if(this._sBackFile != undefined)
      {
         if(this._bShadow)
         {
            this._ldrEmblemShadow.contentPath = this._sBackFile;
            var _loc2_ = new Color(this._ldrEmblemShadow);
            _loc2_.setRGB(16777215);
         }
         this._ldrEmblemShadow._visible = this._bShadow;
         this.layoutBack();
         this.layoutUp();
      }
   }
   function layoutBack()
   {
      if(this._ldrEmblemBack.contentPath == this._sBackFile)
      {
         this.applyBackColor();
      }
      else
      {
         this._ldrEmblemBack.contentPath = this._sBackFile;
      }
   }
   function layoutUp()
   {
      if(this._ldrEmblemUp.contentPath == this._sUpFile)
      {
         this.applyUpColor();
      }
      else
      {
         this._ldrEmblemUp.contentPath = this._sUpFile;
      }
   }
   function applyBackColor()
   {
      this.setMovieClipColor(this._ldrEmblemBack.content.back,this._nBackColor);
   }
   function applyUpColor()
   {
      this.setMovieClipColor(this._ldrEmblemUp.content,this._nUpColor);
   }
   function initialization(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target;
      switch(_loc3_._name)
      {
         case "_ldrEmblemBack":
            this.applyBackColor();
            break;
         case "_ldrEmblemUp":
            this.applyUpColor();
      }
   }
}
