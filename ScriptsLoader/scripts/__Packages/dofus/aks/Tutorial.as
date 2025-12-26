class dofus.aks.Tutorial extends dofus.aks.Handler
{
   static var INTRO_CINEMATIC_PATH = dofus.Constants.CINEMATICS_PATH + "8.swf";
   static var INTRO_CINEMATIC_MAX_LEN = 120;
   static var INTRO_CINEMATIC_PATH_LIGHT = "";
   static var INTRO_CINEMATIC_MAX_LEN_LIGHT = 120;
   static var NOOB_AREA_MUSIC_ID = 129;
   function Tutorial(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function end(§\b\x1d§, §\x07\x11§, §\x06\x07§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = 0;
      }
      if(_loc3_ == undefined || _loc4_ == undefined)
      {
         this.aks.send("TV" + String(_loc2_),false);
      }
      else
      {
         this.aks.send("TV" + String(_loc2_) + "|" + String(_loc3_) + "|" + String(_loc4_),false);
      }
   }
   function onShowTip(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      this.api.kernel.TipsManager.showNewTip(_loc3_);
   }
   function onCreate(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = _loc3_[0];
      var _loc5_ = _loc3_[1];
      var _loc6_ = this.api.config.language;
      this.api.kernel.TutorialServersManager.loadTutorial(_loc4_ + "_" + _loc5_);
   }
   function onGameBegin()
   {
      var _loc2_ = new ank["\x1e\n\x07"]["\x1e\x12\x14"]((!this.api.config.isStreaming ? dofus.aks.Tutorial.INTRO_CINEMATIC_MAX_LEN : dofus.aks.Tutorial.INTRO_CINEMATIC_MAX_LEN_LIGHT) * 1000);
      dofus.aks.Tutorial.INTRO_CINEMATIC_PATH_LIGHT = dofus.Constants.CINEMATICS_PATH + "9_" + this.api.config.language + ".swf";
      _loc2_.addAction(118,false,this.api.sounds,this.api.sounds.stopAllSounds);
      if(!this.api.config.isStreaming)
      {
         _loc2_.addAction(119,true,this.api.ui,this.api.ui.loadUIComponent,["Cinematic","Cinematic",{file:(!this.api.config.isStreaming ? dofus.aks.Tutorial.INTRO_CINEMATIC_PATH : dofus.aks.Tutorial.INTRO_CINEMATIC_PATH_LIGHT),sequencer:_loc2_},{bUltimateOnTop:true}]);
      }
      _loc2_.addAction(120,false,this.api.ui,this.api.ui.loadUIComponent,["AskGameBegin","AskGameBegin",undefined,{bAlwaysOnTop:true}]);
      _loc2_.addAction(121,false,this.api.sounds,this.api.sounds.playMusic,[dofus.aks.Tutorial.NOOB_AREA_MUSIC_ID,true]);
      this.addToQueue({object:_loc2_,method:_loc2_.execute,params:[true]});
   }
}
