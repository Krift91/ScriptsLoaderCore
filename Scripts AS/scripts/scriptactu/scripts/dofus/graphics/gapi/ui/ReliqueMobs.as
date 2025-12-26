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
_global.dofus["\r\x14"].gapi.ui.ReliqueMobs = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.ReliqueMobs.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.ReliqueMobs.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.ReliqueMobs.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
   this._btnMobN.addEventListener("click",this);
   this._btnMobE.addEventListener("click",this);
   this._btnMobAll.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._dgMobs.columnsNames = ["",this.api.lang.getText("MOBS_BOSS_RELIQUE")];
   this._winBg.title = this.api.lang.getText("RECORD_MOBS_RELIQUE");
   this._btnMobN.label = this.api.lang.getText("MOBS_BOSS_RELIQUE");
   this._btnMobE.label = this.api.lang.getText("MOBS_BOSS_EXOTIC_RELIQUE");
   this._btnMobAll.label = this.api.lang.getText("MOBS_ALL");
};
_loc1.tipoMob = function(sValue)
{
   this._aMobs = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = sValue.split(";");
   var _loc5_ = 0;
   for(_loc5_ in _loc4_)
   {
      var _loc3_ = _loc4_[_loc5_];
      var _loc2_ = new Object();
      _loc2_.idMob = _loc3_.split(",")[0];
      _loc2_.cantidad = _loc3_.split(",")[1];
      this._aMobs.push(_loc2_);
   }
   this._dgMobs.dataProvider = this._aMobs;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose:
         this.api.ui.unloadUIComponent("ReliqueMobs");
         break;
      case this._btnMobE:
         this._dgMobs.columnsNames = ["",this.api.lang.getText("MOBS_BOSS_EXOTIC_RELIQUE")];
         this.api.network.send("?ON");
         this._btnMobN.selected = false;
         this._btnMobAll.selected = false;
         break;
      case this._btnMobN:
         this._dgMobs.columnsNames = ["",this.api.lang.getText("MOBS_BOSS_RELIQUE")];
         this.api.network.send("?OE");
         this._btnMobE.selected = false;
         this._btnMobAll.selected = false;
         break;
      case this._btnMobAll:
         this._dgMobs.columnsNames = ["",this.api.lang.getText("MOBS_BOSS_ALL")];
         this.api.network.send("?ML");
         this._btnMobN.selected = false;
         this._btnMobE.selected = false;
   }
};
_loc1._aMobs = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.ReliqueMobs.CLASS_NAME = "ReliqueMobs";
