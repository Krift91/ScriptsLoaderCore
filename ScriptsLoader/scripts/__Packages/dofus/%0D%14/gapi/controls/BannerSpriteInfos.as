class dofus.§\r\x14§.gapi.controls.BannerSpriteInfos extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oSprite;
   var _ldrSprite;
   var _lblRes;
   var _lblName;
   var _lblLevel;
   var _lblLP;
   var _lblAP;
   var _lblMP;
   var _lblAverageDamages;
   var _lblNeutral;
   var _lblEarth;
   var _lblFire;
   var _lblWater;
   var _lblAir;
   var _lblDodgeAP;
   var _lblDodgeMP;
   static var CLASS_NAME = "BannerSpriteInfos";
   function BannerSpriteInfos()
   {
      super();
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oSprite = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.BannerSpriteInfos.CLASS_NAME);
   }
   function update(§\x1e\x19\x15§)
   {
      this.data = _loc2_;
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.initData});
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.initData});
   }
   function addListeners()
   {
      this._ldrSprite.addEventListener("initialization",this);
      this._ldrSprite.addEventListener("complete",this);
   }
   function initTexts()
   {
      this._lblRes.text = this.api.lang.getText("RESISTANCES");
   }
   function initData()
   {
      this._lblName.text = this._oSprite.name;
      this._lblLevel.text = this.api.lang.getText("LEVEL") + " " + this._oSprite.Level;
      this._lblLP.text = !_global.isNaN(this._oSprite.LP) ? this._oSprite.LP : "";
      this._lblAP.text = !_global.isNaN(this._oSprite.AP) ? String(Math.max(0,this._oSprite.AP)) : "";
      this._lblMP.text = !_global.isNaN(this._oSprite.MP) ? String(Math.max(0,this._oSprite.MP)) : "";
      this._lblAverageDamages.text = this._oSprite.averageDamages;
      this._ldrSprite.contentPath = this._oSprite.artworkFile;
      var _loc2_ = this._oSprite.resistances;
      this._lblNeutral.text = _loc2_[0] != undefined ? _loc2_[0] + "%" : "0%";
      this._lblEarth.text = _loc2_[1] != undefined ? _loc2_[1] + "%" : "0%";
      this._lblFire.text = _loc2_[2] != undefined ? _loc2_[2] + "%" : "0%";
      this._lblWater.text = _loc2_[3] != undefined ? _loc2_[3] + "%" : "0%";
      this._lblAir.text = _loc2_[4] != undefined ? _loc2_[4] + "%" : "0%";
      this._lblDodgeAP.text = _loc2_[5] != undefined ? _loc2_[5] + "%" : "0%";
      this._lblDodgeMP.text = _loc2_[6] != undefined ? _loc2_[6] + "%" : "0%";
   }
   function applyColor(§\n\x1d§, §\x1e\t\x03§)
   {
      var _loc4_ = 0;
      switch(_loc3_)
      {
         case 1:
            _loc4_ = this._oSprite.color1;
            break;
         case 2:
            _loc4_ = this._oSprite.color2;
            break;
         case 3:
            _loc4_ = this._oSprite.color3;
      }
      if(_loc4_ == -1 || _loc4_ == undefined)
      {
         return undefined;
      }
      var _loc5_ = (_loc4_ & 0xFF0000) >> 16;
      var _loc6_ = (_loc4_ & 0xFF00) >> 8;
      var _loc7_ = _loc4_ & 0xFF;
      var _loc8_ = new Color(_loc2_);
      var _loc9_ = new Object();
      _loc9_ = {ra:0,ga:0,ba:0,rb:_loc5_,gb:_loc6_,bb:_loc7_};
      _loc8_.setTransform(_loc9_);
   }
   function initialization(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.content;
      var _loc4_ = _loc3_._mcMask;
      _loc3_._x = - _loc4_._x;
      _loc3_._y = - _loc4_._y;
      this._ldrSprite._xscale = 10000 / _loc4_._xscale;
      this._ldrSprite._yscale = 10000 / _loc4_._yscale;
   }
   function complete(§\x1e\x19\x0e§)
   {
      var ref = this;
      this._ldrSprite.content.stringCourseColor = function(§\n\x1d§, §\x1e\t\x07§)
      {
         ref.applyColor(_loc2_,_loc3_);
      };
   }
}
