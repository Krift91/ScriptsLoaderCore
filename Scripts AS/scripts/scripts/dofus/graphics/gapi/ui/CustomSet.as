if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x14"])
{
   _global.dofus["\r\x14"] = new Object();
}
if(!dofus["\r\x14"].gapi)
{
   _global.dofus["\r\x14"].gapi = new Object();
}
if(!dofus["\r\x14"].gapi.ui)
{
   _global.dofus["\r\x14"].gapi.ui = new Object();
}
_global.dofus["\r\x14"].gapi.ui.CustomSet = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.CustomSet.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.ui.CustomSet.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.CustomSet.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initText});
};
_loc1.addListeners = function()
{
   this._btnSave.addEventListener("over",this);
   this._btnSave.addEventListener("out",this);
   this._btnSave.addEventListener("click",this);
   this._btnLoad.addEventListener("over",this);
   this._btnLoad.addEventListener("out",this);
   this._btnLoad.addEventListener("click",this);
   this._btnEdit.addEventListener("over",this);
   this._btnEdit.addEventListener("out",this);
   this._btnEdit.addEventListener("click",this);
   this.api.datacenter.Player.data.addListener(this);
   this.api.datacenter.Player.addEventListener("lpChanged",this);
   this.api.datacenter.Player.addEventListener("lpMaxChanged",this);
   this.api.datacenter.Player.addEventListener("apChanged",this);
   this.api.datacenter.Player.addEventListener("mpChanged",this);
   this.api.datacenter.Player.addEventListener("initiativeChanged",this);
   this.api.datacenter.Player.addEventListener("discernmentChanged",this);
   this.api.datacenter.Player.addEventListener("forceXtraChanged",this);
   this.api.datacenter.Player.addEventListener("vitalityXtraChanged",this);
   this.api.datacenter.Player.addEventListener("wisdomXtraChanged",this);
   this.api.datacenter.Player.addEventListener("chanceXtraChanged",this);
   this.api.datacenter.Player.addEventListener("agilityXtraChanged",this);
   this.api.datacenter.Player.addEventListener("intelligenceXtraChanged",this);
   this.api.datacenter.Player.addEventListener("rapidStuffPut",this);
   var _loc3_ = 0;
   while(true)
   {
      _loc3_ = _loc3_ + 1;
      if(_loc3_ >= dofus["\r\x14"].gapi.ui.customset.CustomSet.MAX_CONTAINER)
      {
         break;
      }
      var _loc2_ = this["_ctr" + _loc3_];
      _loc2_.addEventListener("click",this);
      _loc2_.addEventListener("dblClick",this);
      _loc2_.addEventListener("over",this);
      _loc2_.addEventListener("out",this);
      _loc2_.addEventListener("selectItem",this);
   }
};
_loc1.initTexts = function()
{
   this._lblLP.text = this.api.lang.getText("LP");
   this._lblAP.text = this.api.lang.getText("AP");
   this._lblMP.text = this.api.lang.getText("MP");
   this._lblInitiative.text = this.api.lang.getText("INITIATIVE");
   this._lblDiscernment.text = this.api.lang.getText("DISCERNMENT");
   this._lblForce.text = this.api.lang.getText("FORCE");
   this._lblVitality.text = this.api.lang.getText("VITALITY");
   this._lblWisdom.text = this.api.lang.getText("WISDOM");
   this._lblChance.text = this.api.lang.getText("CHANCE");
   this._lblAgility.text = this.api.lang.getText("AGILITY");
   this._lblIntelligence.text = this.api.lang.getText("INTEL");
   this._lblCustomSet.text = this.api.lang.getText("CUSTOM_SET_CHOOSE_SET");
};
_loc1.initData = function()
{
   this._btnLoad.enabled = false;
   this._btnSave.enabled = false;
   this._btnEdit.enabled = false;
   var _loc3_ = this.api.datacenter.Player;
   var _loc2_ = 0;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= 10)
      {
         break;
      }
      var _loc5_ = this["_ctr" + _loc2_];
      var _loc4_ = _loc3_.getRapidStuff(_loc2_);
      _loc5_.contentData = _loc4_;
   }
   this.lpChanged({value:_loc3_.LP});
   this.lpMaxChanged({value:_loc3_.LPmax});
   this.apChanged({value:_loc3_.AP});
   this.mpChanged({value:_loc3_.MP});
   this.initiativeChanged({value:_loc3_.Initiative});
   this.discernmentChanged({value:_loc3_.Discernment});
   this.forceXtraChanged({value:_loc3_.ForceXtra});
   this.vitalityXtraChanged({value:_loc3_.VitalityXtra});
   this.wisdomXtraChanged({value:_loc3_.WisdomXtra});
   this.chanceXtraChanged({value:_loc3_.ChanceXtra});
   this.agilityXtraChanged({value:_loc3_.AgilityXtra});
   this.intelligenceXtraChanged({value:_loc3_.IntelligenceXtra});
};
_loc1.askLoadSet = function(oRapidStuff, bPopup)
{
   if(this._oSelectedRapidStuff == undefined || oRapidStuff.isEmptyRapidStuff)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("CUSTOM_SET_INVALID_LOAD"),"ERROR_CHAT");
      return undefined;
   }
   if(bPopup)
   {
      var _loc2_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoLoad",{title:this.api.lang.getText("QUESTION"),text:this.api.lang.getText("CUSTOM_SET_CONFIRM_LOAD")});
      _loc2_.addEventListener("yes",this);
   }
   else
   {
      this.api.network.RapidStuff.loadRapidStuff(this._oSelectedRapidStuff.id);
      this.api.kernel.showMessage(undefined,this.api.lang.getText("CUSTOM_SET_LOADED",[this._oSelectedRapidStuff.name]),"INFO_CHAT");
   }
};
_loc1.lpChanged = function(oEvent)
{
   this._lblLPValue.text = this.api.datacenter.Player.LP + "/" + this.api.datacenter.Player.LPmax;
};
_loc1.lpMaxChanged = function(oEvent)
{
   this._lblLPValue.text = this.api.datacenter.Player.LP + "/" + this.api.datacenter.Player.LPmax;
};
_loc1.apChanged = function(oEvent)
{
   this._lblAPValue.text = String(Math.max(0,oEvent.value));
};
_loc1.mpChanged = function(oEvent)
{
   this._lblMPValue.text = String(Math.max(0,oEvent.value));
};
_loc1.initiativeChanged = function(oEvent)
{
   this._lblInitiativeValue.text = String(oEvent.value);
};
_loc1.discernmentChanged = function(oEvent)
{
   this._lblDiscernmentValue.text = String(oEvent.value);
};
_loc1.forceXtraChanged = function(oEvent)
{
   this._lblForceValue.text = this.api.datacenter.Player.Force + (oEvent.value == 0 ? "" : (oEvent.value <= 0 ? " (" : " (+") + String(oEvent.value) + ")");
};
_loc1.vitalityXtraChanged = function(oEvent)
{
   this._lblVitalityValue.text = this.api.datacenter.Player.Vitality + (oEvent.value == 0 ? "" : (oEvent.value <= 0 ? " (" : " (+") + String(oEvent.value) + ")");
};
_loc1.wisdomXtraChanged = function(oEvent)
{
   this._lblWisdomValue.text = this.api.datacenter.Player.Wisdom + (oEvent.value == 0 ? "" : (oEvent.value <= 0 ? " (" : " (+") + String(oEvent.value) + ")");
};
_loc1.chanceXtraChanged = function(oEvent)
{
   this._lblChanceValue.text = this.api.datacenter.Player.Chance + (oEvent.value == 0 ? "" : (oEvent.value <= 0 ? " (" : " (+") + String(oEvent.value) + ")");
};
_loc1.agilityXtraChanged = function(oEvent)
{
   this._lblAgilityValue.text = this.api.datacenter.Player.Agility + (oEvent.value == 0 ? "" : (oEvent.value <= 0 ? " (" : " (+") + String(oEvent.value) + ")");
};
_loc1.intelligenceXtraChanged = function(oEvent)
{
   this._lblIntelligenceValue.text = this.api.datacenter.Player.Intelligence + (oEvent.value == 0 ? "" : (oEvent.value <= 0 ? " (" : " (+") + String(oEvent.value) + ")");
};
_loc1.rapidStuffPut = function(oEvent)
{
   var _loc2_ = oEvent.value;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   var _loc3_ = this["_ctr" + _loc2_.id];
   _loc3_.contentData = _loc2_;
   if(this._oSelectedRapidStuff != undefined && this._oSelectedRapidStuff.id == _loc2_.id)
   {
      this.onSelectedRapidStuff(_loc2_);
   }
};
_loc1.unSelectAll = function()
{
   var _loc3_ = 0;
   while(true)
   {
      _loc3_ = _loc3_ + 1;
      if(_loc3_ > dofus["\r\x14"].gapi.ui.customset.CustomSet.MAX_CONTAINER)
      {
         break;
      }
      var _loc2_ = this["_ctr" + _loc3_];
      if(_loc2_.selected)
      {
         _loc2_.selected = false;
         this._oSelectedRapidStuff = undefined;
      }
   }
   this._btnLoad.enabled = false;
   this._btnSave.enabled = false;
   this._btnEdit.enabled = false;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnSave":
         this.selectItem(oEvent);
         break;
      case "_btnLoad":
         if(this._oSelectedRapidStuff == undefined)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CUSTOM_SET_INVALID_SAVE"),"ERROR_CHAT");
            return undefined;
         }
         var _loc2_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoSave",{title:this.api.lang.getText("QUESTION"),text:this.api.lang.getText("CONFIRM_CUSTOM_SET")});
         _loc2_.addEventListener("yes",this);
         break;
      case "_btnEdit":
         this.askLoadSet(this._oSelectedRapidStuff,false);
         break;
      default:
         if(this._oSelectedRapidStuff == undefined)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CUSTOM_SET_INVALID_EDIT"),"ERROR_CHAT");
            return undefined;
         }
         var _loc7_ = this.api.ui.loadUIComponent("CustomSetEdit","CustomSetEdit",{rapidStuff:this._oSelectedRapidStuff});
         break;
   }
};
_loc1.selectItem = function(oEvent)
{
   this.unSelectAll();
   oEvent.target.selected = true;
   var _loc3_ = oEvent.target;
   var _loc2_ = dofus.datacenter.RapidStuff(_loc3_.contentData);
   this.onSelectedRapidStuff(_loc2_);
};
_loc1.onSelectedRapidStuff = function(oRapidStuff)
{
   if(oRapidStuff != undefined)
   {
      this._btnSave.enabled = !oRapidStuff.isEmptyRapidStuff;
      this._btnLoad.enabled = !oRapidStuff.isEmptyRapidStuff;
      this._lblCustomSet.text = oRapidStuff.name.length <= 0 ? this.api.lang.getText("CUSTOM_SET_EMPTY_SLOT") : oRapidStuff.name;
   }
   else
   {
      this._btnSave.enabled = false;
      this._btnLoad.enabled = false;
      this._lblCustomSet.text = this.api.lang.getText("CUSTOM_SET_EMPTY_SLOT");
   }
   this._oSelectedRapidStuff = oRapidStuff;
   this._btnEdit.enabled = true;
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnSave":
         break;
      case "_ctr0":
      case "_ctr1":
      case "_ctr2":
      case "_ctr3":
      case "_ctr4":
      case "_ctr5":
      case "_ctr6":
      case "_ctr7":
      case "_ctr8":
      case "_ctr9":
         var _loc3_ = oEvent.target.contentData;
         if(_loc3_ != undefined && !_loc3_.isEmptyRapidStuff)
         {
            this.gapi.showTooltip(this.api.lang.getText("CUSTOM_SET_EQUIP"),oEvent.target,-20);
         }
         else
         {
            this.gapi.showTooltip(this.api.lang.getText("CUSTOM_SET_SELECT_SLOT"),oEvent.target,-20);
         }
         break;
      default:
         this.gapi.showTooltip(oEvent.target.contentData.name,oEvent.target,-20);
   }
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.yes = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "AskYesNoSave":
         this.api.network.RapidStuff.saveRapidStuff(this._oSelectedRapidStuff.id);
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CUSTOM_SET_SAVED",[this._oSelectedRapidStuff.name]),"INFO_CHAT");
         break;
      case "AskYesNoLoad":
         this.api.network.RapidStuff.loadRapidStuff(this._oSelectedRapidStuff.id);
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CUSTOM_SET_LOADED",[this._oSelectedRapidStuff.name]),"INFO_CHAT");
   }
};
_loc1.dblClick = function(oEvent)
{
   this.selectItem(oEvent);
   var _loc2_ = oEvent.target.contentData;
   this.askLoadSet(_loc2_,false);
};
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.customset.CustomSet.CLASS_NAME = "CustomSet";
_global.dofus["\r\x14"].gapi.ui.customset.CustomSet.MAX_CONTAINER = 10;
_global.dofus["\r\x14"].gapi.ui.CustomSet.CLASS_NAME = "CustomSet";
