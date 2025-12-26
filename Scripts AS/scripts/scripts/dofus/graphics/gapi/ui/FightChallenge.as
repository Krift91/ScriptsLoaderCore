var _loc1 = dofus["\r\x14"].gapi.ui.FightChallenge.prototype;
_loc1.removeChallenge = function(nUnicID)
{
   var _loc3_ = this._aChallengeList.findFirstItem("unicID",nUnicID);
   if(_loc3_.index != -1)
   {
      this._aChallengeList.removeItems(_loc3_.index,1);
   }
   _global.trace("Reto eliminado ID: " + nUnicID);
   _global.trace("Reto eliminado index: " + _loc3_.index);
   _global.trace("Reto eliminado noIndex: " + _loc3_);
};
_loc1.cleanChallenge = function()
{
   var _loc2_ = 0;
   while(_loc2_ < this._aChallengeIcon.length)
   {
      this._aChallengeIcon[_loc2_].unloadMovie();
      this._aChallengeIcon[_loc2_].removeMovieClip();
      _loc2_ += 1;
   }
   this._aChallengeIcon = [];
   this._aChallengeList = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this.FightChallengeViewer.unloadMovie();
   this._btnChallengeReload._visible = true;
   this._visible = false;
};
_loc1.addListeners = function()
{
   this._btnOpenClose.addEventListener("click",this);
   this._btnOpenClose.addEventListener("over",this);
   this._btnOpenClose.addEventListener("out",this);
   this._btnChallengeReload.addEventListener("click",this);
   this._btnChallengeReload.addEventListener("over",this);
   this._btnChallengeReload.addEventListener("out",this);
};
_loc1.updateList = function()
{
   this._aChallengeIcon = new Array();
   this._visible = this._aChallengeList.length > 0;
   this._aChallengeList.sort(function(a, b)
   {
      return a.special - b.special;
   }
   );
   var _loc2_ = 0;
   while(_loc2_ < this._aChallengeList.length)
   {
      var _loc3_ = this.attachMovie("FightChallengeIcon","FightChallengeIcon" + _loc2_,_loc2_ + 1,{challenge:this._aChallengeList[_loc2_]});
      _loc3_._x = this._btnChallengeReload._x;
      _loc3_._y = this._btnChallengeReload._y + 20 + (6 + _loc3_._height) * _loc2_;
      _loc3_.addEventListener("over",this);
      this._aChallengeIcon.push(_loc3_);
      _loc3_._visible = !this._btnOpenClose.selected;
      if(this._aChallengeList[_loc2_].state > 0)
      {
         this.updateChallenge(this._aChallengeList[_loc2_] == 1);
      }
      _loc2_ += 1;
   }
};
_loc1.actualizarPrecio = function(nPrecio)
{
   this.nPrecio = nPrecio;
};
_loc1.actualizarRetos = function()
{
   var _loc2_ = 0;
   while(_loc2_ < this._aChallengeIcon.length)
   {
      this._aChallengeIcon[_loc2_].unloadMovie();
      this._aChallengeIcon[_loc2_].removeMovieClip();
      _loc2_ += 1;
   }
   this._aChallengeIcon = [];
   this._aChallengeList = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this.FightChallengeViewer.unloadMovie();
   this._visible = false;
};
_loc1.startToPlay = function()
{
   this._btnChallengeReload._visible = false;
   var _loc2_ = 0;
   while(_loc2_ < this._aChallengeList.length)
   {
      var _loc3_ = this["FightChallengeIcon" + _loc2_];
      if(_loc3_ != undefined)
      {
         _loc3_._y = this._btnOpenClose._y + 15 + (6 + _loc3_.height) * _loc2_;
      }
      _loc2_ += 1;
   }
};
_loc1.valid = function(noConfirm, precio)
{
   if(!noConfirm)
   {
      this.api.kernel.showMessage("ATTENTION","Veux-tu payer" + this.nPrecio + " kamas pour changer de challenge ?","CAUTION_YESNO",{name:"Confirm",listener:this});
      return undefined;
   }
   var _loc0_ = null;
   if((_loc0_ = this._oEvent.target) === this._btnChallengeReload)
   {
      this.api.network.Game.reloadChallenges(this.nPrecio);
   }
};
_loc1.yes = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.valid(true,this.nPrecio);
   }
};
_loc1.click = function(e)
{
   var _loc0_ = null;
   if((_loc0_ = e.target) !== this._btnChallengeReload)
   {
      var _loc2_ = 0;
      while(_loc2_ < this._aChallengeIcon.length)
      {
         this._aChallengeIcon[_loc2_]._visible = !this._btnOpenClose.selected;
         this._btnChallengeReload._visible = !this._btnOpenClose.selected;
         _loc2_ += 1;
      }
   }
   else
   {
      this._oEvent = e;
      this.valid(false,this.nPrecio);
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOpenClose:
         this.gapi.showTooltip(this.api.lang.getText("PARTY_OPEN_CLOSE"),oEvent.target,20);
         break;
      case this._btnChallengeReload:
         this.gapi.showTooltip(this.api.lang.getText("RETO_RECARGAR") + " " + this.nPrecio,oEvent.target,20);
   }
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.updateChallengeData = function(eChallengeData)
{
   for(var _loc3_ in this._aChallengeIcon)
   {
      if(this._aChallengeIcon[_loc3_].challenge.unicID == eChallengeData.unicID)
      {
         this._aChallengeIcon[_loc3_].challenge = eChallengeData;
      }
   }
};
_loc1.nPrecio = 0;
