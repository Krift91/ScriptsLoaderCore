class dofus.§\r\x14§.gapi.controls.§\x1d\x0f§.ArtworkRotationItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcAlphaMask;
   var _nSex;
   var _nScale;
   var _ldrArtwork;
   var onEnterFrame;
   var _oLastTransform;
   static var CLASS_NAME = "ArtworkRotationItem";
   static var RED = [0,45,89,134,178];
   static var GREEN = [0,35,70,106,141];
   static var BLUE = [0,25,50,75,100];
   static var PERCENT = [100,75,50,25,0];
   function ArtworkRotationItem()
   {
      super();
      this._mcAlphaMask._visible = false;
   }
   function set sex(§\x1e\x1d\x0f§)
   {
      this._nSex = Number(_loc2_);
   }
   function set scale(§\x1e\x1d\x1a§)
   {
      this._nScale = Number(_loc2_);
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.CLASS_NAME);
   }
   function loadArtwork(§\x07\x01§)
   {
      var _loc3_ = dofus.Constants.GUILDS_BIG_PATH + _loc2_ + this._nSex + ".swf";
      this._ldrArtwork.addEventListener("initialization",this);
      this._ldrArtwork.contentPath = _loc3_;
      this._mcAlphaMask.cacheAsBitmap = true;
      this._mcAlphaMask._xscale = this._mcAlphaMask._yscale = 85;
      this._ldrArtwork.setMask(this._mcAlphaMask);
   }
   function colorize(§\x16\x1d§, §\x1c\x11§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      var nLen = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.RED.length;
      var cTmp = new Color(this._ldrArtwork);
      var oTmp = new Object();
      var nI = !_loc2_ ? 0 : nLen - 1;
      if(!_loc3_)
      {
         oTmp.ra = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.PERCENT[nI];
         oTmp.rb = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.RED[nI];
         oTmp.ga = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.PERCENT[nI];
         oTmp.gb = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.GREEN[nI];
         oTmp.ba = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.PERCENT[nI];
         oTmp.bb = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.BLUE[nI];
         cTmp.setTransform(oTmp);
      }
      else
      {
         var nInc = !_loc2_ ? 1 : -1;
         this.onEnterFrame = function()
         {
            oTmp.ra = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.PERCENT[nI];
            oTmp.rb = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.RED[nI];
            oTmp.ga = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.PERCENT[nI];
            oTmp.gb = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.GREEN[nI];
            oTmp.ba = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.PERCENT[nI];
            oTmp.bb = dofus["\r\x14"].gapi.controls["\x1d\x0f"].ArtworkRotationItem.BLUE[nI];
            cTmp.setTransform(oTmp);
            nI += nInc;
            if(nI >= nLen || nI < 0)
            {
               this._oLastTransform = oTmp;
               delete this.onEnterFrame;
            }
         };
      }
   }
   function initialization(§\x1e\x19\x0e§)
   {
      _loc2_.clip._xscale = _loc2_.clip._yscale = this._nScale;
   }
}
