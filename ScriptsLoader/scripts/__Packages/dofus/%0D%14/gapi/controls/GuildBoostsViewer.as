class dofus.§\r\x14§.gapi.controls.GuildBoostsViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnBoostWisdom;
   var _btnBoostPod;
   var _btnBoostPop;
   var _btnBoostPP;
   var _btnHireTaxCollector;
   var _lstSpells;
   var _lblLP;
   var _lblBonus;
   var _lblBoostPP;
   var _lblBoostWisdom;
   var _lblBoostPod;
   var _lblBoostPop;
   var _lblBoostPoints;
   var _lblLevel;
   var _lblTaxSpells;
   var _lblTaxCharacteristics;
   var _lblLPValue;
   var _lblBonusValue;
   var _lblBoostPodValue;
   var _lblBoostPPValue;
   var _lblBoostWisdomValue;
   var _lblBoostPopValue;
   var _lblTaxCount;
   var _lblBoostPointsValue;
   static var CLASS_NAME = "GuildBoostsViewer";
   function GuildBoostsViewer()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.GuildBoostsViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this._btnBoostWisdom._visible = false;
      this._btnBoostPod._visible = false;
      this._btnBoostPop._visible = false;
      this._btnBoostPP._visible = false;
      this._btnHireTaxCollector._visible = false;
   }
   function addListeners()
   {
      this._lstSpells.addEventListener("itemSelected",this);
      this._btnBoostPP.addEventListener("click",this);
      this._btnBoostWisdom.addEventListener("click",this);
      this._btnBoostPod.addEventListener("click",this);
      this._btnBoostPop.addEventListener("click",this);
      this._btnHireTaxCollector.addEventListener("click",this);
      this._btnBoostPP.addEventListener("over",this);
      this._btnBoostWisdom.addEventListener("over",this);
      this._btnBoostPod.addEventListener("over",this);
      this._btnBoostPop.addEventListener("over",this);
      this._btnHireTaxCollector.addEventListener("over",this);
      this._btnBoostPP.addEventListener("out",this);
      this._btnBoostWisdom.addEventListener("out",this);
      this._btnBoostPod.addEventListener("out",this);
      this._btnBoostPop.addEventListener("out",this);
      this._btnHireTaxCollector.addEventListener("out",this);
   }
   function initTexts()
   {
      this._lblLP.text = this.api.lang.getText("LIFEPOINTS");
      this._lblBonus.text = this.api.lang.getText("DAMAGES_BONUS");
      this._lblBoostPP.text = this.api.lang.getText("DISCERNMENT");
      this._lblBoostWisdom.text = this.api.lang.getText("WISDOM");
      this._lblBoostPod.text = this.api.lang.getText("WEIGHT");
      this._lblBoostPop.text = this.api.lang.getText("TAX_COLLECTOR_COUNT");
      this._lblBoostPoints.text = this.api.lang.getText("GUILD_BONUSPOINTS");
      this._lblLevel.text = this.api.lang.getText("LEVEL_SMALL");
      this._lblTaxSpells.text = this.api.lang.getText("GUILD_TAXSPELLS");
      this._lblTaxCharacteristics.text = this.api.lang.getText("GUILD_TAXCHARACTERISTICS");
      this._btnHireTaxCollector.label = this.api.lang.getText("HIRE_TAXCOLLECTOR");
   }
   function updateData()
   {
      this.gapi.hideTooltip();
      var _loc2_ = this.api.datacenter.Player.guildInfos;
      this._lblLPValue.text = _loc2_.taxLp + "";
      this._lblBonusValue.text = _loc2_.taxBonus + "";
      this._lblBoostPodValue.text = _loc2_.taxPod + "";
      this._lblBoostPPValue.text = _loc2_.taxPP + "";
      this._lblBoostWisdomValue.text = _loc2_.taxWisdom + "";
      this._lblBoostPopValue.text = _loc2_.taxPopulation + "";
      this._lblTaxCount.text = this.api.lang.getText("GUILD_TAX_COUNT",[_loc2_.taxCount,_loc2_.taxCountMax]);
      this._lblBoostPointsValue.text = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("POINTS",[_loc2_.boostPoints]),"m",_loc2_.boostPoints < 2);
      this._lstSpells.dataProvider = _loc2_.taxSpells;
      var _loc3_ = _loc2_.playerRights.canManageBoost && _loc2_.boostPoints > 0;
      this._btnBoostPod._visible = _loc3_ && _loc2_.canBoost("w");
      this._btnBoostPP._visible = _loc3_ && _loc2_.canBoost("p");
      this._btnBoostWisdom._visible = _loc3_ && _loc2_.canBoost("x");
      this._btnBoostPop._visible = _loc3_ && _loc2_.canBoost("c");
      this._btnHireTaxCollector.enabled = _loc2_.playerRights.canHireTaxCollector && (_loc2_.taxCount < _loc2_.taxCountMax && !this.api.datacenter.Player.cantInteractWithTaxCollector);
      this._btnHireTaxCollector._visible = true;
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      this.gapi.loadUIComponent("SpellInfos","SpellInfos",{spell:_loc2_.row.item});
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnBoostPod":
            this.api.sounds.events.onGuildButtonClick();
            this.api.network.Guild.boostCharacteristic("w");
            break;
         case "_btnBoostPP":
            this.api.sounds.events.onGuildButtonClick();
            this.api.network.Guild.boostCharacteristic("p");
            break;
         case "_btnBoostWisdom":
            this.api.sounds.events.onGuildButtonClick();
            this.api.network.Guild.boostCharacteristic("x");
            break;
         case "_btnBoostPop":
            this.api.sounds.events.onGuildButtonClick();
            this.api.network.Guild.boostCharacteristic("c");
            break;
         case "_btnHireTaxCollector":
            var _loc3_ = this.api.datacenter.Player;
            if(_loc3_.guildInfos.taxcollectorHireCost < _loc3_.Kama)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_YOU_HIRE_TAXCOLLECTOR",[_loc3_.guildInfos.taxcollectorHireCost]),"CAUTION_YESNO",{name:"GuildTaxCollector",listener:this});
               break;
            }
            this.api.kernel.showMessage("undefined",this.api.lang.getText("NOT_ENOUGTH_RICH_TO_HIRE_TAX"),"ERROR_BOX");
            break;
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnBoostPod":
            var _loc3_ = this.api.datacenter.Player.guildInfos.getBoostCostAndCountForCharacteristic("w");
            var _loc4_ = this.api.lang.getGuildBoostsMax("w");
            this.gapi.showTooltip(this.api.lang.getText("COST") + " : " + _loc3_.cost + " " + this.api.lang.getText("POUR") + " " + _loc3_.count + " (max : " + _loc4_ + ")",_loc2_.target,-20);
            break;
         case "_btnBoostPP":
            var _loc5_ = this.api.datacenter.Player.guildInfos.getBoostCostAndCountForCharacteristic("p");
            var _loc6_ = this.api.lang.getGuildBoostsMax("p");
            this.gapi.showTooltip(this.api.lang.getText("COST") + " : " + _loc5_.cost + " " + this.api.lang.getText("POUR") + " " + _loc5_.count + " (max : " + _loc6_ + ")",_loc2_.target,-20);
            break;
         case "_btnBoostWisdom":
            var _loc7_ = this.api.datacenter.Player.guildInfos.getBoostCostAndCountForCharacteristic("x");
            var _loc8_ = this.api.lang.getGuildBoostsMax("x");
            this.gapi.showTooltip(this.api.lang.getText("COST") + " : " + _loc7_.cost + " " + this.api.lang.getText("POUR") + " " + _loc7_.count + " (max : " + _loc8_ + ")",_loc2_.target,-20);
            break;
         case "_btnBoostPop":
            var _loc9_ = this.api.datacenter.Player.guildInfos.getBoostCostAndCountForCharacteristic("c");
            var _loc10_ = this.api.lang.getGuildBoostsMax("c");
            this.gapi.showTooltip(this.api.lang.getText("COST") + " : " + _loc9_.cost + " " + this.api.lang.getText("POUR") + " " + _loc9_.count + " (max : " + _loc10_ + ")",_loc2_.target,-20);
            break;
         case "_btnHireTaxCollector":
            this.gapi.showTooltip(this.api.lang.getText("COST") + " : " + this.api.datacenter.Player.guildInfos.taxcollectorHireCost + " " + this.api.lang.getText("KAMAS"),_loc2_.target,-20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function yes(§\x1e\x19\x0e§)
   {
      this.api.network.Guild.hireTaxCollector();
   }
}
