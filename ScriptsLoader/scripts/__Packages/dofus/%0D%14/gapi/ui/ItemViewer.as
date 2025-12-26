class dofus.§\r\x14§.gapi.ui.ItemViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oItem;
   var _btnClose;
   var _mcTooltip;
   var _itvItemViewer;
   var _lblWarning;
   static var CLASS_NAME = "ItemViewer";
   function ItemViewer()
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
      super.init(false,dofus["\r\x14"].gapi.ui.ItemViewer.CLASS_NAME);
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
      this._mcTooltip.onRollOver = function()
      {
         this._parent.onTooltipOver();
      };
      this._mcTooltip.onRollOut = function()
      {
         this._parent.onTooltipOut();
      };
   }
   function updateData()
   {
      this._itvItemViewer.itemData = this._oItem;
   }
   function initTexts()
   {
      this._btnClose.label = this.api.lang.getText("CLOSE");
      this._lblWarning.text = this.api.lang.getText("ITEMS_CHAT_WARNING");
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnClose)
      {
         this.callClose();
      }
   }
   function onTooltipOut()
   {
      this.gapi.hideTooltip();
   }
   function onTooltipOver()
   {
      this.gapi.showTooltip(this.api.lang.getText("ITEMS_CHAT_WARNING_ROLLOVER"),this._mcTooltip,14);
   }
}
