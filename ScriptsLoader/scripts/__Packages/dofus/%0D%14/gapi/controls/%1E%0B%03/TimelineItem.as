class dofus.§\r\x14§.gapi.controls.§\x1e\x0b\x03§.TimelineItem extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _vcChrono;
   var _ldrSprite;
   var _oData;
   var _mcHealth;
   var _mcBackRect;
   static var CLASS_NAME = "Timeline";
   function TimelineItem()
   {
      super();
   }
   function get chrono()
   {
      return this._vcChrono;
   }
   function get sprite()
   {
      return this._ldrSprite;
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oData = _loc2_;
      this.updateHealth();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls["\x1e\x0b\x03"].TimelineItem.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.loadSprite,params:[this._oData.gfxFile]});
   }
   function loadSprite(§\x1e\x12\x0b§)
   {
      this._ldrSprite.contentPath = _loc2_;
      this._ldrSprite.addEventListener("initialization",this);
      this.api.colors.addSprite(this._ldrSprite,this._oData);
      this.setHealthTeamColor();
      this.updateHealth();
   }
   function setHealthTeamColor()
   {
      var _loc2_ = new Color(this._mcHealth);
      _loc2_.setRGB(dofus.Constants.TEAMS_COLOR[this._oData._team]);
   }
   function updateHealth()
   {
      this._mcHealth._yscale = this._oData._lp / this._oData._lpmax * 100;
   }
   function onRollOver()
   {
      this._mcBackRect._alpha = 50;
      this._oData.mc.onRollOver();
      this._oData.mc.showEffects(true);
   }
   function onRollOut()
   {
      this._mcBackRect._alpha = 100;
      this._oData.mc.onRollOut();
      this._oData.mc.showEffects(false);
   }
   function onRelease()
   {
      if(this._oData.isVisible && (this.api.datacenter.Game.interactionType == 2 || this.api.datacenter.Game.interactionType == 3))
      {
         this._oData.mc.onRelease();
      }
      else
      {
         var _loc2_ = this.gapi.getUIComponent("PlayerInfos");
         var _loc3_ = _loc2_ != undefined && this._oData != _loc2_.data;
         this.gapi.loadUIComponent("PlayerInfos","PlayerInfos",{data:this._oData},{bForceLoad:_loc3_});
      }
   }
   function initialization(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.content;
      _loc3_.attachMovie("staticR","anim",10);
      _loc3_._x = 15;
      _loc3_._y = 32;
      _loc3_._xscale = -80;
      _loc3_._yscale = 80;
   }
}
