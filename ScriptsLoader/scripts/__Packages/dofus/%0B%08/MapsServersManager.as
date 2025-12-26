class dofus.§\x0b\b§.MapsServersManager extends dofus.§\x0b\b§.§\x1e\x12\x0f§
{
   static var _sSelf = null;
   var _lastLoadedMap = undefined;
   var _aKeys = new Array();
   var _bBuildingMap = false;
   var _bCustomFileCall = false;
   var _bPreloadCall = false;
   function MapsServersManager()
   {
      super();
      dofus["\x0b\b"].MapsServersManager._sSelf = this;
   }
   function get isBuilding()
   {
      return this._bBuildingMap;
   }
   function set isBuilding(§\x1b\x1a§)
   {
      this._bBuildingMap = _loc2_;
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].MapsServersManager._sSelf;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI,"maps","maps/");
   }
   function loadMap(sID, §\x1e\x13\x03§, §\x1e\x11\x03§)
   {
      this._lastLoadedMap = undefined;
      if(!_global.isNaN(Number(sID)))
      {
         if(_loc4_ != undefined && _loc4_.length > 0)
         {
            this._aKeys[Number(sID)] = dofus.aks["\x1e\x0f"].prepareKey(_loc4_);
         }
         else
         {
            delete this._aKeys[Number(sID)];
         }
      }
      this.loadData(sID + "_" + _loc3_ + (this._aKeys[Number(sID)] == undefined ? "" : "X") + ".swf");
   }
   function getMapName(§\x03\x0b§)
   {
      var _loc3_ = this.api.lang.getMapText(_loc2_);
      var _loc4_ = this.api.lang.getMapAreaInfos(_loc3_.sa);
      var _loc5_ = this.api.lang.getMapAreaText(_loc4_.areaID).n;
      var _loc6_ = this.api.lang.getMapSubAreaText(_loc3_.sa).n;
      var _loc7_ = _loc5_ + (_loc6_.indexOf("//") != -1 ? "" : " (" + _loc6_ + ")");
      if(dofus.Constants.DEBUG)
      {
         _loc7_ += " (" + _loc2_ + ")";
      }
      return _loc7_;
   }
   function parseMap(§\x1e\x19\x15§)
   {
      if(this.api.network.Game.isBusy)
      {
         this.addToQueue({object:this,method:this.parseMap,params:[_loc2_]});
         return undefined;
      }
      var _loc3_ = Number(_loc2_.id);
      if(this.api.config.isStreaming && this.api.config.streamingMethod == "compact")
      {
         var _loc4_ = this.api.lang.getConfigText("INCARNAM_CLASS_MAP");
         var _loc5_ = false;
         var _loc6_ = 0;
         while(_loc6_ < _loc4_.length && !_loc5_)
         {
            if(_loc4_[_loc6_] == _loc3_)
            {
               _loc5_ = true;
            }
            _loc6_ = _loc6_ + 1;
         }
         if(_loc5_)
         {
            var _loc7_ = [dofus.Constants.GFX_ROOT_PATH + "g" + this.api.datacenter.Player.Guild + ".swf",dofus.Constants.GFX_ROOT_PATH + "o" + this.api.datacenter.Player.Guild + ".swf"];
         }
         else
         {
            _loc7_ = [dofus.Constants.GFX_ROOT_PATH + "g0.swf",dofus.Constants.GFX_ROOT_PATH + "o0.swf"];
         }
         if(!this.api.gfx.loadManager.areRegister(_loc7_))
         {
            this.api.gfx.loadManager.loadFiles(_loc7_);
            this.api.gfx.bCustomFileLoaded = false;
         }
         if(this.api.gfx.loadManager.areLoaded(_loc7_))
         {
            this.api.gfx.setCustomGfxFile(_loc7_[0],_loc7_[1]);
         }
         if(!this.api.gfx.bCustomFileLoaded || !this.api.gfx.loadManager.areLoaded(_loc7_))
         {
            var _loc8_ = this.api.ui.getUIComponent("CenterTextMap");
            if(!_loc8_)
            {
               _loc8_ = this.api.ui.loadUIComponent("CenterText","CenterTextMap",{text:this.api.lang.getText("LOADING_MAP"),timer:40000},{bForceLoad:true});
            }
            this.api.ui.getUIComponent("CenterTextMap").updateProgressBar("Downloading",this.api.gfx.loadManager.getProgressions(_loc7_),100);
            this.addToQueue({object:this,method:this.parseMap,params:[_loc2_]});
            return undefined;
         }
         if(_loc5_ && !this._bPreloadCall)
         {
            this._bPreloadCall = true;
            this.api.gfx.loadManager.loadFiles([dofus.Constants.CLIPS_PERSOS_PATH + (this.api.datacenter.Player.Guild * 10 + this.api.datacenter.Player.Sex) + ".swf",dofus.Constants.CLIPS_PERSOS_PATH + "9059.swf",dofus.Constants.CLIPS_PERSOS_PATH + "9091.swf",dofus.Constants.CLIPS_PERSOS_PATH + "1219.swf",dofus.Constants.CLIPS_PERSOS_PATH + "101.swf",dofus.Constants.GFX_ROOT_PATH + "g0.swf",dofus.Constants.GFX_ROOT_PATH + "o0.swf"]);
         }
      }
      this._bCustomFileCall = false;
      if(this.api.network.Game.nLastMapIdReceived != _loc3_ && (this.api.network.Game.nLastMapIdReceived != -1 && this.api.lang.getConfigText("CHECK_MAP_FILE_ID")))
      {
         this.api.gfx.onMapLoaded();
         return undefined;
      }
      this._bBuildingMap = true;
      this._lastLoadedMap = _loc2_;
      var _loc9_ = this.getMapName(_loc3_);
      var _loc10_ = Number(_loc2_.width);
      var _loc11_ = Number(_loc2_.height);
      var _loc12_ = Number(_loc2_.backgroundNum);
      var _loc13_ = this._aKeys[_loc3_] == undefined ? _loc2_.mapData : dofus.aks["\x1e\x0f"].decypherData(_loc2_.mapData,this._aKeys[_loc3_],_global.parseInt(dofus.aks["\x1e\x0f"].checksum(this._aKeys[_loc3_]),16) * 2);
      var _loc14_ = _loc2_.ambianceId;
      var _loc15_ = _loc2_.musicId;
      var _loc16_ = _loc2_.bOutdoor != 1 ? false : true;
      var _loc17_ = (_loc2_.capabilities & 1) == 0;
      var _loc18_ = (_loc2_.capabilities >> 1 & 1) == 0;
      var _loc19_ = (_loc2_.capabilities >> 2 & 1) == 0;
      var _loc20_ = (_loc2_.capabilities >> 3 & 1) == 0;
      this.api.datacenter.Basics.aks_current_map_id = _loc3_;
      this.api.kernel.TipsManager.onNewMap(_loc3_);
      this.api.kernel.StreamingDisplayManager.onNewMap(_loc3_);
      var _loc21_ = new dofus.datacenter["\x10\x15"](_loc3_);
      _loc21_.bCanChallenge = _loc17_;
      _loc21_.bCanAttack = _loc18_;
      _loc21_.bSaveTeleport = _loc19_;
      _loc21_.bUseTeleport = _loc20_;
      _loc21_.bOutdoor = _loc16_;
      _loc21_.ambianceID = _loc14_;
      _loc21_.musicID = _loc15_;
      this.api.gfx.buildMap(_loc3_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc21_);
      this._bBuildingMap = false;
   }
   function onComplete(§\n\x1d§)
   {
      var _loc3_ = _loc2_;
      this.parseMap(_loc3_);
   }
   function onFailed()
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("NO_MAPDATA_FILE"),"ERROR_BOX",{name:"NoMapData"});
   }
}
