class dofus.§\x1e\n\x07§.§\x1d\x1b§ extends Object
{
   var _oConfig;
   var _oKernel;
   var _oDatacenter;
   var _oNetwork;
   var _oGfx;
   var _oUI;
   var _oSounds;
   var _oLang;
   var _oColors;
   var _oElectron;
   var _oMouseClicksMemorizer;
   static var _oLastInstance;
   function §\x1d\x1b§()
   {
      super();
      dofus["\x1e\n\x07"]["\x1d\x1b"]._oLastInstance = this;
   }
   static function getInstance()
   {
      return dofus["\x1e\n\x07"]["\x1d\x1b"]._oLastInstance;
   }
   function get config()
   {
      return this._oConfig;
   }
   function get kernel()
   {
      return this._oKernel;
   }
   function get datacenter()
   {
      return this._oDatacenter;
   }
   function get network()
   {
      return this._oNetwork;
   }
   function get gfx()
   {
      return this._oGfx;
   }
   function get ui()
   {
      return this._oUI;
   }
   function get sounds()
   {
      return this._oSounds;
   }
   function get lang()
   {
      return this._oLang;
   }
   function get colors()
   {
      return this._oColors;
   }
   function get electron()
   {
      return this._oElectron;
   }
   function get mouseClicksMemorizer()
   {
      return this._oMouseClicksMemorizer;
   }
   function initialize()
   {
      this._oConfig = _global.CONFIG;
      this._oLang = new dofus["\x1e\n\x07"]["\x10\x13"]();
      this._oUI = dofus["\x10\x16"].getClip().GAPI;
      this._oUI.api = this;
      this._oElectron = new dofus["\x0f\t"](this);
      this._oKernel = new dofus["\f\x04"](this);
      this._oSounds = dofus.sounds.AudioManager.getInstance();
      _global.SOMA = this._oSounds;
      this._oDatacenter = new dofus.datacenter["\x11\r"](this);
      this._oNetwork = new dofus.aks["\x1e\x0f"](this);
      this._oGfx = dofus["\x10\x16"].getClip().BATTLEFIELD;
      if(this._oConfig.isStreaming && this._oConfig.streamingMethod == "explod")
      {
         this._oGfx.initialize(this._oDatacenter,dofus.Constants.OBJECTS_LIGHT_FILE,dofus.Constants.OBJECTS_LIGHT_FILE,dofus.Constants.ACCESSORIES_PATH,this);
      }
      else
      {
         this._oGfx.initialize(this._oDatacenter,dofus.Constants.GROUND_FILE,dofus.Constants.OBJECTS_FILE,dofus.Constants.ACCESSORIES_PATH,this);
      }
      this._oColors = _global.GAC;
      this._oConfig.languages = this._oLang.getConfigText("LANGUAGES_LIST");
      this._oMouseClicksMemorizer = new ank["\x1e\n\x07"]["\t\x18"]();
      _root.menu = new ank.gapi.controls["\x1e\x15\x05"](this);
      if(this.ui.getUIComponent("Zoom") == undefined)
      {
         this.ui.loadUIComponent("Zoom","Zoom");
      }
   }
   function checkFileSize(sFile, nCheckID)
   {
      var _loc2_ = sFile.split("*");
      sFile = _loc2_[0];
      var arg = "";
      if(_loc2_.length > 1)
      {
         arg = _loc2_[1];
      }
      var _loc3_ = !this.datacenter.Player.isAuthorized && (!this.datacenter.Player.isSkippingFightAnimations && (!this.datacenter.Player.isSkippingLootPanel && this.ui.getUIComponent("Debug") == undefined));
      if(_loc3_)
      {
         var _loc4_ = _global.CONFIG.connexionServer.ip;
         if(_loc4_ == undefined)
         {
            _loc4_ = this.datacenter.Basics.serverHost;
         }
         if(_loc4_ != undefined && (_loc4_.indexOf("127.0.0.1") == 0 || _loc4_.indexOf("192.168") == 0))
         {
            _loc3_ = !_loc3_;
         }
      }
      var nAddition = !!_loc3_ ? -10 : 0;
      var _loc5_ = new Object();
      var ref = this;
      _loc5_.onLoadInit = function(§\n\x1d§, §\r\x03§)
      {
         var _loc4_ = _loc2_.getBytesTotal() + nAddition;
         var _loc5_ = "CHALLENGE";
         var _loc6_ = _loc2_[_loc5_];
         if(_loc6_ != undefined)
         {
            var _loc7_ = false;
            var _loc8_ = 0;
            while(_loc8_ < ref.config.dataServers.length)
            {
               if(sFile.indexOf(ref.config.dataServers[_loc8_].url) == 0)
               {
                  _loc7_ = true;
               }
               _loc8_ = _loc8_ + 1;
            }
            if(_loc7_)
            {
               var _loc9_ = Number(_loc6_.apply(ref,[_root,_global,sFile,nCheckID,arg]));
               if(_global.isNaN(_loc9_))
               {
                  _loc2_.removeMovieClip();
                  return undefined;
               }
               _loc4_ = _loc9_;
            }
         }
         ref.onFileCheckFinished(true,_loc4_,nCheckID);
         _loc2_.removeMovieClip();
      };
      _loc5_.onLoadError = function(§\n\x1d§, §\x0f\x06§, §\r\x03§)
      {
         var _loc5_ = _loc2_.getBytesTotal() + nAddition;
         ref.onFileCheckFinished(true,_loc5_,nCheckID);
         _loc2_.removeMovieClip();
      };
      var _loc6_ = dofus["\x10\x16"].getInstance().getTemporaryContainer();
      var _loc7_ = _loc6_.createEmptyMovieClip("FC" + nCheckID,_loc6_.getNextHighestDepth());
      var _loc8_ = new MovieClipLoader();
      _loc8_.addListener(_loc5_);
      _loc8_.loadClip(sFile,_loc7_);
   }
   function onFileCheckFinished(§\x14\x16§, §\x05\x04§, §\x07\x04§)
   {
      this.network.Basics.fileCheckAnswer(_loc4_,!_loc2_ ? -1 : _loc3_);
   }
}
