class dofus.§\r\x14§.gapi.ui.SpellViewerOnCreate extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nBreed;
   var _lblBreedSpells;
   var _lblBreedName;
   var _lbViewSpell;
   var _btnClose;
   var _bhClose;
   var _mcWindowBg;
   var _mcViewAllSpell;
   var onEnterFrame;
   var onRelease;
   var _mcSpellDesc;
   var _nSpellID;
   static var CLASS_NAME = "SpellViewerOnCreate";
   static var SPELLS_DISPLAYED = 20;
   function SpellViewerOnCreate()
   {
      super();
   }
   function get breed()
   {
      return this._nBreed;
   }
   function set breed(§\t\x02§)
   {
      this._nBreed = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.SpellViewerOnCreate.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initText});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.addListeners});
   }
   function initText()
   {
      this._lblBreedSpells.text = this.api.lang.getText("CLASS_SPELLS");
      this._lblBreedName.text = this.api.lang.getClassText(this._nBreed).sn;
      this._lbViewSpell.text = this.api.lang.getText("SEE_ALL_SPELLS");
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnClose.addEventListener("over",this);
      this._btnClose.addEventListener("out",this);
      this._bhClose.addEventListener("click",this);
      this._mcWindowBg.onRelease = function()
      {
      };
      this._mcWindowBg.useHandCursor = false;
      this._mcViewAllSpell.onRelease = function()
      {
         var aTarget = new Object();
         var _loc2_ = 0;
         while(_loc2_ < dofus["\r\x14"].gapi.ui.SpellViewerOnCreate.SPELLS_DISPLAYED)
         {
            var _loc3_ = this._parent["_ctr" + _loc2_];
            var _loc4_ = this._parent._mcPlacerSpell._x;
            var _loc5_ = this._parent._mcPlacerSpell._y;
            var _loc6_ = _loc4_ + (_loc2_ - (_loc2_ <= 9 ? 0 : 10)) * (_loc3_.width + 5);
            var _loc7_ = _loc5_ + (5 + _loc3_.height) * (_loc2_ <= 9 ? 0 : 1);
            aTarget["_ctr" + _loc2_] = {x:_loc6_,y:_loc7_};
            _loc3_.onEnterFrame = function()
            {
               this._x += (aTarget[this._name].x - this._x) / 2;
               this._y += (aTarget[this._name].y - this._y) / 2;
               this._alpha += (100 - this._alpha) / 2;
               if(Math.abs(this._x - aTarget[this._name].x) < 0.5 && (Math.abs(this._y - aTarget[this._name].y) < 0.5 && Math.abs(this._alpha - 100) < 0.5))
               {
                  delete this.onEnterFrame;
               }
            };
            _loc2_ = _loc2_ + 1;
         }
         var ref = this._parent;
         var _loc8_ = 0;
         this.onEnterFrame = function()
         {
            var _loc2_ = (ref._mcPlacerAllSpell._y - ref._mcSpellDesc._y) / 2;
            ref._mcSpellDesc._y += _loc2_;
            ref._mcWindowBg._y += _loc2_;
            if(Math.abs(ref._mcSpellDesc._y - ref._mcPlacerAllSpell._y) < 0.5)
            {
               ref._mcWindowBg._y += ref._mcPlacerAllSpell._y - ref._mcSpellDesc._y;
               ref._mcSpellDesc._y = ref._mcPlacerAllSpell._y;
               delete this.onEnterFrame;
            }
         };
         this._parent._mcBgViewAllSpell1._visible = false;
         this._parent._mcBgViewAllSpell2._visible = false;
         this._parent._lbViewSpell._visible = false;
         delete this.onRelease;
      };
      var _loc2_ = 0;
      while(_loc2_ < dofus["\r\x14"].gapi.ui.SpellViewerOnCreate.SPELLS_DISPLAYED)
      {
         var _loc3_ = this["_ctr" + _loc2_];
         _loc3_.addEventListener("over",this);
         _loc3_.addEventListener("out",this);
         _loc3_.addEventListener("click",this);
         _loc3_.addEventListener("onContentLoaded",this);
         _loc2_ = _loc2_ + 1;
      }
   }
   function initData()
   {
      var _loc2_ = dofus.Constants.SPELLS_ICONS_PATH;
      var _loc3_ = this.api.lang.getClassText(this._nBreed).s;
      var _loc4_ = 0;
      while(_loc4_ < dofus["\r\x14"].gapi.ui.SpellViewerOnCreate.SPELLS_DISPLAYED)
      {
         var _loc5_ = this["_ctr" + _loc4_];
         _loc5_.contentPath = _loc2_ + _loc3_[_loc4_] + ".swf";
         _loc5_.params = {spellID:_loc3_[_loc4_]};
         _loc5_._alpha = _loc4_ >= 3 ? 0 : 100;
         _loc4_ = _loc4_ + 1;
      }
      this._mcSpellDesc._ldrSpellBig.addEventListener("complete",this);
      this.showSpellInfo(_loc3_[0],1);
   }
   function showSpellInfo(§\x1e\x1c\x1d§, §\x03\x11§)
   {
      this._nSpellID = _loc2_;
      var _loc4_ = this.api.kernel.CharactersManager.getSpellObjectFromData(_loc2_ + "~" + _loc3_ + "~");
      if(!_loc4_.isValid)
      {
         if(_loc3_ != 1)
         {
            this.showSpellInfo(_loc2_,1);
            return undefined;
         }
         _loc4_ = undefined;
      }
      var _loc5_ = 1;
      while(_loc5_ < 7)
      {
         var _loc6_ = this["_btnLevel" + _loc5_];
         _loc6_.selected = _loc5_ == _loc3_;
         _loc5_ = _loc5_ + 1;
      }
      if(_loc4_.name == undefined)
      {
         this._mcSpellDesc._lblSpellName.text = "";
         this._mcSpellDesc._lblSpellRange.text = "";
         this._mcSpellDesc._lblSpellAP.text = "";
         this._mcSpellDesc._txtSpellDescription.text = "";
         this._mcSpellDesc._ldrSpellBig.contentPath = "";
         if(dofus.Constants.DOUBLEFRAMERATE && this._mcSpellDesc._ldrSpellBig.loaded)
         {
            var _loc7_ = this.api.kernel.OptionsManager.getOption("RemasteredSpellIconsPack");
            this._mcSpellDesc._ldrSpellBig.content.gotoAndStop(_loc7_);
         }
      }
      else if(this._mcSpellDesc._lblSpellName.text != undefined)
      {
         this._mcSpellDesc._lblSpellName.text = _loc4_.name;
         this._mcSpellDesc._lblSpellRange.text = this.api.lang.getText("RANGEFULL") + " : " + _loc4_.rangeStr;
         this._mcSpellDesc._lblSpellAP.text = this.api.lang.getText("ACTIONPOINTS") + " : " + _loc4_.apCost;
         this._mcSpellDesc._txtSpellDescription.text = _loc4_.description + "\n" + _loc4_.descriptionNormalHit;
         this._mcSpellDesc._ldrSpellBig.contentPath = _loc4_.iconFile;
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._bhClose:
         case this._btnClose:
            this.unloadThis();
            break;
         default:
            this.showSpellInfo(_loc2_.target.params.spellID,1);
      }
   }
   function refreshSpellsPack()
   {
      if(!dofus.Constants.DOUBLEFRAMERATE)
      {
         return undefined;
      }
      var _loc2_ = this.api.kernel.OptionsManager.getOption("RemasteredSpellIconsPack");
      var _loc3_ = 0;
      while(_loc3_ < dofus["\r\x14"].gapi.ui.SpellViewerOnCreate.SPELLS_DISPLAYED)
      {
         var _loc4_ = this["_ctr" + _loc3_];
         var _loc5_ = _loc4_.content;
         _loc5_.gotoAndStop(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
      var _loc6_ = this._mcSpellDesc._ldrSpellBig;
      _loc6_.content.gotoAndStop(_loc2_);
   }
   function complete(§\x1e\x19\x0e§)
   {
      if(!dofus.Constants.DOUBLEFRAMERATE)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.clip;
      var _loc4_ = this.api.kernel.OptionsManager.getOption("RemasteredSpellIconsPack");
      _loc3_.gotoAndStop(_loc4_);
   }
   function onContentLoaded(§\x1e\x19\x0e§)
   {
      if(!dofus.Constants.DOUBLEFRAMERATE)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.content;
      var _loc4_ = this.api.kernel.OptionsManager.getOption("RemasteredSpellIconsPack");
      _loc3_.gotoAndStop(_loc4_);
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) !== this._btnClose)
      {
         var _loc3_ = dofus.datacenter["\x1e\x0e\x1c"](this.api.kernel.CharactersManager.getSpellObjectFromData(_loc2_.target.params.spellID + "~1~"));
         this.gapi.showTooltip(_loc3_.name + ", " + this.api.lang.getText("REQUIRED_SPELL_LEVEL").toLowerCase() + ": " + _loc3_.minPlayerLevel,_loc2_.target,-20);
      }
      else
      {
         this.gapi.showTooltip(this.api.lang.getText("CLOSE"),_loc2_.target,-20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
}
