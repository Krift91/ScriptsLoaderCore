var _loc1 = _global.dofus["\r\x14"].gapi.controls["\x0b\x0f"].ListInventoryViewerItem.prototype;

// Cache des paramètres de GlowFilters dans ListInventoryViewerItem
// Réduit blur à 4 et quality à 1 pour meilleures performances
_global.dofus["\r\x14"].gapi.controls["\x0b\x0f"].ListInventoryViewerItem.GLOW_FILTER_PARAMS = {
   Leg: {color: 9930239, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Raro: {color: 6327036, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Div: {color: 16177373, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Mitico: {color: 13073735, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Epic: {color: 16711680, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Supreme: {color: 16776960, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Celestial: {color: 65535, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Astral: {color: 255, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Cosmic: {color: 8388736, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Transcendent: {color: 16777215, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false}
};

// Fonction pour créer un filtre à partir des paramètres cachés
_global.dofus["\r\x14"].gapi.controls["\x0b\x0f"].ListInventoryViewerItem.createGlowFilter = function(style)
{
   var params = _global.dofus["\r\x14"].gapi.controls["\x0b\x0f"].ListInventoryViewerItem.GLOW_FILTER_PARAMS[style];
   if(params == undefined)
   {
      return [];
   }
   return [new flash.filters.GlowFilter(params.color, params.alpha, params.blurX, params.blurY, params.strength, params.quality, params.inner, params.knockout)];
};

_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._lblPrice.text = !!bUsed ? new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.price).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) : "";
      var _loc4_ = this._lblPrice.textWidth;
      this._lblName.text = !!bUsed ? (oItem.Quantity > 1 ? "x" + oItem.Quantity + " " : "") + oItem.name : "";
      this._lblName.setSize(this.__width - _loc4_ - 30,this.__height);
      this._lblName.styleName = oItem.style == "" ? "BrownLeftSmallLabel" : oItem.style + "LeftSmallLabel";
      this._ldrIcon.contentPath = !!bUsed ? oItem.iconFile : "";
      this._ldrIcon.contentParams = oItem.params;

      // Optimisation: ne recréer le filtre que si le style a changé
      if(this._lastFilterStyle != oItem.style)
      {
         this._ldrIcon.filters = _global.dofus["\r\x14"].gapi.controls["\x0b\x0f"].ListInventoryViewerItem.createGlowFilter(oItem.style);
         this._lastFilterStyle = oItem.style;
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
