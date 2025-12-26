var _loc1 = ank.gapi.controls.Container.prototype;

// Cache des paramètres de GlowFilters - stocke les paramètres au lieu des objets
// Réduit blur à 4 et quality à 1 pour meilleures performances
ank.gapi.controls.Container.GLOW_FILTER_PARAMS = {
   Leg: {color: 7454686, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Div: {color: 5278164, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Raro: {color: 1328035, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Mitico: {color: 13919846, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Epic: {color: 14233134, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Celestial: {color: 14251310, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Cosmic: {color: 14920489, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Astral: {color: 13936388, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Supreme: {color: 16765184, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Transcendant: {color: 4539197, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false}
};

// Flag global pour activer/désactiver la création de filtres
ank.gapi.controls.Container._filtersEnabled = true;

// Fonction pour créer un filtre à partir des paramètres cachés
ank.gapi.controls.Container.createGlowFilter = function(style)
{
   // Ne pas créer de filtre si désactivé globalement
   if(!ank.gapi.controls.Container._filtersEnabled)
   {
      return [];
   }

   var params = ank.gapi.controls.Container.GLOW_FILTER_PARAMS[style];
   if(params == undefined)
   {
      return [];
   }

   return [new flash.filters.GlowFilter(params.color, params.alpha, params.blurX, params.blurY, params.strength, params.quality, params.inner, params.knockout)];
};

// Fonction pour désactiver temporairement les filtres
ank.gapi.controls.Container.disableFilters = function()
{
   ank.gapi.controls.Container._filtersEnabled = false;
};

// Fonction pour réactiver les filtres
ank.gapi.controls.Container.enableFilters = function()
{
   ank.gapi.controls.Container._filtersEnabled = true;
};

_loc1.__get__contentLoaded = function()
{
   return this._ldrContent.loaded || this._ldrMonster.loaded;
};
_loc1.__get__content = function()
{
   return this._ldrContent.content || this._ldrMonster.content;
};
_loc1.__get__holder = function()
{
   return this._ldrContent.holder || this._ldrMonster.holder;
};
_loc1.__get__centerContent = function()
{
   return this._bCenterContent;
};
_loc1.__set__centerContent = function(bCenterContent)
{
   this._bCenterContent = bCenterContent;
   return this._bCenterContent;
};
_loc1.__get__labelStyle = function()
{
   return this.getStyle().labelstyle == "UseItemStyleLabel" ? this._sLabelStyle : this.getStyle().labelstyle;
};
_loc1.__set__labelStyle = function(sLabelStyle)
{
   this._sLabelStyle = sLabelStyle;
};
_loc1.__set__contentPath = function(_loc2_)
{
   this._ldrContent.contentPath = _loc2_;
};
_loc1.__get__contentPath = function()
{
   if(dofus.datacenter["\f\f"].isFullSoul(_global.API.lang.getItemUnicText(this._oContentData.unicID).t) && this._oContentData.isSoulMobeable)
   {
      return this._ldrMonster.contentPath;
   }
   return this._ldrContent.contentPath;
};
_loc1.__get__showLabel = function()
{
   return this._bShowLabel;
};
_loc1.__set__showLabel = function(_loc2_)
{
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   this._bShowLabel = _loc2_;
   if(_loc2_)
   {
      if(this._sLabel != undefined)
      {
         if(this._lblText == undefined)
         {
            this.attachMovie("Label","_lblText",30,{_width:this.__width,_height:this.__height,styleName:this.labelStyle});
         }
         this.addToQueue({object:this,method:this.setLabel,params:[this._sLabel]});
      }
   }
   else
   {
      this._lblText.removeMovieClip();
      this._mcLabelBackground.clear();
   }
};
_loc1.draw = function()
{
   var _loc2_ = this.getStyle();
   this._mcBg.styleName = _loc2_.backgroundstyle;
   this._lblText.styleName = this.labelStyle;
};
_loc1.__set__label = function(_loc2_)
{
   this._sLabel = _loc2_;
   if(this._bShowLabel)
   {
      if(this._lblText == undefined)
      {
         this.attachMovie("Label","_lblText",30,{_width:this.__width,_height:this.__height,styleName:this.labelStyle});
      }
      this.addToQueue({object:this,method:this.setLabel,params:[_loc2_]});
   }
};
_loc1.__get__label = function()
{
   return this._sLabel;
};
_loc1.setLabel = function(_loc2_)
{
   if(this._bShowLabel)
   {
      this._lblText.text = _loc2_;
      this._lblText.styleName = this.labelStyle;
      var _loc2_ = Math.min(this._lblText.textWidth + 2,this.__width - 4);
      var _loc3_ = this._lblText.textHeight;
      this._mcLabelBackground.clear();
      if(_loc2_ > 2 && _loc3_ != 0)
      {
         this.drawRoundRect(this._mcLabelBackground,2,2,_loc2_,_loc3_ + 2,0,0,50);
      }
   }
   else
   {
      this._lblText.removeMovieClip();
      this._mcLabelBackground.clear();
   }
};
_loc1.__set__contentData = function(oContentData)
{
   this._oContentData = oContentData;
   if(this._oContentData.forceReloadOnContainer != undefined)
   {
      this._ldrContent.forceReload = this._oContentData.forceReloadOnContainer;
   }
   if(this._oContentData.params != undefined)
   {
      this._ldrContent.contentParams = this._oContentData.params;
   }
   if(this._oContentData.iconFile != undefined)
   {
      this.contentPath = this._oContentData.iconFile;
      // Optimisation: vérifier si le style a changé avant de recréer le filtre
      if(this._lastFilterStyle != this._oContentData.style)
      {
         // Si le style n'est pas vide, appliquer le filtre
         if(this._oContentData.style != "" && this._oContentData.style != undefined)
         {
            this._ldrContent.holder.filters = ank.gapi.controls.Container.createGlowFilter(this._oContentData.style);
         }
         else
         {
            this._ldrContent.holder.filters = [];
         }
         this._lastFilterStyle = this._oContentData.style;
      }
   }
   else
   {
      this.contentPath = "";
   }
   if(this._oContentData.label != undefined)
   {
      if(this.label != this._oContentData.label)
      {
         this.label = this._oContentData.label;
      }
   }
   else
   {
      this.label = "";
   }
};
_loc1.__set__margin = function(_loc2_)
{
   _loc2_ = Number(_loc2_);
   if(_global.isNaN(_loc2_))
   {
      return undefined;
   }
   this._nMargin = _loc2_;
   if(this.initialized)
   {
      this._ldrContent.move(this._nMargin,this._nMargin);
      this._ldrMonster.move(this._nMargin,this._nMargin);
   }
};
_loc1.arrange = function()
{
   this._mcInteraction._width = this.__width;
   this._mcInteraction._height = this.__height;
   this._ldrContent.setSize(this.__width - this._nMargin * 2,this.__height - this._nMargin * 2);
   this._ldrMonster.setSize(this.__width - this._nMargin * 2,this.__height - this._nMargin * 2);
   this._mcBg.setSize(this.__width,this.__height);
   this._mcHighlight.setSize(this.__width,this.__height);
   this._lblText.setSize(this.__width,this.__height);
};
_loc1.forceNextLoad = function()
{
   this._ldrContent.forceNextLoad();
   this._ldrMonster.forceNextLoad();
};
_loc1.__get__scaleContent = function()
{
   return this._bScaleContent;
};
_loc1.__set__scaleContent = function(bScaleContent)
{
   this._bScaleContent = bScaleContent;
   return this._bScaleContent;
};
_loc1.__get__contentDataMonster = function()
{
   return this._oContentData;
};
_loc1.__set__contentDataMonster = function(_loc2_)
{
   this._oContentData = _loc2_;
   this._ldrContent._visible = false;
   this._ldrMonster._visible = true;
   if(this._oContentData.params != undefined)
   {
      this._ldrMonster.contentParams = this._oContentData.params;
   }
   if(_loc2_.iconFile != undefined)
   {
      this._ldrMonster.contentPath = _loc2_.iconFile;
   }
   else
   {
      this._ldrMonster.contentPath = "";
   }
   if(_loc2_.label != undefined)
   {
      if(this.label != _loc2_.label)
      {
         this.label = _loc2_.label;
      }
   }
   else
   {
      this.label = "";
   }
};
_loc1.initialization = function(_loc2_)
{
   var mc = _loc2_.clip;
   mc._visible = false;
   mc.attachMovie("staticR","mcAnim",10);
   var MonsterView = this;
   var nCompteur = 0;
   mc.onEnterFrame = function()
   {
      nCompteur++;
      if(nCompteur >= 3)
      {
         MonsterView.prepareSprite(this);
         delete mc.onEnterFrame;
      }
   };
};
_loc1.prepareSprite = function(_loc2_)
{
   if(_loc2_._width > _loc2_._height)
   {
      _loc2_._xscale = _loc2_._yscale = 2500 / _loc2_._width;
   }
   else
   {
      _loc2_._yscale = _loc2_._xscale = 2500 / _loc2_._height;
   }
   _loc2_._x = 15;
   _loc2_._y = 25;
   _loc2_._visible = true;
};
_loc1.createChildren = function()
{
   if(this._bScaleContent == undefined)
   {
      this._bScalContent = true;
   }
   if(this._bCenterContent == undefined)
   {
      this._bCenterContent = false;
   }
   this.createEmptyMovieClip("_mcInteraction",0);
   this.drawRoundRect(this._mcInteraction,0,0,1,1,0,0,0);
   this._mcInteraction.trackAsMenu = true;
   this.attachMovie("Loader","_ldrContent",20,{scaleContent:this._bScaleContent,centerContent:this._bCenterContent});
   this._ldrContent.addEventListener("complete",this);
   this._ldrContent.move(this._nMargin,this._nMargin);
   this.createEmptyMovieClip("_mcLabelBackground",29);
   this.attachMovie("Loader","_ldrMonster",40,{scaleContent:false,centerContent:this._bCenterContent});
   this._ldrContent.addEventListener("complete",this);
   this._ldrMonster.addEventListener("complete",this);
   this._ldrMonster.move(this._nMargin,this._nMargin);
   this._ldrMonster.addEventListener("initialization",this);
};
_loc1.addProperty("centerContent",_loc1.__get__centerContent,_loc1.__set__centerContent);
_loc1.addProperty("labelStyle",_loc1.__get__labelStyle,_loc1.__set__labelStyle);
_loc1.addProperty("scaleContent",_loc1.__get__scaleContent,_loc1.__set__scaleContent);
_loc1.addProperty("contentDataMonster",_loc1.__get__contentDataMonster,_loc1.__set__contentDataMonster);
_loc1.addProperty("contentData",_loc1.__get__contentData,_loc1.__set__contentData);
_loc1.addProperty("contentPath",_loc1.__get__contentPath,_loc1.__set__contentPath);
_loc1.addProperty("margin",_loc1.__get__margin,_loc1.__set__margin);
_loc1.addProperty("contentLoaded",_loc1.__get__contentLoaded,_loc1.__set__contentLoaded);
_loc1.addProperty("content",_loc1.__get_content,_loc1.__set__content);
_loc1.addProperty("holder",_loc1.__get__holder,_loc1.__set__holder);
_loc1.addProperty("showLabel",_loc1.__get__showLabel,_loc1.__set__showLabel);
