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
if(!dofus["\r\x14"].gapi.ui.listado)
{
   _global.dofus["\r\x14"].gapi.ui.listado = new Object();
}
_global.dofus["\r\x14"].gapi.ui.listado.ListadoItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.listado.ListadoItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.listado.ListadoItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   this._btnPropiedades.addEventListener("click",this);
   this._btnPropiedades.addEventListener("over",this);
   this._btnPropiedades.addEventListener("out",this);
   this._btnUbicacion.addEventListener("click",this);
   this._btnUbicacion.addEventListener("over",this);
   this._btnUbicacion.addEventListener("out",this);
   this._btnComprar.addEventListener("click",this);
   this._btnComprar.addEventListener("over",this);
   this._btnComprar.addEventListener("out",this);
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      var _loc6_ = oItem.tipo;
      var _loc4_ = oItem.precio;
      var _loc9_ = "";
      var _loc7_ = oItem.cofres;
      if(_loc6_ == 1)
      {
         var _loc8_ = this.api.lang.getHouseText(oItem.id).n;
         this.tipo = 1;
         this._ldrIcon.contentPath = "iconCasa";
         this._lblNombre.text = _loc8_ + " (" + _loc7_ + " " + this.api.lang.getText("STORAGE") + "(s)";
      }
      if(_loc6_ == 2)
      {
         var _loc5_ = oItem.cercado.split("-");
         this.tipo = 2;
         this._ldrIcon.contentPath = "iconCercado";
         this._lblNombre.text = this.api.lang.getText("MOUNT_PARK") + ": " + _loc5_[0] + " " + this.api.lang.getText("MOUNTS") + " / " + _loc5_[1] + " " + this.api.lang.getText("OBJETOS_CRIA");
         this.txtCompra = this._lblNombre.text;
      }
      this._btnComprar.label = this.api.lang.getText("BUY");
      this._iconLupa._visible = true;
      this._iconGeo._visible = true;
      this._btnPropiedades._visible = true;
      this._btnUbicacion._visible = true;
      if(_loc4_ == "V")
      {
         this._btnComprar.enabled = false;
         this._lblKamas.text = this.api.lang.getText("SERVER_OFFLINE_SHORT");
      }
      else
      {
         this._btnComprar.enabled = true;
         this._btnComprar._visible = true;
         this._lblKamas.text = _loc4_;
         this._lblKamas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " K";
      }
   }
   else if(this._lblNombre.text != undefined)
   {
      this._lblNombre.text = "";
      this._lblKamas.text = "";
      this._ldrIcon.contentPath = "";
      this._iconLupa._visible = false;
      this._iconGeo._visible = false;
      this._btnPropiedades._visible = false;
      this._btnUbicacion._visible = false;
      this._btnComprar._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._txtCantidad.text = "";
   this._iconLupa._visible = false;
   this._iconGeo._visible = false;
   this._btnPropiedades._visible = false;
   this._btnUbicacion._visible = false;
   this._btnComprar._visible = false;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnComprar:
         this._oEvent = oEvent;
         this.valid(false,this._oItem.precio);
         break;
      case this._btnPropiedades:
         if(this.tipo == 1)
         {
            _global.API.network.send("hLP" + this._oItem.id);
         }
         if(this.tipo == 2)
         {
            _global.API.network.send("RLP" + this._oItem.id);
         }
         break;
      case this._btnUbicacion:
         if(this.tipo == 1)
         {
            _global.API.network.send("hLU" + this._oItem.id);
         }
         if(this.tipo == 2)
         {
            _global.API.network.send("RLU" + this._oItem.id);
            break;
         }
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnUbicacion:
         api = _global.API;
         api.ui.showTooltip(this.api.lang.getText("VER_UBICACION"),oEvent.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case this._btnPropiedades:
         api = _global.API;
         api.ui.showTooltip(this.api.lang.getText("VER_PROPIEDADES"),oEvent.target,-20,{bXLimit:true,bYLimit:false});
   }
};
_loc1.valid = function(noConfirm, precio)
{
   if(!noConfirm)
   {
      if(this.tipo == 1)
      {
         _global.API.network.send("hLb" + this._oItem.id);
      }
      if(this.tipo == 2)
      {
         this.api.kernel.showMessage("ATTENTION","Se descontarán x" + new ank["\x1e\n\x07"]["\x0e\x1c"](this._oItem.precio).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " kamas para comprar el \'" + this.txtCompra + "\' ¿Desea continuar?","CAUTION_YESNO",{name:"Confirm",listener:this});
      }
      return undefined;
   }
   var _loc0_ = null;
   if((_loc0_ = this._oEvent.target) === this._btnComprar)
   {
      if(this.tipo == 1)
      {
         _global.API.network.send("hLb" + this._oItem.id);
      }
      if(this.tipo == 2)
      {
         _global.API.network.send("RLb" + this._oItem.id);
      }
   }
};
_loc1.yes = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.valid(true,this.nPrecio);
   }
};
_loc1.out = function(oEvent)
{
   api = _global.API;
   api.ui.hideTooltip();
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
_1oc1.tipo = 0;
_loc1.txtCompra = "";
ASSetPropFlags(_loc1,null,1);
