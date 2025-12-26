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
if(!dofus["\r\x14"].gapi.ui.torneo)
{
   _global.dofus["\r\x14"].gapi.ui.torneo = new Object();
}
_global.dofus["\r\x14"].gapi.ui.torneo.TorneoPersonajeItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.torneo.TorneoPersonajeItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.torneo.TorneoPersonajeItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      var _loc9_ = oItem.id;
      var _loc4_ = oItem.nombre1;
      var _loc3_ = oItem.nombre2;
      var _loc6_ = oItem.claseID1;
      var _loc5_ = oItem.claseID2;
      var _loc8_ = oItem.sexo1;
      var _loc7_ = oItem.sexo2;
      this._lblNombre1.text = _loc4_;
      this._lblNombre2.text = _loc3_;
      this._ldrGfx1.contentPath = dofus.Constants.GUILDS_MINI_PATH + _loc6_ + _loc8_ + ".swf";
      this._ldrGfx2.contentPath = dofus.Constants.GUILDS_MINI_PATH + _loc5_ + _loc7_ + ".swf";
   }
   else if(Number(oItem.id) < 1)
   {
      this._ldrGfx1.contentPath = "";
      this._ldrGfx2.contentPath = "";
   }
};
_loc1.init = function()
{
   super.init(false);
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
