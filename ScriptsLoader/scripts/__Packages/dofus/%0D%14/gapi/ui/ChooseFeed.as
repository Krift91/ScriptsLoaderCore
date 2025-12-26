class dofus.§\r\x14§.gapi.ui.ChooseFeed extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _aFiltersType;
   var _eaDataProvider;
   var _oItem;
   var _btnClose;
   var _btnValid;
   var _bgh;
   var _cgGrid;
   var _winBg;
   var _lblNoItem;
   var _itvItemViewer;
   var _mcItvIconBg;
   static var CLASS_NAME = "LivingItemsViewer";
   function ChooseFeed()
   {
      super();
   }
   function set itemsType(§\x1d\x04§)
   {
      this._aFiltersType = _loc2_;
      if(this._eaDataProvider)
      {
         this.updateData();
      }
   }
   function set item(§\x1e\x19\x15§)
   {
      this._oItem = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.ChooseFeed.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.updateData});
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnValid.addEventListener("click",this);
      this._bgh.addEventListener("click",this);
      this._cgGrid.addEventListener("selectItem",this);
      this._cgGrid.addEventListener("overItem",this);
      this._cgGrid.addEventListener("outItem",this);
      this._cgGrid.addEventListener("dblClickItem",this);
      this._cgGrid.multipleContainerSelectionEnabled = false;
   }
   function initTexts()
   {
      this._btnValid.label = this.api.lang.getText("VALIDATE");
      this._winBg.title = this.api.lang.getText("FEED_ITEM");
      this._lblNoItem.text = this.api.lang.getText("SELECT_ITEM");
   }
   function updateData()
   {
      this._eaDataProvider = this.api.datacenter.Player.Inventory;
      this._itvItemViewer._visible = false;
      this._mcItvIconBg._visible = false;
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      for(var k in this._eaDataProvider)
      {
         var _loc3_ = this._eaDataProvider[k];
         var _loc4_ = 0;
         while(_loc4_ < this._aFiltersType.length)
         {
            if(_loc3_.type == this._aFiltersType[_loc4_] && (!_loc3_.skineable && (_loc3_.position == -1 && _loc3_.canBeExchange)))
            {
               _loc2_.push(_loc3_);
               break;
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      if(_loc2_.length)
      {
         this._cgGrid.dataProvider = _loc2_;
      }
      else
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_NO_FOOD_LIVING_ITEM",[this._oItem.name]),"ERROR_BOX",{name:"noItem",listener:this});
         this.callClose();
      }
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function validate(§\x1e\x19\x03§, §\x02\x04§)
   {
      if(!_loc2_.ID)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("SELECT_ITEM"),"ERROR_BOX",{name:"noSelection",listener:this});
         return undefined;
      }
      if(!_loc3_)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CONFIRM_FOOD_LIVING_ITEM"),"CAUTION_YESNO",{name:"Confirm",params:{oItem:_loc2_},listener:this});
         return undefined;
      }
      this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_FEED);
      this.api.network.Items.feed(this._oItem.ID,this._oItem.position,_loc2_.ID);
      this.callClose();
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._bgh:
         case this._btnClose:
            this.callClose();
            break;
         case this._btnValid:
            this.validate(this._cgGrid.selectedItem.contentData);
      }
   }
   function dblClickItem(§\x1e\x19\x0e§)
   {
      this.validate(_loc2_.target.contentData);
   }
   function selectItem(§\x1e\x19\x0e§)
   {
      this._itvItemViewer.itemData = _loc2_.target.contentData;
      this._itvItemViewer._visible = true;
      this._mcItvIconBg._visible = true;
      this._lblNoItem._visible = false;
   }
   function overItem(§\x1e\x19\x0e§)
   {
      this.gapi.showTooltip(_loc2_.target.contentData.name,_loc2_.target,-20,undefined,_loc2_.target.contentData.style + "ToolTip");
   }
   function outItem(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function yes(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "AskYesNoConfirm")
      {
         this.validate(_loc2_.params.oItem,true);
      }
   }
}
