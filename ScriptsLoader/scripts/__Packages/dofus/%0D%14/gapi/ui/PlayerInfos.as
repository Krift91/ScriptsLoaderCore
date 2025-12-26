class dofus.§\r\x14§.gapi.ui.PlayerInfos extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _btnClose;
   var _winBackground;
   var _lstEffects;
   static var CLASS_NAME = "PlayerInfos";
   function PlayerInfos()
   {
      super();
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oData = _loc2_;
   }
   function get data()
   {
      return this._oData;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.PlayerInfos.CLASS_NAME);
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
   }
   function initData()
   {
      if(this._oData != undefined)
      {
         this._winBackground.title = this.api.lang.getText("EFFECTS") + " " + this._oData.name + " (" + this.api.lang.getText("LEVEL_SMALL") + this._oData.Level + ")";
         this._lstEffects.dataProvider = this._oData.EffectsManager.getEffects();
      }
   }
   function quit()
   {
      this.unloadThis();
   }
   function click(§\x1e\x19\x0e§)
   {
      this.unloadThis();
   }
}
