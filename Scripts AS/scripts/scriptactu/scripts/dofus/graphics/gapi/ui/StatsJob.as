var _loc1 = dofus["\r\x14"].gapi.ui.StatsJob.prototype;
_loc1.createChildren = function()
{
   this.player = this.api.datacenter.Player;
   var _loc2_ = this.api.datacenter.getHero(this.heroID);
   if(_loc2_ != undefined)
   {
      this.player = _loc2_;
   }
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initTexts});
   this._mcViewersPlacer._visible = false;
   this._btnClosePanel._visible = false;
   this.Oficioback._visible = false;
   this._ctrSpe1._visible = false;
   this._ctrSpe2._visible = false;
   this._ctrSpe0._visible = false;
   this._ctrJob2._visible = false;
   this._ctrJob1._visible = false;
   this._ctrJob0._visible = false;
   this._ctrJob2._visible = false;
   this._ctrJob1._visible = false;
   this._ctrJob0._visible = false;
   this.player.data.addListener(this);
   this.player.addEventListener("levelChanged",this);
   this.player.addEventListener("xpChanged",this);
   this.player.addEventListener("lpChanged",this);
   this.player.addEventListener("lpMaxChanged",this);
   this.player.addEventListener("apChanged",this);
   this.player.addEventListener("mpChanged",this);
   this.player.addEventListener("initiativeChanged",this);
   this.player.addEventListener("discernmentChanged",this);
   this.player.addEventListener("forceXtraChanged",this);
   this.player.addEventListener("vitalityXtraChanged",this);
   this.player.addEventListener("wisdomXtraChanged",this);
   this.player.addEventListener("chanceXtraChanged",this);
   this.player.addEventListener("agilityXtraChanged",this);
   this.player.addEventListener("intelligenceXtraChanged",this);
   this.player.addEventListener("bonusPointsChanged",this);
   this.player.addEventListener("energyChanged",this);
   this.player.addEventListener("energyMaxChanged",this);
   this.player.addEventListener("alignmentChanged",this);
};
_loc1.updateCharacteristicButton = function(_loc2_)
{
   var _loc3_ = this.player.getBoostCostAndCountForCharacteristic(_loc2_).cost;
   var _loc2_ = this["_btn" + _loc2_];
   if(_loc3_ <= this.player.BonusPoints)
   {
      _loc2_._visible = true;
   }
   else
   {
      _loc2_._visible = false;
   }
};
_loc1.xpChanged = function(oEvent)
{
   this._pbXP.minimum = this.player.XPlow;
   this._pbXP.maximum = this.player.XPhigh;
   this._pbXP.value = oEvent.value;
   this._mcXP.onRollOver = function()
   {
      this._parent.gapi.showTooltip(new ank["\x1e\n\x07"]["\x0e\x1c"](oEvent.value).addMiddleChar(this._parent.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " / " + new ank["\x1e\n\x07"]["\x0e\x1c"](this._parent._pbXP.maximum).addMiddleChar(this._parent.api.lang.getConfigText("THOUSAND_SEPARATOR"),3),this,-10);
   };
   this._mcXP.onRollOut = function()
   {
      this._parent.gapi.hideTooltip();
   };
};
_loc1.forceXtraChanged = function(_loc2_)
{
   this._lblForceValue.text = this.player.Force + (_loc2_.value != 0 ? (_loc2_.value > 0 ? " (+" : " (") + String(_loc2_.value) + ")" : "");
   this.updateCharacteristicButton(10);
};
_loc1.vitalityXtraChanged = function(_loc2_)
{
   this._lblVitalityValue.text = this.player.Vitality + (_loc2_.value != 0 ? (_loc2_.value > 0 ? " (+" : " (") + String(_loc2_.value) + ")" : "");
   this.updateCharacteristicButton(11);
};
_loc1.wisdomXtraChanged = function(_loc2_)
{
   this._lblWisdomValue.text = this.player.Wisdom + (_loc2_.value != 0 ? (_loc2_.value > 0 ? " (+" : " (") + String(_loc2_.value) + ")" : "");
   this.updateCharacteristicButton(12);
};
_loc1.chanceXtraChanged = function(_loc2_)
{
   this._lblChanceValue.text = this.player.Chance + (_loc2_.value != 0 ? (_loc2_.value > 0 ? " (+" : " (") + String(_loc2_.value) + ")" : "");
   this.updateCharacteristicButton(13);
};
_loc1.agilityXtraChanged = function(_loc2_)
{
   this._lblAgilityValue.text = this.player.Agility + (_loc2_.value != 0 ? (_loc2_.value > 0 ? " (+" : " (") + String(_loc2_.value) + ")" : "");
   this.updateCharacteristicButton(14);
};
_loc1.intelligenceXtraChanged = function(_loc2_)
{
   this._lblIntelligenceValue.text = this.player.Intelligence + (_loc2_.value != 0 ? (_loc2_.value > 0 ? " (+" : " (") + String(_loc2_.value) + ")" : "");
   this.updateCharacteristicButton(15);
};
_loc1.energyChanged = function(oEvent)
{
   if(this.api.datacenter.Basics.aks_current_server.typeNum != dofus.datacenter["\x1e\x12\x12"].SERVER_HARDCORE)
   {
      this._mcEnergy.onRollOver = function()
      {
         this._parent.gapi.showTooltip(new ank["\x1e\n\x07"]["\x0e\x1c"](oEvent.value).addMiddleChar(this._parent.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " / " + new ank["\x1e\n\x07"]["\x0e\x1c"](Math.max(10000,this._parent._pbEnergy.maximum)).addMiddleChar(this._parent.api.lang.getConfigText("THOUSAND_SEPARATOR"),3),this,-10);
      };
      this._mcEnergy.onRollOut = function()
      {
         this._parent.gapi.hideTooltip();
      };
      this._pbEnergy.maximum = this.player.EnergyMax;
      this._pbEnergy.value = oEvent.value;
   }
   else
   {
      this._pbEnergy._alpha = 50;
      this._pbEnergy.enabled = false;
   }
};
_loc1.subClase = function(oEvent)
{
   if(oEvent.value > 0)
   {
      switch(oEvent.value)
      {
         case "1":
            this.iclase1._visible = true;
            this.iclase2._visible = false;
            this.iclase3._visible = false;
            break;
         case "2":
            this.iclase2._visible = true;
            this.iclase1._visible = false;
            this.iclase3._visible = false;
            break;
         case "3":
            this.iclase3._visible = true;
            this.iclase1._visible = false;
            this.iclase2._visible = false;
      }
   }
   else
   {
      this.iclase3._visible = false;
      this.iclase2._visible = false;
      this.iclase1._visible = false;
   }
};
_loc1.addListeners = function()
{
   var _loc3_ = 0;
   while(_loc3_ < 23)
   {
      var _loc5_ = this["_ctrJob" + _loc3_];
      _loc5_.addEventListener("click",this);
      _loc5_.addEventListener("over",this);
      _loc5_.addEventListener("out",this);
      _loc3_ += 1;
   }
   var _loc2_ = 0;
   while(_loc2_ < 11)
   {
      var _loc4_ = this["_ctrSpe" + _loc2_];
      _loc4_.addEventListener("click",this);
      _loc4_.addEventListener("over",this);
      _loc4_.addEventListener("out",this);
      _loc2_ += 1;
   }
   this._ctrAlignment.addEventListener("click",this);
   this._ctrAlignment.addEventListener("over",this);
   this._ctrAlignment.addEventListener("out",this);
   this._btn10.addEventListener("click",this);
   this._btn10.addEventListener("over",this);
   this._btn10.addEventListener("out",this);
   this._btn11.addEventListener("click",this);
   this._resetar.addEventListener("click",this);
   this._btn11.addEventListener("over",this);
   this._btn11.addEventListener("out",this);
   this._btn12.addEventListener("click",this);
   this._btn12.addEventListener("over",this);
   this._btn12.addEventListener("out",this);
   this._btn13.addEventListener("click",this);
   this._btn13.addEventListener("over",this);
   this._btn13.addEventListener("out",this);
   this._btn14.addEventListener("click",this);
   this._btn14.addEventListener("over",this);
   this._btn14.addEventListener("out",this);
   this._btn15.addEventListener("click",this);
   this._btn15.addEventListener("over",this);
   this._btn15.addEventListener("out",this);
   this.api.datacenter.Game.addEventListener("stateChanged",this);
   this._btnClose.addEventListener("click",this);
   this._btnClosePanel.addEventListener("click",this);
   this._oficiosSh.addEventListener("click",this);
   this._oficiosSh.label = "Métiers";
   this._resetar.label = "Resetear";
   this._mcResetStats.addEventListener("click",this);
   this._mcMoreStats.onRelease = function()
   {
      this._parent.click({target:this});
   };
};
_loc1.inicioPanel = function()
{
   panel = false;
   this.Oficioback._visible = false;
   var _loc2_ = 0;
   var _loc3_ = 0;
   while(_loc2_ < 23)
   {
      var _loc5_ = this["_ctrJob" + _loc2_];
      _loc5_._visible = false;
      _loc2_ += 1;
   }
   while(_loc3_ < 11)
   {
      var _loc4_ = this["_ctrSpe" + _loc3_];
      _loc4_._visible = false;
      _loc3_ += 1;
   }
};
_loc1.initData = function()
{
   var _loc4_ = 0;
   var _loc3_ = 0;
   while(_loc4_ < 23)
   {
      var _loc5_ = this["_ctrJob" + _loc4_];
      _loc5_._visible = false;
      _loc4_ += 1;
   }
   while(_loc3_ < 11)
   {
      var _loc9_ = this["_ctrSpe" + _loc3_];
      _loc9_._visible = false;
      _loc3_ += 1;
   }
   var _loc8_ = this.player;
   this.levelChanged({value:_loc8_.Level});
   this.subClase({value:_loc8_.subclase});
   this.xpChanged({value:_loc8_.XP});
   this.lpChanged({value:_loc8_.LP});
   this.lpMaxChanged({value:_loc8_.LPmax});
   this.apChanged({value:_loc8_.AP});
   this.mpChanged({value:_loc8_.MP});
   this.initiativeChanged({value:_loc8_.Initiative});
   this.discernmentChanged({value:_loc8_.Discernment});
   this.forceXtraChanged({value:_loc8_.ForceXtra});
   this.vitalityXtraChanged({value:_loc8_.VitalityXtra});
   this.wisdomXtraChanged({value:_loc8_.WisdomXtra});
   this.chanceXtraChanged({value:_loc8_.ChanceXtra});
   this.agilityXtraChanged({value:_loc8_.AgilityXtra});
   this.intelligenceXtraChanged({value:_loc8_.IntelligenceXtra});
   this.bonusPointsChanged({value:_loc8_.BonusPoints});
   this.energyChanged({value:_loc8_.Energy});
   this.alignmentChanged({alignment:_loc8_.alignment});
   var _loc11_ = this.player.Jobs;
   var _loc7_ = 0;
   if(_loc8_.resets < 15 && _loc8_.Omega == 0)
   {
      this._Omega._visible = false;
      this._lblOmega._visible = false;
   }
   else
   {
      this._Omega._visible = true;
      this._lblOmega._visible = true;
   }
   while(_loc7_ < _loc11_.length)
   {
      _loc5_ = _loc11_[_loc7_];
      var _loc10_ = _loc5_.specializationOf;
      if(_loc10_ != 0)
      {
         var _loc2_ = 0;
         while(_loc2_ < 11)
         {
            _loc4_ = this["_ctrSpe" + _loc2_];
            if(_loc4_.contentData == undefined)
            {
               _loc4_.contentData = _loc5_;
               break;
            }
            _loc2_ += 1;
         }
      }
      else
      {
         _loc3_ = 0;
         while(_loc3_ < 23)
         {
            var _loc6_ = this["_ctrJob" + _loc3_];
            if(_loc6_.contentData == undefined)
            {
               _loc6_.contentData = _loc5_;
               break;
            }
            _loc3_ += 1;
         }
      }
      _loc7_ += 1;
   }
   this._lblName.text = this.player.Name;
   this.activateBoostButtons(!this.api.datacenter.Game.isFight);
};
_loc1.levelChanged = function(oEvent)
{
   var _loc2_ = String(oEvent.value);
   var _loc3_ = this.api.lang.getText("LEVEL") + " " + _loc2_;
   if(String(oEvent.value) > 200)
   {
      _loc3_ = "Oméga " + (_loc2_ - 200);
   }
   this._lblLevel.text = _loc3_;
};
_loc1.omega = function(oEvent)
{
   this._lblOmega.text = String(oEvent.value);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnClosePanel":
         this.hideJob();
         this.hideAlignment();
         this.hideStats();
         break;
      case "_ctrAlignment":
         if(this.player.data.alignment.index == 0)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NEED_ALIGNMENT"),"ERROR_BOX");
         }
         else
         {
            this.showAlignment();
         }
         break;
      case "_resetar":
         this.api.network.send2(this.heroID,"Zw");
         break;
      case "_btn10":
      case "_btn11":
      case "_btn12":
      case "_btn13":
      case "_btn14":
      case "_btn15":
         this.api.sounds.events.onStatsJobBoostButtonClick();
         var _loc6_ = oEvent.target._name.substr(4);
         if(this.player.canBoost(_loc6_))
         {
            this.api.ui.loadUIComponent("BonusStats","BonusStats",{stat:_loc6_,heroID:this.heroID});
         }
         break;
      case "_btnClose":
         this.callClose();
         break;
      case "_mcMoreStats":
         this.showStats();
         break;
      case "_oficiosSh":
         if(!panel)
         {
            panel = true;
            this.Oficioback._visible = true;
            this._ctrSpe1._visible = true;
            this._ctrSpe2._visible = true;
            this._ctrSpe0._visible = true;
            this._ctrJob2._visible = true;
            this._ctrJob1._visible = true;
            this._ctrJob0._visible = true;
            this._oficiosSh.label = "Stats";
            var _loc2_ = 0;
            var _loc3_ = 0;
            while(_loc2_ < 23)
            {
               var _loc5_ = this["_ctrJob" + _loc2_];
               _loc5_._visible = true;
               _loc2_ += 1;
            }
            while(_loc3_ < 11)
            {
               var _loc4_ = this["_ctrSpe" + _loc3_];
               _loc4_._visible = true;
               _loc3_ += 1;
            }
         }
         else
         {
            panel = false;
            this.Oficioback._visible = false;
            this._oficiosSh.label = "Métiers";
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc2_ < 23)
            {
               _loc5_ = this["_ctrJob" + _loc2_];
               _loc5_._visible = false;
               _loc2_ += 1;
            }
            while(_loc3_ < 11)
            {
               _loc4_ = this["_ctrSpe" + _loc3_];
               _loc4_._visible = false;
               _loc3_ += 1;
            }
         }
         break;
      case "_mcResetStats":
         this.api.network.send2(this.heroID,"Apc");
         break;
      default:
         this.showJob(oEvent.target.contentData);
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btn10":
      case "_btn11":
      case "_btn12":
      case "_btn13":
      case "_btn14":
      case "_btn15":
         var _loc4_ = Number(oEvent.target._name.substr(4));
         var _loc3_ = this.player.getBoostCostAndCountForCharacteristic(_loc4_);
         this.gapi.showTooltip(this.api.lang.getText("COST") + " : " + _loc3_.cost + " " + this.api.lang.getText("POUR") + " " + _loc3_.count,oEvent.target,-20);
         break;
      case "_ctrAlignment":
         this.gapi.showTooltip(this.player.alignment.name,oEvent.target,oEvent.target.height + 5);
         break;
      case "iclase1":
         this.gapi.showTooltip(this.api.lang.getText("INFO_CLASE1"),oEvent.target,oEvent.target.height + 5);
         break;
      case "iclase2":
         this.gapi.showTooltip(this.api.lang.getText("INFO_CLASE2"),oEvent.target,oEvent.target.height + 5);
         break;
      case "iclase3":
         this.gapi.showTooltip(this.api.lang.getText("INFO_CLASE3"),oEvent.target,oEvent.target.height + 5);
         break;
      default:
         this.gapi.showTooltip(oEvent.target.contentData.name,oEvent.target,-20);
   }
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.initPrestige = function(_loc2_)
{
   this._lblPrestige.text = String("Prestige " + _loc2_);
};
