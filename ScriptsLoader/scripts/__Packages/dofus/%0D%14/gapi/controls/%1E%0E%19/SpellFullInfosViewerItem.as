class dofus.§\r\x14§.gapi.controls.§\x1e\x0e\x19§.SpellFullInfosViewerItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcArea;
   var _oItem;
   var _lbl;
   var _ctrElement;
   var _lblArea;
   var __width;
   var __height;
   function SpellFullInfosViewerItem()
   {
      super();
      this._mcArea._visible = false;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._oItem = _loc4_;
         if(_loc4_.fx.description == undefined && _loc4_.description == undefined)
         {
            this._lbl.text = _loc3_;
         }
         else
         {
            if(_loc4_.fx.description != undefined)
            {
               this._lbl.text = _loc4_.fx.description;
            }
            else if(_loc4_.description != undefined)
            {
               this._lbl.text = _loc4_.description;
            }
            var _loc5_ = undefined;
            if(_loc4_.fx.element != undefined)
            {
               _loc5_ = _loc4_.fx.element;
            }
            else if(_loc4_.element != undefined)
            {
               _loc5_ = _loc4_.element;
            }
            if(_loc5_ != undefined)
            {
               switch(_loc5_)
               {
                  case "N":
                     this._ctrElement.contentPath = "IconNeutralDommage";
                     break;
                  case "F":
                     this._ctrElement.contentPath = "IconFireDommage";
                     break;
                  case "A":
                     this._ctrElement.contentPath = "IconAirDommage";
                     break;
                  case "W":
                     this._ctrElement.contentPath = "IconWaterDommage";
                     break;
                  case "E":
                     this._ctrElement.contentPath = "IconEarthDommage";
                     break;
                  default:
                     this._ctrElement.contentPath = "";
               }
            }
            else if(_loc4_.fx.icon != undefined)
            {
               this._ctrElement.contentPath = _loc4_.fx.icon;
            }
            else if(_loc4_.icon != undefined)
            {
               this._ctrElement.contentPath = _loc4_.icon;
            }
            else
            {
               this._ctrElement.contentPath = "";
            }
         }
         if(_loc4_.ar > 1)
         {
            this._mcArea._visible = true;
            this._mcArea.onRollOver = function()
            {
               this._parent.onTooltipOver();
            };
            this._mcArea.onRollOut = function()
            {
               this._parent.onTooltipOut();
            };
            this._lblArea.text = (_loc4_.ar != 63 ? _loc4_.ar : _global.API.lang.getText("INFINIT_SHORT")) + " (" + _loc4_.at + ")";
         }
         else
         {
            this._mcArea._visible = false;
            this._mcArea.onRollOver = undefined;
            this._mcArea.onRollOut = undefined;
            this._lblArea.text = "";
         }
      }
      else if(this._lbl.text != undefined)
      {
         this._oItem = undefined;
         this._lbl.text = "";
         this._lblArea.text = "";
         this._mcArea._visible = false;
         this._ctrElement.contentPath = "";
      }
      else
      {
         this._oItem = undefined;
      }
   }
   function init()
   {
      super.init(false);
   }
   function createChildren()
   {
      this.arrange();
   }
   function size()
   {
      super.size();
      this.addToQueue({object:this,method:this.arrange});
   }
   function arrange()
   {
      this._lbl.setSize(this.__width - (this._oItem.ar <= 1 ? 20 : 78),this.__height);
   }
   function onTooltipOver()
   {
      _global.API.ui.showTooltip(_global.API.lang.getText("EFFECT_SHAPE_TYPE_" + this._oItem.at,[this._oItem.ar != 63 ? this._oItem.ar : _global.API.lang.getText("INFINIT")]),this._mcArea,-20);
   }
   function onTooltipOut()
   {
      _global.API.ui.hideTooltip();
   }
}
