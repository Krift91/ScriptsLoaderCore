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
_global.dofus["\r\x14"].gapi.ui.Torneo = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Torneo.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Torneo.prototype;
_loc1.__set__Data = function(sValue)
{
   this._sData = sValue.split(";");
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Torneo.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgLista.addEventListener("itemSelected",this);
   this._btnClose.addEventListener("click",this);
   this._btnApostar.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._dgLista.columnsNames = ["",""];
   this._winBg.title = "Torneo";
};
_loc1.infoPerso = function(b)
{
   this._lblNombre._visible = b;
   this._lblEquipo._visible = b;
   this._svPersonaje1._visible = b;
   this._svPersonaje2._visible = b;
   this._lblNombre1._visible = b;
   this._lblNombre2._visible = b;
   this._lblApuestas._visible = b;
   this._txtApostarK._visible = b;
   this._txtGanancia._visible = b;
   this._k1._visible = b;
   this._k2._visible = b;
   this._k3._visible = b;
   this._btnApostar._visible = b;
   this._tiKamas._visible = b;
   this._tiSearchFont._visible = b;
   this._txtGanancias._visible = b;
   this._txtMiGanancia._visible = b;
   this._txtMisGanancias._visible = b;
};
_loc1.actualizar = function(sTimer)
{
   _global.dofus["\r\x14"].gapi.ui.Torneo.tiempoRestante = sTimer;
   if(this.intervalo)
   {
      clearInterval(this.intervalo);
   }
   var self = this;
   this.intervalo = setInterval(function()
   {
      self.actualizarTiempo();
   }
   ,1000);
   this.actualizarTiempo();
};
_loc1.actualizarTiempo = function()
{
   var _loc3_ = Math.floor(_global.dofus["\r\x14"].gapi.ui.Torneo.tiempoRestante / 1000);
   var _loc5_ = Math.floor(_loc3_ / 60);
   var _loc4_ = _loc3_ % 60 >= 10 ? _loc3_ % 60 : "0" + _loc3_ % 60;
   this._winBg.title = "Torneo - Tiempo restante: " + _loc5_ + ":" + _loc4_;
   if(_global.dofus["\r\x14"].gapi.ui.Torneo.tiempoRestante > 0)
   {
      _global.dofus["\r\x14"].gapi.ui.Torneo.tiempoRestante -= 1000;
   }
   else
   {
      clearInterval(this.intervalo);
      this.intervalo = null;
      this._winBg.title = "Torneo";
   }
};
_loc1.actualizarDatos = function(sDatos)
{
   var _loc2_ = sDatos.split(";");
   this._txtGanancias.text = _loc2_[0];
   this._txtGanancias.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_[0]).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._txtMisGanancias.text = _loc2_[1];
   this._txtMisGanancias.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_[1]).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
};
_loc1.initData = function()
{
   this.infoPerso(false);
   this.actualizarTiempo();
   this._aLista = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = this._sData;
   var _loc6_ = true;
   var _loc5_ = 0;
   for(_loc5_ in _loc4_)
   {
      var _loc3_ = _loc4_[_loc5_];
      var _loc2_ = new Object();
      _loc2_.id = _loc3_.split("~")[0];
      _loc2_.ganancias = _loc3_.split("~")[1];
      _loc2_.nombre1 = _loc3_.split("~")[2];
      _loc2_.claseID1 = _loc3_.split("~")[3];
      _loc2_.sexo1 = _loc3_.split("~")[4];
      _loc2_.colores1 = _loc3_.split("~")[5];
      _loc2_.accesorios1 = _loc3_.split("~")[6];
      _loc2_.nombre2 = _loc3_.split("~")[7];
      _loc2_.claseID2 = _loc3_.split("~")[8];
      _loc2_.sexo2 = _loc3_.split("~")[9];
      _loc2_.colores2 = _loc3_.split("~")[10];
      _loc2_.accesorios2 = _loc3_.split("~")[11];
      _loc2_.misGanancias = _loc3_.split("~")[12];
      this._aLista.push(_loc2_);
   }
   this._dgLista.dataProvider = this._aLista;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc5_ = oEvent.target._name;
   var _loc0_ = null;
   if((_loc0_ = _loc5_) === "_dgLista")
   {
      this.infoPerso(true);
      var _loc2_ = this._dgLista.selectedItem;
      this.nID = this._dgLista.selectedItem.id;
      this._tiKamas.text = 0;
      this._txtMisGanancias.text = _loc2_.misGanancias;
      this._txtMisGanancias.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.misGanancias).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._lblNombre1.text = _loc2_.nombre1;
      this._lblNombre2.text = _loc2_.nombre2;
      this._txtGanancias.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.ganancias).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._lblEquipo.text = "Equipo #" + _loc2_.id;
      this._svPersonaje1._visible = true;
      this._svPersonaje1.zoom = 200;
      this._svPersonaje1.spriteAnims = ["StaticR"];
      this._svPersonaje1.refreshDelay = 50;
      this._svPersonaje1.useSingleLoader = true;
      this._csColors.breed = _loc2_.claseID1;
      this._csColors.sex = _loc2_.sexo1;
      this._oColors = {color1:_loc2_.colores1.split("*")[0],color2:_loc2_.colores1.split("*")[1],color3:_loc2_.colores1.split("*")[2]};
      var _loc4_ = _loc2_.claseID1 + "" + _loc2_.sexo1;
      this._svPersonaje1.spriteData = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_ + ".swf",undefined,5);
      this._svPersonaje1.enableBlur = true;
      this._svPersonaje1.refreshAccessories = true;
      this._svPersonaje1.setColors(this._oColors);
      this.api.kernel.CharactersManager.setSpriteAccessories(this._svPersonaje1.spriteData,_loc2_.accesorios1);
      this._svPersonaje2._visible = true;
      this._svPersonaje2.zoom = 200;
      this._svPersonaje2.spriteAnims = ["StaticR"];
      this._svPersonaje2.refreshDelay = 50;
      this._svPersonaje2.useSingleLoader = true;
      this._csColors.breed = _loc2_.claseID2;
      this._csColors.sex = _loc2_.sexo2;
      this._oColors = {color1:_loc2_.colores2.split("*")[0],color2:_loc2_.colores2.split("*")[1],color3:_loc2_.colores2.split("*")[2]};
      var _loc3_ = _loc2_.claseID2 + "" + _loc2_.sexo2;
      this._svPersonaje2.spriteData = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc3_ + ".swf",undefined,5);
      this._svPersonaje2.enableBlur = true;
      this._svPersonaje2.refreshAccessories = true;
      this._svPersonaje2.setColors(this._oColors);
      this.api.kernel.CharactersManager.setSpriteAccessories(this._svPersonaje2.spriteData,_loc2_.accesorios2);
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose:
         this.api.ui.unloadUIComponent("Torneo");
         break;
      case this._btnApostar:
         if(this.nID == 0)
         {
            return undefined;
         }
         this.api.network.send("ta" + this.nID + ";" + this._tiKamas.text);
         break;
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
_loc1.nID = 0;
_loc1.intervalo = null;
_loc1.tiempoRestante = 0;
_loc1._aLista = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Torneo.CLASS_NAME = "Torneo";
