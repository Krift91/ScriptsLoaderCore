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
_global.dofus["\r\x14"].gapi.ui.CrearTitulo = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.CrearTitulo.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.CrearTitulo.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.CrearTitulo.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnCerrar.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this._btnMisT.addEventListener("click",this);
   if(!_global.CORE_SOUFIX)
   {
      this._btnBorrar.addEventListener("click",this);
   }
   else
   {
      this._btnBorrar._visible = false;
   }
   this._csColors.addEventListener("change",this);
};
_loc1.initTexts = function()
{
   this._txtNombre.restrict = "0-9a-zA-Z ";
   this._txtNombre.maxChars = 25;
   this._btnOk.label = "Créer";
   this._btnBorrar.label = this.api.lang.getText("CLOSE");
   this._txtTitulo.text = "Titre Personnalisé";
   this._win.title = "Titre Personnalisé ";
   this._btnMisT.label = "Mes titres";
};
_loc1.initData = function()
{
};
_loc1.setColors = function(oColors)
{
   this._nColor = Number(oColors.color1);
   this._txtNombre.textColor = this._nColor;
};
_loc1.change = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target) === this._csColors)
   {
      this.setColors(oEvent.value);
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnBorrar:
         this.api.ui.unloadUIComponent("CrearTitulo","Titulos");
         break;
      case this._btnMisT:
         this.api.network.send("BM*|.titre|");
         this.unloadThis();
         break;
      case this._btnOk:
         if(this._nColor == -1 || this._txtNombre.text == undefined || this._txtNombre.text == "")
         {
            return undefined;
         }
         if(!_global.CORE_SOUFIX)
         {
            this.api.network.send("AEL" + this._txtNombre.text + ";" + this._nColor);
            this.unloadThis();
            break;
         }
         api.kernel.showMessage(api.lang.getText("TITLE_VIP"),api.lang.getText("CONFIRMAR_GASTO") + _global.OGRINAS_TITULO_VIP,"CAUTION_YESNO",{listener:this});
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("CrearTitulo");
         this.unloadThis();
         break;
      default:
         this.yes();
         this.unloadThis();
   }
};
_loc1.yes = function(oEvent)
{
   this.api.network.send("Zst" + this._txtNombre.text + ";" + this._nColor);
   this.unloadThis();
};
ASSetPropFlags(_loc1,null,1);
_loc1._nColor = 16777215;
_global.dofus["\r\x14"].gapi.ui.CrearTitulo.CLASS_NAME = "CrearTitulo";
