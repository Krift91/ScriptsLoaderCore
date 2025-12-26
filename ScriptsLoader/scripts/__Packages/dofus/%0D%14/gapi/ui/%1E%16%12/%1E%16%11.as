class dofus.§\r\x14§.gapi.ui.§\x1e\x16\x12§.§\x1e\x16\x11§ extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _ldrIcon;
   var _lblDescription;
   var _lblRemainingTurn;
   var _lblSpell;
   var _mcInteractivity;
   var _oItem;
   function §\x1e\x16\x11§()
   {
      super();
      this.api = _global.API;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._ldrIcon.forceNextLoad();
         this._ldrIcon.contentPath = dofus.Constants.EFFECTSICON_FILE;
         this._lblDescription.text = _loc4_.description;
         this._lblRemainingTurn.text = _loc4_.remainingTurnStr;
         this._lblSpell.text = _loc4_.spellName;
         var ref = this;
         this._mcInteractivity.onRollOver = function()
         {
            ref.over({target:this});
         };
         this._mcInteractivity.onRollOut = function()
         {
            ref.out({target:this});
         };
         this._oItem = _loc4_;
      }
      else if(this._lblSpell.text != undefined)
      {
         this._ldrIcon.contentPath = "";
         this._lblDescription.text = "";
         this._lblRemainingTurn.text = "";
         this._lblSpell.text = "";
         delete this._mcInteractivity.onRollOver;
         delete this._mcInteractivity.onRollOut;
      }
   }
   function init()
   {
      super.init(false);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._ldrIcon.addEventListener("initialization",this);
   }
   function initialization(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._ldrIcon.content.attachMovie("Icon_" + this._oItem.characteristic,"_mcIcon",10,{operator:this._oItem.operator});
      _loc3_.__proto__ = dofus["\r\x14"].battlefield.EffectIcon.prototype;
      var _loc4_ = dofus["\r\x14"].battlefield.EffectIcon(_loc3_);
      _loc4_.initialize(this._oItem.operator,1);
   }
   function over(§\x0f\x04§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._mcInteractivity)
      {
         if(this._oItem.spellDescription.length > 0)
         {
            this.api.ui.showTooltip(this._oItem.spellDescription,_root._xmouse,_root._ymouse - 30);
         }
      }
   }
   function out(§\x0f\x04§)
   {
      this.api.ui.hideTooltip();
   }
}
