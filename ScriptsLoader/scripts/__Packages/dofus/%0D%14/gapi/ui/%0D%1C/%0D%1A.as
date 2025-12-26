class dofus.§\r\x14§.gapi.ui.§\r\x1c§.§\r\x1a§ extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _sTitle;
   var _eaDataProvider;
   var _lstPlayers;
   var _lblWinLoose;
   var _lblName;
   var _lblLevel;
   var _lblKama;
   var _lblHonour;
   var _lblRank;
   var _lblItems;
   var _lblDisgrace;
   static var CLASS_NAME = "GameResultPlayerPVPNoHonour";
   function §\r\x1a§()
   {
      super();
   }
   function set title(§\x1e\f\x0e§)
   {
      this._sTitle = _loc2_;
   }
   function set dataProvider(§\x10\x0b§)
   {
      this._eaDataProvider = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1a"].CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.initData});
      this._lstPlayers._visible = false;
   }
   function addListeners()
   {
   }
   function initTexts()
   {
      this._lblWinLoose.text = this._sTitle;
      this._lblName.text = this.api.lang.getText("NAME_BIG");
      this._lblLevel.text = this.api.lang.getText("LEVEL_SMALL");
      this._lblKama.text = this.api.lang.getText("KAMAS");
      this._lblHonour.text = this.api.lang.getText("HONOUR_POINTS");
      this._lblRank.text = this.api.lang.getText("RANK");
      this._lblItems.text = this.api.lang.getText("WIN_ITEMS");
      if(!this.api.datacenter.Basics.aks_current_server.isHardcore())
      {
         this._lblDisgrace.text = this.api.lang.getText("DISGRACE_POINTS");
      }
      else
      {
         this._lblDisgrace.text = this.api.lang.getText("WIN_XP");
      }
   }
   function initData()
   {
      if(this.api.datacenter.Basics.aks_current_server.isHardcore())
      {
         this._lstPlayers.cellRenderer = "GameResultPlayerPVPNoHonour";
      }
      else
      {
         this._lstPlayers.cellRenderer = "GameResultPlayerPVP";
      }
      var _loc2_ = this._eaDataProvider.length;
      this._lstPlayers.dataProvider = this._eaDataProvider;
      this._lstPlayers.setSize(undefined,Math.min(_loc2_,dofus["\r\x14"].gapi.ui.GameResult.MAX_VISIBLE_PLAYERS_IN_TEAM) * this._lstPlayers.rowHeight);
      this._lstPlayers._visible = true;
   }
   function itemRollOver(§\x1e\x19\x0e§)
   {
   }
   function itemRollOut(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
}
