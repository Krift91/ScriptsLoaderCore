class dofus.§\r\x14§.gapi.controls.§\x16\x19§.BookPageIndexChapterItem extends ank.gapi.core.§\x1e\n\f§
{
   var _lblPageNum;
   var _lblChapter;
   var __width;
   var __height;
   function BookPageIndexChapterItem()
   {
      super();
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._lblPageNum.text = !_loc2_ ? "" : _loc4_[4];
         var _loc5_ = this._lblPageNum.textWidth;
         this._lblChapter.text = !_loc2_ ? "" : _loc4_[0];
         this._lblChapter.setSize(this.__width - _loc5_ - 30,this.__height);
      }
      else if(this._lblPageNum.text != undefined)
      {
         this._lblPageNum.text = "";
         this._lblChapter.text = "";
      }
   }
   function init()
   {
      super.init(false);
   }
   function createChildren()
   {
      this.arrange();
   }
   function size()
   {
      super.size();
      this.addToQueue({object:this,method:this.arrange});
   }
   function arrange()
   {
      this._lblChapter.setSize(this.__width - 50,this.__height);
      this._lblPageNum.setSize(this.__width - 20,this.__height);
   }
}
