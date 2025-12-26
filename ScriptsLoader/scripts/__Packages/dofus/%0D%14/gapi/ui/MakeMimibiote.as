class dofus.§\r\x14§.gapi.ui.MakeMimibiote extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnClose;
   var _btnValidate;
   var _ivInventoryViewer;
   var _cgItemToAttach;
   var _cgItemToEat;
   var _ctrResult;
   var _winInventory;
   var _lblName;
   var _cgResult;
   var _mcFiligrane;
   static var CLASS_NAME = "MakeMimibiote";
   function MakeMimibiote()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.MakeMimibiote.CLASS_NAME);
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnValidate.addEventListener("click",this);
      this._ivInventoryViewer.addEventListener("dblClickItem",this);
      this._ivInventoryViewer.addEventListener("dropItem",this);
      this._ivInventoryViewer.cgGrid.multipleContainerSelectionEnabled = false;
      this._cgItemToAttach.addEventListener("dblClickItem",this);
      this._cgItemToAttach.addEventListener("dropItem",this);
      this._cgItemToAttach.addEventListener("dragItem",this);
      this._cgItemToAttach.addEventListener("overItem",this);
      this._cgItemToAttach.addEventListener("outItem",this);
      this._cgItemToEat.addEventListener("dblClickItem",this);
      this._cgItemToEat.addEventListener("dropItem",this);
      this._cgItemToEat.addEventListener("dragItem",this);
      this._cgItemToEat.addEventListener("overItem",this);
      this._cgItemToEat.addEventListener("outItem",this);
      this._cgItemToAttach.multipleContainerSelectionEnabled = false;
      this._cgItemToEat.multipleContainerSelectionEnabled = false;
      this._ctrResult.addEventListener("over",this);
      this._ctrResult.addEventListener("out",this);
   }
   function initTexts()
   {
      this._winInventory.title = this.api.datacenter.Player.data.name;
      this._lblName.text = this.api.lang.getText("CUSTOMIZE");
      this._btnValidate.label = this.api.lang.getText("VALIDATE");
   }
   function initData()
   {
      this._ivInventoryViewer.showKamas = false;
      this._ivInventoryViewer.dataProvider = this.api.datacenter.Player.Inventory;
      this._cgItemToAttach.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._cgItemToEat.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this._cgResult.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this.refreshPreview();
   }
   function putItem(§\x11\x15§, §\x1e\x19\x03§, §\x16\x12§)
   {
      if(_loc3_ != undefined && !this.canPutItem(_loc3_,_loc2_))
      {
         this.refreshPreview();
         return undefined;
      }
      var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc3_ = _loc3_.clone();
      _loc3_.Quantity = 1;
      if(!(!_loc4_ && _loc2_.dataProvider.length > 0))
      {
         if(_loc3_ != undefined)
         {
            _loc5_.push(_loc3_);
         }
      }
      _loc2_.dataProvider = _loc5_;
      this.refreshPreview();
   }
   function removeItem(§\x11\x15§)
   {
      this.putItem(_loc2_,undefined,false);
   }
   function canPutItem(§\x1e\x19\x03§, §\x13\x03§)
   {
      if(!dofus.Constants.isItemSuperTypeSkinable(_loc2_.superType))
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ITEM_NOT_SKINABLE"),"ERROR_CHAT");
         return false;
      }
      if(_loc2_.hasCustomGfx() || _loc2_.skineable)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ITEM_ALREADY_SKINED"),"ERROR_CHAT");
         return false;
      }
      if(_loc2_.skineable)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ITEM_IS_LIVING_OBJECT"),"ERROR_CHAT");
         return false;
      }
      if(_loc3_ == this._cgItemToEat)
      {
         var _loc4_ = this._cgItemToAttach;
      }
      else
      {
         _loc4_ = this._cgItemToEat;
      }
      var _loc5_ = _loc4_.dataProvider[0];
      if(_loc5_ != undefined)
      {
         if(_loc5_.superType != _loc2_.superType)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ITEM_SHOULD_BE_SAME_TYPE"),"ERROR_CHAT");
            return false;
         }
         if(_loc5_.unicID == _loc2_.unicID)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ITEM_SAME_ID"),"ERROR_CHAT");
            return false;
         }
         if(_loc3_ == this._cgItemToEat)
         {
            if(_loc5_.level < _loc2_.level)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_SKIN_ITEM_SUPERIOR_LEVEL"),"ERROR_CHAT");
               return false;
            }
         }
         else if(_loc2_.level < _loc5_.level)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_SKIN_ITEM_SUPERIOR_LEVEL"),"ERROR_CHAT");
            return false;
         }
      }
      return true;
   }
   function refreshPreview()
   {
      var _loc2_ = false;
      if(this._cgItemToAttach.dataProvider.length > 0 && this._cgItemToEat.dataProvider.length > 0)
      {
         this._btnValidate.enabled = true;
         var _loc3_ = this._cgItemToAttach.dataProvider[0];
         var _loc4_ = this._cgItemToEat.dataProvider[0];
         if(this._ctrResult.contentPath == undefined)
         {
            return undefined;
         }
         var _loc5_ = _loc3_.clone();
         if(_loc4_.realGfx != undefined)
         {
            _loc5_.gfx = _loc4_.realGfx;
         }
         else
         {
            _loc5_.gfx = _loc4_.gfx;
         }
         this._ctrResult.contentPath = _loc5_.iconFile;
         this._mcFiligrane.item = _loc5_;
         _loc2_ = true;
      }
      else
      {
         this._btnValidate.enabled = false;
      }
      if(!_loc2_)
      {
         this._ctrResult.contentPath = "";
      }
      this._mcFiligrane._visible = _loc2_;
      this._ctrResult._visible = _loc2_;
   }
   function yes(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "AskYesNoCreateMimibiote")
      {
         var _loc3_ = this._cgItemToAttach.dataProvider[0];
         var _loc4_ = this._cgItemToEat.dataProvider[0];
         if(!(_loc3_ == undefined || _loc4_ == undefined))
         {
            this.api.network.Items.associateMimibiote(_loc3_.ID,_loc4_.ID);
            this.unloadThis();
         }
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) !== this._btnValidate)
      {
         this.callClose();
      }
      else
      {
         var _loc3_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoCreateMimibiote",{title:this.api.lang.getText("QUESTION"),text:this.api.lang.getText("CONFIRM_MAKE_MIMIBIOTE")});
         _loc3_.addEventListener("yes",this);
      }
   }
   function dblClickItem(§\x1e\x19\x0e§)
   {
      if(_loc2_.owner != undefined)
      {
         var _loc3_ = _loc2_.owner.dataProvider[0];
         if(_loc3_ == undefined)
         {
            return undefined;
         }
         var _loc4_ = _loc2_.owner._name;
         switch(_loc4_)
         {
            case "_cgItemToAttach":
               this.removeItem(this._cgItemToAttach);
               break;
            case "_cgItemToEat":
               this.removeItem(this._cgItemToEat);
         }
      }
      if(_loc2_.target != undefined)
      {
         var _loc0_ = null;
         if((_loc0_ = _loc2_.target) === this._ivInventoryViewer)
         {
            var _loc5_ = _loc2_.item;
            if(_loc5_ == undefined)
            {
               return undefined;
            }
            if(this._cgItemToAttach.dataProvider.length == 0)
            {
               this.putItem(this._cgItemToAttach,_loc5_,false);
            }
            else
            {
               this.putItem(this._cgItemToEat,_loc5_,true);
            }
         }
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._ctrResult)
      {
         var _loc3_ = this._mcFiligrane.item;
         if(_loc3_ != undefined)
         {
            _loc3_.showStatsTooltip(_loc2_.target,_loc3_.style);
         }
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.api.ui.hideTooltip();
   }
   function overItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.contentData;
      _loc3_.showStatsTooltip(_loc2_.target,_loc2_.target.contentData.style);
   }
   function outItem(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function dragItem(§\x1e\x19\x0e§)
   {
      this.gapi.removeCursor();
      if(_loc2_.target.contentData == undefined)
      {
         return undefined;
      }
      this.gapi.setCursor(_loc2_.target.contentData);
   }
   function dropItem(§\x1e\x19\x0e§)
   {
      if(_loc2_.item != undefined)
      {
         var _loc3_ = _loc2_.item;
         var _loc4_ = this._cgItemToAttach.dataProvider[0];
         if(_loc4_ != undefined && _loc4_.ID == _loc3_.ID)
         {
            this.removeItem(this._cgItemToAttach);
            return undefined;
         }
         var _loc5_ = this._cgItemToEat.dataProvider[0];
         if(_loc5_ != undefined && _loc5_.ID == _loc3_.ID)
         {
            this.removeItem(this._cgItemToEat);
            return undefined;
         }
         return undefined;
      }
      _loc3_ = dofus.datacenter["\f\f"](this.gapi.getCursor());
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      this.gapi.removeCursor();
      var _loc6_ = _loc2_.target._parent._parent;
      var _loc7_ = _loc6_._name;
      switch(_loc7_)
      {
         case "_cgItemToAttach":
            var _loc8_ = this._cgItemToEat.dataProvider[0];
            if(_loc8_ != undefined && _loc8_.unicID == _loc3_.unicID)
            {
               this.removeItem(this._cgItemToEat);
            }
            this.putItem(_loc6_,_loc3_,true);
            break;
         case "_cgItemToEat":
            var _loc9_ = this._cgItemToAttach.dataProvider[0];
            if(_loc9_ != undefined && _loc9_.unicID == _loc3_.unicID)
            {
               this.removeItem(this._cgItemToAttach);
            }
            this.putItem(_loc6_,_loc3_,true);
      }
   }
}
