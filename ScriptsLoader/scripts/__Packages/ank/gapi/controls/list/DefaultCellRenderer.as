class ank.gapi.controls.list.DefaultCellRenderer extends ank.gapi.core.§\x1e\n\f§
{
   var _lblText;
   var __width;
   var __height;
   function DefaultCellRenderer()
   {
      super();
   }
   function setState(§\x1e\r\t§)
   {
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._lblText.text = _loc3_;
      }
      else if(this._lblText.text != undefined)
      {
         this._lblText.text = "";
      }
   }
   function init()
   {
      super.init(false);
   }
   function createChildren()
   {
      this.attachMovie("Label","_lblText",10,{styleName:this.getStyle().defaultstyle});
   }
   function size()
   {
      super.size();
      this._lblText.setSize(this.__width,this.__height);
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      this._lblText.styleName = _loc2_.defaultstyle;
   }
}
