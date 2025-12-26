class dofus.§\r\x14§.gapi.controls.§\x0b\x0f§.ListInventoryViewerItemNoPrice extends ank.gapi.core.§\x1e\n\f§
{
   var _lblName;
   var _ldrIcon;
   var __width;
   var __height;
   function ListInventoryViewerItemNoPrice()
   {
      super();
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._lblName.text = !_loc2_ ? "" : (_loc4_.Quantity <= 1 ? "" : "x" + _loc4_.Quantity + " ") + _loc4_.name;
         this._ldrIcon.contentPath = !_loc2_ ? "" : _loc4_.iconFile;
         this._ldrIcon.contentParams = _loc4_.params;
         this._lblName.styleName = _loc4_.style != "" ? _loc4_.style + "LeftSmallLabel" : "BrownLeftSmallLabel";
      }
      else if(this._lblName.text != undefined)
      {
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
      this._lblName.setSize(this.__width - 20,this.__height);
   }
}
