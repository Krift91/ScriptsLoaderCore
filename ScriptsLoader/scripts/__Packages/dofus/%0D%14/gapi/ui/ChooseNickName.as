class dofus.§\r\x14§.gapi.ui.ChooseNickName extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _lblError;
   var _nState;
   var _mcNickBg;
   var _tiNickName;
   var _txtHelp;
   var _txtHelp2;
   var _btnOk;
   var _btnCancel;
   var _lblTitle;
   static var CLASS_NAME = "ChooseNickName";
   var isConfirming = false;
   function ChooseNickName()
   {
      super();
   }
   function set nickAlreadyUsed(§\x14\x04§)
   {
      this._lblError._visible = _loc2_;
      if(_loc2_)
      {
         this.state = 1;
      }
      else
      {
         this.state = 0;
      }
   }
   function set state(§\x1e\x1c\x17§)
   {
      this._nState = _loc2_;
      switch(this._nState)
      {
         case 0:
            this._mcNickBg._visible = true;
            this._lblError._visible = false;
            this._tiNickName._visible = true;
            this._txtHelp._visible = true;
            this._txtHelp2._visible = false;
            this._tiNickName.setFocus();
            this._txtHelp.text = this.api.lang.getText("CHOOSE_NICKNAME_HELP");
            break;
         case 1:
            this._mcNickBg._visible = true;
            this._lblError._visible = true;
            this._tiNickName._visible = true;
            this._txtHelp._visible = true;
            this._txtHelp2._visible = false;
            this._tiNickName.setFocus();
            this._txtHelp.text = this.api.lang.getText("CHOOSE_NICKNAME_HELP");
            break;
         case 2:
            this._mcNickBg._visible = false;
            this._lblError._visible = false;
            this._tiNickName._visible = false;
            this._txtHelp._visible = false;
            this._txtHelp2._visible = true;
            this._txtHelp2.text = this.api.lang.getText("DO_CHOOSE_NICKNAME",[this._tiNickName.text]);
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.ChooseNickName.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initInterface});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function initTexts()
   {
      this._btnOk.label = this.api.lang.getText("OK");
      this._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
      this._lblError.text = this.api.lang.getText("NICKNAME_ALREADY_USED");
      this._lblTitle.text = this.api.lang.getText("CHOOSE_NICKNAME");
   }
   function addListeners()
   {
      this._btnOk.addEventListener("click",this);
      this._btnCancel.addEventListener("click",this);
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
      this.api.kernel.StreamingDisplayManager.onNicknameChoice();
   }
   function initInterface()
   {
      this.state = 0;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnOk":
            var _loc3_ = this._tiNickName.text;
            if(_loc3_.length > 2)
            {
               if(_loc3_.toUpperCase() != this.api.datacenter.Player.login.toUpperCase())
               {
                  if(this._nState == 2)
                  {
                     this.api.network.Account.setNickName(this._tiNickName.text);
                     return undefined;
                  }
                  this.state = 2;
                  return undefined;
               }
               this.api.kernel.showMessage(undefined,this.api.lang.getText("NICKNAME_EQUALS_LOGIN"),"ERROR_BOX");
            }
            break;
         case "_btnCancel":
            if(this._nState == 2)
            {
               this.state = 0;
               return undefined;
            }
            this.api.network.disconnect(false,false);
            this.api.kernel.manualLogon();
            this.unloadThis();
            break;
      }
   }
   function onShortcut(§\x1e\r\x14§)
   {
      if(_loc2_ == "ACCEPT_CURRENT_DIALOG" || _loc2_ == "CTRL_STATE_CHANGED_OFF")
      {
         this.click({target:this._btnOk});
         return false;
      }
      return true;
   }
}
