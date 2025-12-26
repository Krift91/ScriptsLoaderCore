class ank.battlefield.§\x1e\x0e\r§
{
   var _mcBattlefield;
   var _oSprites;
   var _mcContainer;
   var api;
   var _bAllSpritesMasked;
   var updateCarriedPosition;
   var onEnterFrame;
   static var DEFAULT_RUNLINIT = 6;
   static var _bPlayerSpritesHidden = false;
   static var _bShowMonstersTooltip = false;
   function §\x1e\x0e\r§(§\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      this.initialize(_loc2_,_loc3_,_loc4_);
   }
   function get isShowingMonstersTooltip()
   {
      return ank.battlefield["\x1e\x0e\r"]._bShowMonstersTooltip;
   }
   function get isPlayerSpritesHidden()
   {
      return ank.battlefield["\x1e\x0e\r"]._bPlayerSpritesHidden;
   }
   function initialize(§\x1c\x1d§, §\x13\x0f§, §\x11\x10§)
   {
      this._mcBattlefield = _loc2_;
      this._oSprites = _loc4_;
      this._mcContainer = _loc3_;
      this.api = _global.API;
   }
   function clear(§\x18\x06§)
   {
      var _loc3_ = this._oSprites.getItems();
      for(var k in _loc3_)
      {
         this.removeSprite(k,_loc2_);
      }
   }
   function getSprites()
   {
      return this._oSprites;
   }
   function getSprite(sID)
   {
      return this._oSprites.getItemAt(sID);
   }
   function addSprite(sID, oSprite)
   {
      var _loc4_ = true;
      if(oSprite == undefined)
      {
         _loc4_ = false;
         oSprite = this._oSprites.getItemAt(sID);
      }
      if(oSprite == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[addSprite] pas de spriteData");
         return undefined;
      }
      if(_loc4_)
      {
         this._oSprites.addItemAt(sID,oSprite);
      }
      this._mcContainer["sprite" + sID].removeMovieClip();
      var _loc5_ = ank.battlefield["\x1e\n\x07"]["\x1e\x0e\x0e"].getFreeDepthOnCell(this._mcBattlefield.mapHandler,this._oSprites,oSprite.cellNum,oSprite.allowGhostMode && this._mcBattlefield.bGhostView);
      var _loc6_ = this._mcContainer.getInstanceAtDepth(_loc5_);
      oSprite.mc = this._mcContainer.attachClassMovie(oSprite.clipClass,"sprite" + sID,_loc5_,[this._mcBattlefield,this._oSprites,oSprite]);
      oSprite.isHidden = this._bAllSpritesMasked;
      if(oSprite.allowGhostMode && this._mcBattlefield.bGhostView)
      {
         oSprite.mc.setAlpha(ank.battlefield.Constants.GHOSTVIEW_SPRITE_ALPHA);
      }
   }
   function addLinkedSprite(sID, §\x1e\x0f\x05§, §\x07\x03§, oSprite)
   {
      var _loc6_ = true;
      var _loc7_ = this._oSprites.getItemAt(_loc3_);
      if(_loc7_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[addLinkedSprite] pas de spriteData parent");
         return undefined;
      }
      if(oSprite == undefined)
      {
         _loc6_ = false;
         oSprite = this._oSprites.getItemAt(sID);
      }
      if(oSprite == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[addLinkedSprite] pas de spriteData");
         return undefined;
      }
      if(_loc6_)
      {
         this._oSprites.addItemAt(sID,oSprite);
      }
      var _loc8_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getArroundCellNum(this._mcBattlefield.mapHandler,_loc7_.cellNum,_loc7_.direction,_loc4_);
      var _loc9_ = this._mcBattlefield.mapHandler.getCellData(_loc8_);
      if(_loc9_.movement > 0 && _loc9_.active)
      {
         oSprite.cellNum = _loc8_;
      }
      else
      {
         oSprite.cellNum = _loc7_.cellNum;
      }
      oSprite.linkedParent = _loc7_;
      oSprite.childIndex = _loc4_;
      _loc7_.linkedChilds.addItemAt(sID,oSprite);
      this.addSprite(sID);
   }
   function carriedSprite(sID, §\x1e\x0f\x05§)
   {
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[carriedSprite] pas de spriteData");
         return undefined;
      }
      var _loc5_ = this._oSprites.getItemAt(_loc3_);
      if(_loc5_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[carriedSprite] pas de spriteData parent");
         return undefined;
      }
      if(!_loc5_.hasCarriedChild())
      {
         this.autoCalculateSpriteDirection(_loc3_,_loc4_.cellNum);
         _loc4_.direction = _loc5_.direction;
         _loc4_.carriedParent = _loc5_;
         _loc5_.carriedChild = _loc4_;
         var _loc6_ = _loc5_.mc;
         _loc6_.setAnim("carring",false,false);
         _loc6_.onEnterFrame = function()
         {
            this.updateCarriedPosition();
            delete this.onEnterFrame;
         };
         _loc4_.mc.updateMap(_loc5_.cellNum,_loc4_.isVisible);
         _loc4_.mc.setNewCellNum(_loc5_.cellNum);
      }
   }
   function removeEffectsByCasterID(sCasterID)
   {
      if(!this.api.datacenter.Game.isFight || sCasterID == undefined)
      {
         return undefined;
      }
      var _loc3_ = this.getSprites().getItems();
      for(var sID in _loc3_)
      {
         var _loc4_ = _loc3_[sID];
         var _loc5_ = _loc4_.EffectsManager;
         if(_loc5_ != undefined)
         {
            _loc5_.removeEffectsByCasterID(sCasterID);
         }
      }
   }
   function uncarriedSprite(sID, §\x07\x11§, §\x13\x16§, §\x1e\x17\x1c§)
   {
      var oSprite = this._oSprites.getItemAt(sID);
      if(oSprite == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[addLinkedSprite] pas de spriteData parent");
         return undefined;
      }
      if(oSprite.hasCarriedParent())
      {
         oSprite.uncarryingSprite = true;
         var _loc6_ = oSprite.mc;
         var _loc7_ = oSprite.carriedParent;
         var _loc8_ = _loc7_.mc;
         var _loc9_ = _loc7_.sequencer;
         if(_loc5_ == undefined)
         {
            _loc5_ = _loc9_;
         }
         else if(_loc4_)
         {
            _loc5_.addAction(1,false,this,function(§\x1e\x18\n§, §\x1e\x17\x1b§)
            {
               _loc2_.sequencer = _loc3_;
            }
            ,[_loc7_,_loc5_]);
         }
         if(_loc4_)
         {
            _loc5_.addAction(2,false,this,this.autoCalculateSpriteDirection,[_loc7_.id,_loc3_]);
            _loc5_.addAction(3,true,_loc8_,_loc8_.setAnim,["carringEnd",false,false]);
            _loc8_.onEnterFrame = function()
            {
               this.updateCarriedPosition();
               delete this.onEnterFrame;
            };
         }
         _loc5_.addAction(4,false,this,function(§\x1e\x19\x1d§, §\x1e\x18\n§)
         {
            oSprite.uncarryingSprite = false;
            oSprite.carriedParent = undefined;
            _loc3_.carriedChild = undefined;
         }
         ,[oSprite,_loc7_]);
         if(!_loc5_.containsAction(_loc6_,_loc6_.setPosition))
         {
            _loc5_.addAction(5,false,this,this.setSpritePosition,[oSprite.id,_loc3_]);
         }
         if(!_loc7_.isPendingClearing)
         {
            _loc5_.addAction(6,false,_loc8_,_loc8_.setAnim,["static",false,false]);
         }
         if(_loc4_)
         {
            _loc5_.addAction(7,false,this,function(§\x1e\x18\n§, §\x1e\x17\x1b§)
            {
               _loc2_.sequencer = _loc3_;
            }
            ,[_loc7_,_loc9_]);
         }
      }
   }
   function mountSprite(sID, §\x1e\x18\x14§)
   {
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[mountSprite] Sprite " + sID + " inexistant");
         return undefined;
      }
      if(_loc3_ != _loc4_.mount)
      {
         _loc4_.mount = _loc3_;
         _loc4_.mc.draw();
      }
   }
   function unmountSprite(sID)
   {
      var _loc3_ = this._oSprites.getItemAt(sID);
      if(_loc3_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[unmountSprite] Sprite " + sID + " inexistant");
         return undefined;
      }
      if(_loc3_.mount != undefined)
      {
         _loc3_.mount = undefined;
         _loc3_.mc.draw();
      }
   }
   function removeSprite(sID, §\x18\x06§)
   {
      this._mcBattlefield.removeSpriteBubble(sID);
      this._mcBattlefield.hideSpriteOverHead(sID);
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_.mc != undefined && _loc4_.mc == this.api.gfx.rollOverMcSprite)
      {
         this.api.gfx.onSpriteRollOut(_loc4_.mc);
      }
      if(_loc4_.hasChilds)
      {
         var _loc5_ = _loc4_.linkedChilds.getItems();
         for(var k in _loc5_)
         {
            this.removeSprite(_loc5_[k].id,_loc3_);
         }
      }
      if(_loc4_.hasParent && !_loc3_)
      {
         _loc4_.linkedParent.linkedChilds.removeItemAt(sID);
      }
      if(_loc4_.hasCarriedChild())
      {
         _loc4_.carriedChild.carriedParent = undefined;
         _loc4_.carriedChild.mc.setPosition();
      }
      if(_loc4_.hasCarriedParent())
      {
         var _loc6_ = _loc4_.carriedParent;
         _loc4_.carriedParent.carriedChild = undefined;
         _loc6_.mc.setAnim("static",false,false);
      }
      this._mcContainer["sprite" + sID].__proto__ = MovieClip.prototype;
      this._mcContainer["sprite" + sID].removeMovieClip();
      this._mcBattlefield.mapHandler.getCellData(_loc4_.cellNum).removeSpriteOnID(_loc4_.id);
      if(!_loc3_)
      {
         this._oSprites.removeItemAt(sID);
      }
   }
   function hideSprite(sID, §\x19\t§)
   {
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_.hasChilds)
      {
         var _loc5_ = _loc4_.linkedChilds.getItems();
         for(var k in _loc5_)
         {
            this.hideSprite(_loc5_[k].id,_loc3_);
         }
      }
      _loc4_.mc.setVisible(!_loc3_);
   }
   function unmaskAllSprites()
   {
      this._bAllSpritesMasked = false;
      var _loc2_ = this._oSprites.getItems();
      for(var k in _loc2_)
      {
         _loc2_[k].isHidden = false;
      }
   }
   function maskAllSprites()
   {
      this._bAllSpritesMasked = true;
      var _loc2_ = this._oSprites.getItems();
      for(var k in _loc2_)
      {
         _loc2_[k].isHidden = true;
      }
   }
   function setSpriteDirection(sID, §\x06\x07§)
   {
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setSpriteDirection] Sprite " + sID + " inexistant");
         return undefined;
      }
      if(_loc4_.hasChilds)
      {
         var _loc5_ = _loc4_.linkedChilds.getItems();
         for(var k in _loc5_)
         {
            this.setSpriteDirection(_loc5_[k].id,_loc3_);
         }
      }
      if(_loc4_.hasCarriedChild())
      {
         _loc4_.carriedChild.mc.setDirection(_loc3_);
      }
      var _loc6_ = _loc4_.mc;
      _loc6_.setDirection(_loc3_);
   }
   function setSpritePosition(sID, §\x07\x11§, §\x06\x07§)
   {
      var _loc5_ = this._oSprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setSpritePosition] Sprite " + sID + " inexistant");
         return undefined;
      }
      if(_global.isNaN(Number(_loc3_)))
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setSpritePosition] cellNum n\'est pas un nombre");
         return undefined;
      }
      if(Number(_loc3_) < 0 || Number(_loc3_) > this._mcBattlefield.mapHandler.getCellCount())
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setSpritePosition] cellNum invalide");
         return undefined;
      }
      if(_loc5_.hasChilds)
      {
         var _loc6_ = _loc5_.linkedChilds.getItems();
         for(var k in _loc6_)
         {
            var _loc7_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getArroundCellNum(this._mcBattlefield.mapHandler,_loc3_,_loc4_,_loc6_[k].childIndex);
            this.setSpriteDirection(_loc6_[k].id,_loc7_,_loc4_);
         }
      }
      this._mcBattlefield.removeSpriteBubble(sID);
      this._mcBattlefield.hideSpriteOverHead(sID);
      if(_loc4_ != undefined)
      {
         _loc5_.direction = _loc4_;
      }
      var _loc8_ = _loc5_.mc;
      _loc8_.setPosition(_loc3_);
   }
   function stopSpriteMove(sID, §\x1e\x17\x1c§, §\x07\x11§)
   {
      _loc3_.clearAllNextActions();
      var _loc5_ = this._oSprites.getItemAt(sID);
      var _loc6_ = _loc5_.mc;
      _loc5_.isInMove = false;
      _loc3_.addAction(8,false,_loc6_,_loc6_.setPosition,[_loc4_]);
      _loc3_.addAction(9,false,_loc6_,_loc6_.setAnim,["static"]);
   }
   function slideSprite(sID, §\x13\x05§, §\x1e\x12\x15§, §\x1e\x14\x16§)
   {
      if(_loc5_ == undefined)
      {
         _loc5_ = "static";
      }
      var _loc6_ = this._oSprites.getItemAt(sID);
      var _loc7_ = _loc6_.futureCellNum == -1 ? _loc6_.cellNum : _loc6_.futureCellNum;
      var _loc8_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getDirectionFromCoordinates(this._mcBattlefield.mapHandler.getCellData(_loc7_).x,this._mcBattlefield.mapHandler.getCellData(_loc7_).rootY,this._mcBattlefield.mapHandler.getCellData(_loc3_).x,this._mcBattlefield.mapHandler.getCellData(_loc3_).rootY,false);
      var _loc9_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].makeFullPath(this._mcBattlefield.mapHandler,[{num:_loc7_},{num:_loc3_,dir:_loc8_}]);
      if(_loc9_ != undefined)
      {
         this.moveSprite(sID,_loc9_,_loc4_,false,_loc5_);
      }
   }
   function moveSprite(sID, §\x1e\x16\x1b§, §\x1e\x12\x15§, §\x1b\x0e§, §\x1e\x14\x16§, §\x19\x17§, §\x19\x16§, §\x1e\x14\x1d§)
   {
      this._mcBattlefield.removeSpriteBubble(sID);
      this._mcBattlefield.hideSpriteOverHead(sID);
      var _loc10_ = _loc6_ != undefined;
      if(_loc9_ == undefined)
      {
         _loc9_ = ank.battlefield["\x1e\x0e\r"].DEFAULT_RUNLINIT;
      }
      if(_loc7_ == undefined)
      {
         _loc7_ = false;
      }
      if(_loc8_ == undefined)
      {
         _loc8_ = false;
      }
      var _loc11_ = !_loc10_ ? "walk" : "slide";
      if(_loc8_)
      {
         _loc11_ = "walk";
      }
      else if(_loc7_)
      {
         _loc11_ = "run";
      }
      else if(!_loc7_ && (!_loc8_ && !_loc10_))
      {
         if(_loc3_.length > _loc9_)
         {
            _loc11_ = "run";
         }
      }
      var _loc12_ = this._oSprites.getItemAt(sID);
      if(_loc12_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[moveSprite] Sprite " + sID + " inexistant");
         return undefined;
      }
      if(_loc4_ == undefined)
      {
         _loc4_ = _loc12_.sequencer;
      }
      var _loc13_ = Number(_loc3_[_loc3_.length - 1]);
      _loc12_.futureCellNum = _loc13_;
      if(_loc12_.hasChilds)
      {
         if(_loc3_.length > 1)
         {
            var _loc14_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getDirection(this._mcBattlefield.mapHandler,Number(_loc3_[_loc3_.length - 2]),_loc13_);
         }
         else
         {
            _loc14_ = _loc12_.direction;
         }
         var _loc15_ = _loc12_.linkedChilds.getItems();
         for(var k in _loc15_)
         {
            var _loc16_ = _loc15_[k];
            var _loc17_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getArroundCellNum(this._mcBattlefield.mapHandler,_loc13_,_loc14_,_loc16_.childIndex);
            var _loc18_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].pathFind(this.api,this._mcBattlefield.mapHandler,_loc16_.cellNum,_loc17_,{bAllDirections:_loc16_.allDirections,bIgnoreSprites:true,bCellNumOnly:true,bWithBeginCellNum:true});
            if(_loc18_ != null)
            {
               ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(_loc16_,"battlefield",this,this.moveSprite,200 + (_loc12_.cellNum != _loc16_.cellNum ? 0 : 200),[_loc16_.id,_loc18_,_loc16_.sequencer,_loc5_,_loc6_,_loc16_.forceRun || _loc7_,_loc16_.forceWalk || _loc8_,_loc9_]);
            }
         }
      }
      var _loc19_ = _loc12_.mc;
      if(_loc5_)
      {
         if(!_loc10_)
         {
            _loc4_.clearAllNextActions();
         }
      }
      _loc4_.addAction(10,false,_loc19_,_loc19_.setPosition,[_loc3_[0]]);
      var _loc20_ = _loc3_.length;
      var _loc21_ = _loc20_ - 1;
      var _loc22_ = 0;
      while(_loc22_ < _loc20_)
      {
         var _loc23_ = _loc6_;
         var _loc24_ = _loc11_;
         var _loc25_ = false;
         if(_loc22_ != 0)
         {
            var _loc26_ = this._mcBattlefield.mapHandler.getCellHeight(_loc3_[_loc22_ - 1]);
            var _loc27_ = this._mcBattlefield.mapHandler.getCellHeight(_loc3_[_loc22_]);
            if(Math.abs(_loc26_ - _loc27_) > 0.5 && this._mcBattlefield.isJumpActivate)
            {
               _loc23_ = "jump";
               _loc24_ = "run";
               _loc25_ = true;
            }
         }
         _loc4_.addAction(11,true,_loc19_,_loc19_.moveToCell,[_loc4_,_loc3_[_loc22_],_loc22_ == _loc21_,_loc24_,_loc23_,_loc25_]);
         _loc22_ = _loc22_ + 1;
      }
      _loc4_.execute();
   }
   function setCreatureMode(§\x1a\r§)
   {
      var _loc3_ = this.api.datacenter.Sprites.getItems();
      for(var k in _loc3_)
      {
         var _loc4_ = _loc3_[k];
         if(_loc4_ instanceof dofus.datacenter["\x13\x01"])
         {
            if(_loc4_.canSwitchInCreaturesMode)
            {
               if(!(_loc4_ instanceof dofus.datacenter["\t\x07"]))
               {
                  if(_loc2_)
                  {
                     if(!_loc4_.bInCreaturesMode)
                     {
                        _loc4_.tmpGfxFile = _loc4_.gfxFile;
                        _loc4_.tmpMount = _loc4_.mount;
                        _loc4_.mount = undefined;
                        var _loc5_ = dofus.Constants.CLIPS_PERSOS_PATH + _loc4_.Guild + "2.swf";
                        this.api.gfx.setSpriteGfx(_loc4_.id,_loc5_);
                        _loc4_.bInCreaturesMode = true;
                     }
                  }
                  else if(_loc4_.bInCreaturesMode)
                  {
                     _loc4_.mount = _loc4_.tmpMount;
                     delete _loc4_.tmpMount;
                     var _loc6_ = _loc4_.tmpGfxFile != undefined ? _loc4_.tmpGfxFile : _loc4_.gfxFile;
                     delete _loc4_.tmpGfxFile;
                     this.api.gfx.setSpriteGfx(_loc4_.id,_loc6_);
                     _loc4_.bInCreaturesMode = false;
                  }
               }
            }
         }
      }
   }
   function hidePlayerSprites(§\x19\t§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = true;
      }
      else
      {
         ank.battlefield["\x1e\x0e\r"]._bPlayerSpritesHidden = _loc2_;
      }
      if(!this.api.datacenter.Game.isFight)
      {
         var _loc3_ = this.getSprites().getItems();
         for(var sID in _loc3_)
         {
            if(sID != this.api.datacenter.Player.ID)
            {
               var _loc4_ = _loc3_[sID];
               var _loc5_ = _loc4_.mc;
               var _loc6_ = _loc5_.data;
               if(_loc6_ instanceof dofus.datacenter["\x13\x01"] || (_loc6_ instanceof dofus.datacenter["\x1e\x19\f"] || _loc6_ instanceof dofus.datacenter["\t\x1d"]))
               {
                  _loc4_.isHidden = _loc2_;
                  var _loc7_ = _loc4_.linkedChilds.getItems();
                  for(var sChildID in _loc7_)
                  {
                     var _loc8_ = _loc7_[sChildID];
                     _loc8_.isHidden = _loc2_;
                  }
               }
            }
         }
      }
   }
   function showMonstersTooltip(§\x15\x0e§)
   {
      ank.battlefield["\x1e\x0e\r"]._bShowMonstersTooltip = _loc2_;
      var _loc3_ = this.api.gfx.spriteHandler.getSprites().getItems();
      for(var sID in _loc3_)
      {
         var _loc4_ = _loc3_[sID].mc;
         var _loc5_ = _loc4_.data;
         if(_loc5_ instanceof dofus.datacenter["\t\x1d"])
         {
            if(_loc2_)
            {
               _loc4_._rollOver(true);
            }
            else
            {
               _loc4_._rollOut(true);
            }
         }
      }
   }
   function launchVisualEffect(sID, §\x1e\x19\x11§, §\x07\x11§, §\x06\x02§, §\t\x0b§, §\x1e\f\x1b§, §\x1e\x17\x13§, §\x19\x0e§, §\x1c\x01§)
   {
      if(_loc10_ == undefined)
      {
         _loc10_ = true;
      }
      var _loc11_ = this._oSprites.getItemAt(sID);
      if(_loc11_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[launchVisualEffect] Sprite " + sID + " inexistant");
         return undefined;
      }
      var _loc12_ = this._oSprites.getItemAt(_loc7_);
      if(!this.api.electron.isWindowFocused)
      {
         _loc3_.file = undefined;
      }
      if(!_loc10_)
      {
         this._mcBattlefield.visualEffectHandler.addEffect(_loc11_,_loc3_,_loc4_,_loc5_,_loc12_,!_loc9_ ? _loc11_.isVisible : true);
         return undefined;
      }
      var _loc13_ = _loc11_.mc;
      var _loc14_ = _loc11_.sequencer;
      var _loc15_ = true;
      switch(_loc5_)
      {
         case 0:
            var _loc16_ = false;
            _loc15_ = false;
            break;
         case 10:
         case 11:
            _loc16_ = false;
            break;
         case 12:
            _loc16_ = true;
            break;
         case 20:
         case 21:
            _loc16_ = false;
            break;
         case 30:
         case 31:
            _loc16_ = true;
            break;
         case 40:
         case 41:
            _loc16_ = true;
            break;
         case 50:
            _loc16_ = false;
            break;
         case 51:
            _loc16_ = true;
            break;
         default:
            _loc16_ = false;
            _loc15_ = false;
      }
      _loc13_._ACTION = _loc11_;
      _loc13_._OBJECT = _loc13_;
      _loc14_.addAction(12,false,this,this.autoCalculateSpriteDirection,[sID,_loc4_]);
      if(_loc6_ != undefined)
      {
         var _loc17_ = typeof _loc6_;
         if(_loc17_ == "object")
         {
            if(_loc6_.length < 3)
            {
               ank["\x1e\n\x07"]["\x0b\f"].err("[launchVisualEffect] l\'anim " + _loc6_ + " est invalide");
               return undefined;
            }
            var _loc18_ = _loc11_.cellNum;
            var _loc19_ = this._mcBattlefield.mapHandler.getCellData(_loc18_);
            var _loc20_ = this._mcBattlefield.mapHandler.getCellData(_loc4_);
            var _loc21_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getDirectionFromCoordinates(_loc19_.x,_loc19_.y,_loc20_.x,_loc20_.y,false);
            var _loc22_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].makeFullPath(this._mcBattlefield.mapHandler,ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].pathFind(this.api,this._mcBattlefield.mapHandler,_loc18_,_loc4_,{bIgnoreSprites:true,bWithBeginCellNum:true}));
            _loc22_.pop();
            var _loc23_ = _loc22_[_loc22_.length - 1];
            this.moveSprite(sID,_loc22_,_loc14_,false,_loc6_[0],false,true);
            _loc14_.addAction(13,false,_loc13_,_loc13_.setDirection,[ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].convertHeightToFourDirection(_loc21_)]);
            _loc14_.addAction(14,true,_loc13_,_loc13_.setAnim,[_loc6_[1]]);
            if(_loc15_)
            {
               _loc14_.addAction(15,_loc16_,this._mcBattlefield.visualEffectHandler,this._mcBattlefield.visualEffectHandler.addEffect,[_loc11_,_loc3_,_loc4_,_loc5_,_loc12_,!_loc9_ ? _loc11_.isVisible : true]);
            }
            var _loc24_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].makeFullPath(this._mcBattlefield.mapHandler,ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].pathFind(this.api,this._mcBattlefield.mapHandler,_loc23_,_loc18_,{bIgnoreSprites:true,bWithBeginCellNum:true}));
            this.moveSprite(sID,_loc24_,_loc14_,false,_loc6_[2],false,true);
            _loc14_.addAction(16,false,_loc13_,_loc13_.setDirection,[_loc21_]);
            if(_loc6_[3] != undefined)
            {
               _loc14_.addAction(17,false,_loc13_,_loc13_.setAnim,[_loc6_[3]]);
            }
            _loc14_.execute();
            return undefined;
         }
         if(_loc17_ == "string")
         {
            _loc14_.addAction(18,true,_loc13_,_loc13_.setAnim,[_loc6_,false,true]);
         }
      }
      if(_loc8_ != undefined)
      {
         _loc14_.addAction(19,false,this,this.hideSprite,[_loc8_.id,true]);
      }
      if(_loc15_)
      {
         _loc14_.addAction(20,_loc16_,this._mcBattlefield.visualEffectHandler,this._mcBattlefield.visualEffectHandler.addEffect,[_loc11_,_loc3_,_loc4_,_loc5_,_loc12_,!_loc9_ ? _loc11_.isVisible : true]);
      }
      if(_loc8_ != undefined)
      {
         _loc14_.addAction(21,false,this,this.hideSprite,[_loc8_.id,false]);
      }
      _loc14_.execute();
   }
   function launchCarriedSprite(sID, §\x1e\x19\x11§, §\x07\x11§, §\x06\x02§)
   {
      var _loc6_ = this._oSprites.getItemAt(sID);
      var _loc7_ = _loc6_.sequencer;
      if(_loc6_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[launchCarriedSprite] Sprite " + sID + " inexistant");
         return undefined;
      }
      var _loc8_ = _loc6_.carriedChild;
      this.launchVisualEffect(sID,_loc3_,_loc4_,_loc5_,"carringThrow",undefined,_loc8_);
      _loc7_.addAction(22,false,this,this.setSpritePosition,[_loc8_.id,_loc4_]);
      this.uncarriedSprite(_loc8_.id,_loc4_,false,_loc7_);
      _loc7_.addAction(23,false,this,this.setSpriteAnim,[sID,"static"]);
      _loc7_.execute();
   }
   function autoCalculateSpriteDirection(sID, §\x07\x11§)
   {
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[launchVisualEffect] Sprite " + sID + " inexistant");
         return undefined;
      }
      if(_loc4_.cellNum != _loc3_)
      {
         var _loc5_ = _loc4_.mc;
         var _loc6_ = this._mcBattlefield.mapHandler.getCellData(_loc4_.cellNum);
         var _loc7_ = this._mcBattlefield.mapHandler.getCellData(_loc3_);
         var _loc8_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getDirectionFromCoordinates(_loc6_.x,_loc6_.rootY,_loc7_.x,_loc7_.rootY,false);
         _loc5_.setDirection(_loc8_);
      }
   }
   function convertHeightToFourSpriteDirection(sID)
   {
      var _loc3_ = this._oSprites.getItemAt(sID);
      if(_loc3_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[convertHeightToFourSpriteDirection] Sprite " + sID + " inexistant");
         return undefined;
      }
      this.setSpriteDirection(sID,ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].convertHeightToFourDirection(_loc3_.direction));
   }
   function setSpriteAnim(sID, §\x1e\x02§, §\x19\x19§)
   {
      var _loc5_ = this._oSprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setSpriteAnim(" + _loc3_ + ")] Sprite " + sID + " inexistant");
         return undefined;
      }
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(_loc5_.mc,"battlefield");
      _loc5_.mc.setAnim(_loc3_,false,_loc4_);
   }
   function setSpriteLoopAnim(sID, §\x1e\x02§, §\x1e\x1b\x1a§)
   {
      var _loc5_ = this._oSprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setSpriteLoopAnim] Sprite " + sID + " inexistant");
         return undefined;
      }
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(_loc5_.mc,"battlefield");
      _loc5_.mc.setAnim(_loc3_,true);
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(_loc5_.mc,"battlefield",_loc5_.mc,_loc5_.mc.setAnim,_loc4_,["static"]);
   }
   function setSpriteTimerAnim(sID, §\x1e\x02§, §\x19\x19§, §\x1e\x1b\x1a§)
   {
      var _loc6_ = this._oSprites.getItemAt(sID);
      if(_loc6_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setSpriteTimerAnim] Sprite " + sID + " inexistant");
         return undefined;
      }
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(_loc6_.mc,"battlefield");
      _loc6_.mc.setAnimTimer(_loc3_,false,_loc4_,_loc5_);
   }
   function setSpriteGfx(sID, §\x1e\x12\x0b§)
   {
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setSpriteGfx] Sprite " + sID + " inexistant");
         return undefined;
      }
      if(_loc3_ != _loc4_.gfxFile)
      {
         _loc4_.gfxFile = _loc3_;
         _loc4_.mc.draw();
         if(_loc4_.allowGhostMode && this._mcBattlefield.bGhostView)
         {
            _loc4_.mc.setAlpha(ank.battlefield.Constants.GHOSTVIEW_SPRITE_ALPHA);
         }
      }
   }
   function setSpriteColorTransform(sID, §\x1e\x0b\x12§)
   {
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setSpriteColorTransform] Sprite " + sID + " inexistant");
         return undefined;
      }
      _loc4_.mc.setColorTransform(_loc3_);
   }
   function setSpriteAlpha(sID, §\b\x19§)
   {
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setSpriteAlpha] Sprite " + sID + " inexistant");
         return undefined;
      }
      _loc4_.mc.setAlpha(_loc3_);
   }
   function addSpriteExtraClip(sID, §\x12\x19§, §\x12\x15§, §\x14\r§)
   {
      var _loc6_ = this._oSprites.getItemAt(sID);
      if(_loc6_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[addSpriteExtraClip] Sprite " + sID + " inexistant");
         return undefined;
      }
      _loc6_.mc.addExtraClip(_loc3_,_loc4_,_loc5_);
   }
   function removeSpriteExtraClip(sID, §\x14\r§)
   {
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[removeSpriteExtraClip] Sprite " + sID + " inexistant");
         return undefined;
      }
      _loc4_.mc.removeExtraClip(_loc3_);
   }
   function showSpritePoints(sID, §\x1e\n\x02§, §\x12\x15§)
   {
      var _loc5_ = this._oSprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[showSpritePoints] Sprite " + sID + " inexistant");
         return undefined;
      }
      _loc5_.mc.showPoints(_loc3_,_loc4_);
   }
   function setSpriteGhostView(§\x16\x18§)
   {
      var _loc3_ = this._oSprites.getItems();
      for(var k in _loc3_)
      {
         var _loc4_ = this._oSprites.getItemAt(k);
         _loc4_.mc.setGhostView(_loc4_.allowGhostMode && _loc2_);
      }
   }
   function selectSprite(sID, §\x15\x16§)
   {
      var _loc4_ = this._oSprites.getItemAt(sID);
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[selectSprite] Sprite " + sID + " inexistant");
         return undefined;
      }
      if(_loc4_.hasChilds)
      {
         var _loc5_ = _loc4_.linkedChilds.getItems();
         for(var k in _loc5_)
         {
            this.selectSprite(_loc5_[k].id,_loc3_);
         }
      }
      _loc4_.mc.select(_loc3_);
   }
   function setSpriteScale(sID, §\x1e\x1d\x19§, §\x1e\x1d\x18§)
   {
      var _loc5_ = this._oSprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[selectSprite] Sprite " + sID + " inexistant");
         return undefined;
      }
      _loc5_.mc.setScale(_loc3_,_loc4_);
   }
}
