var _loc1 = dofus["\r\x14"].gapi.controls.ItemViewer.prototype;

// Cache des paramètres de GlowFilters dans ItemViewer
// Réduit blur à 4 et quality à 1 pour meilleures performances
dofus["\r\x14"].gapi.controls.ItemViewer.GLOW_FILTER_PARAMS = {
   Leg: {color: 7454686, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Div: {color: 5278164, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Raro: {color: 1328035, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Mitico: {color: 13919846, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Epic: {color: 14233134, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Celestial: {color: 58879, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Cosmic: {color: 14920489, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Astral: {color: 9142015, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Supreme: {color: 14251310, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false},
   Transcendant: {color: 4539197, alpha: 1, blurX: 4, blurY: 4, strength: 2, quality: 1, inner: true, knockout: false}
};

// Fonction pour créer un filtre à partir des paramètres cachés
dofus["\r\x14"].gapi.controls.ItemViewer.createGlowFilter = function(style)
{
   var params = dofus["\r\x14"].gapi.controls.ItemViewer.GLOW_FILTER_PARAMS[style];
   if(params == undefined)
   {
      return [];
   }
   return [new flash.filters.GlowFilter(params.color, params.alpha, params.blurX, params.blurY, params.strength, params.quality, params.inner, params.knockout)];
};

_loc1.__set__displayPrice = function(bDisplayPrice)
{
   this._bPrice = bDisplayPrice;
   this._lblPrice._visible = bDisplayPrice;
   this._ldrPago._visible = bDisplayPrice;
};
_loc1.__get__displayPrice = function()
{
   return this._bPrice;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this._btnTabCharacteristics._visible = false;
   this._pbEthereal._visible = false;
   this._ldrTwoHanded._visible = false;
   if(dofus.Constants.DEBUG || _global.CONFIG.skipLanguageVerification)
   {
      this._btnAgregar._visible = true;
      this._btnModificar._visible = true;
   }
   else
   {
      this._btnAgregar._visible = false;
      this._btnModificar._visible = false;
      this._btnEscudo._visible = false;
   }
};
_loc1.addListeners = function()
{
   this._btnAction.addEventListener("click",this);
   this._btnAction.addEventListener("over",this);
   this._btnAction.addEventListener("out",this);
   this._btnAgregar.addEventListener("click",this);
   this._btnUnlink.addEventListener("click",this);
   this._btnModificar.addEventListener("click",this);
   this._btnTabEffects.addEventListener("click",this);
   this._btnTabCharacteristics.addEventListener("click",this);
   this._btnTabConditions.addEventListener("click",this);
   this._pbEthereal.addEventListener("over",this);
   this._pbEthereal.addEventListener("out",this);
   this._btnEscudo.addEventListener("click",this);
   this._cgInfos.addEventListener("overItem",this);
   this._cgInfos.addEventListener("outItem",this);
   this._cgInfos.addEventListener("scroll",this);
   this._ldrTwoHanded.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._ldrTwoHanded.onRollOut = function()
   {
      this._parent.out({target:this});
   };
   this._ldrPago.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._ldrPago.onRollOut = function()
   {
      this._parent.out({target:this});
   };
};
_loc1.getItemEffects = function(bBaseEffects)
{
   var _loc10_ = this._oItem.unicID == 10207 && this._sCurrentTab == "Effects";
   this._lstInfos._visible = !_loc10_;
   this._cgInfos._visible = _loc10_;
   if(this._bShowBaseEffects)
   {
      if(this._sCurrentTab == "Effects")
      {
         var _loc11_ = this.api.lang.getItemStats(this._oItem.unicID);
         if(_loc11_ != undefined)
         {
            var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
            var _loc8_ = new Array();
            var _loc6_ = _loc11_.split(",");
            var _loc4_ = 0;
            while(_loc4_ < _loc6_.length)
            {
               var _loc3_ = _loc6_[_loc4_].split("#");
               _loc3_[0] = _global.parseInt(_loc3_[0],16);
               _loc3_[1] = _loc3_[1] == "0" ? undefined : _global.parseInt(_loc3_[1],16);
               _loc3_[2] = _loc3_[2] == "0" ? undefined : _global.parseInt(_loc3_[2],16);
               _loc3_[3] = _loc3_[3] == "0" ? undefined : _global.parseInt(_loc3_[3],16);
               _loc8_.push(_loc3_);
               _loc4_ += 1;
            }
            var _loc12_ = dofus.datacenter["\f\f"].getBaseItemEffects(this._oItem.unicID);
            var _loc5_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc8_,undefined,_loc12_);
            for(var _loc9_ in _loc5_)
            {
               if(_loc5_[_loc9_].description.length > 0)
               {
                  _loc7_.push(_loc5_[_loc9_]);
               }
            }
            _loc7_.reverse();
            this._lstInfos.dataProvider = _loc7_;
         }
      }
      else
      {
         this.updateCurrentTabInformations();
      }
   }
   else
   {
      this.updateCurrentTabInformations();
   }
};
_loc1.updateCurrentTabInformations = function()
{
   var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   switch(this._sCurrentTab)
   {
      case "Effects":
         if(this._oItem.unicID == 10207)
         {
            for(var _loc5_ in this._oItem.effects)
            {
               var _loc4_ = this._oItem.effects[_loc5_];
               var _loc2_ = new dofus.datacenter["\f\f"](undefined,_loc4_.param3);
               _loc2_.isEmptyKey = _loc4_.param4 == 0;
               _loc3_.push(_loc2_);
            }
         }
         else
         {
            for(_loc5_ in this._oItem.effects)
            {
               if(this._oItem.effects[_loc5_].description.length > 0)
               {
                  _loc3_.push(this._oItem.effects[_loc5_]);
               }
            }
         }
         break;
      case "Characteristics":
         for(_loc5_ in this._oItem.characteristics)
         {
            if(this._oItem.characteristics[_loc5_].length > 0)
            {
               _loc3_.push(this._oItem.characteristics[_loc5_]);
            }
         }
         break;
      case "Conditions":
         _loc2_ = this._oItem.conditions;
         for(_loc5_ in _loc2_)
         {
            if(_loc2_[_loc5_].length > 0)
            {
               _loc3_.push(_loc2_[_loc5_]);
            }
         }
   }
   if(this._oItem.unicID == 10207 && this._sCurrentTab == "Effects")
   {
      var _loc6_ = function(_loc2_, _loc3_)
      {
         return _loc2_.level - _loc3_.level;
      };
      _loc3_.sort(_loc6_);
      this._cgInfos.dataProvider = _loc3_;
      this.addToQueue({object:this,method:this.updateKeyGrid});
   }
   else
   {
      _loc3_.reverse();
      this._lstInfos.dataProvider = _loc3_;
   }
};
_loc1.setCurrentTab = function(_loc2_)
{
   var _loc2_ = this["_btnTab" + this._sCurrentTab];
   var _loc3_ = this["_btnTab" + _loc2_];
   _loc2_.selected = true;
   _loc2_.enabled = true;
   _loc3_.selected = false;
   if(_loc2_ != "Effects")
   {
      _loc3_.enabled = false;
   }
   this._sCurrentTab = _loc2_;
   this.getItemEffects(this._bShowBaseEffects);
};
_loc1.showItemData = function(oItem)
{
   if(oItem != undefined)
   {
      // Optimisation: ne recréer le filtre que si le style a changé
      if(this._lastFilterStyle != oItem.style)
      {
         this._ldrIcon.filters = dofus["\r\x14"].gapi.controls.ItemViewer.createGlowFilter(oItem.style);
         this._lastFilterStyle = oItem.style;
      }

      // Application du suffixe de nom selon le style
      var nameSuffix = "";
      if(oItem.style == "Leg")
      {
         nameSuffix = " I";
      }
      else if(oItem.style == "Div")
      {
         nameSuffix = " II";
      }
      else if(oItem.style == "Raro")
      {
         nameSuffix = " III";
      }
      else if(oItem.style == "Mitico")
      {
         nameSuffix = " IV";
      }
      else if(oItem.style == "Epic")
      {
         nameSuffix = " V";
      }
      else if(oItem.style == "Celestial")
      {
         nameSuffix = " VI";
      }
      else if(oItem.style == "Cosmic")
      {
         nameSuffix = " VII";
      }
      else if(oItem.style == "Astral")
      {
         nameSuffix = " VIII";
      }
      else if(oItem.style == "Supreme")
      {
         nameSuffix = " IX";
      }
      else if(oItem.style == "Transcendant")
      {
         nameSuffix = " X";
      }
      this._lblName.text = oItem.name + nameSuffix;
      if(dofus.Constants.DEBUG)
      {
         this._lblName.text += " (" + oItem.unicID + ")";
      }
      if(oItem.style == "")
      {
         this._lblName.styleName = "WhiteLeftMediumBoldLabel";
         if(this._ldrPago._visible)
         {
            this._sPago = this.api.lang.getText("KAMAS");
            this._ldrPago.contentPath = "KamaSymbol";
         }
      }
      else
      {
         this._lblName.styleName = oItem.style + "LeftMediumBoldLabel";
         if(this._ldrPago._visible)
         {
            if(oItem.style == "VIP")
            {
               this._sPago = this.api.lang.getText("OGRINAS");
               this._ldrPago.contentPath = "OgrineSymbol";
            }
            else
            {
               this._sPago = this.api.lang.getText("KAMAS");
               this._ldrPago.contentPath = "KamaSymbol";
            }
         }
      }
      var _loc5_ = "";
      if(oItem.itemPago > 0)
      {
         var _loc3_ = this.api.lang.getItemUnicText(oItem.itemPago);
         this._sPago = _loc3_.n;
         var _loc6_ = _loc3_.g;
         var _loc7_ = _loc3_.t;
         this._ldrPago.contentPath = "clips/items/" + _loc7_ + "/" + _loc6_ + ".swf";
         _loc5_ = "x " + _loc3_.n;
      }
      this._lblLevel.text = this.api.lang.getText("LEVEL_SMALL") + oItem.level;
      this._txtDescription.text = oItem.description;
      this.getItemEffects(this._bShowBaseEffects);
      this._ldrIcon.contentParams = oItem.params;
      this._ldrIcon.contentPath = oItem.iconFile;
      if(this._bPrice)
      {
         this._mcDoplonSymbol.contentPath = "clips/items/" + oItem.priceType.t + "/" + oItem.priceType.g + ".swf";
         if(oItem.priceType == undefined)
         {
            this._mcKamaSymbol._visible = true;
            this._mcDoplonSymbol._visible = false;
         }
         else
         {
            this._mcKamaSymbol._visible = false;
            this._mcDoplonSymbol._visible = true;
            if(!this._mcDoplonSymbol.loaded)
            {
               this._mcDoplonSymbol.load();
            }
         }
      }
      this.bShowBaseEffects = false;
      this.updateCurrentTabInformations();
      if(this.api.ui.getUIComponent("Inventory") != undefined)
      {
         if(this._oItem.compressedEffects.indexOf("2d4") != -1)
         {
            this._btnEscudo._visible = true;
         }
         else
         {
            this._btnEscudo._visible = false;
         }
      }
      if(oItem.superType == 2)
      {
         this._btnTabCharacteristics._visible = true;
      }
      else
      {
         if(this._sCurrentTab == "Characteristics")
         {
            this.setCurrentTab("Effects");
         }
         this._btnTabCharacteristics._visible = false;
      }
      if(oItem.price == undefined || oItem.price == -1)
      {
         this._ldrPago._visible = false;
      }
      this._lblPrice.text = oItem.price != undefined ? this.api.lang.getText("UNIT_PRICE") + " : " + new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.price).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + _loc5_ : "";
      this._lblWeight.text = oItem.weight + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this._parent.api.lang.getText("PODS"),"m",oItem.weight < 2);
      if(oItem.isEthereal)
      {
         var _loc4_ = oItem.etherealResistance;
         this._pbEthereal.maximum = _loc4_.param3;
         this._pbEthereal.value = _loc4_.param2;
         this._pbEthereal._visible = true;
         if(_loc4_.param2 < 4)
         {
            this._pbEthereal.styleName = "EtherealCriticalProgressBar";
         }
         else
         {
            this._pbEthereal.styleName = "EtherealNormalProgressBar";
         }
      }
      else
      {
         this._pbEthereal._visible = false;
      }
      this._ldrTwoHanded._visible = oItem.needTwoHands;
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
      this._lblLevel.text = "";
      this._txtDescription.text = "";
      this._ldrIcon.contentPath = "";
      this._cgInfos.clear();
      this._lstInfos.removeAll();
      this._lblPrice.text = "";
      this._lblWeight.text = "";
      this._pbEthereal._visible = false;
      this._ldrTwoHanded._visible = false;
      this._ldrPago._visible = false;
   }
   if(this._oItem.compressedEffects.indexOf("3f8") != -1)
   {
      this._lblName.styleName = "LeftMediumBoldLabelLeg";
   }
   if(this._oItem.compressedEffects.indexOf("2d4") != -1)
   {
      this._lblName.styleName = "LeftMediumBoldLabelRare";
   }
};
_loc1.updateKeyGrid = function()
{
   var _loc2_ = 0;
   while(_loc2_ < this._cgInfos.dataProvider.length)
   {
      var _loc3_ = this._cgInfos.getContainer(_loc2_);
      if(_loc3_.contentData != undefined && _loc3_.contentData.isEmptyKey)
      {
         this.setMovieClipTransform(_loc3_.content,dofus.Constants.INACTIVE_TRANSFORM);
      }
      _loc2_ += 1;
   }
};
_loc1.valid = function(noConfirm, id)
{
   this._nEscogerID = id;
   if(!noConfirm)
   {
      this.api.kernel.showMessage("ATTENTION","¿Se quitará el titulo del escudo para añadirlo a tu lista de titulos ¿Desea continuar?","CAUTION_YESNO",{name:"Confirm",listener:this});
      return undefined;
   }
   var _loc0_ = null;
   if((_loc0_ = this._oEvent.target) === this._btnEscudo)
   {
      this.api.network.send("Ot" + id);
   }
};
_loc1.yes = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.valid(true,this._nEscogerID);
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnEscudo":
         this._oEvent = oEvent;
         this.valid(false,this._oItem.ID);
         break;
      case "_btnAgregar":
         var _loc5_ = this._oItem.compressedEffects;
         if(_loc5_ == undefined)
         {
            _loc5_ = "";
         }
         if(_loc5_.length > 0)
         {
            _loc5_ += ",";
         }
         _loc5_ += "6f#1#0#0#0d0+1";
         this._oItem.setEffects(_loc5_);
         this.updateCurrentTabInformations();
         break;
      case "_btnModificar":
         this.actualizarStats();
         break;
      case "_btnTabEffects":
         if(this._sCurrentTab == "Effects")
         {
            var _loc4_ = this["_btnTab" + this._sCurrentTab];
            _loc4_.selected = false;
            this._bShowBaseEffects = !this._bShowBaseEffects;
            this.getItemEffects(this._bShowBaseEffects);
         }
         else
         {
            this.setCurrentTab("Effects");
         }
         break;
      case "_btnTabCharacteristics":
         this.setCurrentTab("Characteristics");
         break;
      case "_btnTabConditions":
         this.setCurrentTab("Conditions");
         break;
      case "_btnUnlink":
         if(this.gapi.getUIComponent("Inventory") == undefined)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_BECAUSE_BUSY"),"ERROR_CHAT");
            break;
         }
         if(this._oItem.compressedEffects.indexOf("3cf") != -1 && this._parent._name == "Inventory")
         {
            this.dispatchEvent({type:"linkearItem",item:this._oItem});
         }
         break;
      case "_btnAction":
         _loc4_ = this.api.ui.createPopupMenu();
         _loc4_.addStaticItem(this._oItem.name);
         var _loc9_ = false;
         for(var _loc6_ in this._aFiltersType)
         {
            var _loc3_ = this._aFiltersType[_loc6_];
            if(_loc3_ == this._oItem.type)
            {
               _loc4_.addItem("Preview",this.api.ui,this.api.ui.loadUIComponent,["Preview","Preview",{item:this._oItem.unicID,type:this._oItem.type}]);
               break;
            }
         }
         if(this._bUseButton && this._oItem.canUse)
         {
            _loc4_.addItem(this._parent.api.lang.getText("CLICK_TO_USE"),this,this.dispatchEvent,[{type:"useItem",item:this._oItem}]);
         }
         _loc4_.addItem(this._parent.api.lang.getText("CLICK_TO_INSERT"),this.api.kernel.GameManager,this.api.kernel.GameManager.insertItemInChat,[this._oItem]);
         if(this._bTargetButton && this._oItem.canTarget)
         {
            _loc4_.addItem(this._parent.api.lang.getText("CLICK_TO_TARGET"),this,this.dispatchEvent,[{type:"targetItem",item:this._oItem}]);
         }
         _loc4_.addItem("Fusionner",this,this.ouvrirFusionAvecItem,[this._oItem]);
         _loc4_.addItem(this._parent.api.lang.getText("ASSOCIATE_RECEIPTS"),this.api.ui,this.api.ui.loadUIComponent,["ItemUtility","ItemUtility",{item:this._oItem}]);
         if(this._bDestroyButton)
         {
            if(this._oItem.canDestroy)
            {
               _loc4_.addItem(this._parent.api.lang.getText("CLICK_TO_DESTROY"),this,this.dispatchEvent,[{type:"destroyItem",item:this._oItem}]);
            }
            if(this._oItem.compressedEffects.indexOf("3cf") != -1 && this._parent._name == "Inventory")
            {
               _loc4_.addItem(this._parent.api.lang.getText("DISASSOCIATE_MIMOBIONTE"),this,this.dispatchEvent,[{type:"separarMimobionte",item:this._oItem}]);
            }
         }
         _loc4_.show(_root._xmouse,_root._ymouse);
   }
};
_loc1.ouvrirFusionAvecItem = function(oItem)
{
   this.api.network.send("BM*|.upgrade");
   this._itemParaFusion = oItem;
   this.addToQueue({object:this,method:this.colocarItemEnFusion});
};
_loc1.colocarItemEnFusion = function()
{
   var _loc3_ = this.api.ui.getUIComponent("ItemUpgrade");
   if(_loc3_ != undefined && this._itemParaFusion != undefined)
   {
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc2_.push(new dofus.datacenter["\f\f"](this._itemParaFusion.ID,this._itemParaFusion.unicID,1,-1,this._itemParaFusion.compressedEffects));
      _loc3_._cgItem1.dataProvider = _loc2_;
      this._itemParaFusion = undefined;
   }
   else if(this._itemParaFusion != undefined)
   {
      this.addToQueue({object:this,method:this.colocarItemEnFusion});
   }
};
_loc1.actualizarStats = function()
{
   var _loc6_ = "";
   var _loc9_ = new Array();
   for(var _loc12_ in this._oItem.effects)
   {
      _loc9_.push(this._oItem.effects[_loc12_]);
   }
   for(_loc12_ in _loc9_)
   {
      var _loc3_ = _loc9_[_loc12_];
      if(_loc3_.description.length > 0)
      {
         if(_loc6_.length > 0)
         {
            _loc6_ += ",";
         }
         var _loc8_ = "";
         var _loc4_ = !_global.isNaN(_loc3_.param1) ? Number(_loc3_.param1) : 0;
         var _loc5_ = !_global.isNaN(_loc3_.param2) ? Number(_loc3_.param2) : 0;
         var _loc10_ = !_global.isNaN(_loc3_.param3) ? Number(_loc3_.param3) : 0;
         var _loc7_ = true;
         for(var _loc11_ in this.STAT_TEXTO)
         {
            if(_loc3_.type == _loc11_)
            {
               _loc7_ = false;
               break;
            }
         }
         if(_loc7_)
         {
            if(_loc4_ > 0)
            {
               if(_loc4_ >= _loc5_)
               {
                  _loc8_ = "#0d0+" + _loc4_;
               }
               else if(_loc4_ < _loc5_)
               {
                  _loc8_ = "#1d" + (_loc5_ - _loc4_ + 1) + "+" + (_loc4_ - 1);
               }
            }
         }
         _loc6_ += Number(_loc3_.type).toString(16) + "#" + Number(_loc4_).toString(16) + "#" + Number(_loc5_).toString(16) + "#" + Number(_loc10_).toString(16) + _loc8_;
      }
   }
   if(Number(this._oItem.ID) <= Number(0))
   {
      this._parent.api.network.send("BASET_STATS_MODELO " + this._oItem.unicID + " " + _loc6_);
   }
   else
   {
      this._parent.api.network.send("BASET_STATS_OBJETO " + this._oItem.ID + " " + _loc6_);
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_pbEthereal":
         var _loc2_ = this._oItem.etherealResistance;
         this.gapi.showTooltip(_loc2_.description,oEvent.target,-20);
         break;
      case "_ldrTwoHanded":
         this.gapi.showTooltip(this.api.lang.getText("TWO_HANDS_WEAPON"),this._ldrTwoHanded,-20);
         break;
      case "_ldrPago":
         this.gapi.showTooltip(this._sPago,this._ldrPago,-20);
   }
};
_loc1.modificarStat = function(oItem, oItem2)
{
   var _loc4_ = new Array();
   var _loc5_ = false;
   for(var _loc7_ in this._oItem.effects)
   {
      var _loc2_ = this._oItem.effects[_loc7_];
      if(!_loc5_ && _loc2_.type == oItem.type && _loc2_.param1 == oItem.param1)
      {
         if(oItem2 != undefined)
         {
            _loc4_.push([oItem2.type,oItem2.param1,oItem2.param2,oItem2.param3,oItem2.param4]);
         }
         _loc5_ = true;
      }
      else
      {
         _loc4_.push([_loc2_.type,_loc2_.param1,_loc2_.param2,_loc2_.param3,_loc2_.param4]);
      }
   }
   _loc4_.reverse();
   this._oItem.effects = _loc4_;
   this.updateCurrentTabInformations();
};
_loc1.convertirTitulo = function(id)
{
   this.api.network.send("Ot" + id);
};
_loc1.overItem = function(_loc2_)
{
   var _loc2_ = _loc2_.target;
   var _loc1_ = _loc2_.contentData;
   if(!_loc1_.isEmptyKey)
   {
      _loc1_.showStatsTooltip(_loc2_,_loc1_.style);
   }
};
_loc1.outItem = function(_loc2_)
{
   this.gapi.hideTooltip();
};
_loc1.scroll = function(_loc2_)
{
   this.addToQueue({object:this,method:this.updateKeyGrid});
   this.gapi.hideTooltip();
};
_loc1._sPago = "Kamas";
_loc1.addProperty("displayPrice",_loc1.__get__displayPrice,_loc1.__set__displayPrice);
_loc1._bShowBaseEffects = false;
_loc1._aFiltersType = [16,17,18,82];
_loc1.STAT_TEXTO = [7,10,146,148,188,197,201,221,222,229,230,333,335,501,513,600,602,603,604,605,612,613,614,615,616,620,622,624,627,640,641,642,643,645,647,648,649,669,699,700,701,705,710,715,716,717,720,724,725,730,731,751,760,765,791,795,800,805,806,807,808,810,811,813,814,825,900,901,902,905,915,930,931,932,933,934,935,936,937,939,940,946,947,948,949,950,960,961,962,963,964,970,971,972,973,974,983,985,986,987,988,989,990,994,996,997,998,999];
