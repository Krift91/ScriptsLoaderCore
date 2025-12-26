class dofus.§\r\x14§.gapi.controls.§\x1e\x0b§.AlignmentViewerTreeItem extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _ldrIcon;
   var _nLdrX;
   var _lblName;
   var __width;
   var _mcBackgroundLight;
   var _mcBackgroundDark;
   var _lblLevel;
   var _nLblX;
   static var DEPTH_X_OFFSET = 10;
   function AlignmentViewerTreeItem()
   {
      super();
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         var _loc5_ = dofus["\r\x14"].gapi.controls["\x1e\x0b"].AlignmentViewerTreeItem.DEPTH_X_OFFSET * _loc4_.depth;
         if(_loc4_.data instanceof dofus.datacenter["\x1e\f"])
         {
            this._ldrIcon._x = this._nLdrX + _loc5_;
            this._lblName._x = this._nLdrX + _loc5_;
            this._lblName.width = this.__width - this._lblName._x;
            this._lblName.styleName = "BrownLeftMediumBoldLabel";
            this._mcBackgroundLight._visible = false;
            this._mcBackgroundDark._visible = true;
            this._ldrIcon.contentPath = "";
            this._lblName.text = _loc4_.data.name;
            this._lblLevel.text = "";
         }
         if(_loc4_.data instanceof dofus.datacenter["\x1e\x18\x05"])
         {
            this._ldrIcon._x = this._nLdrX + _loc5_;
            this._lblName._x = this._nLblX + _loc5_;
            this._lblName.width = this.__width - this._lblName._x;
            this._lblName.styleName = "BrownLeftSmallBoldLabel";
            this._mcBackgroundLight._visible = false;
            this._mcBackgroundDark._visible = false;
            this._ldrIcon.contentPath = _loc4_.data.iconFile;
            this._lblName.text = _loc4_.data.name;
            this._lblLevel.text = "";
         }
         else if(_loc4_.data instanceof dofus.datacenter.Specialization)
         {
            this._ldrIcon._x = this._nLdrX + _loc5_;
            this._lblName._x = this._nLblX + _loc5_;
            this._lblName.width = this.__width - this._lblName._x;
            this._lblName.styleName = "BrownLeftSmallLabel";
            this._mcBackgroundLight._visible = false;
            this._mcBackgroundDark._visible = false;
            this._ldrIcon.contentPath = "";
            this._lblLevel.text = _loc4_.data.alignment.value <= 0 ? "- " : _loc4_.data.alignment.value + " ";
            this._lblName.text = _loc4_.data.name;
            this._lblLevel.setSize(this.__width);
            this._lblName.setSize(this.__width - this._lblName._x - this._lblLevel.textWidth - 30);
         }
      }
      else if(this._lblName.text != undefined)
      {
         this._ldrIcon._x = this._nLdrX;
         this._lblName._x = this._nLblX;
         this._ldrIcon.contentPath = "";
         this._lblName.text = "";
         this._lblLevel.text = "";
         this._mcBackgroundLight._visible = false;
         this._mcBackgroundDark._visible = false;
      }
   }
   function init()
   {
      super.init(false);
      this._nLdrX = this._ldrIcon._x;
      this._nLblX = this._lblName._x;
   }
}
