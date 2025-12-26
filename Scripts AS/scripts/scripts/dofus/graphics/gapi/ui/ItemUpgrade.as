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
_global.dofus["\r\x14"].gapi.ui.ItemUpgrade = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.ItemUpgrade.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.ItemUpgrade.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.ItemUpgrade.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.updateData});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnFusion.addEventListener("click",this);
   this._cgItem1.addEventListener("selectItem",this);
   this._cgItem1.addEventListener("overItem",this);
   this._cgItem1.addEventListener("outItem",this);
   this._cgItem1.addEventListener("dblClickItem",this);
   this._cgItem2.addEventListener("selectItem",this);
   this._cgItem2.addEventListener("overItem",this);
   this._cgItem2.addEventListener("outItem",this);
   this._cgItem2.addEventListener("dblClickItem",this);
   this._cgItem3.addEventListener("selectItem",this);
   this._cgItem3.addEventListener("overItem",this);
   this._cgItem3.addEventListener("outItem",this);
   this._cgItem3.addEventListener("dblClickItem",this);
   this._cgItemR.addEventListener("selectItem",this);
   this._cgItemR.addEventListener("overItem",this);
   this._cgItemR.addEventListener("outItem",this);
   this._cgItemR.addEventListener("dblClickItem",this);
   this._btnReload.addEventListener("click",this);
   this._btnReload.addEventListener("over",this);
   this._btnReload.addEventListener("out",this);
   this._cgResultado.addEventListener("selectItem",this);
   this._cgResultado.addEventListener("overItem",this);
   this._cgResultado.addEventListener("outItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgGrid.addEventListener("dblClickItem",this);
   this._cgGrid._visible = false;
   this._itvItemViewer._visible = false;
   this._winItemViewer._visible = false;
   this._btnFusion.enabled = false;
   this._mcMaskCtr1._visible = true;
   this._mcMaskCtr2._visible = true;
   this._mcMaskSucceed._visible = false;
   this._cbTypes.addEventListener("itemSelected",this);
};
_loc1.initData = function()
{
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   _loc8_.push({id:0,label:"(" + this.api.lang.getText("PLEASE_SELECT") + ")"});
   _loc8_.push({id:-1,label:this.api.lang.getText("WITHOUT_TYPE_FILTER")});
   var _loc7_ = [];
   var _loc2_ = 0;
   while(_loc2_ < this._aFiltersType.length)
   {
      var _loc4_ = this._aFiltersType[_loc2_];
      var _loc6_ = this.api.lang.getItemTypeText(_loc4_);
      if(_loc6_ != undefined)
      {
         _loc7_.push({id:_loc4_,label:_loc6_.n});
      }
      _loc2_ += 1;
   }
   if(_loc7_.length > 1)
   {
      _loc7_.sortOn("label",Array.CASEINSENSITIVE);
   }
   _loc2_ = 0;
   while(_loc2_ < _loc7_.length)
   {
      _loc8_.push(_loc7_[_loc2_]);
      _loc2_ += 1;
   }
   _loc2_ = 0;
   while(_loc2_ < this._aFiltersTypeRecursos.length)
   {
      var _loc5_ = this._aFiltersTypeRecursos[_loc2_];
      var _loc3_ = this.api.lang.getItemTypeText(_loc5_);
      if(_loc3_ != undefined)
      {
         _loc8_.push({id:_loc5_,label:_loc3_.n});
      }
      _loc2_ += 1;
   }
   this._cbTypes.dataProvider = _loc8_;
   this._cbTypes.selectedIndex = 0;
};
_loc1.initTexts = function()
{
   this._btnFusion.label = this.api.lang.getText("FUSIONAR");
   this._winBg.title = this.api.lang.getText("ItemUpgrade");
   this._winBg.setTitleColor(255);
   this._winBg.setBackgroundAlpha(70);
};
_loc1.getItemsPlacesEnGrilles = function()
{
   var _loc3_ = [];
   var _loc2_ = undefined;
   if(this._cgItem1.dataProvider != undefined && this._cgItem1.dataProvider.length > 0)
   {
      _loc2_ = this._cgItem1.getContainer(0).contentData;
      if(_loc2_ != undefined)
      {
         _loc3_.push(_loc2_.ID);
      }
   }
   if(this._cgItem2.dataProvider != undefined && this._cgItem2.dataProvider.length > 0)
   {
      _loc2_ = this._cgItem2.getContainer(0).contentData;
      if(_loc2_ != undefined)
      {
         _loc3_.push(_loc2_.ID);
      }
   }
   if(this._cgItem3.dataProvider != undefined && this._cgItem3.dataProvider.length > 0)
   {
      _loc2_ = this._cgItem3.getContainer(0).contentData;
      if(_loc2_ != undefined)
      {
         _loc3_.push(_loc2_.ID);
      }
   }
   if(this._cgItemR.dataProvider != undefined && this._cgItemR.dataProvider.length > 0)
   {
      _loc2_ = this._cgItemR.getContainer(0).contentData;
      if(_loc2_ != undefined)
      {
         _loc3_.push(_loc2_.ID);
      }
   }
   return _loc3_;
};
_loc1.estItemDejaPlacer = function(itemID, listeIDs)
{
   var _loc1_ = 0;
   while(_loc1_ < listeIDs.length)
   {
      if(listeIDs[_loc1_] == itemID)
      {
         return true;
      }
      _loc1_ = _loc1_ + 1;
   }
   return false;
};
_loc1.updateData = function(nTypeID)
{
   this._eaDataProvider = this.api.datacenter.Player.Inventory;
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc6_ = this.getItemsPlacesEnGrilles();
   for(var _loc7_ in this._eaDataProvider)
   {
      var _loc2_ = this._eaDataProvider[_loc7_];
      if(!this.estItemDejaPlacer(_loc2_.ID,_loc6_))
      {
         if(!_loc2_.isItemUpgrade && !_loc2_.skineable && _loc2_.position == -1 && _loc2_.canBeExchange)
         {
            if(nTypeID == undefined)
            {
               var _loc3_ = -1;
               while(true)
               {
                  _loc3_ += 1;
                  if(_loc3_ >= this._aFiltersType.length)
                  {
                     break;
                  }
                  if(_loc2_.type == this._aFiltersType[_loc3_])
                  {
                     _loc4_.push(_loc2_);
                     break;
                  }
               }
            }
            else if(_loc2_.type == nTypeID)
            {
               _loc4_.push(_loc2_);
            }
         }
      }
   }
   if(_loc4_.length)
   {
      this._cgGrid.dataProvider = _loc4_;
   }
   else if(nTypeID == undefined)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_NO_ITEM_UPGRADE",["ItemUpgrade"]),"ERROR_BOX",{name:"noItem",listener:this});
      this.callClose();
   }
   else
   {
      this._cgGrid.dataProvider = _loc4_;
   }
};
_loc1.updateDataR = function(nTypeID)
{
   this._eaDataProvider = this.api.datacenter.Player.Inventory;
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc6_ = this.getItemsPlacesEnGrilles();
   for(var _loc7_ in this._eaDataProvider)
   {
      var _loc2_ = this._eaDataProvider[_loc7_];
      if(!this.estItemDejaPlacer(_loc2_.ID,_loc6_))
      {
         if(!_loc2_.isItemUpgrade && !_loc2_.skineable && _loc2_.position == -1 && _loc2_.canBeExchange)
         {
            if(nTypeID == undefined)
            {
               var _loc3_ = -1;
               while(true)
               {
                  _loc3_ += 1;
                  if(_loc3_ >= this._aFiltersTypeRecursos.length)
                  {
                     break;
                  }
                  if(_loc2_.type == this._aFiltersTypeRecursos[_loc3_])
                  {
                     _loc4_.push(_loc2_);
                     break;
                  }
               }
            }
            else if(_loc2_.type == nTypeID)
            {
               _loc4_.push(_loc2_);
            }
         }
      }
   }
   if(_loc4_.length)
   {
      this._cgGrid.dataProvider = _loc4_;
   }
   else if(nTypeID == undefined)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_NO_ITEM_UPGRADE_RELIQUIA",["ItemUpgrade"]),"ERROR_BOX",{name:"noItem",listener:this});
      this.updateData();
   }
   else
   {
      this._cgGrid.dataProvider = _loc4_;
   }
};
_loc1.itemSelected = function(oEvent)
{
   var _loc4_ = null;
   if((_loc4_ = oEvent.target._name) === "_cbTypes")
   {
      this._nCategoriaID = this._cbTypes.selectedItem.id;
      switch(this._nCategoriaID)
      {
         case 0:
            this._cgGrid.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
            break;
         case -1:
            this.updateData();
            break;
         case 132:
            this.updateDataR(132);
            break;
         default:
            var _loc3_ = false;
            var _loc2_ = 0;
            while(_loc2_ < this._aFiltersTypeRecursos.length)
            {
               if(this._aFiltersTypeRecursos[_loc2_] == this._nCategoriaID)
               {
                  _loc3_ = true;
                  break;
               }
               _loc2_ += 1;
            }
            if(_loc3_)
            {
               this.updateDataR(this._nCategoriaID);
               break;
            }
            this.updateData(this._nCategoriaID);
            break;
      }
   }
};
_loc1.callClose = function()
{
   this.unloadThis();
   return true;
};
_loc1.validate = function(noConfirm)
{
   var _loc4_ = this._cgItem1.getContainer(0).contentData;
   var _loc6_ = this._cgItem2.getContainer(0).contentData;
   var _loc5_ = this._cgItem3.getContainer(0).contentData;
   var _loc3_ = this._cgItemR.getContainer(0).contentData;
   var _loc2_ = 0;
   if(_loc3_ == undefined)
   {
      _loc2_ = 0;
   }
   else
   {
      _loc2_ = _loc3_.unicID;
   }
   if(!noConfirm)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("CONFIRM_FUSION_ITEMUPGRADE",[_loc4_.name,this.exito]),"CAUTION_YESNO",{name:"Confirm",listener:this});
      return undefined;
   }
   this.api.network.send("OuE" + _loc4_.ID + "," + _loc6_.ID + "," + _loc5_.ID + "," + _loc2_ + "," + this._objMejoraID + "," + this.exito);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose:
         this.callClose();
         break;
      case this._btnFusion:
         this.validate(false);
   }
};
_loc1.dblClickItem = function(oEvent)
{
   this._cgResultado.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = 0;
   var _loc8_ = Number(0);
   var _loc7_ = false;
   var _loc2_ = undefined;
   var _loc3_ = undefined;
   var _loc6_ = undefined;
   var _loc4_ = undefined;
   var _loc15_ = null;
   if((_loc15_ = oEvent.target._parent._parent) !== this._cgGrid)
   {
      this.Cg = oEvent.target._parent._parent;
      this.mostrarViewer(false);
      this._cgGrid._visible = true;
      if(this._nCategoriaID == 132)
      {
         this.updateDataR(this._nCategoriaID);
      }
      else if(this._nCategoriaID == -1)
      {
         this.updateData();
      }
      else if(this._nCategoriaID > 0)
      {
         this.updateData(this._nCategoriaID);
      }
   }
   else
   {
      this._cgGrid._visible = false;
      var _loc13_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc10_ = oEvent.target.contentData;
      _loc13_.push(new dofus.datacenter["\f\f"](_loc10_.ID,_loc10_.unicID,1,-1,_loc10_.compressedEffects));
      this.Cg.dataProvider = _loc13_;
      if(this._nCategoriaID == 132)
      {
         this.updateDataR(this._nCategoriaID);
      }
      else if(this._nCategoriaID == -1)
      {
         this.updateData();
      }
      else if(this._nCategoriaID > 0)
      {
         this.updateData(this._nCategoriaID);
      }
      _loc2_ = this._cgItem1.getContainer(0).contentData;
      _loc3_ = this._cgItem2.getContainer(0).contentData;
      _loc6_ = this._cgItem3.getContainer(0).contentData;
      _loc4_ = this._cgItemR.getContainer(0).contentData;
      _loc7_ = false;
      if(_loc4_.unicID == 20073)
      {
         _loc8_ = 10;
      }
      if(_loc4_.unicID == 20074)
      {
         _loc8_ = 15;
      }
      if(_loc4_.unicID == 20075)
      {
         _loc8_ = 18;
      }
      if(_loc4_.unicID == 20076)
      {
         _loc8_ = 20;
      }
      if(_loc4_.unicID == 20077)
      {
         _loc8_ = 22;
      }
      if(_loc4_.unicID == 20078)
      {
         _loc8_ = 24;
      }
      if(_loc4_.unicID == 20079)
      {
         _loc8_ = 26;
      }
      if(_loc4_.unicID == 20080)
      {
         _loc8_ = 28;
      }
      var _loc9_ = undefined;
      if(_loc4_.type !== 132 && _loc4_ !== undefined)
      {
         this.api.kernel.showMessage(undefined,"Tu ne peux placer que des objets de type ressources.","ERROR_BOX");
         _loc7_ = false;
         this._mcMaskSucceed._visible = false;
         this._btnFusion.enabled = false;
      }
      if(_loc2_ && _loc2_.type === 132 || _loc3_ && _loc3_.type === 132 || _loc6_ && _loc6_.type === 132)
      {
         this.api.kernel.showMessage(undefined,"Les objets ne peuvent pas être de type ressource.","ERROR_BOX");
         this._mcMaskSucceed._visible = false;
         this._btnFusion.enabled = false;
         _loc7_ = false;
      }
      if(_loc4_.type !== 132 && _loc4_ !== undefined)
      {
         this.api.kernel.showMessage(undefined,"Tu ne peux placer que des objets de type **ressource**.","ERROR_BOX");
         _loc7_ = false;
         this._mcMaskSucceed._visible = false;
         this._btnFusion.enabled = false;
      }
      if(_loc2_ !== undefined && _loc3_ !== undefined && _loc6_ !== undefined)
      {
         if(_loc2_.type !== _loc3_.type || _loc3_.type !== _loc6_.type)
         {
            this.api.kernel.showMessage(undefined,"Les objets ne sont pas du même type.","ERROR_BOX");
            _loc7_ = false;
            this._mcMaskSucceed._visible = false;
            this._btnFusion.enabled = false;
         }
         else if(_loc2_.unicID != _loc3_.unicID && _loc3_.unicID != _loc6_.unicID)
         {
            this.api.kernel.showMessage(undefined,"Les objets choisis ne sont pas similaires.","ERROR_BOX");
            _loc7_ = false;
            this._mcMaskSucceed._visible = false;
            this._btnFusion.enabled = false;
         }
         else if(_loc2_.unicID == _loc3_.unicID && _loc3_.unicID == _loc6_.unicID)
         {
            if(_loc2_.ID == _loc3_.ID || _loc3_.ID == _loc6_.ID || _loc2_.ID == _loc6_.ID)
            {
               this.api.kernel.showMessage(undefined,"Les objets doivent être différents.","ERROR_BOX");
               this._mcMaskSucceed._visible = false;
               this._btnFusion.enabled = false;
               _loc7_ = false;
            }
            else if(_loc2_.style != _loc3_.style || _loc3_.style != _loc6_.style)
            {
               this.api.kernel.showMessage(undefined,"Les objets doivent avoir le même type","ERROR_BOX");
               this._mcMaskSucceed._visible = false;
               this._btnFusion.enabled = false;
               _loc7_ = false;
            }
            else
            {
               if(_loc2_.style == "Leg")
               {
                  _loc5_ = 2;
               }
               else if(_loc2_.style == "Div")
               {
                  _loc5_ = 3;
               }
               else if(_loc2_.style == "Raro")
               {
                  _loc5_ = 4;
               }
               else if(_loc2_.style == "Mitico")
               {
                  _loc5_ = 5;
               }
               else
               {
                  _loc5_ = 0;
               }
               if(_loc5_ == 0)
               {
                  var _loc12_ = this.api.lang.getItemUnicText(80001);
                  var _loc17_ = _loc12_.g;
                  var _loc19_ = _loc12_.t;
                  this._ldrItem.contentPath = "clips/items/" + _loc19_ + "/" + _loc17_ + ".swf";
                  this._txtCantidad.text = "x 30";
                  this._objMejoraID = 80001;
                  base = 50;
               }
               else if(_loc5_ == 2)
               {
                  var _loc11_ = this.api.lang.getItemUnicText(80002);
                  var _loc18_ = _loc11_.g;
                  var _loc16_ = _loc11_.t;
                  this._ldrItem.contentPath = "clips/items/" + _loc16_ + "/" + _loc18_ + ".swf";
                  this._txtCantidad.text = "x 50";
                  this._objMejoraID = 80002;
                  base = 25;
               }
               else if(_loc5_ == 3)
               {
                  base = 50;
               }
               else if(_loc5_ == 4)
               {
                  base = 30;
               }
               else if(_loc5_ == 5)
               {
                  base = 15;
               }
               _loc9_ = base + _loc8_;
               _loc9_ = Math.min(_loc9_,100);
               this._txtExito.text = _loc9_;
               this.exito = _loc9_;
               this._mcMaskSucceed._visible = true;
               this._btnFusion.enabled = true;
               _loc7_ = true;
            }
         }
      }
   }
   if(_loc7_ && _loc2_ !== undefined)
   {
      this.enviarPacket(_loc2_.unicID,_loc5_);
   }
};
_loc1.actualizarItem = function(unicID, exoColor)
{
   this._cgResultado.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = this._cgItem1.getContainer(0).contentData;
   _global.trace("_cgItem1 : " + _loc5_);
   var _loc3_ = _loc5_.compressedEffects;
   _global.trace("_loc3 : " + _loc3_);
   _loc3_ = "384#" + exoColor + "#0#0#0d0+" + exoColor;
   _global.trace("_loc3Nuevo : " + _loc3_);
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   _global.trace("_loc8 : " + _loc4_);
   _loc4_.push(new dofus.datacenter["\f\f"](0,unicID,1,-1,_loc3_));
   this._cgResultado.dataProvider = _loc4_;
   _global.trace("_cgResultado : " + this._cgResultado.dataProvider);
};
_loc1.enviarPacket = function(idObjeto, objetoExo)
{
   this.api.network.send("Oui" + idObjeto + "," + objetoExo);
};
_loc1.mostrarViewer = function(bMostrar)
{
   this._itvItemViewer._visible = bMostrar;
   this._winItemViewer._visible = bMostrar;
};
_loc1.selectItem = function(oEvent)
{
   this._itvItemViewer.itemData = oEvent.target.contentData;
   this.mostrarViewer(true);
};
_loc1.descriItem = function(oEvent)
{
   var _loc3_ = oEvent;
   var _loc5_ = -20;
   var _loc2_ = _loc3_.name;
   var _loc4_ = true;
   for(var _loc6_ in _loc3_.effects)
   {
      var _loc1_ = _loc3_.effects[_loc6_];
      if(_loc1_.description.length > 0)
      {
         if(_loc4_)
         {
            _loc2_ += "\n";
            _loc5_ -= 10;
            _loc4_ = false;
         }
         _loc2_ = _loc2_ + "\n" + _loc1_.description;
         _loc5_ -= 12;
      }
   }
   return _loc2_;
};
_loc1.overItem = function(oEvent)
{
   if(oEvent.target == undefined || oEvent.target.contentData.length == 0 || oEvent.target.contentData == undefined || oEvent.target.contentData.name == "")
   {
      return undefined;
   }
   var _loc9_ = oEvent.target.contentData;
   var _loc4_ = _loc9_;
   var _loc3_ = "";
   var _loc6_ = -20;
   var _loc5_ = true;
   for(var _loc8_ in _loc4_.effects)
   {
      var _loc2_ = _loc4_.effects[_loc8_];
      if(_loc2_.description.length > 0)
      {
         if(_loc5_)
         {
            _loc3_ += "\n";
            _loc6_ -= 10;
            _loc5_ = false;
         }
         _loc3_ = _loc3_ + "\n" + _loc2_.description;
         _loc6_ -= 12;
      }
   }
   this.gapi.showTooltip(oEvent.target.contentData.name + " " + _loc3_,oEvent.target,-20,undefined,oEvent.target.contentData.style + "ToolTip");
};
_loc1.outItem = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.yes = function(oEvent)
{
   var _loc2_ = null;
   if((_loc2_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.validate(true);
   }
};
_loc1.Cg = null;
_loc1._aFiltersType = [1,2,3,4,5,6,7,8,9,10,11,16,17,18,19,21,22,81,82];
_loc1._aFiltersTypeRecursos = [132];
_loc1._nCategoriaID = 0;
_loc1.exito = 0;
_loc1._objMejoraID = 0;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.ItemUpgrade.CLASS_NAME = "ItemUpgrade";
