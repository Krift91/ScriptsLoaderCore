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
if(!dofus["\r\x14"].gapi.ui.logros)
{
   _global.dofus["\r\x14"].gapi.ui.logros = new Object();
}
_global.dofus["\r\x14"].gapi.ui.logros.LogrosItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.logros.LogrosItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.logros.LogrosItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._ldr.contentPath = "clips/logros/" + oItem.gfx + ".png";
      this._lblNombre.text = oItem.nombre;
      this._lblDescripcion.text = oItem.descripcion;
      this._lblLevel.text = oItem.puntos;
      this._mcSombra._visible = oItem.terminado == 1;
      this._mcF._visible = true;
   }
   else if(this._lblNombre.text != undefined)
   {
      this._ldr.contentPath = "";
      this._lblNombre.text = "";
      this._lblDescripcion.text = "";
      this._lblLevel.text = "";
      this._mcSombra._visible = false;
      this._mcF._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcSombra._visible = false;
   this._mcF._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
