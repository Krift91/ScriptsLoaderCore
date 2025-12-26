class dofus.§\r\x14§.gapi.ui.Party extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnOpenClose;
   var _btnBlockJoinerExceptParty;
   var _mcInfo;
   var _piMember0;
   var _piMember1;
   var _piMember2;
   var _piMember3;
   var _piMember4;
   var _piMember5;
   var _piMember6;
   var _piMember7;
   var _aMembers;
   var _nLvlTotal;
   var _nProspectionTotal;
   static var CLASS_NAME = "Party";
   var _sLeaderID = "0";
   var _sFollowID = "0";
   function Party()
   {
      super();
   }
   function get leaderID()
   {
      return this._sLeaderID;
   }
   function get followID()
   {
      return this._sFollowID;
   }
   function moveUI(§\x05\x1d§)
   {
      this._btnOpenClose._y += _loc2_;
      this._btnBlockJoinerExceptParty._y += _loc2_;
      this._mcInfo._y += _loc2_;
      this._piMember0._y += _loc2_;
      this._piMember1._y += _loc2_;
      this._piMember2._y += _loc2_;
      this._piMember3._y += _loc2_;
      this._piMember4._y += _loc2_;
      this._piMember5._y += _loc2_;
      this._piMember6._y += _loc2_;
      this._piMember7._y += _loc2_;
   }
   function addMember(§\x1e\x18\x16§, §\x16\b§)
   {
      this._aMembers.push(_loc2_);
      if(_loc3_)
      {
         this.updateData();
      }
   }
   function getMember(§\x1e\x10\x03§)
   {
      var _loc3_ = this._aMembers.findFirstItem("id",_loc2_);
      if(_loc3_.index != -1)
      {
         return _loc3_.item;
      }
      return null;
   }
   function getMemberById(§\x02\x13§)
   {
      var _loc3_ = 0;
      while(_loc3_ < dofus.Constants.MEMBERS_COUNT_IN_PARTY)
      {
         if(this._aMembers[_loc3_].id == _loc2_)
         {
            return this._aMembers[_loc3_];
         }
         _loc3_ = _loc3_ + 1;
      }
      return null;
   }
   function removeMember(§\x1e\x10\x03§, §\x16\b§)
   {
      var _loc4_ = this._aMembers.findFirstItem("id",_loc2_);
      if(this._sFollowID == _loc2_)
      {
         this.api.kernel.GameManager.updateCompass(this.api.datacenter.Basics.banner_targetCoords[0],this.api.datacenter.Basics.banner_targetCoords[1]);
         delete this._sFollowID;
      }
      if(_loc4_.index != -1)
      {
         this._aMembers.removeItems(_loc4_.index,1);
      }
      if(_loc3_)
      {
         this.updateData();
      }
   }
   function refresh()
   {
      this.addToQueue({object:this,method:this.updateData});
   }
   function setLeader(§\x1e\x10\x11§)
   {
      this._sLeaderID = _loc2_;
      this.updateData();
      if(_loc2_ == undefined)
      {
         this.api.kernel.GameManager.updateCompass(this.api.datacenter.Basics.banner_targetCoords[0],this.api.datacenter.Basics.banner_targetCoords[0]);
      }
   }
   function setFollow(§\x1e\x12\x05§)
   {
      this._sFollowID = _loc2_;
      this.updateData();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Party.CLASS_NAME);
      this._aMembers = new ank["\x1e\n\x07"]["\x0f\x01"]();
   }
   function destroy()
   {
      this.gapi.hideTooltip();
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.updateData});
      this.addToQueue({object:this,method:this.initOption});
      if(this.api.ui.getUIComponent("Timeline") != undefined && dofus["\r\x14"].gapi.ui.Timeline.isTimelineUpPosition)
      {
         this.moveUI(dofus["\r\x14"].gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE);
      }
   }
   function addListeners()
   {
      this._btnOpenClose.addEventListener("click",this);
      this._btnOpenClose.addEventListener("over",this);
      this._btnOpenClose.addEventListener("out",this);
      this._btnBlockJoinerExceptParty.addEventListener("click",this);
      this._btnBlockJoinerExceptParty.addEventListener("over",this);
      this._btnBlockJoinerExceptParty.addEventListener("out",this);
   }
   function initOption()
   {
      this._btnBlockJoinerExceptParty.selected = this.api.kernel.OptionsManager.getOption("FightGroupAutoLock");
   }
   function updateData(§\x1e\x18\x15§)
   {
      var _loc3_ = 0;
      this._nLvlTotal = 0;
      this._nProspectionTotal = 0;
      var _loc5_ = false;
      if(this._aMembers.length != 0)
      {
         var _loc6_ = 0;
         while(_loc6_ < dofus.Constants.MEMBERS_COUNT_IN_PARTY)
         {
            var _loc7_ = this._aMembers[_loc6_];
            var _loc8_ = this["_piMember" + _loc3_++];
            if(_loc2_ && _loc2_.id == _loc7_.id)
            {
               _loc7_ = _loc2_;
               this._aMembers[_loc6_] = _loc2_;
            }
            _loc8_.setData(_loc7_);
            _loc8_.isFollowing = _loc7_.id == this._sFollowID;
            _loc8_.isLeader = _loc7_.id == this._sLeaderID;
            if(_loc8_.isInGroup)
            {
               this._nLvlTotal += _loc7_.level;
               this._nProspectionTotal += _loc7_.prospection;
            }
            _loc6_ = _loc6_ + 1;
         }
         var _loc9_ = true;
         while(_loc9_)
         {
            _loc9_ = false;
            var _loc10_ = 0;
            while(_loc10_ < dofus.Constants.MEMBERS_COUNT_IN_PARTY)
            {
               if(this._aMembers[_loc10_ + 1] != undefined && this._aMembers[_loc10_].initiative < this._aMembers[_loc10_ + 1].initiative)
               {
                  var _loc11_ = this._aMembers[_loc10_];
                  this._aMembers[_loc10_] = this._aMembers[_loc10_ + 1];
                  this._aMembers[_loc10_ + 1] = _loc11_;
                  _loc9_ = true;
               }
               var _loc12_ = this["_piMember" + _loc10_];
               _loc12_._visible = !this._btnOpenClose.selected;
               _loc12_.setData(this._aMembers[_loc10_]);
               _loc12_.isFollowing = this._aMembers[_loc10_].id == this._sFollowID;
               _loc12_.isLeader = this._aMembers[_loc10_].id == this._sLeaderID;
               if(_loc12_.isInGroup)
               {
                  var _loc4_ = _loc12_;
               }
               _loc10_ = _loc10_ + 1;
            }
         }
      }
      var ref = this;
      this._mcInfo.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcInfo.onRollOut = function()
      {
         ref.out({target:this});
      };
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) !== this._btnBlockJoinerExceptParty)
      {
         this._piMember0._visible = !this._btnOpenClose.selected;
         this._piMember1._visible = !this._btnOpenClose.selected;
         this._piMember2._visible = !this._btnOpenClose.selected;
         this._piMember3._visible = !this._btnOpenClose.selected;
         this._piMember4._visible = !this._btnOpenClose.selected;
         this._piMember5._visible = !this._btnOpenClose.selected;
         this._piMember6._visible = !this._btnOpenClose.selected;
         this._piMember7._visible = !this._btnOpenClose.selected;
         this._mcInfo._visible = !this._btnOpenClose.selected;
      }
      else
      {
         var _loc3_ = !this.api.kernel.OptionsManager.getOption("FightGroupAutoLock");
         this.api.kernel.OptionsManager.setOption("FightGroupAutoLock",_loc3_);
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnOpenClose:
            this.gapi.showTooltip(this.api.lang.getText("PARTY_OPEN_CLOSE"),_loc2_.target,20);
            break;
         case this._mcInfo:
            this.gapi.showTooltip("<b>" + this.api.lang.getText("INFORMATIONS") + "</b>\n" + this.api.lang.getText("TOTAL_LEVEL") + " : " + this._nLvlTotal + "\n" + this.api.lang.getText("TOTAL_DISCERNMENT") + " : " + this._nProspectionTotal,_loc2_.target,20);
            break;
         case this._btnBlockJoinerExceptParty:
            this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_BLOCKJOINEREXCEPTPARTY"),_loc2_.target,20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
}
