class dofus.§\r\x14§.gapi.ui.BigStoreSearchFullSoul extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oParent;
   var _btnClose;
   var _btnClose2;
   var _btnView;
   var _winBackground;
   var _lblSearch;
   var _tiSearch;
   static var CLASS_NAME = "BigStoreSearchFullSoul";
   var _sDefaultText = "";
   function BigStoreSearchFullSoul()
   {
      super();
   }
   function set oParent(§\x1e\x1a\x10§)
   {
      this._oParent = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.BigStoreSearchFullSoul.CLASS_NAME);
   }
   function callClose()
   {
      this.gapi.hideTooltip();
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnClose2.addEventListener("click",this);
      this._btnView.addEventListener("click",this);
   }
   function initTexts()
   {
      this._winBackground.title = this.api.lang.getText("BIGSTORE_SEARCH");
      this._lblSearch.text = this.api.lang.getText("BIGSTORE_SEARCH_MONSTER_NAME");
      this._btnClose2.label = this.api.lang.getText("CLOSE");
      this._btnView.label = this.api.lang.getText("BIGSTORE_SEARCH_VIEW");
      this._tiSearch.text = "";
      this._tiSearch.setFocus();
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
         case "_btnClose2":
            this.callClose();
            break;
         case "_btnView":
            this._oParent._sFullSoulMonster = this._tiSearch.text;
            this._oParent.modelChanged2();
            this.callClose();
      }
   }
}
