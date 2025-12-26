class dofus.§\r\x14§.gapi.ui.AskPrivateChat extends ank.gapi.ui.FlyWindow
{
   var _winBackground;
   var dispatchEvent;
   static var CLASS_NAME = "AskPrivateChat";
   function AskPrivateChat()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.AskPrivateChat.CLASS_NAME);
      this.gapi.getUIComponent("Banner").chatAutoFocus = false;
   }
   function destroy()
   {
      this.gapi.getUIComponent("Banner").chatAutoFocus = true;
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
   }
   function initWindowContent()
   {
      var _loc2_ = this._winBackground.content;
      _loc2_._txtMessage.maxChars = dofus.Constants.MAX_MESSAGE_LENGTH;
      _loc2_._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
      _loc2_._btnAddFriend.label = this.api.lang.getText("ADD_TO_FRIENDS");
      _loc2_._btnSend.label = this.api.lang.getText("SEND");
      _loc2_._btnCancel.addEventListener("click",this);
      _loc2_._btnAddFriend.addEventListener("click",this);
      _loc2_._btnSend.addEventListener("click",this);
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
      Selection.setFocus(_loc2_._txtMessage._tText);
   }
   function onShortcut(§\x1e\r\x14§)
   {
      if(_loc2_ == "ACCEPT_CURRENT_DIALOG")
      {
         this.click({target:this._winBackground.content._btnSend});
         return false;
      }
      return true;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnCancel":
            this.dispatchEvent({type:"cancel",params:this.params});
            this.unloadThis();
            break;
         case "_btnSend":
            var _loc3_ = this._winBackground.content._txtMessage.text;
            _loc3_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc3_).replace(String.fromCharCode(13)," ");
            this.dispatchEvent({type:"send",message:_loc3_,params:this.params});
            this.unloadThis();
            break;
         case "_btnAddFriend":
            this.dispatchEvent({type:"addfriend",params:this.params});
      }
   }
}
