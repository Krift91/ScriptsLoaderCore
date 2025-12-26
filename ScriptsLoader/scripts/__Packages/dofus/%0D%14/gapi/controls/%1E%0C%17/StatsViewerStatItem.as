class dofus.§\r\x14§.gapi.controls.§\x1e\f\x17§.StatsViewerStatItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _mcCatBackground;
   var _ldrIcon;
   var _lblCatName;
   var _lblName;
   var _lblBase;
   var _lblItems;
   var _lblAlign;
   var _lblBoost;
   var _lblTotal;
   function StatsViewerStatItem()
   {
      super();
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
         if(_loc4_.isCat)
         {
            this._mcCatBackground._visible = true;
            this._ldrIcon.contentPath = "";
            this._lblCatName.text = _loc4_.name;
            this._lblName.text = "";
            this._lblBase.text = "";
            this._lblItems.text = "";
            this._lblAlign.text = "";
            this._lblBoost.text = "";
            this._lblTotal.text = "";
         }
         else
         {
            this._mcCatBackground._visible = false;
            if(_loc4_.p != undefined)
            {
               this._ldrIcon.contentPath = _loc4_.p;
            }
            else
            {
               this._ldrIcon.contentPath = "";
            }
            this._lblCatName.text = "";
            this._lblName.text = _loc4_.name;
            if(_loc4_.s != 0)
            {
               this._lblBase.text = _loc4_.s;
               if(_loc4_.s > 0)
               {
                  this._lblBase.styleName = "GreenCenterSmallLabel";
               }
               else
               {
                  this._lblBase.styleName = "RedCenterSmallLabel";
               }
            }
            else
            {
               this._lblBase.text = "-";
               this._lblBase.styleName = "BrownCenterSmallLabel";
            }
            if(_loc4_.i != 0)
            {
               this._lblItems.text = _loc4_.i;
               if(_loc4_.i > 0)
               {
                  this._lblItems.styleName = "GreenCenterSmallLabel";
               }
               else
               {
                  this._lblItems.styleName = "RedCenterSmallLabel";
               }
            }
            else
            {
               this._lblItems.text = "-";
               this._lblItems.styleName = "BrownCenterSmallLabel";
            }
            if(_loc4_.d != 0)
            {
               this._lblAlign.text = _loc4_.d;
               if(_loc4_.d > 0)
               {
                  this._lblAlign.styleName = "GreenCenterSmallLabel";
               }
               else
               {
                  this._lblAlign.styleName = "RedCenterSmallLabel";
               }
            }
            else
            {
               this._lblAlign.text = "-";
               this._lblAlign.styleName = "BrownCenterSmallLabel";
            }
            if(_loc4_.b != 0)
            {
               this._lblBoost.text = _loc4_.b;
               if(_loc4_.b > 0)
               {
                  this._lblBoost.styleName = "GreenCenterSmallLabel";
               }
               else
               {
                  this._lblBoost.styleName = "RedCenterSmallLabel";
               }
            }
            else
            {
               this._lblBoost.text = "-";
               this._lblBoost.styleName = "BrownCenterSmallLabel";
            }
            var _loc5_ = _loc4_.b + _loc4_.d + _loc4_.i + _loc4_.s;
            if(_loc5_ != 0)
            {
               this._lblTotal.text = String(_loc5_);
               if(_loc5_ > 0)
               {
                  this._lblTotal.styleName = "GreenCenterSmallLabel";
               }
               else
               {
                  this._lblTotal.styleName = "RedCenterSmallLabel";
               }
            }
            else
            {
               this._lblTotal.text = "-";
               this._lblTotal.styleName = "BrownCenterSmallLabel";
            }
         }
      }
      else if(this._lblName.text != undefined)
      {
         this._mcCatBackground._visible = false;
         this._ldrIcon.contentPath = "";
         this._lblCatName.text = "";
         this._lblName.text = "";
         this._lblBase.text = "";
         this._lblBase.styleName = "BrownCenterSmallLabel";
         this._lblItems.text = "";
         this._lblItems.styleName = "BrownCenterSmallLabel";
         this._lblAlign.text = "";
         this._lblAlign.styleName = "BrownCenterSmallLabel";
         this._lblBoost.text = "";
         this._lblBoost.styleName = "BrownCenterSmallLabel";
         this._lblTotal.text = "";
         this._lblTotal.styleName = "BrownCenterSmallLabel";
      }
   }
   function init()
   {
      super.init(false);
      this._mcCatBackground._visible = false;
   }
}
