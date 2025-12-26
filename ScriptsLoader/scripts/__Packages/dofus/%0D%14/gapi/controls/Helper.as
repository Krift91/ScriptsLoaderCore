class dofus.§\r\x14§.gapi.controls.Helper extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _aAnimationQueue;
   var _nStarsDisplayed;
   var _bIsPlaying;
   var _sLastAnimation;
   var _mcBoon;
   static var CLASS_NAME = "Helper";
   static var SINGLETON_INSTANCE = null;
   static var MAX_STARS_DISPLAYED = 5;
   function Helper()
   {
      super();
   }
   static function getCurrentHelper()
   {
      if(dofus["\r\x14"].gapi.controls.Helper.SINGLETON_INSTANCE == null || !(dofus["\r\x14"].gapi.controls.Helper.SINGLETON_INSTANCE instanceof dofus["\r\x14"].gapi.controls.Helper))
      {
         var _loc2_ = _global.API.ui.getUIComponent("Banner");
         if(_loc2_ == undefined)
         {
            return null;
         }
         var _loc3_ = _loc2_.showCircleXtra("helper",true);
         return _loc3_.content;
      }
      return dofus["\r\x14"].gapi.controls.Helper.SINGLETON_INSTANCE;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.Helper.CLASS_NAME);
      dofus["\r\x14"].gapi.controls.Helper.SINGLETON_INSTANCE = this;
      this._aAnimationQueue = new Array();
      this.addAnimationToQueue("show");
   }
   function createChildren()
   {
      this.hideAllStars();
   }
   function hideAllStars()
   {
      this.showStars(0);
   }
   function showStars(nCount)
   {
      var _loc3_ = 0;
      while(_loc3_ < dofus["\r\x14"].gapi.controls.Helper.MAX_STARS_DISPLAYED)
      {
         this.getStar(_loc3_ + 1)._visible = nCount > _loc3_;
         _loc3_ = _loc3_ + 1;
      }
      this._nStarsDisplayed = nCount;
   }
   function getStar(§\x04\x12§)
   {
      return this["_mcStar" + _loc2_];
   }
   function addStar()
   {
      if(this._nStarsDisplayed < dofus["\r\x14"].gapi.controls.Helper.MAX_STARS_DISPLAYED)
      {
         this.showStars(this._nStarsDisplayed + 1);
      }
   }
   function removeStar()
   {
      if(this._nStarsDisplayed > 0)
      {
         this.showStars(this._nStarsDisplayed - 1);
      }
   }
   function addAnimationToQueue(§\x1e\x14\x16§)
   {
      this._aAnimationQueue.push(_loc2_);
      if(!this._bIsPlaying)
      {
         this.playNextAnimation();
      }
   }
   function playNextAnimation()
   {
      if(this._aAnimationQueue.length > 0)
      {
         var _loc2_ = String(this._aAnimationQueue.shift());
         this._sLastAnimation = _loc2_;
         this._mcBoon.gotoAndPlay(_loc2_);
      }
      else
      {
         var _loc0_ = null;
         if((_loc0_ = this._sLastAnimation) === "hide")
         {
            var _loc3_ = _global.API.ui.getUIComponent("Banner");
            _loc3_.showCircleXtra("artwork",true,{bMask:true});
         }
         this._mcBoon.gotoAndStop("static");
      }
   }
   function onNewTip()
   {
      this.addStar();
      this.addAnimationToQueue("wave");
   }
   function onRemoveTip()
   {
      this.removeStar();
      if(this._nStarsDisplayed <= 0)
      {
         this._nStarsDisplayed = 0;
         this.addAnimationToQueue("hide");
      }
   }
   function onAnimationEnd()
   {
      this.playNextAnimation();
   }
}
