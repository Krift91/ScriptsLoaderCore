class dofus.§\r\x14§.gapi.ui.ChooseItemSkin extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oItem;
   var _btnClose;
   var _btnValid;
   var _cisItem;
   var _win;
   var _bgh;
   static var CLASS_NAME = "ChooseItemSkin";
   function ChooseItemSkin()
   {
      super();
   }
   function set item(§\x1e\x19\x03§)
   {
      this._oItem = _loc2_;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   function get item()
   {
      return this._oItem;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.ChooseItemSkin.CLASS_NAME);
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
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.updateData});
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnValid.addEventListener("click",this);
   }
   function updateData()
   {
      this._cisItem.item = this._oItem;
   }
   function initTexts()
   {
      this._btnValid.label = this.api.lang.getText("VALIDATE");
      this._win.title = this.api.lang.getText("CHOOSE_SKIN");
   }
   function validate(§\x1e\x19\x03§)
   {
      if(!_loc2_)
      {
         return undefined;
      }
      this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CHANGE_SKIN);
      this.api.network.Items.setSkin(this._oItem.ID,this._oItem.position,_loc2_.skin + 1);
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
            this.validate(this._cisItem.selectedItem);
      }
   }
   function dblClickItem(§\x1e\x19\x0e§)
   {
      this.validate(_loc2_.target.contentData);
   }
}
