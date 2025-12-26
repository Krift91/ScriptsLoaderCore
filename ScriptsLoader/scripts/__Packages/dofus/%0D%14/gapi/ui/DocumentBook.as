class dofus.§\r\x14§.gapi.ui.DocumentBook extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oDoc;
   var _btnPrevious;
   var _btnNext;
   var _btnAskPageLeft;
   var _btnAskPageRight;
   var _btnClose;
   var _nCurrentLeftPageNum;
   var _mcRightPlacer;
   var _mcLeftPlacer;
   var _lblLeftPageNum;
   var _lblRightPageNum;
   static var CLASS_NAME = "DocumentBook";
   function DocumentBook()
   {
      super();
   }
   function set document(§\x1e\x19\x13§)
   {
      this._oDoc = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.DocumentBook.CLASS_NAME);
   }
   function destroy()
   {
      this.gapi.hideTooltip();
   }
   function callClose()
   {
      this.api.network.Documents.leave();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.setLeftPageNumber,params:[0]});
      this._btnPrevious._visible = false;
      this._btnNext._visible = false;
      this._btnAskPageLeft.enabled = false;
      this._btnAskPageRight.enabled = false;
   }
   function addListeners()
   {
      this._btnPrevious.addEventListener("click",this);
      this._btnPrevious.addEventListener("over",this);
      this._btnPrevious.addEventListener("out",this);
      this._btnNext.addEventListener("click",this);
      this._btnNext.addEventListener("over",this);
      this._btnNext.addEventListener("out",this);
      this._btnClose.addEventListener("click",this);
      this._btnAskPageLeft.addEventListener("click",this);
      this._btnAskPageRight.addEventListener("click",this);
      this._btnAskPageLeft.addEventListener("over",this);
      this._btnAskPageRight.addEventListener("over",this);
      this._btnAskPageLeft.addEventListener("out",this);
      this._btnAskPageRight.addEventListener("out",this);
   }
   function setLeftPageNumber(§\x01\x1a§)
   {
      if(this._oDoc == undefined)
      {
         return undefined;
      }
      this._nCurrentLeftPageNum = _loc2_;
      var _loc3_ = this._oDoc.getPage(_loc2_);
      var _loc4_ = this._oDoc.getPage(_loc2_ + 1);
      this.layoutContent(_loc3_,true);
      this.layoutContent(_loc4_,false);
      this._btnPrevious._visible = _loc2_ > 0;
      this._btnNext._visible = _loc2_ + 2 < this._oDoc.pageCount;
   }
   function layoutContent(§\x1e\x18\f§, §\x18\x02§)
   {
      var _loc4_ = !_loc3_ ? "_mcRightRenderer" : "_mcLeftRenderer";
      var _loc5_ = !_loc3_ ? this._mcRightPlacer : this._mcLeftPlacer;
      this[_loc4_].removeMovieClip();
      switch(_loc2_.type)
      {
         case "title":
            this.attachMovie("BookPageTitle",_loc4_,this.getNextHighestDepth(),{_x:_loc5_._x,_y:_loc5_._y,page:_loc2_});
            break;
         case "index":
            this.attachMovie("BookPageIndex",_loc4_,this.getNextHighestDepth(),{_x:_loc5_._x,_y:_loc5_._y,page:_loc2_});
            this[_loc4_].addEventListener("chapterChange",this);
            break;
         case "text":
            this.attachMovie("BookPageText",_loc4_,this.getNextHighestDepth(),{_x:_loc5_._x,_y:_loc5_._y,page:_loc2_});
            break;
         case "blank":
      }
      if(_loc3_)
      {
         this._lblLeftPageNum.text = _loc2_.num != undefined ? _loc2_.num : "";
         this._btnAskPageLeft.enabled = _loc2_.num != undefined;
      }
      else
      {
         this._lblRightPageNum.text = _loc2_.num != undefined ? _loc2_.num : "";
         this._btnAskPageRight.enabled = _loc2_.num != undefined;
      }
   }
   function askPage(§\x01\x1a§)
   {
      var _loc3_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:_loc2_,max:_loc2_});
      _loc3_.addEventListener("validate",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnPrevious":
            this.setLeftPageNumber(this._nCurrentLeftPageNum - 2);
            break;
         case "_btnNext":
            this.setLeftPageNumber(this._nCurrentLeftPageNum + 2);
            break;
         case "_btnClose":
            this.callClose();
            break;
         case "_btnAskPageLeft":
            this.askPage(1);
            break;
         case "_btnAskPageRight":
            this.askPage(this._oDoc.pageCount - 1);
      }
   }
   function chapterChange(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.pageNum % 2 != 0 ? _loc2_.pageNum - 1 : _loc2_.pageNum;
      this.setLeftPageNumber(_loc3_);
   }
   function validate(§\x1e\x19\x0e§)
   {
      var _loc3_ = Number(_loc2_.value);
      if(_global.isNaN(_loc3_))
      {
         _loc3_ = 1;
      }
      if(_loc3_ < 1)
      {
         _loc3_ = 1;
      }
      if(_loc3_ >= this._oDoc.pageCount)
      {
         _loc3_ = this._oDoc.pageCount - 1;
      }
      var _loc4_ = _loc3_ % 2 != 0 ? _loc3_ - 1 : _loc3_;
      this.setLeftPageNumber(_loc4_);
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnPrevious":
            this.gapi.showTooltip(this.api.lang.getText("PREVIOUS_PAGE"),_loc2_.target,-20);
            break;
         case "_btnNext":
            this.gapi.showTooltip(this.api.lang.getText("NEXT_PAGE"),_loc2_.target,-20);
            break;
         default:
            this.gapi.showTooltip(this.api.lang.getText("CHOOSE_PAGE_NUMBER"),_loc2_.target,-20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
}
