class dofus.§\r\x14§.gapi.controls.PointsViewer extends ank.gapi.core.§\x1e\n\f§
{
   var _sBackgroundLink;
   var _nTextColor;
   var _nValue;
   var _txtValue;
   var dispatchEvent;
   static var CLASS_NAME = "PointsViewer";
   function PointsViewer()
   {
      super();
   }
   function set background(§\x1e\x14\x0e§)
   {
      this._sBackgroundLink = _loc2_;
   }
   function set textColor(§\x1e\x1c\x02§)
   {
      this._nTextColor = _loc2_;
   }
   function set value(§\x1e\x1b\n§)
   {
      _loc2_ = Number(_loc2_);
      if(_global.isNaN(_loc2_))
      {
         return;
      }
      this._nValue = _loc2_;
      this.applyValue();
      this.useHandCursor = false;
   }
   function get value()
   {
      return this._nValue;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.PointsViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.attachMovie(this._sBackgroundLink,"_mcBg",this._txtValue.getDepth() - 1);
      this._txtValue.textColor = this._nTextColor;
   }
   function applyValue()
   {
      this._txtValue.text = String(this._nValue);
   }
   function onRollOver()
   {
      this.dispatchEvent({type:"over"});
   }
   function onRollOut()
   {
      this.dispatchEvent({type:"out"});
   }
}
