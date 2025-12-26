class dofus.§\r\x14§.gapi.controls.§\x1e\x0b\f§.§\x1e\x0b\x0b§ extends ank.gapi.core.§\x1e\n\f§
{
   var _oData;
   var _ldrSprite;
   function §\x1e\x0b\x0b§()
   {
      super();
   }
   function set data(§\x1e\x19\x15§)
   {
      if(_loc2_ != this._oData)
      {
         this._oData = _loc2_;
         this.addToQueue({object:this,method:this.setSprite});
      }
   }
   function init()
   {
      super.init(false);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._ldrSprite.addEventListener("initialization",this);
   }
   function setSprite()
   {
      this._ldrSprite.contentPath = this._oData.gfxFile != undefined ? this._oData.gfxFile : "";
   }
   function initialization(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.clip;
      _global.GAC.addSprite(_loc3_,this._oData);
      _loc3_.attachMovie("staticR","mcAnim",10);
      _loc3_._xscale = -80;
      _loc3_._yscale = 80;
   }
}
