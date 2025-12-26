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
if(!dofus["\r\x14"].gapi.ui.farmeo)
{
   _global.dofus["\r\x14"].gapi.ui.farmeo = new Object();
}
_global.dofus["\r\x14"].gapi.ui.farmeo.FarmeoFamiliaItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.farmeo.FarmeoFamiliaItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.farmeo.FarmeoFamiliaItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblName.text = oItem.nombre;
      this._ldrIcon.contentPath = "clips/artworks/big/" + this.api.lang.getMonstersText(oItem.gfx).g + ".swf";
      this._mcF._visible = true;
   }
   else if(this._lblName.text != "")
   {
      this._lblName.text = "";
      this._mcF._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcF._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
