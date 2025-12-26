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
_global.dofus["\r\x14"].gapi.ui.Listado = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Listado.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Listado.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Listado.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.aparecer(false);
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnCasas.addEventListener("click",this);
   this._btnCercados.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnSearch.addEventListener("click",this);
};
_loc1.aparecer = function(b)
{
   this._winbBG._visible = b;
   this._txtPrecio._visible = b;
   this._txtPrecioV._visible = b;
   this._txtInfo._visible = b;
   this._txtInfo1._visible = b;
   this._txtInfo2._visible = b;
   this._btnCerrar._visible = b;
   this._iconKama._visible = b;
   this._bh._visible = b;
   this._ldrIcon._visible = b;
   this._ldrIcon1._visible = b;
   this._ldrIcon2._visible = b;
   this._txtTitulo._visible = b;
};
_loc1.propiedades = function(sDatos)
{
   var _loc6_ = sDatos.split(",")[0];
   var _loc8_ = sDatos.split(",")[1];
   var _loc5_ = sDatos.split(",")[2];
   var _loc7_ = sDatos.split(",")[3];
   var _loc4_ = sDatos.split(",")[4];
   this.aparecer(true);
   this._txtPrecioV.text = _loc6_;
   this._txtPrecioV.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc6_).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   if(_loc5_ == 1)
   {
      this._ldrIcon.contentPath = "iconCasa";
      this._ldrIcon1.contentPath = "iconCelda";
      this._ldrIcon2.contentPath = "IconPods";
      this._txtTitulo.text = this.api.lang.getHouseText(_loc8_).n;
      this._txtInfo1.text = _loc7_ + " " + this.api.lang.getText("HABITACIONES");
      this._txtInfo2.text = _loc4_ + " " + this.api.lang.getText("STORAGE") + "(s)";
   }
   if(_loc5_ == 2)
   {
      this._ldrIcon.contentPath = "iconCercado";
      this._ldrIcon1.contentPath = "iconMontura";
      this._ldrIcon2.contentPath = "iconCria";
      this._txtTitulo.text = this.api.lang.getText("MOUNTS");
      this._txtInfo1.text = _loc7_ + " " + this.api.lang.getText("MOUNTS");
      this._txtInfo2.text = _loc4_ + " " + this.api.lang.getText("OBJETOS_CRIA");
   }
};
_loc1.initTexts = function()
{
   this._dgListado.columnsNames = ["",this.api.lang.getText("NAME"),this.api.lang.getText("PRICE")];
   this._winBg.title = this.api.lang.getText("AGENCIA_INMOBILIARIA");
   this._btnCasas.label = this.api.lang.getText("HOUSES_WORD");
   this._btnCercados.label = this.api.lang.getText("MOUNT_PARK");
   this._txtPrecio.text = this.api.lang.getText("PRICE") + ":";
   this._txtInfo.text = this.api.lang.getText("WHOIS");
   this._btnCerrar.label = this.api.lang.getText("CLOSE");
   this._btnSearch.label = this.api.lang.getText("SEARCH");
   this._tiSearch.text = "";
   this._tiSearch.setFocus();
   this._lblInformacion.text = this.api.lang.getText("WHOIS");
};
_loc1.buscar = function(sFilter)
{
   var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc7_ = sFilter.toUpperCase();
   var _loc5_ = parseInt(sFilter);
   for(var _loc9_ in this._aListado)
   {
      var _loc2_ = this._aListado[_loc9_];
      if(_loc2_.tipo == 1)
      {
         var _loc3_ = this.api.lang.getHouseText(_loc2_.id).n;
         if(sFilter.length > 0 && _loc3_.toUpperCase().indexOf(_loc7_) == -1)
         {
            continue;
         }
      }
      else if(_loc2_.tipo == 2)
      {
         var _loc4_ = parseInt(_loc2_.cercado.split("-")[0]);
         if(!isNaN(_loc5_) && _loc4_ != _loc5_)
         {
            continue;
         }
      }
      _loc6_.push(_loc2_);
   }
   if(_loc6_.length == 0)
   {
      this._dgListado._visible = false;
   }
   else
   {
      this._dgListado._visible = true;
      this._dgListado.dataProvider = _loc6_;
   }
};
_loc1.tipoListado = function(sValue)
{
   this._aListado = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = sValue.split(";");
   var _loc5_ = 0;
   for(_loc5_ in _loc4_)
   {
      var _loc3_ = _loc4_[_loc5_];
      var _loc2_ = new Object();
      _loc2_.id = _loc3_.split(",")[0];
      _loc2_.precio = _loc3_.split(",")[1];
      _loc2_.tipo = _loc3_.split(",")[2];
      _loc2_.cercado = _loc3_.split(",")[3];
      _loc2_.cofres = _loc3_.split(",")[4];
      this._aListado.push(_loc2_);
   }
   this._dgListado.dataProvider = this._aListado;
   if(_loc2_.tipo == 1)
   {
      this._lblTotal.text = this.api.lang.getText("HOUSES_WORD") + " " + this.api.lang.getText("DISPONIBLE") + "(s): " + this._aListado.length;
   }
   if(_loc2_.tipo == 2)
   {
      this._lblTotal.text = this.api.lang.getText("MOUNT_PARK") + "(s) " + this.api.lang.getText("DISPONIBLE") + "(s): " + this._aListado.length;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnSearch:
         this.buscar(this._tiSearch.text);
         break;
      case this._btnClose:
         this.api.ui.unloadUIComponent("Listado");
         break;
      case this._btnCerrar:
         this.aparecer(false);
         break;
      case this._btnCercados:
         this._dgListado.columnsNames = ["",this.api.lang.getText("NAME_BIG"),this.api.lang.getText("PRICE")];
         this.api.network.send("RLl");
         this._btnCasas.selected = true;
         this._btnCercados.selected = false;
         break;
      case this._btnCasas:
         this._dgListado.columnsNames = ["",this.api.lang.getText("NAME_BIG"),this.api.lang.getText("PRICE")];
         this.api.network.send("hLl");
         this._btnCasas.selected = false;
         this._btnCercados.selected = true;
   }
};
_loc1._aListado = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Listado.CLASS_NAME = "Listado";
