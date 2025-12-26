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
_global.dofus["\r\x14"].gapi.ui.HeroesPanel = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.HeroesPanel.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.HeroesPanel.prototype;
_loc1.init = function()
{
   super.init(false,"HeroesPanel");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
   var _loc2_ = 0;
   while(_loc2_ < 10)
   {
      this["_hero" + _loc2_]._visible = false;
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnAdd.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._btnAdd.label = "Créer un Héro";
   this._btnTabHeroes.label = "Heroes";
   this._window.title = "Vos Héros";
};
_loc1.actualizar = function(packet)
{
   var _loc3_ = packet.split(",")[0];
   var _loc2_ = packet.split(",")[1];
   this._txtNivel.text = _loc3_;
   this._txtNivel.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this._txtNivel.text).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._txtPP.text = _loc2_;
   this._txtPP.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this._txtPP.text).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
};
_loc1.initData = function()
{
   this.updateCharactersList();
};
_loc1.updateCharactersList = function()
{
   var _loc5_ = new Array();
   for(var _loc8_ in this.api.datacenter.Heroes)
   {
      var _loc2_ = this.api.datacenter.Heroes[_loc8_];
      var _loc3_ = this.api.datacenter.Sprites.getItemAt(_loc2_.ID);
      if(_loc3_)
      {
         _loc2_.gfxFile = _loc3_.gfxFile;
         _loc2_.accessories = _loc3_.accessories;
      }
      _loc5_[_loc2_.ID] = _loc2_;
   }
   var _loc6_ = new Array();
   for(var _loc7_ in _loc5_)
   {
      _loc6_.push(_loc5_[_loc7_]);
   }
   _loc6_.sort(function(a, b)
   {
      return a.ID - b.ID;
   }
   );
   var _loc4_ = 0;
   while(_loc4_ < 10)
   {
      _loc2_ = _loc6_[_loc4_];
      _loc3_ = undefined;
      if(_loc2_ != undefined)
      {
         _loc3_ = new ank.battlefield.datacenter["\x1e\x0e\x10"]("viewer",ank.battlefield.mc["\x1e\x0e\x10"],_loc2_.gfxFile,undefined,4);
         _loc3_.color1 = _loc2_.color1;
         _loc3_.color2 = _loc2_.color2;
         _loc3_.color3 = _loc2_.color3;
         _loc3_.accessories = _loc2_.accessories;
      }
      _loc2_.sprite = _loc3_;
      this["_hero" + _loc4_].data = _loc2_;
      _loc4_ = _loc4_ + 1;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnAdd:
         this.api.ui.loadUIComponent("CreateCharacter","CreateCharacter",{modeHero:true},{bAlwaysOnTop:true});
         break;
      case this._btnClose:
         this.unloadThis();
   }
};
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.HeroesPanel.CLASS_NAME = "HeroesPanel";
