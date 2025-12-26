class dofus.§\r\x14§.gapi.controls.BookPageIndex extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oPage;
   var _lstChapters;
   var _lblIndex;
   var dispatchEvent;
   static var CLASS_NAME = "BookPageIndex";
   function BookPageIndex()
   {
      super();
   }
   function set page(§\x1e\x18\f§)
   {
      this._oPage = _loc2_;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.BookPageIndex.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.updateData});
   }
   function addListeners()
   {
      this._lstChapters.addEventListener("itemSelected",this);
   }
   function initTexts()
   {
      this._lblIndex.text = this.api.lang.getText("TABLE_OF_CONTENTS");
   }
   function updateData()
   {
      this._lstChapters.dataProvider = this._oPage.chapters;
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.row.item[4];
      this.dispatchEvent({type:"chapterChange",pageNum:_loc3_});
   }
}
