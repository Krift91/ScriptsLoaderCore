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
_global.dofus["\r\x14"].gapi.ui.Farmeo = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Farmeo.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Farmeo.prototype;
_loc1.__set__ListaFamilia = function(sValue)
{
   this._aListaFamilia = sValue.split(";");
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Farmeo.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgListaFamilia.addEventListener("itemSelected",this);
   this._btnAceptar.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._dgListaFamilia.columnsNames = ["Famille",""];
   this._winBg.title = "Farming Naeris";
   this._btnAceptar.label = "Valider";
   this._txtListaMobs.text = "Listes de Monstres";
};
_loc1.initData = function()
{
   this._aFamilias = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = this._aListaFamilia;
   var _loc6_ = true;
   var _loc5_ = 0;
   for(_loc5_ in _loc4_)
   {
      var _loc3_ = _loc4_[_loc5_];
      var _loc2_ = new Object();
      _loc2_.id = _loc3_.split(",")[0];
      _loc2_.nombre = _loc3_.split(",")[1];
      _loc2_.gfx = _loc3_.split(",")[2];
      _loc2_.familia = _loc3_.split(",")[3];
      _loc2_.precio = Number(_loc3_.split(",")[4]);
      this._aFamilias.push(_loc2_);
   }
   this._dgListaFamilia.dataProvider = this._aFamilias;
};
_loc1.listaMobs = function(sValue)
{
   this._aListaMobs = sValue;
   var _loc4_ = this._aListaMobs.split(",");
   var _loc3_ = undefined;
   var _loc5_ = undefined;
   var _loc6_ = undefined;
   var _loc2_ = 1;
   while(_loc2_ <= 6)
   {
      if(_loc2_ - 1 < _loc4_.length)
      {
         _loc3_ = _loc4_[_loc2_ - 1];
      }
      else
      {
         _loc3_ = 0;
      }
      _loc5_ = this.api.lang.getMonstersText(_loc3_).g;
      _loc6_ = this.api.lang.getMonstersText(_loc3_).n;
      this["_ldrIco" + _loc2_].contentPath = "clips/artworks/big/" + _loc5_ + ".swf";
      this["_txtNombre" + _loc2_].text = _loc6_;
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.itemSelected = function(oEvent)
{
   var _loc5_ = oEvent.target._name;
   var _loc0_ = null;
   if((_loc0_ = _loc5_) === "_dgListaFamilia")
   {
      var _loc2_ = this._dgListaFamilia.selectedItem;
      var _loc6_ = _loc2_.id;
      var _loc4_ = _loc2_.familia;
      var _loc3_ = _loc2_.precio;
      this._sNombre = this.api.lang.getMonstersRaceText(_loc4_).n;
      this._nPrecio = Number(_loc3_);
      this.api.network.send("fp" + _loc6_);
      this._txtFamiliaNombre.text = "Famille: " + this.api.lang.getMonstersRaceText(_loc4_).n;
      this._tiCantidad.text = Number(1);
      this._txtPrecio.text = Number(this._tiCantidad.text * _loc3_);
   }
};
_loc1.valid = function(noConfirm)
{
   if(!noConfirm)
   {
      this.api.kernel.showMessage("ATTENTION","Vous allez payer " + Number(this._nPrecio * this._tiCantidad.text) + " (kamas) pour commencer le combat contre la famille (" + this._sNombre + "), n\'oubliez pas que pour terminer le combat, vous devrez vaincre " + this._tiCantidad.text + " monstres, tu veux continuer ?","CAUTION_YESNO",{name:"Confirm",listener:this});
      return undefined;
   }
   var _loc0_ = null;
   if((_loc0_ = this._oEvent.target) === this._btnAceptar)
   {
      this.api.network.send("fF" + this._dgListaFamilia.selectedItem.id + "," + Number(this._tiCantidad.text * this._nPrecio) + "," + this._tiCantidad.text);
   }
   this.api.network.send("fF" + this._dgListaFamilia.selectedItem.id + "," + Number(this._tiCantidad.text * this._nPrecio) + "," + this._tiCantidad.text);
   this.gapi.unloadUIComponent("Farmeo");
};
_loc1.yes = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.valid(true);
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnAceptar:
         if(this._dgListaFamilia.selectedItem.id == undefined)
         {
            this.api.kernel.showMessage(undefined,"Vous devez sélectionner une famille pour démarrer cette action","ERROR_BOX");
         }
         else
         {
            this.valid(false);
         }
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Farmeo");
   }
};
_loc1.addProperty("listaFamilia",function()
{
}
,_loc1.__set__ListaFamilia);
_loc1._sNombre = "";
_loc1._nPrecio = Number(0);
_loc1._aFamilias = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Farmeo.CLASS_NAME = "Farmeo";
