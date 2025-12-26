class dofus.§\r\x14§.gapi.ui.AskSecretAnswer extends ank.gapi.ui.FlyWindow
{
   var _char;
   var _winBackground;
   static var CLASS_NAME = "AskSecretAnswer";
   var isConfirming = false;
   function AskSecretAnswer()
   {
      super();
   }
   function get charToDelete()
   {
      return this._char;
   }
   function set charToDelete(§\x13\x0f§)
   {
      this._char = _loc2_;
   }
   function initWindowContent()
   {
      var _loc2_ = this._winBackground.content;
      _loc2_._txtHelp.text = this.api.lang.getText("DELETING_CHARACTER_ANSWER") + "\r\n" + _global.unescape(this.api.datacenter.Basics.aks_secret_question);
      _loc2_._btnOk.label = this.api.lang.getText("OK");
      _loc2_._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
      _loc2_._btnOk.addEventListener("click",this);
      _loc2_._btnCancel.addEventListener("click",this);
      _loc2_._tiNickName.setFocus();
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnOk":
            var _loc3_ = this._winBackground.content._tiNickName.text;
            if(_loc3_.length > 0)
            {
               this.api.kernel.showMessage(this.api.lang.getText("DELETE_WORD"),this.api.lang.getText("DO_U_DELETE_A",[this._char.name]),"CAUTION_YESNO",{name:"SecretAnswer",params:{nickname:_loc3_},listener:this});
            }
            break;
         case "_btnCancel":
            this.unloadThis();
      }
   }
   function onShortcut(§\x1e\r\x14§)
   {
      if(_loc2_ == "ACCEPT_CURRENT_DIALOG" && this.api.ui.getUIComponent("AskYesNoSecretAnswer") == undefined)
      {
         this.click({target:this._winBackground.content._btnOk});
         return false;
      }
      return true;
   }
   function yes(§\x1e\x19\x0e§)
   {
      this.api.network.Account.deleteCharacter(this._char.id,_loc2_.params.nickname);
      this.unloadThis();
   }
   function no(§\x1e\x19\x0e§)
   {
      this.unloadThis();
   }
}
