class dofus.§\r\x14§.gapi.ui.Timeline extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _tl;
   var _txtTableTurnDown;
   var _txtTableTurnUp;
   var _btnUp;
   var _mcTableTurnDown;
   var _btnDown;
   var _mcTableTurnUp;
   static var CLASS_NAME = "Timeline";
   static var bTimelineUpPosition = false;
   static var OPTION_BUTTONS_MOVE_DISTANCE = 40;
   static var UI_TIMELINE_MOVE_DISTANCE = 350;
   static var UI_PARTY_MOVE_DISTANCE = 39;
   function Timeline()
   {
      super();
   }
   static function get isTimelineUpPosition()
   {
      return dofus["\r\x14"].gapi.ui.Timeline.bTimelineUpPosition;
   }
   function update()
   {
      this._tl.update();
   }
   function nextTurn(§\f\x1c§, §\x13\x13§)
   {
      this.refreshCurrentTableTurnTxtFields();
      this._tl.nextTurn(_loc2_,_loc3_);
   }
   function get timelineControl()
   {
      return this._tl;
   }
   function hideItem(§\f\x1c§)
   {
      this._tl.hideItem(_loc2_);
   }
   function showItem(§\f\x1c§)
   {
      this._tl.showItem(_loc2_);
   }
   function startChrono(§\x05\x19§)
   {
      this._tl.startChrono(_loc2_);
   }
   function stopChrono()
   {
      this._tl.stopChrono();
   }
   function refreshCurrentTableTurnTxtFields()
   {
      this._txtTableTurnDown.text = String(this.api.datacenter.Game.currentTableTurn);
      this._txtTableTurnUp.text = String(this.api.datacenter.Game.currentTableTurn);
   }
   function over(§\x1e\x19\x0e§)
   {
      if(!this.gapi.isCursorHidden())
      {
         return undefined;
      }
      switch(_loc2_.target._name)
      {
         case "_mcTableTurnUp":
         case "_mcTableTurnDown":
            var _loc3_ = this.api.lang.getText("TURNS_NUMBER") + " : " + this.api.datacenter.Game.currentTableTurn;
            var _loc4_ = _root._xmouse;
            var _loc5_ = _root._ymouse - 20;
            this.gapi.showTooltip(_loc3_,_loc4_,_loc5_);
      }
   }
   function out()
   {
      this.gapi.hideTooltip();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Timeline.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      if(dofus["\r\x14"].gapi.ui.Timeline.bTimelineUpPosition)
      {
         this.moveTimeline(- dofus["\r\x14"].gapi.ui.Timeline.UI_TIMELINE_MOVE_DISTANCE);
         var _loc2_ = this.api.ui.getUIComponent("FightOptionButtons");
         if(_loc2_ != undefined && _loc2_._btnFlag._y == 370)
         {
            _loc2_.moveButtons(dofus["\r\x14"].gapi.ui.Timeline.OPTION_BUTTONS_MOVE_DISTANCE);
         }
         var _loc3_ = this.api.ui.getUIComponent("Party");
         if(_loc3_ != undefined && _loc3_._btnBlockJoinerExceptParty._y == 41)
         {
            _loc3_.moveUI(dofus["\r\x14"].gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE);
         }
         this._btnUp._visible = false;
         this._txtTableTurnDown._visible = false;
         this._mcTableTurnDown._visible = false;
      }
      else
      {
         this._btnDown._visible = false;
         this._txtTableTurnUp._visible = false;
         this._mcTableTurnUp._visible = false;
      }
      this.refreshCurrentTableTurnTxtFields();
   }
   function addListeners()
   {
      this._btnUp.addEventListener("click",this);
      this._btnDown.addEventListener("click",this);
      this._mcTableTurnDown.onRollOver = function()
      {
         this._parent.over({target:this});
      };
      this._mcTableTurnDown.onRollOut = function()
      {
         this._parent.out({target:this});
      };
      this._mcTableTurnUp.onRollOver = function()
      {
         this._parent.over({target:this});
      };
      this._mcTableTurnUp.onRollOut = function()
      {
         this._parent.out({target:this});
      };
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target._name;
      switch(_loc3_)
      {
         case "_btnUp":
            dofus["\r\x14"].gapi.ui.Timeline.bTimelineUpPosition = true;
            this._btnUp._visible = false;
            this._btnDown._visible = true;
            this._txtTableTurnUp._visible = true;
            this._txtTableTurnDown._visible = false;
            this._mcTableTurnUp._visible = true;
            this._mcTableTurnDown._visible = false;
            this.moveTimeline(- dofus["\r\x14"].gapi.ui.Timeline.UI_TIMELINE_MOVE_DISTANCE);
            this.api.ui.getUIComponent("FightOptionButtons").moveButtons(dofus["\r\x14"].gapi.ui.Timeline.OPTION_BUTTONS_MOVE_DISTANCE);
            this.api.ui.getUIComponent("Party").moveUI(dofus["\r\x14"].gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE);
            break;
         case "_btnDown":
            dofus["\r\x14"].gapi.ui.Timeline.bTimelineUpPosition = false;
            this._btnUp._visible = true;
            this._btnDown._visible = false;
            this._txtTableTurnUp._visible = false;
            this._txtTableTurnDown._visible = true;
            this._mcTableTurnUp._visible = false;
            this._mcTableTurnDown._visible = true;
            this.moveTimeline(dofus["\r\x14"].gapi.ui.Timeline.UI_TIMELINE_MOVE_DISTANCE);
            this.api.ui.getUIComponent("FightOptionButtons").moveButtons(- dofus["\r\x14"].gapi.ui.Timeline.OPTION_BUTTONS_MOVE_DISTANCE);
            this.api.ui.getUIComponent("Party").moveUI(- dofus["\r\x14"].gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE);
      }
   }
   function destroy()
   {
      if(dofus["\r\x14"].gapi.ui.Timeline.bTimelineUpPosition)
      {
         var _loc2_ = this.api.ui.getUIComponent("FightOptionButtons");
         if(_loc2_ != undefined && _loc2_._btnFlag._y == 370 + dofus["\r\x14"].gapi.ui.Timeline.OPTION_BUTTONS_MOVE_DISTANCE)
         {
            _loc2_.moveButtons(- dofus["\r\x14"].gapi.ui.Timeline.OPTION_BUTTONS_MOVE_DISTANCE);
         }
         var _loc3_ = this.api.ui.getUIComponent("Party");
         if(_loc3_ != undefined && _loc3_._btnBlockJoinerExceptParty._y == 41 + dofus["\r\x14"].gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE)
         {
            _loc3_.moveUI(- dofus["\r\x14"].gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE);
         }
      }
   }
   function moveTimeline(§\x05\x1d§)
   {
      this._tl._y += _loc2_;
      this._btnUp._y += _loc2_;
      this._btnDown._y += _loc2_;
      this._txtTableTurnDown._y += _loc2_;
      this._txtTableTurnUp._y += _loc2_;
      this._mcTableTurnDown._y += _loc2_;
      this._mcTableTurnUp._y += _loc2_;
   }
}
