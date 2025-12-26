stop();
var _loc1 = dofus.DofusLoader.prototype;
_loc1.onCoreLoaded = function(mcCore)
{
   if(this.nCoreModulesLoadingStep == undefined || this.nCoreModulesLoadingStep != 2)
   {
      this.showBasicInformations();
      this.showBanner(true);
   }
   _global.clearInterval(this._nFinishCoreLoadingTimer);
   this._nFinishCoreLoadingTimer = _global.setInterval(this,"onCoreLoadedFinish",1000,mcCore);
};
_loc1.onCoreLoadedFinish = function(mcCore)
{
   _global.clearInterval(this._nFinishCoreLoadingTimer);
   if(_global.CONFIG.isStreaming)
   {
      this._bJsTimer = false;
   }
   if((this._bNonCriticalError || this._bUpdate) && dofus.Constants.DEBUG)
   {
      this.showNextButton(true);
      this.showCopyLogsButton(true);
      this.showShowLogsButton(true);
   }
   else
   {
      this.initCore(mcCore);
   }
};
_loc1.initCore = function(mcCore)
{
   this._mcCore = mcCore;
   this.checkXML();
};
_loc1.checkXML = function()
{
   var _loc3_ = ankama_acc;
   var _loc4_ = new LoadVars();
   var ref2 = _global;
   _loc4_.onData = function(sData)
   {
      ref2._sServerIP = sData.split(";")[0];
   };
   var _loc5_ = new LoadVars();
   _loc5_.addRequestHeader("Authorization",TOKEN);
   _loc5_.ip = "";
   _loc5_.sendAndLoad(_loc3_,_loc4_,"POST");
   this.parametrosCargados();
};
_loc1.parametrosCargados = function()
{
   Key.removeListener(this);
   var _loc2_ = dofus["\x10\x16"].getInstance();
   if(_loc2_ == undefined)
   {
      _loc2_ = new dofus["\x10\x16"](this._mcCore);
      if(Key.isDown(Key.SHIFT))
      {
         Stage.scaleMode = "exactFit";
      }
   }
   _loc2_.initStart();
   this._bNonCriticalError = false;
   this._bUpdate = false;
};
