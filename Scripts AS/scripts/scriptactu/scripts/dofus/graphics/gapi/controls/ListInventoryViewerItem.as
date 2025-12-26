var _loc1 = _global.dofus["\r\x14"].gapi.controls["\x0b\x0f"].ListInventoryViewerItem.prototype;
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._lblPrice.text = !bUsed ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.price).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      var _loc4_ = this._lblPrice.textWidth;
      this._lblName.text = !bUsed ? "" : (oItem.Quantity <= 1 ? "" : "x" + oItem.Quantity + " ") + oItem.name;
      this._lblName.setSize(this.__width - _loc4_ - 30,this.__height);
      this._lblName.styleName = oItem.style != "" ? oItem.style + "LeftSmallLabel" : "BrownLeftSmallLabel";
      this._ldrIcon.contentPath = !bUsed ? "" : oItem.iconFile;
      this._ldrIcon.contentParams = oItem.params;
      if(oItem.style == "FABULEUX")
      {
         this._ldrIcon.filters = [new flash.filters.GlowFilter(16766720,1,10,10,1,1,true,false)];
      }
      else if(oItem.style == "ULTIME")
      {
         this._ldrIcon.filters = [new flash.filters.GlowFilter(13369344,1,10,10,1,1,true,false)];
      }
      else if(oItem.style == "UNIQUE")
      {
         this._ldrIcon.filters = [new flash.filters.GlowFilter(10813439,1,10,10,1,1,true,false)];
      }
      else if(oItem.style == "MYTHIQUE")
      {
         this._ldrIcon.filters = [new flash.filters.GlowFilter(16711680,1,10,10,1,1,true,false)];
      }
      else
      {
         this._ldrIcon.filters = [];
      }
   }
   else if(this._lblPrice.text != undefined)
   {
      this._lblPrice.text = "";
      this._lblName.text = "";
      this._ldrIcon.contentPath = "";
   }
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
