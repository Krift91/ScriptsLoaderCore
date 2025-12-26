var _loc1 = _global.dofus["\r\x14"].gapi.ui.CreateCharacter.prototype;
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._mcRight:
         this._csBreedSelection.slide(1);
         break;
      case this._mcLeft:
         this._csBreedSelection.slide(-1);
         break;
      case this._mcMaleButton:
         this.setClass(this._nBreed,0);
         break;
      case this._mcFemaleButton:
         this.setClass(this._nBreed,1);
         break;
      case this._mcSpellButton2:
      case this._mcSpellButton:
         this.api.ui.loadUIComponent("SpellViewerOnCreate","SpellViewerOnCreate",{breed:this._nBreed});
         break;
      case this._mcHistoryButton:
         this.api.ui.loadUIComponent("HistoryViewerOnCreate","HistoryViewerOnCreate",{breed:this._nBreed});
         break;
      case this._btnValidate:
         this.validateCreation();
         break;
      case this._btnBack:
         if(this.modeHero)
         {
            this.unloadThis();
         }
         else if(this.api.datacenter.Basics.createCharacter)
         {
            this.api.kernel.changeServer(true);
         }
         else
         {
            this.api.datacenter.Basics.ignoreCreateCharacter = true;
            this.api.network.Account.getCharactersForced();
         }
         break;
      case this._mcRandomName:
         if(this._nLastRegenerateTimer + dofus["\r\x14"].gapi.ui.CreateCharacter.NAME_GENERATION_DELAY < getTimer())
         {
            this.api.network.Account.getRandomCharacterName();
            this._nLastRegenerateTimer = getTimer();
            break;
         }
   }
};
_loc1.validateCreation = function()
{
   var _loc3_ = this._itCharacterName.text;
   if(_loc3_.length == 0 || _loc3_ == undefined)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("NEED_CHARACTER_NAME"),"ERROR_BOX",{name:"CREATENONAME"});
      return undefined;
   }
   if(_loc3_.length > 20)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("LONG_CHARACTER_NAME",[_loc3_,20]),"ERROR_BOX");
      return undefined;
   }
   if(this.api.lang.getConfigText("CHAR_NAME_FILTER") && !this.api.datacenter.Player.isAuthorized)
   {
      var _loc8_ = new dofus["\x1e\n\x07"]["\b\x16"]["\b\x17"](_loc3_);
      var _loc5_ = new dofus["\x1e\n\x07"]["\b\x16"]["\x1e\x15\x01"].NameCheckerCharacterNameRules();
      var _loc4_ = _loc8_.isValidAgainstWithDetails(_loc5_);
      if(!_loc4_.IS_SUCCESS)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("INVALID_CHARACTER_NAME") + "\r\n" + _loc4_.toString("\r\n"),"ERROR_BOX");
         return undefined;
      }
   }
   if(dofus.Constants.EPISODIC_GUILD[this._nBreed - 1] > this.api.datacenter.Basics.aks_current_regional_version)
   {
      var _loc7_ = this.api.lang.getClassText(this._nBreed).sn;
      this.api.kernel.showMessage(undefined,this.api.lang.getText("COMING_SOON_GUILD",[_loc7_]),"ERROR_BOX");
      return undefined;
   }
   if(dofus.Constants.PAYING_GUILD[this._nBreed - 1] && this._nRemainingTime <= 0)
   {
      var _loc6_ = this.api.lang.getClassText(this._nBreed).sn;
      this.api.kernel.showMessage(undefined,this.api.lang.getText("PAYING_GUILD",[_loc6_]),"ERROR_BOX");
      return undefined;
   }
   this.api.datacenter.Basics.hasCreatedCharacter = true;
   if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
   {
      this.getURL("JavaScript:WriteLog(\'addCharacter;" + _loc3_ + "\')");
   }
   if(this.modeHero)
   {
      this.api.network.Account.addCharacterHero(_loc3_,this._nBreed,this._oColors.color1,this._oColors.color2,this._oColors.color3,this._nSex);
   }
   else
   {
      this.api.network.Account.addCharacter(_loc3_,this._nBreed,this._oColors.color1,this._oColors.color2,this._oColors.color3,this._nSex);
   }
};
