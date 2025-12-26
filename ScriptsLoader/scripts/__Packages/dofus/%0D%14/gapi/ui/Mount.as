class dofus.§\r\x14§.gapi.ui.Mount extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnNameValid;
   var _btnName;
   var _btnXP;
   var _btnRide;
   var _btnInventory;
   var _btnAction;
   var _btnClose;
   var _win;
   var _lblName;
   var _lblPercentXP;
   var _lblInventory;
   var _tiName;
   var _mcTextInputBackground;
   var _lblNameValue;
   var _lblPercentXPValue;
   var _mvMountViewer;
   static var CLASS_NAME = "Mount";
   function Mount()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Mount.CLASS_NAME);
   }
   function destroy()
   {
      this.gapi.hideTooltip();
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
      this.addToQueue({object:this,method:this.mountChanged,params:[{mount:this.api.datacenter.Player.mount}]});
   }
   function addListeners()
   {
      this._btnNameValid.addEventListener("click",this);
      this._btnName.addEventListener("click",this);
      this._btnName.addEventListener("over",this);
      this._btnName.addEventListener("out",this);
      this._btnXP.addEventListener("click",this);
      this._btnXP.addEventListener("over",this);
      this._btnXP.addEventListener("out",this);
      this._btnRide.addEventListener("click",this);
      this._btnRide.addEventListener("over",this);
      this._btnRide.addEventListener("out",this);
      this._btnInventory.addEventListener("click",this);
      this._btnInventory.addEventListener("over",this);
      this._btnInventory.addEventListener("out",this);
      this._btnAction.addEventListener("click",this);
      this._btnAction.addEventListener("over",this);
      this._btnAction.addEventListener("out",this);
      this.api.datacenter.Player.addEventListener("mountXPPercentChanged",this);
      this.api.datacenter.Player.addEventListener("mountChanged",this);
      this._btnClose.addEventListener("click",this);
   }
   function initData()
   {
      this.mountChanged();
   }
   function initTexts()
   {
      this._win.title = this.api.lang.getText("MY_MOUNT");
      this._lblName.text = this.api.lang.getText("NAME_BIG");
      this._lblPercentXP.text = this.api.lang.getText("MOUNT_PERCENT_XP");
      this._lblInventory.text = this.api.lang.getText("MOUNT_INVENTORY_2");
   }
   function editName(§\x1a\x12§)
   {
      this._tiName._visible = _loc2_;
      this._btnNameValid._visible = _loc2_;
      this._mcTextInputBackground._visible = _loc2_;
      this._lblNameValue._visible = !_loc2_;
      this._btnName._visible = !_loc2_;
   }
   function mountXPPercentChanged(§\x1e\x19\x0e§)
   {
      this._lblPercentXPValue.text = this.api.datacenter.Player.mountXPPercent + "%";
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnNameValid:
            if(this._tiName.text != "")
            {
               this.api.network.Mount.rename(this._tiName.text);
            }
            break;
         case this._btnName:
            this.editName(true);
            break;
         case this._btnXP:
            var _loc3_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:this.api.datacenter.Player.mountXPPercent,max:90});
            _loc3_.addEventListener("validate",this);
            break;
         case this._btnClose:
            this.callClose();
            break;
         case this._btnRide:
            this.api.network.Mount.ride();
            break;
         case this._btnInventory:
            this.api.network.Exchange.request(15);
            break;
         case this._btnAction:
            var _loc4_ = this.api.ui.createPopupMenu();
            var _loc5_ = this.api.datacenter.Player.mount;
            _loc4_.addStaticItem(_loc5_.name);
            _loc4_.addItem(this.api.lang.getText("MOUNT_CASTRATE_TOOLTIP"),this,this.castrateMount);
            _loc4_.addItem(this.api.lang.getText("MOUNT_KILL_TOOLTIP"),this,this.killMount);
            _loc4_.show(_root._xmouse,_root._ymouse);
      }
   }
   function castrateMount()
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_CASTRATE_YOUR_MOUNT"),"CAUTION_YESNO",{name:"CastrateMount",listener:this});
   }
   function killMount()
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_KILL_YOUR_MOUNT"),"CAUTION_YESNO",{name:"KillMount",listener:this});
   }
   function nameChanged(§\x1e\x19\x0e§)
   {
      var _loc3_ = this.api.datacenter.Player.mount;
      this._lblNameValue.text = _loc3_.name;
      this._tiName.text = _loc3_.name;
      this.editName(false);
   }
   function mountChanged(§\x1e\x19\x0e§)
   {
      var _loc3_ = this.api.datacenter.Player.mount;
      if(_loc3_ != undefined)
      {
         _loc3_.addEventListener("nameChanged",this);
         this._mvMountViewer.mount = _loc3_;
         this.mountXPPercentChanged();
         this.nameChanged();
      }
      else
      {
         this.callClose();
      }
   }
   function validate(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.value;
      if(_global.isNaN(_loc3_))
      {
         return undefined;
      }
      if(_loc3_ > 90)
      {
         return undefined;
      }
      if(_loc3_ < 0)
      {
         return undefined;
      }
      this.api.network.Mount.setXP(_loc3_);
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnName:
            this.gapi.showTooltip(this.api.lang.getText("MOUNT_RENAME_TOOLTIP"),_loc2_.target,-30,{bXLimit:true,bYLimit:false});
            break;
         case this._btnInventory:
            this.gapi.showTooltip(this.api.lang.getText("MOUNT_INVENTORY_ACCES"),_loc2_.target,-30,{bXLimit:true,bYLimit:false});
            break;
         case this._btnRide:
            this.gapi.showTooltip(this.api.lang.getText("MOUNT_RIDE_TOOLTIP"),_loc2_.target,-30,{bXLimit:true,bYLimit:false});
            break;
         case this._btnAction:
            this.gapi.showTooltip(this.api.lang.getText("MOUNT_ACTION_TOOLTIP"),_loc2_.target,-30,{bXLimit:true,bYLimit:false});
            break;
         case this._btnXP:
            this.gapi.showTooltip(this.api.lang.getText("MOUNT_XP_PERCENT_TOOLTIP"),_loc2_.target,-30,{bXLimit:true,bYLimit:false});
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function yes(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "AskYesNoKillMount":
            this.api.network.Mount.kill();
            break;
         case "AskYesNoCastrateMount":
            this.api.network.Mount.castrate();
      }
   }
}
