class dofus.§\r\x14§.gapi.controls.Card extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _sName;
   var _nBackground;
   var _sGfxFile;
   var _lblName;
   var _ldrBack;
   var _ldrGfx;
   static var CLASS_NAME = "Card";
   function Card()
   {
      super();
   }
   function set name(§\x1e\x0f\x16§)
   {
      this._sName = _loc2_;
   }
   function set background(§\b\n§)
   {
      this._nBackground = _loc2_;
   }
   function set gfxFile(§\x1e\x11\x1c§)
   {
      this._sGfxFile = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.Card.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initData});
   }
   function initData()
   {
      this._lblName.text = this._sName;
      this._ldrBack.contentPath = dofus.Constants.CARDS_PATH + this._nBackground + ".swf";
      this._ldrGfx.contentPath = this._sGfxFile;
   }
}
