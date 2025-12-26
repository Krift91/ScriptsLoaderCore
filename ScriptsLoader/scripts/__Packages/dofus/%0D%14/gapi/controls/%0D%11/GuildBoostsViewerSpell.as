class dofus.§\r\x14§.gapi.controls.§\r\x11§.GuildBoostsViewerSpell extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lblName;
   var _lblLevel;
   var _ldrIcon;
   var _mcBorder;
   var _mcBack;
   var _btnBoost;
   var _mcCross;
   static var COLOR_TRANSFORM = {ra:60,rb:0,ga:60,gb:0,ba:60,bb:0};
   static var NO_COLOR_TRANSFORM = {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0};
   function GuildBoostsViewerSpell()
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
         this._oItem = _loc4_;
         this._lblName.text = _loc4_.name;
         this._lblLevel.text = _loc4_.level == 0 ? "-" : _loc4_.level;
         this._ldrIcon.contentPath = _loc4_.iconFile;
         this._mcBorder._visible = true;
         this._mcBack._visible = true;
         var _loc5_ = this._mcList.gapi.api.datacenter.Player.guildInfos;
         this._btnBoost._visible = _loc5_.playerRights.canManageBoost && _loc5_.canBoost("s",_loc4_.ID);
         if(_loc4_.level == 0)
         {
            this.setMovieClipTransform(this._ldrIcon,dofus["\r\x14"].gapi.controls["\r\x11"].GuildBoostsViewerSpell.COLOR_TRANSFORM);
            this._mcCross._visible = true;
         }
         else
         {
            this.setMovieClipTransform(this._ldrIcon,dofus["\r\x14"].gapi.controls["\r\x11"].GuildBoostsViewerSpell.NO_COLOR_TRANSFORM);
            this._mcCross._visible = false;
         }
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._lblLevel.text = "";
         this._ldrIcon.contentPath = "";
         this._mcBorder._visible = false;
         this._mcBack._visible = false;
         this._mcCross._visible = false;
         this._btnBoost._visible = false;
         this.setMovieClipTransform(this._ldrIcon,dofus["\r\x14"].gapi.controls["\r\x11"].GuildBoostsViewerSpell.NO_COLOR_TRANSFORM);
      }
   }
   function init()
   {
      super.init(false);
      this._mcBorder._visible = false;
      this._mcBack._visible = false;
      this._mcCross._visible = false;
      this._btnBoost._visible = false;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._btnBoost.addEventListener("click",this);
      this._btnBoost.addEventListener("over",this);
      this._btnBoost.addEventListener("out",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      this._mcList.gapi.api.network.Guild.boostSpell(this._oItem.ID);
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._mcList.gapi.api;
      var _loc4_ = _loc3_.datacenter.Player.guildInfos.getBoostCostAndCountForCharacteristic("s",this._oItem.ID);
      this._mcList.gapi.showTooltip(_loc3_.lang.getText("COST") + " : " + _loc4_.cost,_loc2_.target,-20);
   }
   function out(§\x1e\x19\x0e§)
   {
      this._mcList.gapi.hideTooltip();
   }
}
