class ank.battlefield.§\x1c\n§ extends MovieClip
{
   var _bMapBuild;
   var _nScreenWidth;
   var _nScreenHeight;
   var _mcMainContainer;
   var _oDatacenter;
   var _sGroundFile;
   var onInitError;
   var attachClassMovie;
   var loadManager;
   var _sObjectFile;
   var mapHandler;
   var overHeadHandler;
   var textHandler;
   var pointsHandler;
   var onMapBuilding;
   var _nFrameLoadTimeOut;
   var onEnterFrame;
   var onMapLoaded;
   var selectionHandler;
   var interactionHandler;
   var zoneHandler;
   var pointerHandler;
   var spriteHandler;
   var gridHandler;
   var visualEffectHandler;
   var onInitComplete;
   var onInitProgress;
   static var useCacheAsBitmapOnStaticAnim;
   var _bJumpActivate = false;
   static var FRAMELOADTIMOUT = 500;
   var _bUseCustomGroundGfxFile = false;
   var bGhostView = false;
   var bCustomFileLoaded = false;
   function §\x1c\n§()
   {
      super();
   }
   function get isMapBuild()
   {
      if(this._bMapBuild)
      {
         return true;
      }
      ank["\x1e\n\x07"]["\x0b\f"].err("[isMapBuild] Carte non chargée");
      return false;
   }
   function set screenWidth(§\x1e\x1d\x16§)
   {
      this._nScreenWidth = _loc2_;
   }
   function get screenWidth()
   {
      return this._nScreenWidth != undefined ? this._nScreenWidth : ank.battlefield.Constants.DISPLAY_WIDTH;
   }
   function set screenHeight(§\x1e\x1d\x17§)
   {
      this._nScreenHeight = _loc2_;
   }
   function get screenHeight()
   {
      return this._nScreenHeight != undefined ? this._nScreenHeight : ank.battlefield.Constants.DISPLAY_HEIGHT;
   }
   function set isJumpActivate(§\x18\x07§)
   {
      this._bJumpActivate = _loc2_;
   }
   function get isJumpActivate()
   {
      return this._bJumpActivate;
   }
   function get container()
   {
      return this._mcMainContainer;
   }
   function get isContainerVisible()
   {
      return this._mcMainContainer._visible;
   }
   function get datacenter()
   {
      return this._oDatacenter;
   }
   function initialize(§\x1e\x19\x14§, §\x1e\x11\x19§, §\x1e\x0f\x0f§, §\x1e\x14\x1a§)
   {
      this._oDatacenter = _loc2_;
      this._sGroundFile = _loc3_;
      if(!this.initializeDatacenter())
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("BattleField -> Init datacenter impossible");
         this.onInitError();
      }
      ank["\x1e\n\x07"]["\x0e\x1b"].addExtensions();
      if(_global.GAC == undefined)
      {
         _global.GAC = new ank.battlefield["\r\x16"]();
         _global.GAC.setAccessoriesRoot(_loc5_);
      }
      this.attachClassMovie(ank.battlefield.mc.Container,"_mcMainContainer",10,[this,this._oDatacenter,_loc4_]);
      this._bMapBuild = false;
      this.loadManager = new ank.battlefield.LoadManager(this.createEmptyMovieClip("LoadManager",this.getNextHighestDepth()));
   }
   function setStreaming(§\x1e\f\x16§, §\x1e\x1a\x06§, §\r\x12§)
   {
      ank.battlefield.Constants.USE_STREAMING_FILES = _loc2_;
      ank.battlefield.Constants.STREAMING_OBJECTS_DIR = _loc3_;
      ank.battlefield.Constants.STREAMING_GROUNDS_DIR = _loc4_;
   }
   function setStreamingMethod(§\x1e\x0f\x16§)
   {
      ank.battlefield.Constants.STREAMING_METHOD = _loc2_;
   }
   function setCustomGfxFile(§\x1e\x0f\x02§, §\x1e\x0f\x01§)
   {
      if(_loc2_ && (_loc2_ != "" && this._sGroundFile != _loc2_))
      {
         this._sGroundFile = _loc2_;
         this._bUseCustomGroundGfxFile = true;
         this.bCustomFileLoaded = false;
      }
      if(_loc3_ && (_loc3_ != "" && this._sObjectFile != _loc3_))
      {
         this._mcMainContainer.initialize(this._mcMainContainer,this._oDatacenter,_loc3_);
         this.bCustomFileLoaded = false;
         this._sObjectFile = _loc3_;
      }
   }
   function activateTacticMode(§\x16\x15§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.mapHandler.tacticMode(_loc2_);
   }
   function clear()
   {
      this._mcMainContainer.clear();
      this._sGroundFile = "";
      this._sObjectFile = "";
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].clear("battlefield");
      ank["\x1e\n\x07"]["\x11\x11"].getInstance().clear();
      this.initializeDatacenter();
      this.createHandlers();
      this._bMapBuild = false;
   }
   function setColor(§\x1e\x0b\x12§)
   {
      this._mcMainContainer.setColor(_loc2_);
   }
   function cleanMap(nPermanentLevel, §\x18\x06§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      if(nPermanentLevel == undefined)
      {
         nPermanentLevel = Number.POSITIVE_INFINITY;
      }
      else
      {
         nPermanentLevel = Number(nPermanentLevel);
      }
      this.mapHandler.initializeMap(nPermanentLevel);
      this.unSelect(true);
      this.clearAllZones();
      this.clearPointer();
      this.removeGrid();
      this.clearAllSprites(_loc3_);
      this.overHeadHandler.clear();
      this.textHandler.clear();
      this.pointsHandler.clear();
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].clean();
      ank["\x1e\n\x07"]["\x11\x11"].getInstance().clear();
   }
   function getZoom()
   {
      return this._mcMainContainer.getZoom();
   }
   function showContainer(§\x16\x18§)
   {
      this._mcMainContainer._visible = _loc2_;
   }
   function zoom(§\x05\x0b§)
   {
      this._mcMainContainer.zoom(_loc2_);
   }
   function buildMapFromObject(§\x1e\x18\x17§, §\x1b\x1b§)
   {
      this.clear();
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      this.onMapBuilding();
      this.mapHandler.build(_loc2_,undefined,_loc3_);
      if(this.mapHandler.LoaderRequestLeft == 0)
      {
         this.DispatchMapLoaded();
      }
      else
      {
         this._nFrameLoadTimeOut = ank.battlefield["\x1c\n"].FRAMELOADTIMOUT;
         var ref = this;
         this.onEnterFrame = function()
         {
            ref._nFrameLoadTimeOut--;
            if(ref._nFrameLoadTimeOut <= 0 || ref.mapHandler.LoaderRequestLeft <= 0)
            {
               delete ref.onEnterFrame;
               ref.DispatchMapLoaded();
            }
         };
      }
   }
   function DispatchMapLoaded()
   {
      this._bMapBuild = true;
      this.onMapLoaded();
   }
   function buildMap(§\x04\x12§, §\x1e\x0f\x16§, §\x1e\x1b\x02§, §\x04\x17§, §\b\t§, §\x1e\x13\x13§, §\x1e\x18\x17§, §\x1b\x1b§)
   {
      if(_loc8_ == undefined)
      {
         _loc8_ = new ank.battlefield.datacenter.Map();
      }
      ank.battlefield["\x1e\n\x07"]["\x12\r"].uncompressMap(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      this.buildMapFromObject(_loc8_,_loc9_);
   }
   function updateCell(§\x07\x11§, §\x1e\x13\x14§, §\x1e\x10\x05§, nPermanentLevel)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      if(_loc3_ == undefined)
      {
         this.mapHandler.initializeCell(_loc2_,Number.POSITIVE_INFINITY,true);
      }
      else
      {
         var _loc6_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].uncompressCell(_loc3_,true);
         this.mapHandler.updateCell(_loc2_,_loc6_,_loc4_,nPermanentLevel);
      }
   }
   function setObject2Frame(§\x07\x11§, §\x0e\x04§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.mapHandler.setObject2Frame(_loc2_,_loc3_);
   }
   function setObject2Interactive(§\x07\x11§, §\x18\x17§, nPermanentLevel)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.mapHandler.setObject2Interactive(_loc2_,_loc3_,nPermanentLevel);
   }
   function updateCellObjectExternalWithExternalClip(§\x07\x11§, §\x1e\x12\x0b§, nPermanentLevel, §\x18\x17§, §\x1c\x04§, §\x1e\x19\r§)
   {
      var _loc8_ = new ank.battlefield.datacenter["\x13\n"]();
      _loc8_.layerObjectExternal = _loc3_;
      _loc8_.layerObjectExternalInteractive = _loc5_ != undefined ? _loc5_ : true;
      _loc8_.layerObjectExternalAutoSize = _loc6_;
      _loc8_.layerObjectExternalData = _loc7_;
      this.mapHandler.updateCell(_loc2_,_loc8_,"1C000",nPermanentLevel);
   }
   function setObjectExternalFrame(§\x07\x11§, §\x0e\x04§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.mapHandler.setObjectExternalFrame(_loc2_,_loc3_);
   }
   function initializeCell(§\x07\x11§, nPermanentLevel)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.mapHandler.initializeCell(_loc2_,nPermanentLevel);
   }
   function select(§\x13\x06§, §\x06\x1d§, §\x1e\x10\x14§, §\b\x19§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      if(typeof _loc2_ == "object")
      {
         this.selectionHandler.selectMultiple(true,_loc2_,_loc3_,_loc4_,_loc5_);
      }
      else if(typeof _loc2_ == "number")
      {
         this.selectionHandler.select(true,_loc2_,_loc3_,_loc4_,_loc5_);
      }
   }
   function unSelect(§\x1c\x15§, §\x13\x06§, §\x1e\x10\x14§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      if(_loc2_)
      {
         this.selectionHandler.clear();
      }
      else if(typeof _loc3_ == "object")
      {
         this.selectionHandler.selectMultiple(false,_loc3_,undefined,_loc4_);
      }
      else if(typeof _loc3_ == "number")
      {
         this.selectionHandler.select(false,_loc3_,undefined,_loc4_);
      }
      else if(_loc4_ != undefined)
      {
         this.selectionHandler.clearLayer(_loc4_);
      }
   }
   function unSelectAllButOne(§\x1e\x10\x14§)
   {
      var _loc3_ = this.selectionHandler.getLayers();
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         if(_loc3_[_loc4_] != _loc2_)
         {
            this.selectionHandler.clearLayer(_loc3_[_loc4_]);
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function setInteraction(§\x1e\x1c\x17§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.interactionHandler.setEnabled(_loc2_);
   }
   function setInteractionOnCell(§\x07\x11§, §\x1e\x1c\x17§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.interactionHandler.setEnabledCell(_loc2_,_loc3_);
   }
   function setInteractionOnCells(§\x0e§, §\x1e\x1c\x17§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      for(var k in _loc2_)
      {
         this.interactionHandler.setEnabledCell(_loc2_[k],_loc3_);
      }
   }
   function drawZone(§\x07\x11§, §\x1e\x1e\x15§, §\x1e\x1e\x14§, §\x1e\x10\x14§, §\x06\x1d§, §\x1e\r\x16§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.zoneHandler.drawZone(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
   }
   function clearZone(§\x07\x11§, §\x1e\x1e\x16§, §\x1e\x10\x14§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.zoneHandler.clearZone(_loc2_,_loc3_,_loc4_);
   }
   function clearZoneLayer(§\x1e\x10\x14§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.zoneHandler.clearZoneLayer(_loc2_);
   }
   function clearAllZones(§\x1e\t\x1c§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.zoneHandler.clear();
   }
   function clearPointer(§\x1e\t\x1c§)
   {
      this.pointerHandler.clear();
   }
   function hidePointer(§\x1e\t\x1c§)
   {
      this.pointerHandler.hide();
   }
   function addPointerShape(§\x1e\r\x16§, §\t\r§, §\x06\x1d§, §\x07\x10§)
   {
      this.pointerHandler.addShape(_loc2_,_loc3_,_loc4_,_loc5_);
   }
   function drawPointer(§\x07\x11§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.pointerHandler.draw(_loc2_);
   }
   function getSprite(sID)
   {
      return this.spriteHandler.getSprite(sID);
   }
   function getSprites()
   {
      return this.spriteHandler.getSprites();
   }
   function addSprite(sID, spriteData)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.addSprite(sID,spriteData);
   }
   function addLinkedSprite(sID, §\x1e\x0f\x05§, §\x07\x03§, oSprite)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.addLinkedSprite(sID,_loc3_,_loc4_,oSprite);
   }
   function carriedSprite(sID, §\x1e\x0f\x05§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.carriedSprite(sID,_loc3_);
   }
   function removeEffectsByCasterID(sCasterID)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.removeEffectsByCasterID(sCasterID);
   }
   function uncarriedSprite(sID, §\x07\x11§, §\x13\x16§, §\x1e\x17\x1c§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.uncarriedSprite(sID,_loc3_,_loc4_,_loc5_);
   }
   function mountSprite(sID, §\x1e\x18\x14§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.mountSprite(sID,_loc3_);
   }
   function unmountSprite(sID)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.unmountSprite(sID);
   }
   function clearAllSprites(§\x18\x06§)
   {
      this.spriteHandler.clear(_loc2_);
   }
   function removeSprite(sID, §\x18\x06§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.removeSprite(sID,_loc3_);
   }
   function hideSprite(sID, §\x16\x18§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.hideSprite(sID,_loc3_);
   }
   function setSpritePosition(sID, §\x07\x11§, §\x10\x1d§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.setSpritePosition(sID,_loc3_,_loc4_);
   }
   function setSpriteDirection(sID, §\x06\x07§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.setSpriteDirection(sID,_loc3_);
   }
   function stopSpriteMove(sID, §\x1e\x17\x1c§, §\x07\x11§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.stopSpriteMove(sID,_loc3_,_loc4_);
   }
   function moveSprite(sID, §\x12\x0e§, §\x1e\x17\x1c§, §\x1b\x0e§, §\x19\x17§, §\x19\x16§, §\x1e\x1d\x1d§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      var _loc9_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].extractFullPath(this.mapHandler,_loc3_);
      this.moveSpriteWithUncompressedPath(sID,_loc9_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
   }
   function moveSpriteWithUncompressedPath(sID, §\x1d\x1c§, §\x1e\x17\x1c§, §\x1b\x0e§, §\x19\x17§, §\x19\x16§, §\x1e\x1d\x1d§, §\x1e\x14\x16§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      if(_loc3_ != undefined)
      {
         this.spriteHandler.moveSprite(sID,_loc3_,_loc4_,_loc5_,_loc9_,_loc6_,_loc7_,_loc8_);
      }
   }
   function slideSprite(sID, §\x07\x11§, §\x1e\x17\x1c§, §\x1e\x14\x16§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.slideSprite(sID,_loc3_,_loc4_,_loc5_);
   }
   function autoCalculateSpriteDirection(sID, §\x07\x11§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.autoCalculateSpriteDirection(sID,_loc3_);
   }
   function convertHeightToFourSpriteDirection(sID)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.convertHeightToFourSpriteDirection(sID);
   }
   function setForcedSpriteAnim(sID, §\x1e\x14\x17§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.setSpriteAnim(sID,_loc3_,true);
   }
   function setSpriteAnim(sID, §\x1e\x14\x17§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.setSpriteAnim(sID,_loc3_);
   }
   function setSpriteLoopAnim(sID, §\x1e\x14\x17§, §\x1e\x1b\x1a§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.setSpriteLoopAnim(sID,_loc3_,_loc4_);
   }
   function setSpriteTimerAnim(sID, §\x1e\x14\x17§, §\x19\x19§, §\x1e\x1b\x1a§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.setSpriteTimerAnim(sID,_loc3_,_loc4_,_loc5_);
   }
   function setSpriteGfx(sID, §\x1e\x12\x0b§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.setSpriteGfx(sID,_loc3_);
   }
   function setSpriteColorTransform(sID, §\x1e\x17\x0e§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.setSpriteColorTransform(sID,_loc3_);
   }
   function setSpriteAlpha(sID, §\b\x19§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.setSpriteAlpha(sID,_loc3_);
   }
   function spriteLaunchVisualEffect(sID, §\x1e\x19\x11§, §\x07\x11§, §\x06\x02§, §\t\x0b§, §\x1e\f\x1b§, §\x1e\x17\x13§, §\x19\x0e§, §\x1c\x01§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.launchVisualEffect(sID,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
   }
   function spriteLaunchCarriedSprite(sID, §\x1e\x19\x11§, §\x07\x11§, §\x06\x02§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.launchCarriedSprite(sID,_loc3_,_loc4_,_loc5_);
   }
   function selectSprite(sID, §\x15\x16§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.spriteHandler.selectSprite(sID,_loc3_);
   }
   function addSpriteBubble(sID, §\x1e\f\x12§, §\x1e\x1b\x13§)
   {
      var _loc5_ = this._oDatacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[addSpriteBubble] Sprite inexistant (sprite Id : " + sID + ")");
         return undefined;
      }
      if(_loc5_.isInMove)
      {
         return undefined;
      }
      if(!_loc5_.isVisible)
      {
         return undefined;
      }
      var _loc6_ = _loc5_.mc;
      var _loc7_ = _loc6_._x;
      var _loc8_ = _loc6_._y;
      if(_loc4_ == undefined)
      {
         _loc4_ = ank.battlefield["\x1e\x0b\x07"].BUBBLE_TYPE_CHAT;
      }
      if(_loc7_ == 0 || _loc8_ == 0)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[addSpriteBubble] le sprite n\'est pas encore placé");
         return undefined;
      }
      this.textHandler.addBubble(sID,_loc7_,_loc8_,_loc3_,_loc4_);
   }
   function removeSpriteBubble(sID)
   {
      var _loc3_ = this._oDatacenter.Sprites.getItemAt(sID);
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      this.textHandler.removeBubble(sID);
   }
   function addSpritePoints(sID, §\x1e\x0b\x19§, §\x06\x1d§)
   {
      var _loc5_ = this._oDatacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[addSpritePoints] Sprite inexistant");
         return undefined;
      }
      if(!_loc5_.isVisible)
      {
         return undefined;
      }
      var _loc6_ = _loc5_.mc;
      var _loc7_ = _loc6_._x;
      var _loc8_ = _loc6_._y - ank.battlefield.Constants.DEFAULT_SPRITE_HEIGHT;
      if(_loc7_ == 0 || _loc8_ == 0)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[addSpritePoints] le sprite n\'est pas encore placé");
         return undefined;
      }
      this.pointsHandler.addPoints(sID,_loc7_,_loc8_,_loc3_,_loc4_);
   }
   function addSpriteOverHeadItem(sID, §\x1e\x10\x13§, className, §\x17§, §\x06\x0b§, §\x1a\n§)
   {
      var _loc8_ = this._oDatacenter.Sprites.getItemAt(sID);
      if(_loc8_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[addSpriteOverHeadItem] Sprite inexistant");
         return undefined;
      }
      if(_loc8_.isInMove && !_loc7_)
      {
         return undefined;
      }
      if(!_loc8_.isVisible)
      {
         return undefined;
      }
      var _loc9_ = _loc8_.mc;
      this.overHeadHandler.addOverHeadItem(sID,_loc9_._x,_loc9_._y,_loc9_,_loc3_,className,_loc5_,_loc6_);
   }
   function removeSpriteOverHeadLayer(sID, §\x1e\x10\x13§)
   {
      this.overHeadHandler.removeOverHeadLayer(sID,_loc3_);
   }
   function hideSpriteOverHead(sID)
   {
      this.overHeadHandler.removeOverHead(sID);
   }
   function addSpriteExtraClipOnTimer(sID, §\x1e\x12\x0b§, §\x06\x1d§, §\x14\r§, §\x05\x19§)
   {
      this.addSpriteExtraClip(sID,_loc3_,_loc4_,_loc5_);
      var _loc7_ = new Object();
      _loc7_.timerId = _global.setInterval(this,"removeSpriteExtraClipOnTimer",_loc6_,_loc7_,sID,_loc5_);
   }
   function removeSpriteExtraClipOnTimer(§\x1e\x17\x0f§, sID, §\x14\r§)
   {
      _global.clearInterval(_loc2_.timerId);
      this.removeSpriteExtraClip(sID,_loc4_);
   }
   function addSpriteExtraClip(sID, §\x1e\x12\x0b§, §\x06\x1d§, §\x14\r§)
   {
      this.spriteHandler.addSpriteExtraClip(sID,_loc3_,_loc4_,_loc5_);
   }
   function removeSpriteExtraClip(sID, §\x14\r§)
   {
      this.spriteHandler.removeSpriteExtraClip(sID,_loc3_);
   }
   function showSpritePoints(sID, §\x1e\x1b\n§, §\x06\x1d§)
   {
      this.spriteHandler.showSpritePoints(sID,_loc3_,_loc4_);
   }
   function setSpriteGhostView(§\x16\x18§)
   {
      this.bGhostView = _loc2_;
      this.spriteHandler.setSpriteGhostView(_loc2_);
   }
   function setSpriteScale(sID, §\x1e\x1d\x19§, §\x1e\x1d\x18§)
   {
      this.spriteHandler.setSpriteScale(sID,_loc3_,_loc4_);
   }
   function drawGrid(§\x1c\x15§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      if(this.gridHandler.bGridVisible)
      {
         this.removeGrid();
      }
      else
      {
         this.gridHandler.draw(_loc2_);
      }
   }
   function removeGrid(§\x1e\t\x1c§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      this.gridHandler.clear();
   }
   function addVisualEffectOnSprite(sID, §\x1e\x19\x11§, §\x07\x11§, §\x06\x02§, §\x1e\f\x1b§)
   {
      if(!this.isMapBuild)
      {
         return undefined;
      }
      var _loc7_ = this._oDatacenter.Sprites.getItemAt(sID);
      var _loc8_ = this._oDatacenter.Sprites.getItemAt(_loc6_);
      this.visualEffectHandler.addEffect(_loc7_,_loc3_,_loc4_,_loc5_,_loc8_);
   }
   function initializeDatacenter(§\x1e\t\x1c§)
   {
      if(this._oDatacenter == undefined)
      {
         return false;
      }
      this._oDatacenter.Map.cleanSpritesOn();
      this._oDatacenter.Map = new ank.battlefield.datacenter.Map();
      this._oDatacenter.Sprites = new ank["\x1e\n\x07"]["\x0e\x1d"]();
      return true;
   }
   function createHandlers(§\x1e\t\x1c§)
   {
      this.mapHandler = new ank.battlefield["\x0b\x06"](this,this._mcMainContainer,this._oDatacenter);
      this.spriteHandler = new ank.battlefield["\x1e\x0e\r"](this,this._mcMainContainer.ExternalContainer.Object2,this._oDatacenter.Sprites);
      this.interactionHandler = new ank.battlefield["\f\x12"](this._mcMainContainer.ExternalContainer.InteractionCell,this._oDatacenter);
      this.zoneHandler = new ank.battlefield["\x1e\t\x02"](this,this._mcMainContainer.ExternalContainer.Zone);
      this.pointerHandler = new ank.battlefield["\x1e\x16\f"](this,this._mcMainContainer.ExternalContainer.Pointer);
      this.selectionHandler = new ank.battlefield["\x1e\x12\x19"](this,this._mcMainContainer.ExternalContainer,this._oDatacenter);
      this.gridHandler = new ank.battlefield["\r\x13"](this._mcMainContainer.ExternalContainer.Grid,this._oDatacenter);
      this.visualEffectHandler = new ank.battlefield["\x1e\t\x1d"](this,this._mcMainContainer.ExternalContainer.Object2);
      this.textHandler = new ank.battlefield["\x1e\x0b\x07"](this,this._mcMainContainer.Text,this._oDatacenter);
      this.pointsHandler = new ank.battlefield["\x1e\x16\x0b"](this,this._mcMainContainer.Points,this._oDatacenter);
      this.overHeadHandler = new ank.battlefield["\x1e\x17\x07"](this,this._mcMainContainer.OverHead);
   }
   function onLoadInit(§\n\x1d§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_._name) !== "Ground")
      {
         _loc2_.__proto__ = ank.battlefield.mc.ExternalContainer.prototype;
         _loc2_.initialize(this._sGroundFile);
         this.createHandlers();
      }
      else
      {
         _loc2_._parent.useCustomGroundGfxFile(this._bUseCustomGroundGfxFile);
         this.bCustomFileLoaded = true;
         this.onInitComplete();
      }
   }
   function onLoadError(§\n\x1d§)
   {
      this.onInitError();
   }
   function onLoadProgress(§\n\x1d§, §\b\x06§, §\x07\x1d§)
   {
      this.onInitProgress(_loc3_,_loc4_);
   }
}
