this.api = _global.API;
_global.dofus["\r\x14"].gapi.ui.Vote = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Vote.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Vote.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Vote.CLASS_NAME);
};
_loc1.__set__Datos = function(nValue)
{
   this._sBonus1 = String(nValue);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnReduce.addEventListener("click",this);
   this._btnMaximize.addEventListener("click",this);
   this._btnSpawn.addEventListener("click",this);
};
_loc1.initTexts = function()
{
};
_loc1.initData = function()
{
   this._btnMaximize._visible = false;
   this.cargarDatos(this._sBonus1);
};
_loc1.mostrarPanel = function(bDato)
{
   this._win._visible = bDato;
   this._txtDescripción._visible = bDato;
   this._btnSpawn._visible = bDato;
   this._txtMobs._visible = bDato;
   this._pbProgreso._visible = bDato;
   this._txtCant0._visible = bDato;
   this._txtCant1._visible = bDato;
   this._txtR._visible = bDato;
   this._bg._visible = bDato;
};
_loc1.actualizar = function(nValue)
{
   this._txtCant0.text = nValue;
   this._pbProgreso.value = nValue;
};
_loc1.cargarDatos = function(sValue)
{
   this._sBonus1 = sValue;
   var _loc2_ = this._sBonus1.split(",");
   if(_loc2_.length >= 4)
   {
      this._txtDescripción.text = _loc2_[0];
      this._txtCant0.text = _loc2_[1];
      this._txtCant1.text = _loc2_[2];
      this._pbProgreso.minimum = Number(_loc2_[1]);
      this._pbProgreso.maximum = Number(_loc2_[2]);
      this._pbProgreso.value = Number(_loc2_[3]);
   }
   else
   {
      this._txtDescripción.text = "Sans description";
      this._txtCant0.text = "0";
      this._txtCant1.text = "10";
      this._pbProgreso.minimum = 0;
      this._pbProgreso.maximum = 10;
      this._pbProgreso.value = 0;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnReduce:
         this._btnReduce._visible = false;
         this._btnMaximize._visible = true;
         this.mostrarPanel(false);
         break;
      case this._btnMaximize:
         this._btnReduce._visible = true;
         this._btnMaximize._visible = false;
         this.mostrarPanel(true);
         break;
      case this._btnSpawn:
         var _loc2_ = "https://play-naeris.net/";
         getURL(_loc2_,"_blank");
   }
};
_loc1.addProperty("datos",function()
{
}
,_loc1.__set__Datos);
_loc1._sBonus1 = "";
_loc1._aListaDatos = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Vote.CLASS_NAME = "Vote";
