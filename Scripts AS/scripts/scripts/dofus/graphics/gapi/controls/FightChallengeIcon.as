var _loc1 = dofus["\r\x14"].gapi.controls.FightChallengeIcon.prototype;
_loc1.createChildren = function()
{
   this._lastShowAsk = 0;
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initCpt});
};
_loc1.initCpt = function()
{
   this._ldr.contentPath = this.challenge.iconPath;
   this._ldr.frame = !!this.challenge.special ? 2 : 1;
   this.update();
};
_loc1.over = function(_loc2_)
{
   var _loc3_ = this.api.lang.getFightChallenge(this.challenge.id);
   var _loc2_ = "<b>" + _loc3_.n + "</b>\n";
   if(getTimer() - this._lastShowAsk >= 2400 && (this.challenge.showTarget && this.challenge.state == 0))
   {
      this.api.network.Game.showFightChallengeTarget(this.challenge.id);
      this._lastShowAsk = getTimer();
   }
   _loc2_ += this.challenge.description + "\n";
   if(!this.challenge.special)
   {
      _loc2_ += this.api.lang.getText("LOOT");
      _loc2_ += " : +" + (this.challenge.teamDropBonus + this.challenge.basicDropBonus) + "%\n";
      _loc2_ += this.api.lang.getText("WORD_XP");
      _loc2_ += " : +" + (this.challenge.teamXpBonus + this.challenge.basicXpBonus) + "%\n";
   }
   _loc2_ += this.api.lang.getText("STATE") + " : ";
   switch(this.challenge.state)
   {
      case 0:
         _loc2_ += this.api.lang.getText(!!this.challenge.special ? "CURRENT_FIGHT_CHALLENGE_SPECIAL" : "CURRENT_FIGHT_CHALLENGE");
         break;
      case 1:
         _loc2_ += this.api.lang.getText(!!this.challenge.special ? "FIGHT_CHALLENGE_DONE_SPECIAL" : "FIGHT_CHALLENGE_DONE");
         break;
      case 2:
         _loc2_ += this.api.lang.getText(!!this.challenge.special ? "FIGHT_CHALLENGE_FAILED_SPECIAL" : "FIGHT_CHALLENGE_FAILED");
   }
   this.gapi.showTooltip(_loc2_,_loc2_.target,40);
};
