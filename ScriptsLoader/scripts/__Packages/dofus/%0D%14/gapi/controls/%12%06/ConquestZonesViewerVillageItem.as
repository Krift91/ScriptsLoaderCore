class dofus.§\r\x14§.gapi.controls.§\x12\x06§.ConquestZonesViewerVillageItem extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _ldrAlignment;
   var _mcNotAligned;
   var _mcAlignmentInteractivity;
   var _mcDoorClose;
   var _mcDoorOpen;
   var _mcDoorInteractivity;
   var _mcPrismClose;
   var _mcPrismOpen;
   var _mcPrismInteractivity;
   var _mcList;
   var _oItem;
   var _lblVillage;
   function ConquestZonesViewerVillageItem()
   {
      super();
      this.api = _global.API;
      this._ldrAlignment._alpha = 0;
      this._mcNotAligned._alpha = 0;
      this._mcAlignmentInteractivity._alpha = 0;
      this._mcDoorClose._alpha = 0;
      this._mcDoorOpen._alpha = 0;
      this._mcDoorInteractivity._alpha = 0;
      this._mcPrismClose._alpha = 0;
      this._mcPrismOpen._alpha = 0;
      this._mcPrismInteractivity._alpha = 0;
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
         this._lblVillage.text = this.api.lang.getMapAreaText(_loc4_.id).n;
         if(_loc4_.alignment == -1)
         {
            this._ldrAlignment._alpha = 0;
            this._mcNotAligned._alpha = 100;
         }
         else
         {
            this._mcNotAligned._alpha = 0;
            this._ldrAlignment._alpha = 100;
            this._ldrAlignment.contentPath = dofus.Constants.ALIGNMENTS_MINI_PATH + _loc4_.alignment + ".swf";
         }
         if(_loc4_.door)
         {
            this._mcDoorClose._alpha = 0;
            this._mcDoorOpen._alpha = 100;
         }
         else
         {
            this._mcDoorClose._alpha = 100;
            this._mcDoorOpen._alpha = 0;
         }
         if(_loc4_.prism)
         {
            this._mcPrismClose._alpha = 0;
            this._mcPrismOpen._alpha = 100;
         }
         else
         {
            this._mcPrismClose._alpha = 100;
            this._mcPrismOpen._alpha = 0;
         }
         var ref = this;
         this._mcAlignmentInteractivity.onRollOver = function()
         {
            ref.over({target:this});
         };
         this._mcAlignmentInteractivity.onRollOut = function()
         {
            ref.out({target:this});
         };
         this._mcDoorInteractivity.onRollOver = function()
         {
            ref.over({target:this});
         };
         this._mcDoorInteractivity.onRollOut = function()
         {
            ref.out({target:this});
         };
         this._mcPrismInteractivity.onRollOver = function()
         {
            ref.over({target:this});
         };
         this._mcPrismInteractivity.onRollOut = function()
         {
            ref.out({target:this});
         };
      }
      else if(this._lblVillage.text != undefined)
      {
         this._lblVillage.text = "";
         this._ldrAlignment._alpha = 0;
         this._ldrAlignment.contentPath = undefined;
         this._mcNotAligned._alpha = 0;
         this._mcAlignmentInteractivity._alpha = 0;
         this._mcDoorClose._alpha = 0;
         this._mcDoorOpen._alpha = 0;
         this._mcDoorInteractivity._alpha = 0;
         this._mcPrismClose._alpha = 0;
         this._mcPrismOpen._alpha = 0;
         this._mcPrismInteractivity._alpha = 0;
      }
   }
   function over(§\x0f\x04§)
   {
      switch(_loc2_.target)
      {
         case this._mcAlignmentInteractivity:
            this.api.ui.showTooltip(this.api.lang.getText("ALIGNMENT") + ": " + (this._oItem.alignment <= 0 ? (this._oItem.alignment != -1 ? this.api.lang.getText("NEUTRAL_WORD") : this.api.lang.getText("NON_ALIGNED")) : new dofus.datacenter["\x1e\f"](this._oItem.alignment,1).name),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcDoorInteractivity:
            this.api.ui.showTooltip(!this._oItem.door ? this.api.lang.getText("CONQUEST_VILLAGE_DOOR_CLOSE") : this.api.lang.getText("CONQUEST_VILLAGE_DOOR_OPEN"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcPrismInteractivity:
            this.api.ui.showTooltip(!this._oItem.prism ? this.api.lang.getText("CONQUEST_VILLAGE_PRISM_CLOSE") : this.api.lang.getText("CONQUEST_VILLAGE_PRISM_OPEN"),_root._xmouse,_root._ymouse - 20);
      }
   }
   function out(§\x0f\x04§)
   {
      this.api.ui.hideTooltip();
   }
}
