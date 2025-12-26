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
_global.dofus["\r\x14"].gapi.ui.quests.ObjetivosItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.quests.ObjetivosItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.quests.ObjetivosItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   _global.trace("setValue called with:");
   _global.trace("bUsed: " + bUsed);
   _global.trace("sSuggested: " + sSuggested);
   _global.trace("oItem: " + oItem);
   if(bUsed)
   {
      _global.trace("Setting visible components and loading data from oItem...");
      this._iconXP._visible = true;
      this._iconK._visible = true;
      this._iconGeo._visible = true;
      this._svPersonaje._visible = true;
      this._oItem = oItem;
      this._lblKamas.text = oItem.kamas;
      this._lblKamas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.kamas).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._lblEXP.text = oItem.experiencia;
      this._lblEXP.text = new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.experiencia).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._lblMision.text = this.api.lang.getQuestText(oItem.idMision);
      this._lblNPC.text = this.api.lang.getNonPlayableCharactersText(oItem.idNPC).n;
      this._svPersonaje._visible = true;
      this._svPersonaje.fondo._visible = false;
      this._svPersonaje.spriteAnims = ["StaticR"];
      this._svPersonaje.refreshDelay = 50;
      this._svPersonaje.zoom = 150;
      this._svPersonaje.useSingleLoader = true;
      this._ldrItems._visible = true;
      this.cargarRecompensas(oItem.recompensas);
      var _loc4_ = dofus.Constants.CLIPS_PERSOS_PATH + oItem.idGFXnpc + ".swf";
      this._svPersonaje.spriteData = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_loc4_,undefined,5);
      this._svPersonaje.enableBlur = true;
   }
   else if(this._lblMision.text != undefined)
   {
      _global.trace("bUsed is false and mission label is not undefined, clearing fields...");
      this._lblKamas.text = "";
      this._lblEXP.text = "";
      this._lblMision.text = "";
      this._lblNPC.text = "";
   }
};
_loc1.cargarRecompensas = function(sGFX)
{
   var _loc6_ = sGFX.split("~");
   var _loc2_ = 5;
   while(_loc2_ >= 0)
   {
      var _loc3_ = 5 - _loc2_;
      if(_loc3_ < _loc6_.length && _loc6_[_loc3_] !== "")
      {
         var _loc5_ = _loc6_[_loc3_].split("-");
         var _loc8_ = _loc5_[0];
         var _loc10_ = _loc5_[1];
         var _loc4_ = this.api.lang.getItemUnicText(_loc8_);
         var _loc9_ = _loc4_.g;
         var _loc7_ = _loc4_.t;
         this._ldrItems["_ldr" + (_loc2_ + 1)]._visible = true;
         this["_ldrR" + (_loc2_ + 1)].contentPath = dofus.Constants.ITEMS_PATH + _loc7_ + "/" + _loc9_ + ".swf";
      }
      else
      {
         this._ldrItems["_ldr" + (_loc2_ + 1)]._visible = false;
         this["_ldrR" + (_loc2_ + 1)].contentPath = "";
      }
      _loc2_ = _loc2_ - 1;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._iconXP._visible = false;
   this._iconK._visible = false;
   this._iconGeo._visible = false;
   this._svPersonaje._visible = false;
   this._ldrItems._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
