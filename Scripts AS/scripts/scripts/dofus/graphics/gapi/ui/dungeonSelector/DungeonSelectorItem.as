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
if(!dofus["\r\x14"].gapi.ui.dungeonSelector)
{
   _global.dofus["\r\x14"].gapi.ui.dungeonSelector = new Object();
}
_global.dofus["\r\x14"].gapi.ui.dungeonSelector.DungeonSelectorItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.dungeonSelector.DungeonSelectorItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.dungeonSelector.DungeonSelectorItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblName._visible = true;
      this._lblLevel._visible = true;
      this._lblName.text = oItem.name;
      this._ldr._visible = true;
      this._lblLevel.text = _global.API.lang.getText("LEVEL") + " " + oItem.level;
      this._mcBg._visible = true;
      this._check._visible = oItem.completo;
      var _loc4_ = oItem.idMob;
      this._svPersonaje._visible = true;
      this._svPersonaje.fondo._visible = false;
      if(oItem.idMob == 1632 || oItem.idMob == 1616)
      {
         this._svPersonaje.zoom = 15;
      }
      else if(oItem.idMob == 1621 || oItem.idMob == 1242 || oItem.idMob == 1444 || oItem.idMob == 1231 || oItem.idMob == 1451 || oItem.idMob == 1088 || oItem.idMob == 1134)
      {
         this._svPersonaje.zoom = 45;
      }
      else if(oItem.idMob == 1157 || oItem.idMob == 1231 || oItem.idMob == 1623 || oItem.idMob == 1647 || oItem.idMob == 1458)
      {
         this._svPersonaje.zoom = 40;
      }
      else if(oItem.idMob == 1635)
      {
         this._svPersonaje.zoom = 10;
      }
      else if(oItem.idMob == 1617)
      {
         this._svPersonaje.zoom = 50;
      }
      else if(oItem.idMob == 1297)
      {
         this._svPersonaje.zoom = 70;
      }
      else
      {
         this._svPersonaje.zoom = 60;
      }
      this._svPersonaje.spriteAnims = ["StaticR"];
      this._svPersonaje.refreshDelay = 50;
      this._svPersonaje.useSingleLoader = true;
      this._svPersonaje.spriteData = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_ + ".swf",undefined,5);
      this._svPersonaje.enableBlur = true;
   }
   else
   {
      this._svPersonaje._visible = false;
      this._ldr._visible = false;
      this._mcBg._visible = false;
      this._check._visible = false;
      this._lblName._visible = false;
      this._lblLevel._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcBg._visible = false;
   this._check._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
