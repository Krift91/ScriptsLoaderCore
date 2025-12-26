class dofus.§\r\x14§.gapi.controls.SpriteViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oSpriteData;
   var _oSourceSpriteData;
   var _mcSpriteA;
   var _mcSpriteB;
   var _mcInteraction;
   var _nInterval;
   var _ldrSpriteA;
   var _ldrSpriteB;
   var _mcCurrentSprite;
   var _mcOtherSprite;
   var mcOther;
   var onEnterFrame;
   static var CLASS_NAME = "SpriteViewer";
   var REFRESH_DELAY = 500;
   var SPRITE_ANIMS = ["StaticF","StaticR","StaticL","WalkF","RunF","Anim2R","Anim2L"];
   var _bEnableBlur = true;
   var _nZoom = 200;
   var _bAllowAnimations = true;
   var _bUseSingleLoader = false;
   var _bNoDelay = false;
   var _nSpriteAnimIndex = 0;
   var _bCurrentSprite = false;
   var _bRefreshAccessories = true;
   function SpriteViewer()
   {
      super();
   }
   function get spriteData()
   {
      return this._oSpriteData;
   }
   function set spriteData(§\x1e\x19\x15§)
   {
      if(_loc2_.isMounting)
      {
         this.enableBlur = false;
      }
      this._oSpriteData = _loc2_;
      if(this.initialized)
      {
         this.addSpriteListeners();
         this.refreshDisplay();
      }
   }
   function get sourceSpriteData()
   {
      return this._oSourceSpriteData;
   }
   function set sourceSpriteData(§\x1e\x19\x15§)
   {
      this._oSourceSpriteData = _loc2_;
   }
   function get enableBlur()
   {
      return this._bEnableBlur;
   }
   function set enableBlur(§\x14\x1a§)
   {
      this._bEnableBlur = _loc2_;
      this._mcSpriteA.onEnterFrame = this._mcSpriteB.onEnterFrame = undefined;
      !this._bCurrentSprite ? this._mcSpriteB : this._mcSpriteA._alpha = 100;
      !!this._bCurrentSprite ? this._mcSpriteB : this._mcSpriteA._alpha = 0;
   }
   function get refreshAccessories()
   {
      return this._bRefreshAccessories;
   }
   function set refreshAccessories(§\x14\x1a§)
   {
      this._bRefreshAccessories = _loc2_;
   }
   function get zoom()
   {
      return this._nZoom;
   }
   function set zoom(§\x1e\x1b\n§)
   {
      this._nZoom = _loc2_;
      if(this.initialized)
      {
         this.refreshDisplay();
      }
   }
   function get allowAnimations()
   {
      return this._bAllowAnimations;
   }
   function set allowAnimations(§\x14\x1a§)
   {
      this._bAllowAnimations = _loc2_;
      this._mcInteraction._visible = _loc2_;
   }
   function get noDelay()
   {
      return this._bNoDelay;
   }
   function set noDelay(§\x14\x1a§)
   {
      this._bNoDelay = _loc2_;
   }
   function get spriteAnims()
   {
      return this.SPRITE_ANIMS;
   }
   function set spriteAnims(§\x1c§)
   {
      this.SPRITE_ANIMS = _loc2_;
   }
   function get refreshDelay()
   {
      return this.REFRESH_DELAY;
   }
   function set refreshDelay(§\t\x02§)
   {
      this.REFRESH_DELAY = _loc2_;
   }
   function get useSingleLoader()
   {
      return this._bUseSingleLoader;
   }
   function set useSingleLoader(§\x1c\x1d§)
   {
      this._bUseSingleLoader = _loc2_;
   }
   function refreshDisplay()
   {
      if(this._nInterval > 0)
      {
         _global.clearInterval(this._nInterval);
      }
      if(this._bNoDelay)
      {
         this.beginDisplay();
      }
      else
      {
         this._nInterval = _global.setInterval(this,"beginDisplay",this.REFRESH_DELAY);
      }
   }
   function getColor(§\x04\n§)
   {
      return this._oSpriteData["color" + _loc2_] != undefined ? this._oSpriteData["color" + _loc2_] : -1;
   }
   function setColor(§\x04\n§, §\x1e\x1b\n§)
   {
      this._oSpriteData["color" + _loc2_] = _loc3_;
      this.updateSprite();
   }
   function setColors(§\x1e\x19\x1c§)
   {
      this._oSpriteData.color1 = _loc2_.color1;
      this._oSpriteData.color2 = _loc2_.color2;
      this._oSpriteData.color3 = _loc2_.color3;
      if(this._oSpriteData.isMounting && this._oSpriteData.mount.isChameleon)
      {
         this._oSpriteData.mount.customColor1 = _loc2_.color2;
         this._oSpriteData.mount.customColor2 = _loc2_.color3;
         this._oSpriteData.mount.customColor3 = _loc2_.color3;
      }
      this.updateSprite();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.SpriteViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.refreshDisplay});
   }
   function addListeners()
   {
      this._ldrSpriteA.addEventListener("initialization",this);
      this._ldrSpriteB.addEventListener("initialization",this);
      this.addSpriteListeners();
      this._mcInteraction.onRelease = function()
      {
         this._parent.click({target:this});
      };
   }
   function addSpriteListeners()
   {
      if(this._oSourceSpriteData == undefined)
      {
         return undefined;
      }
      this._oSourceSpriteData.addEventListener("gfxFileChanged",this);
      this._oSourceSpriteData.addEventListener("accessoriesChanged",this);
   }
   function beginDisplay()
   {
      _global.clearInterval(this._nInterval);
      this._nInterval = 0;
      if(this._oSpriteData == undefined)
      {
         return undefined;
      }
      if(this._bEnableBlur && !this._bUseSingleLoader)
      {
         var _loc2_ = !this._bCurrentSprite ? this._ldrSpriteB : this._ldrSpriteA;
         this._bCurrentSprite = !this._bCurrentSprite;
         var _loc3_ = !this._bCurrentSprite ? this._mcSpriteB : this._mcSpriteA;
      }
      else if(this._bUseSingleLoader)
      {
         _loc2_ = this._ldrSpriteA;
         this._bCurrentSprite = false;
      }
      else
      {
         _loc2_ = !this._bCurrentSprite ? this._ldrSpriteB : this._ldrSpriteA;
      }
      _loc2_.forceReload = true;
      _loc2_.content.removeMovieClip();
      var _loc4_ = _loc2_.holder.createEmptyMovieClip("content_mc",1);
      this._oSpriteData.mc = _loc4_.attachClassMovie(this._oSpriteData.clipClass,"sprite" + this._oSpriteData.id,1,[undefined,undefined,this._oSpriteData]);
      _loc2_.content = this._oSpriteData.mc;
      this._oSpriteData.mc.addEventListener("onLoadInit",_loc2_);
   }
   function attachAnimation(§\x04\n§)
   {
      if(_loc2_ < 0)
      {
         _loc2_ = 0;
      }
      var _loc3_ = this.SPRITE_ANIMS[_loc2_];
      var _loc4_ = ank.battlefield.mc["\x1e\x0e\x10"].getDirNumByChar(_loc3_.charAt(_loc3_.length - 1));
      this._oSpriteData.direction = _loc4_;
      _loc3_ = _loc3_.substring(0,_loc3_.length - 1);
      this._mcSpriteA.setAnim(_loc3_,true,true);
      this._mcSpriteB.setAnim(_loc3_,true,true);
   }
   function applyZoom()
   {
      if(this._mcSpriteA != undefined)
      {
         this._mcSpriteA._xscale = this._mcSpriteA._yscale = this._nZoom;
      }
      if(this._mcSpriteB != undefined)
      {
         this._mcSpriteB._xscale = this._mcSpriteB._yscale = this._nZoom;
      }
   }
   function playNextAnim(§\x1e\x1c\x18§)
   {
      if(_loc2_ == undefined || _global.isNaN(_loc2_))
      {
         _loc2_ = this._nSpriteAnimIndex;
      }
      this._nSpriteAnimIndex = _loc2_;
      this.attachAnimation(this._nSpriteAnimIndex);
      this._nSpriteAnimIndex++;
      if(this._nSpriteAnimIndex >= this.SPRITE_ANIMS.length)
      {
         this._nSpriteAnimIndex = 0;
      }
      this.applyZoom();
   }
   function updateSprite()
   {
      this.attachAnimation(this._nSpriteAnimIndex - 1);
      this.applyZoom();
   }
   function destroy()
   {
      _global.clearInterval(this._nInterval);
      this._nInterval = 0;
   }
   function initialization(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_ldrSpriteA":
            var _loc0_ = null;
            this._mcSpriteA = _loc0_ = _loc2_.clip;
            this._mcCurrentSprite = _loc0_;
            this._mcOtherSprite = this._mcSpriteB;
            break;
         case "_ldrSpriteB":
            this._mcSpriteB = _loc0_ = _loc2_.clip;
            this._mcCurrentSprite = _loc0_;
            this._mcOtherSprite = this._mcSpriteA;
      }
      this.applyZoom();
      if(this._bEnableBlur)
      {
         this._mcOtherSprite._alpha = 100;
         this._mcCurrentSprite._alpha = 0;
         this._mcCurrentSprite.mcOther = this._mcOtherSprite;
         this._mcCurrentSprite.onEnterFrame = function()
         {
            this._alpha += 10;
            this.mcOther._alpha -= 30;
            if(this._alpha >= 100 && this.mcOther._alpha <= 0)
            {
               this._alpha = 100;
               this.mcOther._alpha = 0;
               this.onEnterFrame = undefined;
            }
         };
      }
      else
      {
         this._mcCurrentSprite._alpha = 100;
         if(this._mcOtherSprite != undefined)
         {
            this._mcOtherSprite._alpha = 0;
         }
      }
      this.addToQueue({object:this,method:this.playNextAnim,params:[this._nSpriteAnimIndex - 1]});
   }
   function click(§\x1e\x19\x0e§)
   {
      this.playNextAnim();
   }
   function gfxFileChanged(§\x1e\x19\x0e§)
   {
      this._oSpriteData.gfxFile = _loc2_.value;
      this.refreshDisplay();
   }
   function accessoriesChanged(§\x1e\x19\x0e§)
   {
      if(!this._bRefreshAccessories)
      {
         return undefined;
      }
      this._oSpriteData.accessories = _loc2_.value;
      this.refreshDisplay();
   }
}
