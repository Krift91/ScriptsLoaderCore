class dofus.§\r\x14§.gapi.ui.MountStorage extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _eaMount;
   var _eaParkMounts;
   var _cbFilterShed;
   var _cbFilterPark;
   var _lstCertificate;
   var _lstMountPark;
   var _lstShed;
   var _btnClose;
   var _btnShed;
   var _btnMountPark;
   var _btnCertificate;
   var _btnInventory;
   var _ldrSprite;
   var _mcRectanglePreview;
   var _winCertificate;
   var _winMountPark;
   var _winInventory;
   var _winShed;
   var _lblTitle;
   var _lblInventoryNoMount;
   var _mcArrowShed;
   var _mcArrowMountPark;
   var _mcArrowCertificate;
   var _mcArrowInventory;
   var _winMountViewer;
   var _mvMountViewer;
   var _winItemViewer;
   var _itvItemViewer;
   var _lblInventoryMountModel;
   var _lblInventoryMountName;
   var _btnInventoryMount;
   var _nSelectFrom;
   static var CLASS_NAME = "MountStorage";
   static var FROM_SHED = 0;
   static var FROM_MOUNTPARK = 1;
   static var FROM_CERTIFICATE = 2;
   static var FROM_INVENTORY = 3;
   function MountStorage()
   {
      super();
   }
   function set mounts(§\x10\x02§)
   {
      this._eaMount.removeEventListener("modelChanged",this);
      this._eaMount = _loc2_;
      this._eaMount.addEventListener("modelChanged",this);
      if(this.initialized)
      {
         this.modelChanged({target:this._eaMount});
      }
   }
   function get mounts()
   {
      return this._eaMount;
   }
   function set parkMounts(§\x10\x02§)
   {
      this._eaParkMounts.removeEventListener("modelChanged",this);
      this._eaParkMounts = _loc2_;
      this._eaParkMounts.addEventListener("modelChanged",this);
      if(this.initialized)
      {
         this.modelChanged({target:this._eaParkMounts});
      }
   }
   function get parkMounts()
   {
      return this._eaParkMounts;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.MountStorage.CLASS_NAME);
   }
   function callClose()
   {
      this.api.network.Exchange.leave();
      return true;
   }
   function createChildren()
   {
      this.hideViewersAndButtons();
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.initData});
      this.gapi.unloadLastUIAutoHideComponent();
   }
   function addListeners()
   {
      this.api.datacenter.Player.addEventListener("mountChanged",this);
      this.api.datacenter.Player.Inventory.addEventListener("modelChanged",this);
      this.api.datacenter.Player.mount.addEventListener("nameChanged",this);
      this._cbFilterShed.addEventListener("itemSelected",this);
      this._cbFilterPark.addEventListener("itemSelected",this);
      this._lstCertificate.addEventListener("itemSelected",this);
      this._lstCertificate.addEventListener("itemRollOver",this);
      this._lstCertificate.addEventListener("itemRollOut",this);
      this._lstMountPark.addEventListener("itemSelected",this);
      this._lstMountPark.addEventListener("itemRollOver",this);
      this._lstMountPark.addEventListener("itemRollOut",this);
      this._lstShed.addEventListener("itemSelected",this);
      this._lstShed.addEventListener("itemRollOver",this);
      this._lstShed.addEventListener("itemRollOut",this);
      this._btnClose.addEventListener("click",this);
      this._btnShed.addEventListener("click",this);
      this._btnMountPark.addEventListener("click",this);
      this._btnCertificate.addEventListener("click",this);
      this._btnInventory.addEventListener("click",this);
      this._ldrSprite.addEventListener("initialization",this);
      this._mcRectanglePreview.onRelease = function()
      {
         this._parent.click({target:this._parent._btnInventoryMount});
      };
   }
   function initTexts()
   {
      this._winCertificate.title = this.api.lang.getText("MOUNT_CERTIFICATES");
      this._winMountPark.title = this.api.lang.getText("MOUNT_PARK");
      this._winInventory.title = this.api.lang.getText("MOUNT_INVENTORY");
      this._winShed.title = this.api.lang.getText("MOUNT_SHED");
      this._btnShed.label = this.api.lang.getText("MOUNT_SHED_ACTION");
      this._btnMountPark.label = this.api.lang.getText("MOUNT_PARK_ACTION");
      this._btnCertificate.label = this.api.lang.getText("MOUNT_CERTIFICATE_ACTION");
      this._btnInventory.label = this.api.lang.getText("MOUNT_INVENTORY_ACTION");
      this._lblTitle.text = this.api.lang.getText("MOUNT_MANAGER");
      this._lblInventoryNoMount.text = this.api.lang.getText("MOUNT_NO_EQUIP");
      this.fillTypeCombobox(this._cbFilterShed,this.mounts.concat(this.parkMounts));
      this.fillTypeCombobox(this._cbFilterPark,this.mounts.concat(this.parkMounts));
   }
   function initData()
   {
      this.modelChanged({target:this._eaMount});
      this.modelChanged({target:this._eaParkMounts});
      this.modelChanged({target:this.api.datacenter.Player.Inventory});
      this.mountChanged();
   }
   function createCertificateArray()
   {
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = this.api.datacenter.Player.Inventory;
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc4_];
         if(_loc5_.type == 97)
         {
            _loc2_.push(_loc5_);
         }
         _loc4_ = _loc4_ + 1;
      }
      return _loc2_;
   }
   function hideShedButton(§\x19\t§)
   {
      this._mcArrowShed._visible = !_loc2_;
      this._btnShed._visible = !_loc2_;
   }
   function hideMountParkButton(§\x19\t§)
   {
      this._mcArrowMountPark._visible = !_loc2_;
      this._btnMountPark._visible = !_loc2_;
   }
   function hideCertificateButton(§\x19\t§)
   {
      this._mcArrowCertificate._visible = !_loc2_;
      this._btnCertificate._visible = !_loc2_;
   }
   function hideInventoryButton(§\x19\t§)
   {
      this._mcArrowInventory._visible = !_loc2_;
      this._btnInventory._visible = !_loc2_;
   }
   function hideMountViewer(§\x19\t§)
   {
      this._winMountViewer._visible = !_loc2_;
      this._mvMountViewer._visible = !_loc2_;
      if(!_loc2_)
      {
         this.moveTopButtons(0);
         this.moveBottomButtons(0);
      }
   }
   function hideItemViewer(§\x19\t§)
   {
      this._winItemViewer._visible = !_loc2_;
      this._itvItemViewer._visible = !_loc2_;
      if(!_loc2_)
      {
         this.moveTopButtons(14);
         this.moveBottomButtons(-13);
      }
   }
   function moveTopButtons(§\x1e\t\x0b§)
   {
      this._btnInventory._y = 146 + _loc2_;
      this._btnShed._y = 146 + _loc2_;
   }
   function moveBottomButtons(§\x1e\t\x0b§)
   {
      this._btnCertificate._y = 383 + _loc2_;
      this._btnMountPark._y = 383 + _loc2_;
   }
   function hideAllButtons(§\x19\t§)
   {
      this.hideShedButton(_loc2_);
      this.hideMountParkButton(_loc2_);
      this.hideCertificateButton(_loc2_);
      this.hideInventoryButton(_loc2_);
   }
   function hideViewersAndButtons()
   {
      this.hideAllButtons(true);
      this.hideMountViewer(true);
      this.hideItemViewer(true);
   }
   function fillTypeCombobox(§\x13\x0e§, §\x0f\x13§)
   {
      var _loc4_ = _loc2_.selectedItem.id;
      var _loc5_ = _loc2_.selectedItem.modelID;
      var _loc6_ = !_loc2_.dataProvider.length ? new ank["\x1e\n\x07"]["\x0f\x01"]() : _loc2_.dataProvider;
      if(!_loc2_.dataProvider.length)
      {
         _loc6_.push({label:this.api.lang.getText("WITHOUT_TYPE_FILTER"),id:0});
         _loc6_.push({label:this.api.lang.getText("MOUNT_FILTER_MAN"),id:1});
         _loc6_.push({label:this.api.lang.getText("MOUNT_FILTER_WOMAN"),id:2});
         _loc6_.push({label:this.api.lang.getText("MOUNT_FILTER_FECONDABLE"),id:3});
         _loc6_.push({label:this.api.lang.getText("MOUNT_FILTER_FECONDEE"),id:4});
         _loc6_.push({label:this.api.lang.getText("MOUNT_FILTER_MOUNTABLE"),id:5});
         _loc6_.push({label:this.api.lang.getText("MOUNT_FILTER_NONAME"),id:6});
         _loc6_.push({label:this.api.lang.getText("MOUNT_FILTER_CAPACITY"),id:7});
         _loc6_.push({label:this.api.lang.getText("MOUNT_FILTER_MUSTXP"),id:8});
         _loc6_.push({label:this.api.lang.getText("MOUNT_FILTER_TIRED"),id:9});
         _loc6_.push({label:this.api.lang.getText("MOUNT_FILTER_NOTIRED"),id:10});
      }
      _loc3_.sortOn("modelID");
      for(var i in _loc3_)
      {
         var _loc7_ = false;
         loop1:
         for(var j in _loc6_)
         {
            if(_loc6_[j].modelID != _loc3_[i].modelID)
            {
               continue;
            }
            _loc7_ = true;
            while(true)
            {
               if(§§pop() == null)
               {
                  break loop1;
               }
            }
         }
         if(!_loc7_)
         {
            _loc6_.push({label:_loc3_[i].modelName,id:11,modelID:_loc3_[i].modelID});
         }
      }
      _loc6_.sortOn(["id","modelName"],Array.NUMERIC);
      var _loc8_ = -1;
      for(var i in _loc6_)
      {
         if(_loc6_[i].id == _loc4_ && _loc6_[i].modelID == _loc5_)
         {
            _loc8_ = _global.parseInt(i);
         }
      }
      _loc2_.dataProvider = _loc6_;
      _loc2_.selectedIndex = _loc8_ == -1 ? 0 : _loc8_;
   }
   function makeDataProvider(§\x0f\x13§, §\x13\f§)
   {
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = _loc3_.selectedItem.id;
      switch(_loc5_)
      {
         case 0:
            _loc4_ = _loc2_;
            break;
         case 1:
            for(var i in _loc2_)
            {
               if(!_loc2_[i].sex)
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
            break;
         case 2:
            for(var i in _loc2_)
            {
               if(_loc2_[i].sex)
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
            break;
         case 3:
            for(var i in _loc2_)
            {
               if(_loc2_[i].fecondable && _loc2_[i].fecondation == -1)
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
            break;
         case 4:
            for(var i in _loc2_)
            {
               if(_loc2_[i].fecondation > 0)
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
            break;
         case 5:
            for(var i in _loc2_)
            {
               if(_loc2_[i].mountable)
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
            break;
         case 6:
            for(var i in _loc2_)
            {
               if(_loc2_[i].name == this.api.lang.getText("NO_NAME"))
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
            break;
         case 7:
            for(var i in _loc2_)
            {
               if(_loc2_[i].capacities.length > 0)
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
            break;
         case 8:
            for(var i in _loc2_)
            {
               if(_loc2_[i].mountable && _loc2_[i].level < 5)
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
            break;
         case 9:
            for(var i in _loc2_)
            {
               if(_loc2_[i].tired == _loc2_[i].tiredMax)
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
            break;
         case 10:
            for(var i in _loc2_)
            {
               if(_loc2_[i].tired < _loc2_[i].tiredMax)
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
            break;
         case 11:
            for(var i in _loc2_)
            {
               if(_loc2_[i].modelID == _loc3_.selectedItem.modelID)
               {
                  _loc4_.push(_loc2_[i]);
               }
            }
      }
      return _loc4_;
   }
   function initialization(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.content;
      _loc3_.attachMovie("staticR_front","anim_front",11);
      _loc3_.attachMovie("staticR_back","anim_back",10);
   }
   function mountChanged(§\x1e\x19\x0e§)
   {
      this.hideViewersAndButtons();
      var _loc3_ = this.api.datacenter.Player.mount;
      var _loc4_ = _loc3_ != undefined;
      if(_loc4_)
      {
         this._lblInventoryMountModel.text = _loc3_.modelName;
         this._lblInventoryMountName.text = _loc3_.name;
         this._ldrSprite.forceNextLoad();
         this._ldrSprite.contentPath = _loc3_.gfxFile;
         var _loc5_ = new ank.battlefield.datacenter["\x1e\x0e\x10"]("-1",undefined,"",0,0);
         _loc5_.mount = _loc3_;
         this.api.colors.addSprite(this._ldrSprite,_loc5_);
      }
      this._lblInventoryNoMount._visible = !_loc4_;
      this._lblInventoryMountModel._visible = _loc4_;
      this._lblInventoryMountName._visible = _loc4_;
      this._ldrSprite._visible = _loc4_;
      this._mcRectanglePreview._visible = _loc4_;
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      this.hideViewersAndButtons();
      switch(_loc2_.target)
      {
         case this._eaMount:
            this._lstShed.dataProvider = this.makeDataProvider(this._eaMount,this._cbFilterShed);
            this._lstShed.sortOn("modelID");
            this.fillTypeCombobox(this._cbFilterShed,this.mounts.concat(this.parkMounts));
            this.fillTypeCombobox(this._cbFilterPark,this.mounts.concat(this.parkMounts));
            break;
         case this._eaParkMounts:
            this._lstMountPark.dataProvider = this.makeDataProvider(this._eaParkMounts,this._cbFilterPark);
            this._lstShed.sortOn("modelID");
            this.fillTypeCombobox(this._cbFilterShed,this.mounts.concat(this.parkMounts));
            this.fillTypeCombobox(this._cbFilterPark,this.mounts.concat(this.parkMounts));
            break;
         case this.api.datacenter.Player.Inventory:
            this._lstCertificate.dataProvider = this.createCertificateArray();
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc3_ = this.api.network.Exchange;
      loop0:
      switch(_loc2_.target)
      {
         case this._btnClose:
            this.callClose();
            break;
         case this._btnInventoryMount:
            this._nSelectFrom = dofus["\r\x14"].gapi.ui.MountStorage.FROM_INVENTORY;
            this._mvMountViewer.mount = this.api.datacenter.Player.mount;
            this.hideAllButtons(false);
            this.hideItemViewer(true);
            this.hideMountViewer(false);
            this.hideInventoryButton(true);
            break;
         case this._btnShed:
            switch(this._nSelectFrom)
            {
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_CERTIFICATE:
                  _loc3_.putInShedFromCertificate(this._itvItemViewer.itemData.ID);
                  break;
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_MOUNTPARK:
                  _loc3_.putInShedFromMountPark(this._mvMountViewer.mount.ID);
                  break;
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_INVENTORY:
                  _loc3_.putInShedFromInventory(this.api.datacenter.Player.mount.ID);
            }
            break;
         case this._btnInventory:
            switch(this._nSelectFrom)
            {
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_SHED:
                  _loc3_.putInInventoryFromShed(this._mvMountViewer.mount.ID);
                  break;
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_MOUNTPARK:
                  _loc3_.putInShedFromMountPark(this._mvMountViewer.mount.ID);
                  _loc3_.putInInventoryFromShed(this._mvMountViewer.mount.ID);
                  break;
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_CERTIFICATE:
            }
            break;
         case this._btnMountPark:
            switch(this._nSelectFrom)
            {
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_SHED:
                  _loc3_.putInMountParkFromShed(this._mvMountViewer.mount.ID);
                  break;
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_CERTIFICATE:
                  break;
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_INVENTORY:
                  _loc3_.putInShedFromInventory(this._mvMountViewer.mount.ID);
                  _loc3_.putInMountParkFromShed(this._mvMountViewer.mount.ID);
            }
            break;
         case this._btnCertificate:
            switch(this._nSelectFrom)
            {
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_SHED:
                  _loc3_.putInCertificateFromShed(this._mvMountViewer.mount.ID);
                  break loop0;
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_MOUNTPARK:
                  _loc3_.putInShedFromMountPark(this._mvMountViewer.mount.ID);
                  _loc3_.putInCertificateFromShed(this._mvMountViewer.mount.ID);
                  break loop0;
               case dofus["\r\x14"].gapi.ui.MountStorage.FROM_INVENTORY:
                  _loc3_.putInShedFromInventory(this._mvMountViewer.mount.ID);
                  _loc3_.putInCertificateFromShed(this._mvMountViewer.mount.ID);
            }
      }
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      this.hideAllButtons(false);
      switch(_loc2_.target)
      {
         case this._lstShed:
            this._nSelectFrom = dofus["\r\x14"].gapi.ui.MountStorage.FROM_SHED;
            this._mvMountViewer.mount = _loc2_.row.item;
            this.hideItemViewer(true);
            this.hideShedButton(true);
            this.hideMountViewer(false);
            break;
         case this._lstMountPark:
            this._nSelectFrom = dofus["\r\x14"].gapi.ui.MountStorage.FROM_MOUNTPARK;
            this._mvMountViewer.mount = _loc2_.row.item;
            this.hideItemViewer(true);
            this.hideMountParkButton(true);
            this.hideMountViewer(false);
            break;
         case this._lstCertificate:
            this.hideMountParkButton(true);
            this.hideInventoryButton(true);
            this._nSelectFrom = dofus["\r\x14"].gapi.ui.MountStorage.FROM_CERTIFICATE;
            this._itvItemViewer.itemData = _loc2_.row.item;
            this.hideCertificateButton(true);
            this.hideMountViewer(true);
            this.hideItemViewer(false);
            break;
         case this._cbFilterShed:
            this._lstShed.dataProvider = this.makeDataProvider(this._eaMount,this._cbFilterShed);
            this.hideViewersAndButtons();
            break;
         case this._cbFilterPark:
            this._lstMountPark.dataProvider = this.makeDataProvider(this._eaParkMounts,this._cbFilterPark);
            this.hideViewersAndButtons();
            break;
         default:
            this.hideViewersAndButtons();
      }
   }
   function itemRollOver(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._lstCertificate:
            break;
         case this._lstMountPark:
         case this._lstShed:
            this.gapi.showTooltip(_loc2_.row.item.getToolTip(),_loc2_.target,20,{bXLimit:true,bYLimit:false});
      }
   }
   function itemRollOut(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function nameChanged(§\x1e\x19\x0e§)
   {
      this._lblInventoryMountName.text = _loc2_.name;
   }
}
