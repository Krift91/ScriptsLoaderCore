var _loc1 = dofus["\r\x14"].gapi.ui.bigstore["\x18\x1d"].prototype;
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   delete this._nSelectedSet;
   if(bUsed)
   {
      this._oItem = oItem;
      var _loc4_ = this._mcList._parent._parent.isThisPriceSelected(oItem.id,1);
      var _loc5_ = this._mcList._parent._parent.isThisPriceSelected(oItem.id,2);
      var _loc6_ = this._mcList._parent._parent.isThisPriceSelected(oItem.id,3);
      if(_loc4_)
      {
         var _loc7_ = this._btnPriceSet1;
      }
      if(_loc5_)
      {
         _loc7_ = this._btnPriceSet2;
      }
      if(_loc6_)
      {
         _loc7_ = this._btnPriceSet3;
      }
      if(_loc4_ || (_loc5_ || _loc6_))
      {
         var _loc8_ = this._btnBuy;
      }
      if(_loc8_ != undefined)
      {
         this._mcList._parent._parent.setButtons(_loc7_,_loc8_);
      }
      this._btnPriceSet1.selected = _loc4_ && !_global.isNaN(oItem.priceSet1);
      this._btnPriceSet2.selected = _loc5_ && !_global.isNaN(oItem.priceSet2);
      this._btnPriceSet3.selected = _loc6_ && !_global.isNaN(oItem.priceSet3);
      if(_loc4_)
      {
         this._nSelectedSet = 1;
      }
      else if(_loc5_)
      {
         this._nSelectedSet = 2;
      }
      else if(_loc6_)
      {
         this._nSelectedSet = 3;
      }
      this._btnBuy.enabled = this._nSelectedSet != undefined;
      this._btnBuy._visible = true;
      this._btnPriceSet1._visible = true;
      this._btnPriceSet2._visible = true;
      this._btnPriceSet3._visible = true;
      this._btnPriceSet1.enabled = !_global.isNaN(oItem.priceSet1);
      this._btnPriceSet2.enabled = !_global.isNaN(oItem.priceSet2);
      this._btnPriceSet3.enabled = !_global.isNaN(oItem.priceSet3);
      this._btnPriceSet1.label = !_global.isNaN(oItem.priceSet1) ? new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.priceSet1).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  " : "-  ";
      this._btnPriceSet2.label = !_global.isNaN(oItem.priceSet2) ? new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.priceSet2).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  " : "-  ";
      this._btnPriceSet3.label = !_global.isNaN(oItem.priceSet3) ? new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.priceSet3).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  " : "-  ";
      this._ldrIcon.contentParams = oItem.item.params;
      this._ldrIcon.contentPath = oItem.item.iconFile;
      if(oItem.item.style == "LEG")
      {
         this._ldrIcon.filters = [new flash.filters.GlowFilter(16764672,1,10,10,1,1,true,false)];
      }
      else if(oItem.item.style == "DIV")
      {
         this._ldrIcon.filters = [new flash.filters.GlowFilter(16737279,1,10,10,1,1,true,false)];
      }
      else if(oItem.item.style == "RARE")
      {
         this._ldrIcon.filters = [new flash.filters.GlowFilter(57087,1,10,10,1,1,true,false)];
      }
      else if(oItem.item.style == "MYTHIQUE")
      {
         this._ldrIcon.filters = [new flash.filters.GlowFilter(16711680,1,10,10,1,1,true,false)];
      }
      else
      {
         this._ldrIcon.filters = [];
      }
   }
   else if(this._ldrIcon.contentPath != undefined)
   {
      this._btnPriceSet1._visible = false;
      this._btnPriceSet2._visible = false;
      this._btnPriceSet3._visible = false;
      this._btnBuy._visible = false;
      this._ldrIcon.contentPath = "";
   }
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
