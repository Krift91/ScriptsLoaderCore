class dofus.§\r\x14§.gapi.controls.SpriteHealthBar extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nCurrentValue;
   var _nMinValue;
   var _nMaxValue;
   var _nWidth;
   var _mcBar;
   var _mcBarHighlight;
   var _txtValue;
   var _nPreviousWidth;
   var _nCurrentWidth;
   var _mcBorder;
   var §\x1d\b\n§;
   var _nUpdateTimeout;
   static var CLASS_NAME = "SpriteHealthBar";
   function SpriteHealthBar()
   {
      super();
   }
   function set lifeCurrentValue(_loc2_)
   {
      this._nCurrentValue = _loc2_;
   }
   function get lifeCurrentValue()
   {
      return this._nCurrentValue;
   }
   function set lifeMinValue(_loc2_)
   {
      this._nMinValue = _loc2_;
   }
   function get lifeMinValue()
   {
      return this._nMinValue;
   }
   function set lifeMaxValue(_loc2_)
   {
      this._nMaxValue = _loc2_;
   }
   function get lifeMaxValue()
   {
      return this._nMaxValue;
   }
   function set realWidth(_loc2_)
   {
      this._nWidth = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.SpriteHealthBar.CLASS_NAME);
   }
   function createChildren()
   {
      this.setWholeBarWidth();
      this.initTextField();
      this._mcBar._width = this._mcBarHighlight._width = this.getHealthBarWidth();
      this.addToQueue({object:this,method:this.initData});
   }
   function initData()
   {
      this._parent._oSprite.addEventListener("lpChanged",this);
      this._parent._oSprite.addEventListener("lpMaxChanged",this);
   }
   function initTextField()
   {
      this.createTextField("_txtValue",101,0,-1,this._nWidth,this._height);
      this._txtValue.embedFonts = true;
      this._txtValue.text = String(this._nCurrentValue);
      this._txtValue.setTextFormat(new TextFormat("Font2",10,16777215,false,false,false,null,null,"center"));
   }
   function getHealthBarWidth()
   {
      this._nPreviousWidth = this._nCurrentWidth;
      var _loc2_ = this._nCurrentValue - this._nMinValue;
      var _loc3_ = this._nMaxValue - this._nMinValue;
      var _loc4_ = Math.round(_loc2_ / _loc3_ * this._nWidth);
      if(_loc4_ > this._nWidth)
      {
         _loc4_ = this._nWidth;
      }
      this._nCurrentWidth = _loc4_;
      return _loc4_;
   }
   function animHealthBar(_loc2_, nCurrentValue, nNewValue)
   {
      _global.API.kernel.debug("Animate");
      new ank["\x1e\n\x07"].TweenAnimation.width(_loc2_,eval("\t\x04").transitions.easing.Strong.easeIn,nCurrentValue,nNewValue,0.5,true);
   }
   function setWholeBarWidth()
   {
      this._mcBar._width = this._mcBarHighlight._width = this._mcBorder._width = this["\x1d\b\n"]._width = this._nWidth;
   }
   function updateData()
   {
      this.initTextField();
      this._mcBar._width = this._mcBarHighlight._width = this.getHealthBarWidth();
      var _loc2_ = this._nPreviousWidth - this._nCurrentWidth;
      if(this.api.kernel.OptionsManager.getOption("AnimateHPBar"))
      {
         if(_loc2_ > 0)
         {
            var _loc3_ = new flash.geom.ColorTransform(1,1,0,1,1,150,0,0);
            var _loc4_ = new flash.geom.Transform(this._mcBarHighlight);
            _loc4_.colorTransform = _loc3_;
            this.animHealthBar(this._mcBarHighlight,this._nPreviousWidth,this._nCurrentWidth);
         }
         else
         {
            var _loc5_ = new flash.geom.ColorTransform(0,1,1,1,1,150,0,0);
            var _loc6_ = new flash.geom.Transform(this._mcBarHighlight);
            _loc6_.colorTransform = _loc5_;
            this.animHealthBar(this._mcBar,this._nPreviousWidth,this._nCurrentWidth);
         }
      }
   }
   function lpChanged(_loc2_)
   {
      if(this._nUpdateTimeout != undefined)
      {
         _global.clearTimeout(this._nUpdateTimeout);
      }
      var _loc4_ = _global.setTimeout(this,"updateData",50);
      this._nUpdateTimeout = _loc4_;
      this._nCurrentValue = _loc2_.value;
   }
   function lpMaxChanged(_loc2_)
   {
      this._nMaxValue = _loc2_.value;
   }
}
