class dofus.§\r\x14§.gapi.ui.HistoryViewerOnCreate extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nBreed;
   var _lblBreedHistory;
   var _lblBreedName;
   var _txtHistoryDescription;
   var _ldrClassBg;
   var _btnClose;
   var _bhClose;
   var _mcWindowBg;
   static var CLASS_NAME = "HistoryViewerOnCreate";
   function HistoryViewerOnCreate()
   {
      super();
   }
   function get breed()
   {
      return this._nBreed;
   }
   function set breed(§\t\x02§)
   {
      this._nBreed = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.HistoryViewerOnCreate.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initText});
      this.addToQueue({object:this,method:this.addListeners});
   }
   function initText()
   {
      this._lblBreedHistory.text = this.api.lang.getText("HISTORY_CLASS_WORD");
      this._lblBreedName.text = this.api.lang.getClassText(this._nBreed).sn;
      this._txtHistoryDescription.text = this.api.lang.getClassText(this._nBreed).d;
      this._ldrClassBg.content._alpha = 50;
      this._ldrClassBg.contentPath = dofus.Constants.BREEDS_BACK_PATH + this._nBreed + ".swf";
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnClose.addEventListener("over",this);
      this._btnClose.addEventListener("out",this);
      this._bhClose.addEventListener("click",this);
      this._mcWindowBg.onRelease = function()
      {
      };
      this._mcWindowBg.useHandCursor = false;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._bhClose:
         case this._btnClose:
            this.unloadThis();
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnClose)
      {
         this.gapi.showTooltip(this.api.lang.getText("CLOSE"),_loc2_.target,-20);
      }
   }
}
