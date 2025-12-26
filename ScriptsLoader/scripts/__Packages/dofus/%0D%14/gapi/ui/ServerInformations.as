class dofus.§\r\x14§.gapi.ui.ServerInformations extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nServerID;
   var _sServer;
   var _mcOk;
   var _mcBack;
   var _btnMoreInfo;
   var _ldrSprite;
   var _lblSelectedServer;
   var _lblStatus;
   var _lblPopulation;
   var _lblCommunity;
   var _lblHowOld;
   var _lblServerType;
   var _taDescription;
   var _lblMoreInfo;
   var _lblOk;
   var _lblBack;
   var _lblSelectedServerName;
   var _lblStatusValue;
   var _lblPopulationValue;
   var _lblCommunityValue;
   var _lblHowOldValue;
   var dispatchEvent;
   static var CLASS_NAME = "ServerInformations";
   var _bShowDescription = false;
   function ServerInformations()
   {
      super();
   }
   function set server(§\x1e\x1d\x11§)
   {
      this._nServerID = _loc2_;
      this._sServer = _global.API.datacenter.Basics.aks_servers.findFirstItem("id",_loc2_).item;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.ServerInformations.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initText});
      this.addToQueue({object:this,method:this.initData});
   }
   function addListeners()
   {
      this._mcOk.onRelease = function()
      {
         this._parent.click({target:this});
      };
      this._mcBack.onRelease = function()
      {
         this._parent.click({target:this});
      };
      this._btnMoreInfo.onRelease = function()
      {
         this._parent.click({target:this});
      };
      this._ldrSprite.addEventListener("error",this);
      this._ldrSprite.addEventListener("initialization",this);
   }
   function initText()
   {
      this._lblSelectedServer.text = this.api.lang.getText("CHOOSEN_SERVER") + " :";
      this._lblStatus.text = this.api.lang.getText("SERVER_STATUS");
      this._lblPopulation.text = this.api.lang.getText("POPULATION");
      this._lblCommunity.text = this.api.lang.getText("COMMUNITY");
      this._lblHowOld.text = this.api.lang.getText("OPENING_DATE");
      this._lblServerType.text = this.api.lang.getText("SERVER_GAME_TYPE",[this.api.lang.getText("SERVER_GAME_TYPE_" + this._sServer.typeNum)]);
      if(this._sServer.isHardcore())
      {
         this._taDescription.text = this.api.lang.getText("SERVER_RULES_" + this._sServer.typeNum);
         this._lblMoreInfo.text = this.api.lang.getText("SHORTCUTS_DESCRIPTION");
         this._bShowDescription = false;
      }
      else
      {
         this._taDescription.text = this._sServer.description;
         this._lblMoreInfo.text = this.api.lang.getText("RULES_SHORTCUT");
         this._bShowDescription = true;
      }
      this._lblOk.text = this.api.lang.getText("OK");
      this._lblBack.text = this.api.lang.getText("BACK");
      this._ldrSprite.contentPath = dofus.Constants.SERVER_SYMBOL_PATH + this._sServer.id + ".swf";
   }
   function initData()
   {
      this._lblSelectedServerName.text = this._sServer.label;
      this._lblStatusValue.text = this._sServer.stateStr;
      this._lblPopulationValue.text = this._sServer.populationStr;
      this._lblCommunityValue.text = this._sServer.communityStr;
      this._lblHowOldValue.text = this._sServer.dateStr;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_mcOk":
            this.dispatchEvent({type:"serverSelected",value:this._nServerID});
            break;
         case "_mcBack":
            this.dispatchEvent({type:"canceled"});
            break;
         case "_btnMoreInfo":
            this._bShowDescription = !this._bShowDescription;
            if(this._bShowDescription)
            {
               this._taDescription.text = this._sServer.description;
               this._lblMoreInfo.text = this.api.lang.getText("RULES_SHORTCUT");
               break;
            }
            this._taDescription.text = this.api.lang.getText("SERVER_RULES_" + this._sServer.getRulesType());
            this._lblMoreInfo.text = this.api.lang.getText("SHORTCUTS_DESCRIPTION");
            break;
      }
   }
   function initialization(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.clip;
      _loc3_._xscale = _loc3_._yscale = 136;
   }
   function error(§\x1e\x19\x0e§)
   {
      this._ldrSprite.contentPath = dofus.Constants.SERVER_SYMBOL_PATH + "0.swf";
   }
}
