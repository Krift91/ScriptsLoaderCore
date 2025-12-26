class dofus.§\r\x14§.gapi.controls.§\x0b\x0f§.ListInventoryViewerItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _lblPrice;
   var _lblName;
   var __width;
   var __height;
   var _ldrIcon;
   function ListInventoryViewerItem()
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
         this._lblPrice.text = !_loc2_ ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.price).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
         var _loc5_ = this._lblPrice.textWidth;
         this._lblName.text = !_loc2_ ? "" : (_loc4_.Quantity <= 1 ? "" : "x" + _loc4_.Quantity + " ") + _loc4_.name;
         this._lblName.setSize(this.__width - _loc5_ - 30,this.__height);
         this._lblName.styleName = _loc4_.style != "" ? _loc4_.style + "LeftSmallLabel" : "BrownLeftSmallLabel";
         this._ldrIcon.contentPath = !_loc2_ ? "" : _loc4_.iconFile;
         this._ldrIcon.contentParams = _loc4_.params;
      }
      else if(this._lblPrice.text != undefined)
      {
         this._lblPrice.text = "";
         this._lblName.text = "";
         this._ldrIcon.contentPath = "";
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
      this._lblName.setSize(this.__width - 50,this.__height);
      this._lblPrice.setSize(this.__width - 20,this.__height);
   }
}
