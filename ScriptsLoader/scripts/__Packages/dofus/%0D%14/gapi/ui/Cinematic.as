class dofus.§\r\x14§.gapi.ui.Cinematic extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _sFile;
   var _oSequencer;
   var _sOldQuality;
   var _ldrLoader;
   var _btnCancel;
   var _lblWhite;
   var dispatchEvent;
   static var CLASS_NAME = "Cinematic";
   function Cinematic()
   {
      super();
   }
   function set file(§\x1e\x12\x0b§)
   {
      this._sFile = _loc2_;
   }
   function set sequencer(§\x1e\x17\x1b§)
   {
      this._oSequencer = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Cinematic.CLASS_NAME);
   }
   function destroy()
   {
      _root._quality = this._sOldQuality;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.loadFile});
   }
   function startCinematic(§\n\x19§)
   {
      _loc2_.gotoAndPlay(1);
   }
   function addListeners()
   {
      this._ldrLoader.addEventListener("initialization",this);
      this._ldrLoader.addEventListener("complete",this);
      this._btnCancel.addEventListener("click",this);
      this._btnCancel.addEventListener("over",this);
      this._btnCancel.addEventListener("out",this);
   }
   function loadFile()
   {
      this._ldrLoader.contentPath = this._sFile;
      this._sOldQuality = _root._quality;
      _root._quality = "MEDIUM";
      this._lblWhite.text = this.api.lang.getText("LOADING");
   }
   function initialization(§\x1e\x19\x0e§)
   {
      this._lblWhite._visible = false;
      _loc2_.target.content.cinematic = this;
      this.addToQueue({object:this,method:this.startCinematic,params:[_loc2_.target.content]});
   }
   function complete(§\x1e\x19\x0e§)
   {
      _loc2_.target.stop();
      _loc2_.target.content.stop();
      _loc2_.target.content.cinematic.stop();
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnCancel)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("LEAVE_CINEMATIC"),"CAUTION_YESNO",{name:"Cinematic",listener:this});
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnCancel)
      {
         this.gapi.showTooltip(this.api.lang.getText("CANCEL_CINEMATIC"),_loc2_.target,-20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function onCinematicFinished()
   {
      this.dispatchEvent({type:"cinematicFinished"});
      this._oSequencer.onActionEnd();
      _root._quality = this._sOldQuality;
      this.unloadThis();
   }
   function onSubtitle(§\x1e\x0b\x04§, §\x1e\x1c\x13§)
   {
      var _loc4_ = this._sFile.substring(0,this._sFile.toLowerCase().indexOf(".swf"));
      while(_loc4_.indexOf("/") > -1)
      {
         _loc4_ = _loc4_.substr(_loc4_.indexOf("/") + 1);
      }
      var _loc5_ = Number(_loc4_);
      var _loc6_ = this.api.lang.getSubtitle(_loc5_,_loc3_);
      if(_loc6_ != undefined)
      {
         _loc2_.text = _loc6_;
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      this.onCinematicFinished();
   }
}
