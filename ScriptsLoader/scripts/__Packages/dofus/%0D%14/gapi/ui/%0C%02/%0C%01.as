class dofus.§\r\x14§.gapi.ui.§\f\x02§.§\f\x01§ extends ank.gapi.core.§\x1e\n\f§
{
   var _lblItem;
   var _mcCategory;
   var _mcArticle;
   var _bWasArticle;
   function §\f\x01§()
   {
      super();
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._lblItem.text = _loc4_.n;
         var _loc5_ = _loc4_.c == undefined;
         this._mcCategory._visible = _loc5_;
         this._mcArticle._visible = !_loc5_;
         if(!_loc5_ && !this._bWasArticle)
         {
            this._lblItem._x += 10;
            this._mcArticle._x += 10;
            this._bWasArticle = true;
         }
      }
      else if(this._lblItem.text != undefined)
      {
         this._lblItem.text = "";
         this._mcArticle._visible = false;
         this._mcCategory._visible = false;
         if(this._bWasArticle)
         {
            this._lblItem._x -= 10;
            this._mcArticle._x -= 10;
            this._bWasArticle = false;
         }
      }
   }
   function KnownledgeBaseCategoryItem()
   {
      this._mcArticle._visible = false;
      this._mcCategory._visible = false;
   }
   function init()
   {
      super.init(false);
   }
}
