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
_global.dofus["\r\x14"].gapi.ui.InfoPlayer = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.InfoPlayer.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.InfoPlayer.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.InfoPlayer.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.__set__Data = function(sValue)
{
   this._sData = sValue;
};
_loc1.addListeners = function()
{
   this._btnCancel.addEventListener("click",this);
   this._btnTienda.addEventListener("click",this);
   this._btnTienda.addEventListener("over",this);
   this._btnTienda.addEventListener("out",this);
   this._btnBoton2.addEventListener("click",this);
   this._btnBoton2.addEventListener("over",this);
   this._btnBoton2.addEventListener("out",this);
   this._btnTurno.addEventListener("click",this);
   this._btnTurno.addEventListener("over",this);
   this._btnTurno.addEventListener("out",this);
   this._btnSolo.addEventListener("click",this);
   this._btnSolo.addEventListener("over",this);
   this._btnSolo.addEventListener("out",this);
   this._btnFarm.addEventListener("click",this);
   this._btnFarm.addEventListener("over",this);
   this._btnFarm.addEventListener("out",this);
   this._btnSavePos.addEventListener("click",this);
   this._btnSavePos.addEventListener("over",this);
   this._btnSavePos.addEventListener("out",this);
   this._btnDj.addEventListener("click",this);
   this._btnDj.addEventListener("over",this);
   this._btnDj.addEventListener("out",this);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnCancel:
         this.api.ui.unloadUIComponent("InfoPlayer");
         break;
      case this._btnTienda:
         this.escojerComando(1);
         break;
      case this._btnBoton2:
         this.escojerComando(2);
         break;
      case this._btnTurno:
         this.escojerComando(3);
         break;
      case this._btnSolo:
         this.escojerComando(4);
         break;
      case this._btnFarm:
         this.escojerComando(5);
         break;
      case this._btnDj:
         this.escojerComando(6);
         break;
      case this._btnSavePos:
         this.escojerComando(7);
   }
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnTienda":
         this.gapi.showTooltip(this.api.lang.getText("SHOP"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnSavePos":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVE_DESACTIVE_SAVE_POS"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnBoton2":
         this.gapi.showTooltip(this.api.lang.getText("INFO_???"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnTurno":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVE_DESACTIVE_TURN"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnSolo":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVE_DESACTIVE_SOLO"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnFarm":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVE_DESACTIVE_FARM"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnDj":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVE_DESACTIVE_DJ"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
   }
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.lang.getText("PANEL_INFO_PLAYER");
   this._lblNombre.text = this.api.datacenter.Player.Name;
   this._btnTienda.label = this.api.lang.getText("BOUTIQUE");
   this._btnBoton2.label = this.api.lang.getText("---");
};
_loc1.initData = function()
{
   this.cargarDatos(this._sData);
   this.initPlayer();
};
_loc1.cargarDatos = function(sValue)
{
   this._sData = sValue;
   var _loc2_ = this._sData.split(";");
   this._txtPocionDj.text = Number(_loc2_[0]) >= 1 ? String(_loc2_[0]) : "Inactif";
   this._txtPocionDrop.text = Number(_loc2_[1]) >= 1 ? String(_loc2_[1]) : "Inactif";
   this._txtTimeVIP.text = Number(_loc2_[2]) >= 1 ? String(_loc2_[2]) : "Inactif";
   this._txtTimeE.text = Number(_loc2_[3]) >= 1 ? String(_loc2_[3]) : "Inactif";
   this._txtTurno.text = Number(_loc2_[4]) != 0 ? "Actif" : "Inactif";
   if(Number(_loc2_[4]) == 0)
   {
      this._btnTurno.styleName = "RedCheckButton";
      this._btnTurno.selected = false;
   }
   else if(Number(_loc2_[4]) != 0)
   {
      this._btnTurno.styleName = "GreenCheckButton";
      this._btnTurno.selected = true;
   }
   this._txtSoloR.text = Number(_loc2_[5]) != 0 ? "Actif" : "Inactif";
   if(Number(_loc2_[5]) == 0)
   {
      this._btnSolo.styleName = "RedCheckButton";
      this._btnSolo.selected = false;
   }
   else if(Number(_loc2_[5]) != 0)
   {
      this._btnSolo.styleName = "GreenCheckButton";
      this._btnSolo.selected = true;
   }
   this._txtFarm.text = Number(_loc2_[6]) != 0 ? "Actif" : "Inactif";
   if(Number(_loc2_[6]) == 0)
   {
      this._btnFarm.styleName = "RedCheckButton";
      this._btnFarm.selected = false;
   }
   else if(Number(_loc2_[6]) != 0)
   {
      this._btnFarm.styleName = "GreenCheckButton";
      this._btnFarm.selected = true;
   }
   this._txtDj.text = Number(_loc2_[7]) != 0 ? "Actif" : "Inactif";
   if(Number(_loc2_[7]) == 0)
   {
      this._btnDj.styleName = "RedCheckButton";
      this._btnDj.selected = false;
   }
   else if(Number(_loc2_[7]) != 0)
   {
      this._btnDj.styleName = "GreenCheckButton";
      this._btnDj.selected = true;
   }
   this._txtSavePos.text = Number(_loc2_[8]) != 0 ? "Actif" : "Inactif";
   if(Number(_loc2_[8]) == 0)
   {
      this._btnSavePos.styleName = "RedCheckButton";
      this._btnSavePos.selected = false;
   }
   else if(Number(_loc2_[8]) != 0)
   {
      this._btnSavePos.styleName = "GreenCheckButton";
      this._btnSavePos.selected = true;
   }
   this._txtNFight.text = Number(_loc2_[9]);
   this._txtAd2.text = Number(_loc2_[10]);
   this._txtAd3.text = Number(_loc2_[11]);
};
_loc1.setSpriteAccessories = function(_loc3_)
{
   if(_loc3_.length != 0)
   {
      var _loc9_ = new Array();
      var _loc6_ = _loc3_.split(",");
      var _loc2_ = 0;
      while(_loc2_ < _loc6_.length)
      {
         if(_loc6_[_loc2_].indexOf("~") != -1)
         {
            var _loc5_ = _loc6_[_loc2_].split("~");
            var _loc4_ = _global.parseInt(_loc5_[0],16);
            var _loc7_ = _global.parseInt(_loc5_[1]);
            _loc3_ = _global.parseInt(_loc5_[2]) - 1;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
         }
         else
         {
            _loc4_ = _global.parseInt(_loc6_[_loc2_],16);
            _loc7_ = undefined;
            _loc3_ = undefined;
         }
         if(!_global.isNaN(_loc4_))
         {
            var _loc8_ = new dofus.datacenter["\x11"](_loc4_,_loc7_,_loc3_);
            _loc9_[_loc2_] = _loc8_;
         }
         _loc2_ += 1;
      }
      return _loc9_;
   }
};
_loc1.initPlayer = function()
{
   this._svCharacter.zoom = 200;
   this._svCharacter.spriteAnims = ["StaticF"];
   this._svCharacter.refreshDelay = 50;
   this._svCharacter.spriteData = this.api.datacenter.Player.data;
   var _loc3_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svCharacter.useSingleLoader = true;
   this._csColors.breed = this.api.datacenter.Player.Guild;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc5_ = this.api.datacenter.Player.Guild + "" + this.api.datacenter.Player.Sex;
   var _loc4_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc5_ + ".swf",undefined,5);
   _loc4_.accessories = _loc3_.accessories;
   this._svCharacter.enableBlur = true;
   this._svCharacter.refreshAccessories = !var2;
   this._svCharacter.sourceSpriteData = _loc3_;
   this._svCharacter.spriteData = _loc4_;
   this._svCharacter.setColors(this._oColors);
};
_loc1.escojerComando = function(comando)
{
   this.api.network.send("!CIE" + comando);
};
_loc1.escojerHard = function(comando)
{
   this.api.network.send("Ih" + comando);
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
ASSetPropFlags(_loc1,null,1);
_loc1._nNivelSong = 0;
_global.dofus["\r\x14"].gapi.ui.InfoPlayer.CLASS_NAME = "InfoPlayer";
