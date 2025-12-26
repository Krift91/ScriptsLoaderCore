class dofus.§\r\x14§.gapi.ui.FightChallenge extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _aChallengeList;
   var _aChallengeIcon;
   var FightChallengeViewer;
   var _btnOpenClose;
   static var CLASS_NAME = "FightChallenge";
   function FightChallenge()
   {
      super();
   }
   function get challenges()
   {
      return this._aChallengeList;
   }
   function addChallenge(§\x0e\x16§)
   {
      this._aChallengeList.push(_loc2_);
      this.updateList();
   }
   function cleanChallenge()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._aChallengeIcon.length)
      {
         dofus["\r\x14"].gapi.controls.FightChallengeIcon(this._aChallengeIcon[_loc2_]).unloadMovie();
         dofus["\r\x14"].gapi.controls.FightChallengeIcon(this._aChallengeIcon[_loc2_]).removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this._aChallengeIcon = new Array();
      this._aChallengeList = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this.FightChallengeViewer.unloadMovie();
      this._visible = false;
   }
   function updateChallenge(§\f\x1c§, §\x1e\f\x01§)
   {
      var _loc4_ = 0;
      while(_loc4_ < this._aChallengeIcon.length)
      {
         if(dofus["\r\x14"].gapi.controls.FightChallengeIcon(this._aChallengeIcon[_loc4_]).challenge.id == _loc2_)
         {
            dofus["\r\x14"].gapi.controls.FightChallengeIcon(this._aChallengeIcon[_loc4_]).challenge.state = !_loc3_ ? 2 : 1;
            dofus["\r\x14"].gapi.controls.FightChallengeIcon(this._aChallengeIcon[_loc4_]).update();
            this.FightChallengeViewer.update();
         }
         _loc4_ = _loc4_ + 1;
      }
      var _loc5_ = 0;
      while(_loc5_ < this._aChallengeList.length)
      {
         if(dofus.datacenter["\x0e\x0f"](this._aChallengeList[_loc5_]).id == _loc2_)
         {
            this._aChallengeList[_loc5_].state = !_loc3_ ? 2 : 1;
         }
         _loc5_ = _loc5_ + 1;
      }
   }
   function init()
   {
      this._aChallengeList = new ank["\x1e\n\x07"]["\x0f\x01"]();
      super.init(false,dofus["\r\x14"].gapi.ui.FightChallenge.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._btnOpenClose.addEventListener("click",this);
      this._btnOpenClose.addEventListener("over",this);
      this._btnOpenClose.addEventListener("out",this);
   }
   function updateList()
   {
      this._aChallengeIcon = new Array();
      this._visible = this._aChallengeList.length > 0;
      var _loc3_ = 0;
      while(_loc3_ < this._aChallengeList.length)
      {
         var _loc2_ = dofus["\r\x14"].gapi.controls.FightChallengeIcon(this.attachMovie("FightChallengeIcon","FightChallengeIcon" + _loc3_,_loc3_ + 1,{challenge:this._aChallengeList[_loc3_]}));
         _loc2_._x = this._btnOpenClose._x;
         _loc2_._y = this._btnOpenClose._y + 15 + (6 + _loc2_._height) * _loc3_;
         _loc2_.addEventListener("over",this);
         this._aChallengeIcon.push(_loc2_);
         _loc2_._visible = !this._btnOpenClose.selected;
         _loc3_ = _loc3_ + 1;
      }
   }
   function click(§\x10\x11§)
   {
      var _loc3_ = 0;
      while(_loc3_ < this._aChallengeIcon.length)
      {
         this._aChallengeIcon[_loc3_]._visible = !this._btnOpenClose.selected;
         _loc3_ = _loc3_ + 1;
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnOpenClose)
      {
         this.gapi.showTooltip(this.api.lang.getText("PARTY_OPEN_CLOSE"),_loc2_.target,20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
}
