class dofus.§\r\x14§.gapi.ui.ChallengeMenu extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _sLabelReady;
   var _sLabelCancel;
   var _bCancelButton;
   var _btnCancel;
   var _lblCancel;
   var _mcBackground;
   var _btnReady;
   var _lblReady;
   var _mcTick;
   var _bReady;
   static var CLASS_NAME = "ChallengeMenu";
   static var X_OFFSET = 90;
   function ChallengeMenu()
   {
      super();
   }
   function set labelReady(§\x1e\x10\x19§)
   {
      this._sLabelReady = _loc2_;
   }
   function set labelCancel(§\x1e\x10\x1a§)
   {
      this._sLabelCancel = _loc2_;
   }
   function set cancelButton(§\x1b\x16§)
   {
      this._bCancelButton = _loc2_;
      this._btnCancel._visible = _loc2_;
      this._lblCancel._visible = _loc2_;
      if(!_loc2_)
      {
         this._mcBackground._x += dofus["\r\x14"].gapi.ui.ChallengeMenu.X_OFFSET;
         this._btnReady._x += dofus["\r\x14"].gapi.ui.ChallengeMenu.X_OFFSET;
         this._lblReady._x += dofus["\r\x14"].gapi.ui.ChallengeMenu.X_OFFSET;
         this._mcTick._x += dofus["\r\x14"].gapi.ui.ChallengeMenu.X_OFFSET;
      }
   }
   function set ready(§\x16\f§)
   {
      this._bReady = _loc2_;
      this._mcTick._visible = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.ChallengeMenu.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.setLabels});
   }
   function setLabels()
   {
      this._lblReady.text = this._sLabelReady;
      if(this._bCancelButton)
      {
         this._lblCancel.text = this._sLabelCancel;
      }
   }
   function sendReadyState()
   {
      this.api.network.Game.ready(!this._bReady);
      this.ready = !this._bReady;
   }
   function sendCancel()
   {
      this.api.network.Game.leave();
   }
}
