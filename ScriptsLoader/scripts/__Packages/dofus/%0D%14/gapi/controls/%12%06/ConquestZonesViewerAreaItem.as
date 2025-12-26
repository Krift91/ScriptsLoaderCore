class dofus.§\r\x14§.gapi.controls.§\x12\x06§.ConquestZonesViewerAreaItem extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _ldrAlignment;
   var _mcNotAligned;
   var _mcFighting;
   var _mcLocate;
   var _mcSubtitleBackground;
   var _mcList;
   var _oItem;
   var _lblArea;
   var _mcTooltip;
   var _oPrismData;
   var _lblPrism;
   var _mcAlignmentInteractivity;
   var _mcFightingInteractivity;
   var _lblSubtitle;
   static var MOVING_INDICE = 5;
   function ConquestZonesViewerAreaItem()
   {
      super();
      this.api = _global.API;
      this._ldrAlignment._alpha = 0;
      this._mcNotAligned._alpha = 0;
      this._mcFighting._alpha = 0;
      this._mcLocate._alpha = 0;
      this._mcSubtitleBackground._alpha = 0;
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
         if(this._oItem.area == undefined || (Number(_loc4_.area) < 0 || _global.isNaN(_loc4_.area)))
         {
            var _loc5_ = this.api.lang.getMapSubAreaText(_loc4_.id).n;
            this._lblArea.text = _loc5_.substr(0,2) != "//" ? _loc5_ : _loc5_.substr(2);
            this._mcFighting._alpha = !_loc4_.fighting ? 0 : 100;
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
            var ref = this;
            this._mcTooltip.onRollOver = function()
            {
               ref.over({target:this});
            };
            this._mcTooltip.onRollOut = function()
            {
               ref.out({target:this});
            };
            if(_loc4_.prism == 0)
            {
               delete this._oPrismData;
               this._lblPrism.text = "-";
               this._mcLocate._alpha = 0;
               delete this._mcLocate.onRelease;
               delete this._mcLocate.onRollOver;
               delete this._mcLocate.onRollOut;
            }
            else
            {
               this._oPrismData = this.api.lang.getMapText(_loc4_.prism);
               this._lblPrism.text = this._oPrismData.x + ";" + this._oPrismData.y;
               this._mcLocate._alpha = 100;
               this._mcLocate.onRelease = function()
               {
                  ref.click({target:this});
               };
               this._mcLocate.onRollOver = function()
               {
                  ref.over({target:this});
               };
               this._mcLocate.onRollOut = function()
               {
                  ref.out({target:this});
               };
            }
            this._mcAlignmentInteractivity.onRollOver = function()
            {
               ref.over({target:this});
            };
            this._mcAlignmentInteractivity.onRollOut = function()
            {
               ref.out({target:this});
            };
            if(this._mcFighting._alpha == 0)
            {
               if(!this._mcNotAligned.moved)
               {
                  this._mcNotAligned._x += dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
                  this._mcNotAligned.moved = true;
               }
               if(!this._ldrAlignment.moved)
               {
                  this._ldrAlignment._x += dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
                  this._ldrAlignment.moved = true;
               }
               if(!this._mcAlignmentInteractivity.moved)
               {
                  this._mcAlignmentInteractivity._x += dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
                  this._mcAlignmentInteractivity.moved = true;
               }
            }
            else
            {
               this._mcFightingInteractivity.onRollOver = function()
               {
                  ref.over({target:this});
               };
               this._mcFightingInteractivity.onRollOut = function()
               {
                  ref.out({target:this});
               };
               if(this._mcNotAligned.moved)
               {
                  this._mcNotAligned._x -= dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
                  this._mcNotAligned.moved = false;
               }
               if(this._ldrAlignment.moved)
               {
                  this._ldrAlignment._x -= dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
                  this._ldrAlignment.moved = false;
               }
               if(this._mcAlignmentInteractivity.moved)
               {
                  this._mcAlignmentInteractivity._x -= dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
                  this._mcAlignmentInteractivity.moved = false;
               }
            }
            this._mcSubtitleBackground._alpha = 0;
            this._lblSubtitle.text = "";
         }
         else
         {
            this._lblArea.text = "";
            this._ldrAlignment._alpha = 0;
            this._mcNotAligned._alpha = 0;
            this._mcFighting._alpha = 0;
            this._mcLocate._alpha = 0;
            delete this._mcLocate.onRelease;
            delete this._mcAlignmentInteractivity.onRollOver;
            delete this._mcAlignmentInteractivity.onRollOut;
            delete this._mcFightingInteractivity.onRollOver;
            delete this._mcFightingInteractivity.onRollOut;
            delete this._mcTooltip.onRollOver;
            delete this._mcTooltip.onRollOut;
            this._lblPrism.text = "";
            if(this._mcNotAligned.moved)
            {
               this._mcNotAligned._x -= dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
               this._mcNotAligned.moved = false;
            }
            if(this._ldrAlignment.moved)
            {
               this._ldrAlignment._x -= dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
               this._ldrAlignment.moved = false;
            }
            if(this._mcAlignmentInteractivity.moved)
            {
               this._mcAlignmentInteractivity._x -= dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
               this._mcAlignmentInteractivity.moved = false;
            }
            this._mcSubtitleBackground._alpha = 100;
            this._lblSubtitle.text = this.api.lang.getMapAreaText(this._oItem.area).n;
         }
      }
      else if(this._lblArea.text != undefined)
      {
         this._lblArea.text = "";
         this._ldrAlignment._alpha = 0;
         this._mcNotAligned._alpha = 0;
         this._mcFighting._alpha = 0;
         this._mcLocate._alpha = 0;
         this._mcSubtitleBackground._alpha = 0;
         this._lblSubtitle.text = "";
         delete this._mcLocate.onRelease;
         delete this._mcAlignmentInteractivity.onRollOver;
         delete this._mcAlignmentInteractivity.onRollOut;
         delete this._mcFightingInteractivity.onRollOver;
         delete this._mcFightingInteractivity.onRollOut;
         delete this._mcTooltip.onRollOver;
         delete this._mcTooltip.onRollOut;
         this._lblPrism.text = "";
         if(this._mcNotAligned.moved)
         {
            this._mcNotAligned._x -= dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
            this._mcNotAligned.moved = false;
         }
         if(this._ldrAlignment.moved)
         {
            this._ldrAlignment._x -= dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
            this._ldrAlignment.moved = false;
         }
         if(this._mcAlignmentInteractivity.moved)
         {
            this._mcAlignmentInteractivity._x -= dofus["\r\x14"].gapi.controls["\x12\x06"].ConquestZonesViewerAreaItem.MOVING_INDICE;
            this._mcAlignmentInteractivity.moved = false;
         }
      }
   }
   function click(§\x0f\x04§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._mcLocate)
      {
         this.api.kernel.GameManager.updateCompass(this._oPrismData.x,this._oPrismData.y,true);
      }
   }
   function over(§\x0f\x04§)
   {
      switch(_loc2_.target)
      {
         case this._mcAlignmentInteractivity:
            this.api.ui.showTooltip(this.api.lang.getText("ALIGNMENT") + ": " + (this._oItem.alignment <= 0 ? (this._oItem.alignment != -1 ? this.api.lang.getText("NEUTRAL_WORD") : this.api.lang.getText("NON_ALIGNED")) : new dofus.datacenter["\x1e\f"](this._oItem.alignment,1).name),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcFightingInteractivity:
            this.api.ui.showTooltip(this.api.lang.getText("FIGHTING_PRISM"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcLocate:
            this.api.ui.showTooltip(this.api.lang.getText("LOCATE"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcTooltip:
            var _loc3_ = new String();
            if(this._oItem.alignment == this.api.datacenter.Player.alignment.index)
            {
               _loc3_ = this.api.lang.getText("CONQUEST_AREA_OWNED") + "\n";
               if(this._oItem.isVulnerable())
               {
                  _loc3_ += this.api.lang.getText("CONQUEST_AREA_VULNERABLE") + "\n";
               }
               _loc3_ += "\n";
            }
            else if(this._oItem.isCapturable())
            {
               _loc3_ = this.api.lang.getText("CONQUEST_AREA_CAN_BE_CAPTURED") + "\n\n";
            }
            else
            {
               _loc3_ = this.api.lang.getText("CONQUEST_AREA_CANT_BE_CAPTURED") + "\n\n";
            }
            _loc3_ += this.api.lang.getText("CONQUEST_NEAR_ZONES") + ":\n";
            var _loc4_ = this._oItem.getNearZonesList();
            for(var s in _loc4_)
            {
               var _loc5_ = this.api.lang.getMapSubAreaText(_loc4_[s]).n;
               if(_loc5_.substr(0,2) == "//")
               {
                  _loc5_ = _loc5_.substr(2);
               }
               _loc3_ += " - " + _loc5_ + "\n";
            }
            this.api.ui.showTooltip(_loc3_,_root._xmouse,_root._ymouse + 20);
      }
   }
   function out(§\x0f\x04§)
   {
      this.api.ui.hideTooltip();
   }
}
