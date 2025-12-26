var _loc1 = _global.dofus["\r\x14"].gapi.ui.ChooseCharacter.prototype;
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnPlay":
         if(this._aSpriteList[this._nSelectedIndex].Venta == 1)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PERSO_EN_VENTA"),"ERROR_BOX");
            return undefined;
         }
         if(this._nSelectedIndex == undefined)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("SELECT_CHARACTER"),"ERROR_BOX",{name:"NoSelect"});
         }
         else
         {
            this.api.network.Account.setCharacter(this._aSpriteList[this._nSelectedIndex].id);
         }
         break;
      case "_btnCreate":
         if(this._nCharacterCount >= 5 && !this.api.datacenter.Player.isAuthorized)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("TOO_MUCH_CHARACTER"),"ERROR_BOX");
         }
         else
         {
            this.gapi.loadUIComponent("CreateCharacter","CreateCharacter",{remainingTime:this._nRemainingTime});
            this.gapi.unloadUIComponent("ChooseCharacter");
         }
         break;
      case "_btnSubscribe":
         _root.getURL(this.api.lang.getConfigText("PAY_LINK"),"_blank");
         break;
      case "_btnBack":
         this.api.kernel.changeServer(true);
         break;
      case "_btnChangeServer":
   }
};
