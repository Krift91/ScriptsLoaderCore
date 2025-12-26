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
_global.dofus["\r\x14"].gapi.ui.Logros = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Logros.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Logros.prototype;
_loc1.__set__Data = function(sValue)
{
   this._sData = sValue.split(";");
};
_loc1.__set__Puntos = function(sValue)
{
   this._sPuntos = sValue;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Logros.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   var _loc2_ = 0;
   while(_loc2_ < 6)
   {
      this["_bg" + (_loc2_ + 1)]._visible = false;
      _loc2_ = _loc2_ + 1;
   }
   this._ldrItems._ldr1._visible = false;
   this._ldrItems._ldr2._visible = false;
   this._ldrItems._ldr3._visible = false;
   this._ldrItems._ldr4._visible = false;
   this._ldrItems._ldr5._visible = false;
   this._ldrItems._ldr6._visible = false;
   this._pbObjetivos._visible = false;
   this._dgObjetivos._visible = false;
   this._iconKama._visible = false;
   this._iconXP._visible = false;
};
_loc1.addListeners = function()
{
   this._dgCatLogros.addEventListener("itemSelected",this);
   this._dgLogros.addEventListener("itemSelected",this);
   this._btnClose.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
   this._pbAvance.addEventListener("over",this);
   this._pbAvance.addEventListener("out",this);
   this._pbObjetivos.addEventListener("over",this);
   this._pbObjetivos.addEventListener("out",this);
   this._btnBuscar.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._dgCatLogros.columnsNames = ["",this.api.lang.getText("CATEGORIA_LOGROS"),""];
   this._dgLogros.columnsNames = ["",this.api.lang.getText("LISTA_LOGROS"),"",""];
   this._winBg.title = this.api.lang.getText("LOGROS");
   this._lblDetalle.text = this.api.lang.getText("DETALLES");
   this._taDescripcion.text = "";
   this._txtPuntos.text = this._sPuntos.split(",")[0];
   this._txtScore.text = this.api.lang.getText("PUNTAJE");
   this._lblMiAvance.text = this.api.lang.getText("AVANCE") + ":";
   this._lblPuntaje.text = this._sPuntos.split(",")[1] + "/" + this._sPuntos.split(",")[2];
   this._btnBuscar.label = this.api.lang.getText("BUSCAR");
   this._tiSearch.text = "";
   this._tiSearch.setFocus();
};
_loc1.initData = function()
{
   this._dgLogros._visible = false;
   this._aCatLogros = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = this._sData;
   var _loc5_ = 0;
   for(_loc5_ in _loc4_)
   {
      var _loc3_ = _loc4_[_loc5_];
      var _loc2_ = new Object();
      _loc2_.id = _loc3_.split(",")[0];
      _loc2_.nombre = _loc3_.split(",")[1];
      _loc2_.gfx = _loc3_.split(",")[2];
      this._aCatLogros.push(_loc2_);
   }
   this._aCatLogros.reverse();
   this._dgCatLogros.dataProvider = this._aCatLogros;
   this._pbAvance.value = Number(this._sPuntos.split(",")[0]);
   this._pbAvance.maximum = Number(this._sPuntos.split(",")[2]);
   this._ldrBanner.contentPath = "clips/logros/banner.swf";
};
_loc1.cargarLogros = function(sLogros)
{
   this._aListaLogros = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = sLogros.split(";");
   var _loc4_ = 0;
   for(_loc4_ in _loc5_)
   {
      var _loc3_ = _loc5_[_loc4_];
      var _loc2_ = new Object();
      _loc2_.id = _loc3_.split(",")[0];
      _loc2_.nombre = _loc3_.split(",")[1];
      _loc2_.gfx = _loc3_.split(",")[2];
      _loc2_.terminado = _loc3_.split(",")[3];
      this._nTerminado = Number(_loc2_.terminado);
      _loc2_.puntos = _loc3_.split(",")[4];
      _loc2_.descripcion = _loc3_.split(",")[5];
      this._aListaLogros.push(_loc2_);
   }
   this._aListaLogros.reverse();
   this._dgLogros.dataProvider = this._aListaLogros;
};
_loc1.buscar = function(sFilter)
{
   var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   for(var _loc7_ in this._aListaLogros)
   {
      var _loc4_ = this._aListaLogros[_loc7_];
      var _loc3_ = _global.API.lang.getLogroUnico(_loc4_.id);
      if(!(sFilter.length > 0 && _loc3_.n.toUpperCase().indexOf(sFilter.toUpperCase()) == -1))
      {
         if(_loc3_.n != undefined)
         {
            _loc6_.push(_loc4_);
         }
      }
   }
   if(_loc6_.length == 0)
   {
      this._dgLogros._visible = false;
   }
   else
   {
      this._dgLogros._visible = true;
      this._dgLogros.dataProvider = _loc6_;
      this._dgLogros.columnsNames = ["",this.api.lang.getText("RESULT_LIST",[_loc6_.length]),""];
   }
};
_loc1.cargarObjetivos = function(sObjetivos)
{
   this._aListaObjetivos = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = sObjetivos.split(";");
   var _loc4_ = 0;
   for(_loc4_ in _loc5_)
   {
      var _loc3_ = _loc5_[_loc4_];
      var _loc2_ = new Object();
      _loc2_.nombre = _loc3_.split(",")[0];
      this._aListaObjetivos.push(_loc2_);
   }
   this._aListaObjetivos.reverse();
   this._dgObjetivos.dataProvider = this._aListaObjetivos;
};
_loc1.cargarBarra = function(nValue, nMax)
{
   this._pbObjetivos.value = Number(nValue);
   this._pbObjetivos.maximum = Number(nMax);
   this._txtProgreso.text = this.api.lang.getText("PROGRESS") + ": " + Number(nValue) + "/" + Number(nMax);
};
_loc1.cargarRecompensas = function(sDatos, sGFX)
{
   var _loc4_ = sDatos.split("~");
   var _loc2_ = 0;
   while(_loc2_ < 6)
   {
      this["_bg" + (_loc2_ + 1)]._visible = _loc4_[_loc2_] === "1";
      _loc2_ = _loc2_ + 1;
   }
   this._ldrItems._ldr1._visible = _loc4_[0] === "1";
   this._ldrItems._ldr2._visible = _loc4_[1] === "1";
   this._ldrItems._ldr3._visible = _loc4_[2] === "1";
   this._ldrItems._ldr4._visible = _loc4_[3] === "1";
   this._ldrItems._ldr5._visible = _loc4_[4] === "1";
   this._ldrItems._ldr6._visible = _loc4_[5] === "1";
   this._txtKamas.text = _loc4_[6];
   this._txtKamas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this._txtKamas.text).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._txtExp.text = _loc4_[7];
   this._txtExp.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this._txtExp.text).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   if(_loc4_[8] != undefined && _loc4_[8] != "0")
   {
      this._txtPointsBoutique.text = _loc4_[8];
      this._txtPointsBoutique.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this._txtPointsBoutique.text).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._iconPointsBoutique._visible = true;
   }
   else
   {
      this._txtPointsBoutique.text = "0";
      this._iconPointsBoutique._visible = true;
   }
   var _loc9_ = sGFX.split("~");
   _loc2_ = 0;
   while(_loc2_ < _loc9_.length)
   {
      _loc4_ = _loc9_[_loc2_].split(",");
      var _loc7_ = _loc4_[0];
      var _loc5_ = _loc4_[1];
      var _loc3_ = this.api.lang.getItemUnicText(_loc7_);
      var _loc8_ = _loc3_.g;
      var _loc6_ = _loc3_.t;
      if(_loc2_ < 6)
      {
         this["_ldrR" + (_loc2_ + 1)].contentPath = dofus.Constants.ITEMS_PATH + _loc6_ + "/" + _loc8_ + ".swf";
      }
      if(_loc2_ < 6)
      {
         this["_txtCant" + (_loc2_ + 1)].text = _loc5_;
      }
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.itemSelected = function(oEvent)
{
   var _loc5_ = oEvent.target._name;
   switch(_loc5_)
   {
      case "_dgCatLogros":
         var _loc4_ = this._dgCatLogros.selectedItem;
         this._dgLogros._visible = true;
         this.api.network.send("!CLL" + _loc4_.id);
         break;
      case "_dgLogros":
         this._pbObjetivos._visible = true;
         var _loc3_ = this._dgLogros.selectedItem;
         var _loc6_ = this.api.lang.getLogroUnico(_loc3_.id);
         this._lblName.text = _loc3_.nombre;
         this._taDescripcion.text = _loc3_.descripcion;
         this._lblObjetivos.text = this.api.lang.getText("QUESTS_OBJECTIVES");
         this._dgObjetivos._visible = true;
         this._iconKama._visible = true;
         this._iconXP._visible = true;
         this._ldrItems._ldr1._visible = false;
         this._ldrItems._ldr2._visible = false;
         this._ldrItems._ldr3._visible = false;
         this._ldrItems._ldr4._visible = false;
         this._ldrItems._ldr5._visible = false;
         this._ldrItems._ldr6._visible = false;
         var _loc2_ = 0;
         while(_loc2_ < 6)
         {
            this["_bg" + (_loc2_ + 1)]._visible = false;
            this["_txtCant" + (_loc2_ + 1)].text = "";
            this["_ldrR" + (_loc2_ + 1)].contentPath = "";
            _loc2_ = _loc2_ + 1;
         }
         this.api.network.send("!CLO" + _loc3_.id);
         this.api.network.send("!CLo" + _loc3_.id);
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose:
         this.api.ui.unloadUIComponent("Logros");
         break;
      case this._btnBuscar:
         this.buscar(this._tiSearch.text);
   }
};
_loc1.over = function(oEvent)
{
   if(oEvent.target._name === "_pbAvance")
   {
      this.gapi.showTooltip(new ank["\x1e\n\x07"]["\x0e\x1c"](Number(this._sPuntos.split(",")[0])).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " / " + new ank["\x1e\n\x07"]["\x0e\x1c"](this._pbAvance.maximum).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3),this._pbAvance,-20);
   }
   if(oEvent.target._name === "_pbObjetivos")
   {
      this.gapi.showTooltip(new ank["\x1e\n\x07"]["\x0e\x1c"](this._pbObjetivos.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " / " + new ank["\x1e\n\x07"]["\x0e\x1c"](this._pbObjetivos.maximum).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3),this._pbObjetivos,-20);
   }
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
_loc1.addProperty("puntos",function()
{
}
,_loc1.__set__Puntos);
_loc1.addProperty("logros",function()
{
}
,_loc1.__set__Logros);
_loc1._aListaLogros = new Array();
_loc1._aCatLogros = new Array();
_loc1._aListaObjetivos = new Array();
_loc1._nTerminado = Number(0);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Logros.CLASS_NAME = "Logros";
