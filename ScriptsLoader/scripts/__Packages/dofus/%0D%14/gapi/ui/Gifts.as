class dofus.§\r\x14§.gapi.ui.Gifts extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oGift;
   var _aSpriteList;
   var _cgGifts;
   var _btnClose;
   var _btnSelect;
   var _lblTitle;
   var _lblGift;
   var _lblItems;
   var _lblSelectCharacter;
   var _itvItemViewer;
   var _ldrGfx;
   var _lblTitleGift;
   var _txtDescription;
   var _nSelectedIndex;
   var _nSaveLastClick;
   static var CLASS_NAME = "Gifts";
   function Gifts()
   {
      super();
   }
   function set gift(§\x1e\x19\x07§)
   {
      this._oGift = _loc2_;
   }
   function set spriteList(§\x1d\t§)
   {
      this._aSpriteList = _loc2_;
   }
   function checkNextGift()
   {
      if(this.api.datacenter.Basics.aks_gifts_stack.length != 0)
      {
         var _loc2_ = this.api.datacenter.Basics.aks_gifts_stack.shift();
         this.gapi.loadUIComponent("Gifts","Gifts",{gift:_loc2_,spriteList:this._aSpriteList},{bForceLoad:true});
      }
      else
      {
         this.gapi.getUIComponent("ChooseCharacter")._visible = true;
         this.gapi.getUIComponent("CreateCharacter")._visible = true;
         this.unloadThis();
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Gifts.CLASS_NAME);
   }
   function callClose()
   {
      this.gapi.getUIComponent("ChooseCharacter")._visible = true;
      this.gapi.getUIComponent("CreateCharacter")._visible = true;
      this.unloadThis();
   }
   function createChildren()
   {
      this._visible = false;
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.initData});
   }
   function addListeners()
   {
      var _loc2_ = 0;
      while(_loc2_ < 5)
      {
         var _loc3_ = this["_ccs" + _loc2_];
         _loc3_.params = {index:_loc2_};
         _loc3_.addEventListener("select",this);
         _loc2_ = _loc2_ + 1;
      }
      this._cgGifts.addEventListener("selectItem",this);
      this._cgGifts.multipleContainerSelectionEnabled = false;
      this._btnClose.addEventListener("click",this);
      this._btnSelect.addEventListener("click",this);
   }
   function initTexts()
   {
      this._lblTitle.text = this.api.lang.getText("GIFTS_TITLE");
      this._lblGift.text = this.api.lang.getText("THE_GIFT");
      this._lblItems.text = this.api.lang.getText("GIFT_CONTENT");
      this._lblSelectCharacter.text = this.api.lang.getText("GIFT_SELECT_CHARACTER");
      this._btnClose.label = this.api.lang.getText("CLOSE");
      this._btnSelect.label = this.api.lang.getText("SELECT");
   }
   function initData()
   {
      var _loc0_ = null;
      if((_loc0_ = this._oGift.type) !== 1)
      {
         this.checkNextGift();
      }
      else
      {
         this._visible = true;
         this._cgGifts.dataProvider = this._oGift.items;
         this._cgGifts.selectedIndex = 0;
         this._itvItemViewer.itemData = this._oGift.items[0];
         this._ldrGfx.contentPath = this._oGift.gfxUrl;
         this._lblTitleGift.text = this._oGift.title;
         this._txtDescription.text = this._oGift.desc;
         var _loc2_ = 0;
         while(_loc2_ < 5)
         {
            var _loc3_ = this["_ccs" + _loc2_];
            _loc3_.data = this._aSpriteList[_loc2_];
            _loc3_.enabled = this._aSpriteList[_loc2_] != undefined;
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function select(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.params.index;
      this["_ccs" + this._nSelectedIndex].selected = false;
      if(this._nSelectedIndex == _loc3_)
      {
         delete this._nSelectedIndex;
      }
      else
      {
         this._nSelectedIndex = _loc3_;
      }
      if(getTimer() - this._nSaveLastClick < ank.gapi["\r\x19"].DBLCLICK_DELAY)
      {
         this._nSelectedIndex = _loc3_;
         this.click({target:this._btnSelect});
         return undefined;
      }
      this._nSaveLastClick = getTimer();
   }
   function selectItem(§\x1e\x19\x0e§)
   {
      this._itvItemViewer.itemData = _loc2_.target.contentData;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnClose:
            this.callClose();
            break;
         case this._btnSelect:
            if(!_global.isNaN(this._nSelectedIndex))
            {
               var _loc3_ = dofus.datacenter["\f\f"](this._oGift.items[0]);
               this.api.kernel.showMessage(this.api.lang.getText("THE_GIFT"),this.api.lang.getText("GIFT_ATTRIBUTION_CONFIRMATION",[_loc3_.name,this["_ccs" + this._nSelectedIndex].data.name]),"CAUTION_YESNO",{name:"GiftAttribution",listener:this,params:{giftId:this._oGift.id,charId:this["_ccs" + this._nSelectedIndex].data.id}});
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("SELECT_CHARACTER"),"ERROR_BOX",{name:"NoSelect"});
            break;
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "AskYesNoGiftAttribution")
      {
         this.api.network.Account.attributeGiftToCharacter(_loc2_.params.giftId,_loc2_.params.charId);
         this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:this.api.lang.getText("WAITING_MSG_RECORDING")},{bAlwaysOnTop:true,bForceLoad:true});
      }
   }
}
