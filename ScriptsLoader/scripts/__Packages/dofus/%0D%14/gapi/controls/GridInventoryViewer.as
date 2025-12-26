class dofus.§\r\x14§.gapi.controls.GridInventoryViewer extends dofus.§\r\x14§.gapi.controls.InventoryViewer
{
   var _cgGrid;
   var _oOverItem;
   var _btnDragKama;
   var _lblKama;
   var _mcKamaSymbol;
   var _mcKamaSymbol2;
   var _oDataViewer;
   var _lblFilter;
   var _oKamasProvider;
   var dispatchEvent;
   static var CLASS_NAME = "GridInventoryViewer";
   var _bShowKamas = true;
   var _bCheckPlayerPods = false;
   var _bCheckMountPods = false;
   function GridInventoryViewer()
   {
      super();
   }
   function get cgGrid()
   {
      return this._cgGrid;
   }
   function get currentOverItem()
   {
      return this._oOverItem;
   }
   function get checkPlayerPods()
   {
      return this._bCheckPlayerPods;
   }
   function get checkMountPods()
   {
      return this._bCheckMountPods;
   }
   function set checkPlayerPods(§\x1b\x0f§)
   {
      this._bCheckPlayerPods = _loc2_;
   }
   function set checkMountPods(§\x1b\x10§)
   {
      this._bCheckMountPods = _loc2_;
   }
   function set showKamas(§\x15\b§)
   {
      this._bShowKamas = _loc2_;
      this._btnDragKama._visible = this._lblKama._visible = this._mcKamaSymbol._visible = this._mcKamaSymbol2._visible = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.GridInventoryViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this._oDataViewer = this._cgGrid;
      this.addToQueue({object:this,method:this.addListeners});
      super.createChildren();
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function addListeners()
   {
      super.addListeners();
      this._cgGrid.addEventListener("dropItem",this);
      this._cgGrid.addEventListener("dragItem",this);
      this._cgGrid.addEventListener("selectItem",this);
      this._cgGrid.addEventListener("overItem",this);
      this._cgGrid.addEventListener("outItem",this);
      this._cgGrid.addEventListener("dblClickItem",this);
      this._btnDragKama.onRelease = function()
      {
         this._parent.askKamaQuantity();
      };
   }
   function initTexts()
   {
      this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
   }
   function initData()
   {
      this.modelChanged();
      this.kamaChanged({value:this._oKamasProvider.Kama});
   }
   function validateDrop(§\x1e\x0b\x10§, §\x1e\x19\x03§, §\x01\x01§)
   {
      _loc4_ = Number(_loc4_);
      if(_loc4_ < 1 || _global.isNaN(_loc4_))
      {
         return undefined;
      }
      if(_loc4_ > _loc3_.Quantity)
      {
         _loc4_ = _loc3_.Quantity;
      }
      this.dispatchEvent({type:"dropItem",item:_loc3_,quantity:_loc4_});
   }
   function validateKama(§\x01\x01§)
   {
      _loc2_ = Number(_loc2_);
      if(_loc2_ < 1 || _global.isNaN(_loc2_))
      {
         return undefined;
      }
      if(_loc2_ > this._oKamasProvider.Kama)
      {
         _loc2_ = this._oKamasProvider.Kama;
      }
      this.dispatchEvent({type:"dragKama",quantity:_loc2_});
   }
   function askKamaQuantity()
   {
      var _loc2_ = this._oKamasProvider.Kama == undefined ? 0 : Number(this._oKamasProvider.Kama);
      var _loc3_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:_loc2_,max:_loc2_,params:{targetType:"kama"}});
      _loc3_.addEventListener("validate",this);
   }
   function showOneItem(§\x1e\x1b\x10§)
   {
      var _loc3_ = 0;
      while(_loc3_ < this._cgGrid.dataProvider.length)
      {
         if(_loc2_ == this._cgGrid.dataProvider[_loc3_].unicID)
         {
            this._cgGrid.setVPosition(_loc3_ / this._cgGrid.visibleColumnCount);
            this._cgGrid.selectedIndex = _loc3_;
            return true;
         }
         _loc3_ = _loc3_ + 1;
      }
      return false;
   }
   function dragItem(§\x1e\x19\x0e§)
   {
      if(_loc2_.target.contentData == undefined)
      {
         return undefined;
      }
      this.gapi.removeCursor();
      this.gapi.setCursor(_loc2_.target.contentData);
   }
   function dropItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = this.gapi.getCursor();
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      this.gapi.removeCursor();
      var _loc4_ = _loc3_.Quantity;
      if(this.checkPlayerPods)
      {
         _loc4_ = this.api.datacenter.Player.getPossibleItemReceiveQuantity(_loc3_,false);
      }
      else if(this.checkMountPods)
      {
         _loc4_ = this.api.datacenter.Player.getPossibleItemReceiveQuantity(_loc3_,true);
      }
      if(_loc4_ <= 0)
      {
         this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("SRV_MSG_6"),"ERROR_BOX",{name:undefined});
      }
      else if(_loc4_ > 1)
      {
         var _loc5_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc4_,params:{targetType:"item",oItem:_loc3_}});
         _loc5_.addEventListener("validate",this);
      }
      else
      {
         this.validateDrop(this._cgGrid,_loc3_,1);
      }
   }
   function selectItem(§\x1e\x19\x0e§)
   {
      if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc2_.target.contentData != undefined)
      {
         this.api.kernel.GameManager.insertItemInChat(_loc2_.target.contentData);
         return undefined;
      }
      this.dispatchEvent({type:"selectedItem",item:_loc2_.target.contentData});
   }
   function overItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.contentData;
      _loc3_.showStatsTooltip(_loc2_.target,_loc2_.target.contentData.style);
      this._oOverItem = _loc3_;
   }
   function outItem(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
      this._oOverItem = undefined;
   }
   function dblClickItem(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:_loc2_.type,item:_loc2_.target.contentData,target:this,targets:_loc2_.targets,index:_loc2_.target.id});
   }
   function validate(§\x1e\x19\x0e§)
   {
      switch(_loc2_.params.targetType)
      {
         case "item":
            this.validateDrop(this._cgGrid,_loc2_.params.oItem,_loc2_.value);
            break;
         case "kama":
            this.validateKama(_loc2_.value);
      }
   }
}
