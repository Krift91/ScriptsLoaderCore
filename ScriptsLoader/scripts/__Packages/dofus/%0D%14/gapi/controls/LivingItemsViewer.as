class dofus.§\r\x14§.gapi.controls.LivingItemsViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oItemData;
   var _pbXP;
   var _btnFeed;
   var _btnDissociate;
   var _btnSkin;
   var _lblStateTitle;
   var _lblState;
   var _lblLevelTitle;
   var _lblLevel;
   var _lblXplTitle;
   var _lblEatDate;
   var _ctrItem;
   static var CLASS_NAME = "LivingItemsViewer";
   function LivingItemsViewer()
   {
      super();
   }
   function set itemData(§\x1e\x1a\x10§)
   {
      this._oItemData = _loc2_;
      this.updateData();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.LivingItemsViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.updateData});
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._pbXP.addEventListener("over",this);
      this._pbXP.addEventListener("out",this);
      this._btnFeed.addEventListener("click",this);
      this._btnDissociate.addEventListener("click",this);
      this._btnSkin.addEventListener("click",this);
   }
   function initTexts()
   {
      this._lblStateTitle.text = this.api.lang.getText("STATE");
      this._lblState.text = this.api.lang.getText(this._oItemData.mood != 1 ? (this._oItemData.mood != 0 ? "FAT" : "LEAN") : "SATISFIED_WORD");
      this._lblLevelTitle.text = this.api.lang.getText("LEVEL");
      this._lblLevel.text = String(this._oItemData.maxSkin);
      this._lblXplTitle.text = this.api.lang.getText("EXPERIMENT");
      this._btnDissociate.label = this.api.lang.getText("DISSOCIATE");
      this._btnFeed.label = this.api.lang.getText("FEED_WORD");
      this._btnSkin.label = this.api.lang.getText("CHOOSE_SKIN");
      var _loc2_ = this._oItemData.effects;
      for(var i in _loc2_)
      {
         if(_loc2_[i].type == 808)
         {
            this._lblEatDate.text = _loc2_[i].description;
            break;
         }
      }
   }
   function updateData()
   {
      this._ctrItem.contentPath = this._oItemData.gfx;
      this._ctrItem.contentData = this._oItemData;
      this._pbXP.minimum = this._oItemData.currentLivingLevelXpMin;
      this._pbXP.maximum = this._oItemData.currentLivingLevelXpMax;
      this._pbXP.value = this._oItemData.currentLivingXp;
      this._btnDissociate.enabled = this._oItemData.isAssociate;
      this._btnFeed.enabled = this._oItemData.isAssociate;
      this.initTexts();
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnSkin:
            this.api.ui.loadUIComponent("ChooseItemSkin","ChooseItemSkin",{item:this._oItemData});
            break;
         case this._btnFeed:
            this.api.ui.loadUIComponent("ChooseFeed","ChooseFeed",{itemsType:[this._oItemData.type],item:this._oItemData});
            break;
         case this._btnDissociate:
            this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_DISSOCIATE);
            this.api.network.Items.dissociate(this._oItemData.ID,this._oItemData.position);
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      this.gapi.showTooltip(new ank["\x1e\n\x07"]["\x0e\x1c"](this._pbXP.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " / " + new ank["\x1e\n\x07"]["\x0e\x1c"](this._pbXP.maximum).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3),this._pbXP,-20);
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
}
