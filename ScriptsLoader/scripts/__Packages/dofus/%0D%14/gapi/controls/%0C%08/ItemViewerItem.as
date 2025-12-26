class dofus.§\r\x14§.gapi.controls.§\f\b§.ItemViewerItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lbl;
   var _btn;
   var __width;
   var __height;
   var _ldr;
   function ItemViewerItem()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      this._oItem = _loc4_;
      if(_loc2_)
      {
         this.showButton(false);
         this.showLoader(false);
         if(_loc4_ instanceof dofus.datacenter["\x0f\r"])
         {
            this._lbl.text = _loc4_.description;
            switch(_loc4_.operator)
            {
               case "+":
                  this._lbl.styleName = "GreenLeftSmallLabel";
                  break;
               case "-":
                  this._lbl.styleName = "RedLeftSmallLabel";
                  break;
               default:
                  this._lbl.styleName = "BrownLeftSmallLabel";
            }
            var _loc0_ = null;
            if((_loc0_ = _loc4_.type) !== 995)
            {
               this.showButton(false,"");
               this._btn.removeEventListener();
            }
            else
            {
               this.showButton(true,"ItemViewerUseHand");
               this._btn.addEventListener("click",this);
            }
            if(_loc4_.element != undefined)
            {
               switch(_loc4_.element)
               {
                  case "W":
                     this.showLoader(true,"IconWaterDommage");
                     break;
                  case "F":
                     this.showLoader(true,"IconFireDommage");
                     break;
                  case "E":
                     this.showLoader(true,"IconEarthDommage");
                     break;
                  case "A":
                     this.showLoader(true,"IconAirDommage");
                     break;
                  case "N":
                     this.showLoader(true,"IconNeutralDommage");
               }
            }
            else
            {
               switch(Number(_loc4_.characteristic))
               {
                  case 13:
                     this.showLoader(true,"IconWaterBonus");
                     break;
                  case 35:
                     this.showLoader(true,"IconWater");
                     break;
                  case 15:
                     this.showLoader(true,"IconFireBonus");
                     break;
                  case 34:
                     this.showLoader(true,"IconFire");
                     break;
                  case 10:
                     this.showLoader(true,"IconEarthBonus");
                     break;
                  case 33:
                     this.showLoader(true,"IconEarth");
                     break;
                  case 14:
                     this.showLoader(true,"IconAirBonus");
                     break;
                  case 36:
                     this.showLoader(true,"IconAir");
                     break;
                  case 37:
                     this.showLoader(true,"IconNeutral");
                     break;
                  case 1:
                     this.showLoader(true,"Star");
                     break;
                  case 11:
                     this.showLoader(true,"IconVita");
                     break;
                  case 12:
                     this.showLoader(true,"IconWisdom");
                     break;
                  case 44:
                     this.showLoader(true,"IconInit");
                     break;
                  case 48:
                     this.showLoader(true,"IconPP");
                     break;
                  case 2:
                     this.showLoader(true,"KamaSymbol");
                     break;
                  case 23:
                     this.showLoader(true,"IconMP");
               }
            }
         }
         else
         {
            this._lbl.text = _loc3_;
            this._lbl.styleName = "BrownLeftSmallLabel";
         }
      }
      else if(this._lbl.text != undefined)
      {
         this.showButton(false,"");
         this._btn.removeEventListener();
         this._lbl.text = "";
         this.showLoader(false,"");
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
      this._lbl.setSize(this.__width,this.__height);
   }
   function showButton(§\x15\x0e§, §\x1e\x11\x0e§)
   {
      this._btn._visible = _loc2_;
      this._btn.icon = _loc3_;
      this.moveLabel(!_loc2_ ? 0 : 20);
      if(_loc2_ == false)
      {
         this._btn.removeEventListener("click",this);
      }
   }
   function showLoader(§\x15\x0e§, §\x1e\x11\x0e§)
   {
      this._ldr._visible = _loc2_;
      this._ldr.contentPath = _loc3_;
      this._ldr._x = this.__width - 17;
   }
   function moveLabel(§\x1e\t\x14§)
   {
      this._lbl._x = _loc2_;
   }
   function click()
   {
      this._mcList.gapi.api.network.Mount.data(this._oItem.param1,this._oItem.param2);
   }
}
