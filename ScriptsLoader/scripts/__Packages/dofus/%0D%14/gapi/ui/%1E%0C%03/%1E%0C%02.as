class dofus.§\r\x14§.gapi.ui.§\x1e\f\x03§.§\x1e\f\x02§ extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _mcUnderAttack;
   var _mcUnderAttackInteractivity;
   var _mcList;
   var _oItem;
   var _lblCost;
   var _lblCoords;
   var _lblName;
   var _btnLocate;
   function §\x1e\f\x02§()
   {
      super();
      this._mcUnderAttack._visible = false;
      this._mcUnderAttackInteractivity._visible = false;
      this.api = _global.API;
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._oItem = _loc4_;
         this._lblCost.text = _loc4_.cost + " k";
         this._lblCoords.text = _loc4_.coordinates;
         this._lblName.text = _loc4_.name;
         this._btnLocate._visible = true;
         if(this._oItem.attackNear)
         {
            this._mcUnderAttack._visible = true;
            this._mcUnderAttackInteractivity._visible = true;
            var ref = this;
            this._mcUnderAttackInteractivity.onRollOver = function()
            {
               ref.over({target:this});
            };
            this._mcUnderAttackInteractivity.onRollOut = function()
            {
               ref.out({target:this});
            };
         }
         else
         {
            this._mcUnderAttack._visible = false;
            this._mcUnderAttackInteractivity._visible = false;
         }
      }
      else if(this._lblCost.text != undefined)
      {
         this._lblCost.text = "";
         this._lblCoords.text = "";
         this._lblName.text = "";
         this._btnLocate._visible = false;
         this._mcUnderAttack._visible = false;
         this._mcUnderAttackInteractivity._visible = false;
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
      this._btnLocate.addEventListener("click",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      this.api.kernel.GameManager.updateCompass(this._oItem.x,this._oItem.y,true);
   }
   function over(§\x0f\x04§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._mcUnderAttackInteractivity)
      {
         this.api.ui.showTooltip(this.api.lang.getText("CONQUEST_NEAR_PRISM_UNDER_ATTACK"),_root._xmouse,_root._ymouse);
      }
   }
   function out(§\x0f\x04§)
   {
      this.api.ui.hideTooltip();
   }
}
