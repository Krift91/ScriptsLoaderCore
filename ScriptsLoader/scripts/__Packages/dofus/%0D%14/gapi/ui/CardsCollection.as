class dofus.§\r\x14§.gapi.ui.CardsCollection extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnClose;
   var _ctr1;
   var _ctr2;
   var _ctr3;
   var _ctr4;
   var _ctr5;
   var _ctr6;
   var _ctrMain;
   static var CLASS_NAME = "CardsCollection";
   function CardsCollection()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.CardsCollection.CLASS_NAME);
   }
   function destroy()
   {
      this.gapi.hideTooltip();
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
   }
   function initTexts()
   {
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      var _loc2_ = 1;
      while(_loc2_ <= 9)
      {
         var _loc3_ = this["_ctr" + _loc2_];
         _loc3_.addEventListener("click",this);
         _loc3_.addEventListener("over",this);
         _loc3_.addEventListener("out",this);
         _loc2_ = _loc2_ + 1;
      }
   }
   function initData()
   {
      this._ctr1.contentData = {iconFile:"Card",params:{name:"La carte",background:0,gfxFile:dofus.Constants.ARTWORKS_BIG_PATH + (random(150) + 1000) + ".swf"}};
      this._ctr2.contentData = {iconFile:"Card",params:{name:"Une autre carte",background:1,gfxFile:dofus.Constants.ARTWORKS_BIG_PATH + (random(150) + 1000) + ".swf"}};
      this._ctr3.contentData = {iconFile:"Card",params:{name:"Le monstre",background:2,gfxFile:dofus.Constants.ARTWORKS_BIG_PATH + (random(150) + 1000) + ".swf"}};
      this._ctr4.contentData = {iconFile:"Card",params:{name:"Lee",background:3,gfxFile:dofus.Constants.ARTWORKS_BIG_PATH + (random(150) + 1000) + ".swf"}};
      this._ctr5.contentData = {iconFile:"Card",params:{name:"Gross",background:4,gfxFile:dofus.Constants.ARTWORKS_BIG_PATH + (random(150) + 1000) + ".swf"}};
      this._ctr6.contentData = {iconFile:"Card",params:{name:"\n\x01",background:5,gfxFile:dofus.Constants.ARTWORKS_BIG_PATH + (random(150) + 1000) + ".swf"}};
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
            this.callClose();
            break;
         case "_ctr1":
         case "_ctr2":
         case "_ctr3":
         case "_ctr4":
         case "_ctr5":
         case "_ctr6":
         case "_ctr7":
         case "_ctr8":
         case "_ctr9":
            var _loc3_ = _loc2_.target.contentData;
            if(_loc3_ != undefined)
            {
               this._ctrMain.forceNextLoad();
               this._ctrMain.contentData = _loc3_;
               break;
            }
      }
   }
}
