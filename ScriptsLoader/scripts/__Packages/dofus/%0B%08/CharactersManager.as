class dofus.§\x0b\b§.CharactersManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   static var _sSelf = null;
   function CharactersManager(oAPI)
   {
      dofus["\x0b\b"].CharactersManager._sSelf = this;
      super.initialize(oAPI);
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].CharactersManager._sSelf;
   }
   function setLocalPlayerData(§\x04\x12§, §\x1e\x0f\x16§, §\x1e\x19\x15§)
   {
      var _loc5_ = this.api.datacenter.Player;
      _loc5_.clean();
      _loc5_.ID = _loc2_;
      _loc5_.Name = _loc3_;
      _loc5_.Guild = _loc4_.guild;
      _loc5_.Level = _loc4_.level;
      _loc5_.Sex = _loc4_.sex;
      _loc5_.color1 = _loc4_.color1 != -1 ? Number("0x" + _loc4_.color1) : _loc4_.color1;
      _loc5_.color2 = _loc4_.color2 != -1 ? Number("0x" + _loc4_.color2) : _loc4_.color2;
      _loc5_.color3 = _loc4_.color3 != -1 ? Number("0x" + _loc4_.color3) : _loc4_.color3;
      var _loc6_ = _loc4_.items.split(";");
      var _loc7_ = 0;
      while(_loc7_ < _loc6_.length)
      {
         var _loc8_ = _loc6_[_loc7_];
         if(_loc8_.length != 0)
         {
            var _loc9_ = this.getItemObjectFromData(_loc8_);
            if(_loc9_ != undefined)
            {
               _loc5_.addItem(_loc9_);
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      _loc5_.updateCloseCombat();
   }
   function updateLocalPlayerData(oSprite)
   {
      var _loc3_ = this.api.datacenter.Player;
      if(_loc3_.Name != oSprite.name)
      {
         _loc3_.Name = oSprite.name;
         this.api.electron.updateWindowTitle(_loc3_.Name);
         this.api.electron.setIngameDiscordActivity();
      }
      if(_loc3_.color1 != oSprite.color1 || (_loc3_.color2 != oSprite.color2 || _loc3_.color3 != oSprite.color3))
      {
         _loc3_.color1 = oSprite.color1;
         _loc3_.color2 = oSprite.color2;
         _loc3_.color3 = oSprite.color3;
         this.api.ui.getUIComponent("Banner").updateArtwork(true);
         this.api.ui.getUIComponent("Inventory").refreshSpriteViewer();
      }
      if(_loc3_.Sex != oSprite.Sex)
      {
         _loc3_.Sex = oSprite.Sex;
         this.api.ui.getUIComponent("Inventory").refreshSpriteViewer();
      }
   }
   function createCharacter(sID, §\x1e\x0f\x16§, §\x1e\x19\x15§)
   {
      if(this.api.datacenter.Player.isAuthorized && _loc4_.gfxID == "999")
      {
         _loc4_.gfxID = "8023";
      }
      var _loc5_ = this.api.datacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         _loc5_ = new dofus.datacenter["\x13\x01"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_.gfxID + ".swf",_loc4_.cell,_loc4_.dir,_loc4_.gfxID,_loc4_.title);
         this.api.datacenter.Sprites.addItemAt(sID,_loc5_);
      }
      _loc5_.GameActionsManager.init();
      _loc5_.cellNum = Number(_loc4_.cell);
      _loc5_.scaleX = _loc4_.scaleX;
      _loc5_.scaleY = _loc4_.scaleY;
      _loc5_.name = _loc3_;
      _loc5_.Guild = Number(_loc4_.spriteType);
      _loc5_.Level = Number(_loc4_.level);
      _loc5_.Sex = _loc4_.sex == undefined ? 1 : _loc4_.sex;
      _loc5_.color1 = _loc4_.color1 != -1 ? Number("0x" + _loc4_.color1) : _loc4_.color1;
      _loc5_.color2 = _loc4_.color2 != -1 ? Number("0x" + _loc4_.color2) : _loc4_.color2;
      _loc5_.color3 = _loc4_.color3 != -1 ? Number("0x" + _loc4_.color3) : _loc4_.color3;
      _loc5_.Aura = _loc4_.aura == undefined ? 0 : _loc4_.aura;
      _loc5_.Merchant = _loc4_.merchant != "1" ? false : true;
      _loc5_.serverID = Number(_loc4_.serverID);
      _loc5_.alignment = _loc4_.alignment;
      _loc5_.rank = _loc4_.rank;
      _loc5_.mount = _loc4_.mount;
      _loc5_.isDead = _loc4_.isDead == 1;
      _loc5_.deathState = Number(_loc4_.isDead);
      _loc5_.deathCount = Number(_loc4_.deathCount);
      _loc5_.lvlMax = Number(_loc4_.lvlMax);
      _loc5_.pvpGain = Number(_loc4_.pvpGain);
      this.setSpriteAccessories(_loc5_,_loc4_.accessories);
      if(_loc4_.LP != undefined)
      {
         _loc5_.LP = _loc4_.LP;
      }
      if(_loc4_.LP != undefined)
      {
         _loc5_.LPmax = _loc4_.LP;
      }
      if(_loc4_.AP != undefined)
      {
         _loc5_.AP = _loc4_.AP;
      }
      if(_loc4_.AP != undefined)
      {
         _loc5_.APinit = _loc4_.AP;
      }
      if(_loc4_.MP != undefined)
      {
         _loc5_.MP = _loc4_.MP;
      }
      if(_loc4_.MP != undefined)
      {
         _loc5_.MPinit = _loc4_.MP;
      }
      if(_loc4_.resistances != undefined)
      {
         _loc5_.resistances = _loc4_.resistances;
      }
      _loc5_.Team = _loc4_.team != undefined ? _loc4_.team : null;
      if(_loc4_.emote != undefined && _loc4_.emote.length != 0)
      {
         _loc5_.direction = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].convertHeightToFourDirection(_loc4_.dir);
         if(_loc4_.emoteTimer != undefined && _loc4_.emote.length != 0)
         {
            _loc5_.startAnimationTimer = _loc4_.emoteTimer;
         }
         _loc5_.startAnimation = "EmoteStatic" + _loc4_.emote;
      }
      if(_loc4_.guildName != undefined)
      {
         _loc5_.guildName = _loc4_.guildName;
      }
      _loc5_.emblem = this.createGuildEmblem(_loc4_.emblem);
      if(_loc4_.restrictions != undefined)
      {
         _loc5_.restrictions = _global.parseInt(_loc4_.restrictions,36);
      }
      if(sID == this.api.datacenter.Player.ID)
      {
         this.updateLocalPlayerData(_loc5_);
         if(!this.api.datacenter.Player.haveFakeAlignment)
         {
            this.api.datacenter.Player.alignment = _loc5_.alignment.clone();
         }
      }
      return _loc5_;
   }
   function createCreature(sID, §\x1e\x0f\x16§, §\x1e\x19\x15§)
   {
      var _loc5_ = this.api.datacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         _loc5_ = new dofus.datacenter.Creature(sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_.gfxID + ".swf",_loc4_.cell,_loc4_.dir,_loc4_.gfxID);
         this.api.datacenter.Sprites.addItemAt(sID,_loc5_);
      }
      _loc5_.GameActionsManager.init();
      _loc5_.cellNum = _loc4_.cell;
      _loc5_.name = _loc3_;
      _loc5_.powerLevel = _loc4_.powerLevel;
      _loc5_.scaleX = _loc4_.scaleX;
      _loc5_.scaleY = _loc4_.scaleY;
      _loc5_.noFlip = _loc4_.noFlip;
      _loc5_.color1 = _loc4_.color1 != -1 ? Number("0x" + _loc4_.color1) : _loc4_.color1;
      _loc5_.color2 = _loc4_.color2 != -1 ? Number("0x" + _loc4_.color2) : _loc4_.color2;
      _loc5_.color3 = _loc4_.color3 != -1 ? Number("0x" + _loc4_.color3) : _loc4_.color3;
      this.setSpriteAccessories(_loc5_,_loc4_.accessories);
      if(_loc4_.LP != undefined)
      {
         _loc5_.LP = _loc4_.LP;
      }
      if(_loc4_.LP != undefined)
      {
         _loc5_.LPmax = _loc4_.LP;
      }
      if(_loc4_.AP != undefined)
      {
         _loc5_.AP = _loc4_.AP;
      }
      if(_loc4_.AP != undefined)
      {
         _loc5_.APinit = _loc4_.AP;
      }
      if(_loc4_.MP != undefined)
      {
         _loc5_.MP = _loc4_.MP;
      }
      if(_loc4_.MP != undefined)
      {
         _loc5_.MPinit = _loc4_.MP;
      }
      if(_loc4_.resistances != undefined)
      {
         _loc5_.resistances = _loc4_.resistances;
      }
      if(_loc4_.summoned != undefined)
      {
         _loc5_.isSummoned = _loc4_.summoned;
      }
      _loc5_.Team = _loc4_.team != undefined ? _loc4_.team : null;
      return _loc5_;
   }
   function createMonster(sID, §\x1e\x0f\x16§, §\x1e\x19\x15§)
   {
      var _loc5_ = this.api.datacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         _loc5_ = new dofus.datacenter["\n\x01"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_.gfxID + ".swf",_loc4_.cell,_loc4_.dir,_loc4_.gfxID);
         this.api.datacenter.Sprites.addItemAt(sID,_loc5_);
      }
      _loc5_.GameActionsManager.init();
      _loc5_.cellNum = _loc4_.cell;
      _loc5_.name = _loc3_;
      _loc5_.scaleX = _loc4_.scaleX;
      _loc5_.scaleY = _loc4_.scaleY;
      _loc5_.noFlip = _loc4_.noFlip;
      _loc5_.powerLevel = _loc4_.powerLevel;
      _loc5_.color1 = _loc4_.color1 != -1 ? Number("0x" + _loc4_.color1) : _loc4_.color1;
      _loc5_.color2 = _loc4_.color2 != -1 ? Number("0x" + _loc4_.color2) : _loc4_.color2;
      _loc5_.color3 = _loc4_.color3 != -1 ? Number("0x" + _loc4_.color3) : _loc4_.color3;
      this.setSpriteAccessories(_loc5_,_loc4_.accessories);
      if(_loc4_.LP != undefined)
      {
         _loc5_.LP = _loc4_.LP;
      }
      if(_loc4_.LP != undefined)
      {
         _loc5_.LPmax = _loc4_.LP;
      }
      if(_loc4_.AP != undefined)
      {
         _loc5_.AP = _loc4_.AP;
      }
      if(_loc4_.AP != undefined)
      {
         _loc5_.APinit = _loc4_.AP;
      }
      if(_loc4_.MP != undefined)
      {
         _loc5_.MP = _loc4_.MP;
      }
      if(_loc4_.MP != undefined)
      {
         _loc5_.MPinit = _loc4_.MP;
      }
      if(_loc4_.summoned != undefined)
      {
         _loc5_.isSummoned = _loc4_.summoned;
      }
      _loc5_.Team = _loc4_.team != undefined ? _loc4_.team : null;
      return _loc5_;
   }
   function createMonsterGroup(sID, §\x1e\x0f\x16§, §\x1e\x19\x15§)
   {
      var _loc5_ = this.api.datacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         _loc5_ = new dofus.datacenter["\t\x1d"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_.gfxID + ".swf",_loc4_.cell,_loc4_.dir,_loc4_.bonusValue);
         this.api.datacenter.Sprites.addItemAt(sID,_loc5_);
      }
      _loc5_.GameActionsManager.init();
      _loc5_.cellNum = _loc4_.cell;
      _loc5_.name = _loc3_;
      _loc5_.Level = _loc4_.level;
      _loc5_.scaleX = _loc4_.scaleX;
      _loc5_.scaleY = _loc4_.scaleY;
      _loc5_.noFlip = _loc4_.noFlip;
      _loc5_.color1 = _loc4_.color1 != -1 ? Number("0x" + _loc4_.color1) : _loc4_.color1;
      _loc5_.color2 = _loc4_.color2 != -1 ? Number("0x" + _loc4_.color2) : _loc4_.color2;
      _loc5_.color3 = _loc4_.color3 != -1 ? Number("0x" + _loc4_.color3) : _loc4_.color3;
      this.setSpriteAccessories(_loc5_,_loc4_.accessories);
      return _loc5_;
   }
   function createNonPlayableCharacter(sID, §\x1e\x1b\x10§, §\x1e\x19\x15§)
   {
      var _loc5_ = this.api.datacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         _loc5_ = new dofus.datacenter["\x02\x01"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_.gfxID + ".swf",_loc4_.cell,_loc4_.dir,_loc4_.gfxID,_loc4_.customArtwork);
         this.api.datacenter.Sprites.addItemAt(sID,_loc5_);
      }
      _loc5_.GameActionsManager.init();
      _loc5_.cellNum = _loc4_.cell;
      _loc5_.unicID = _loc3_;
      _loc5_.scaleX = _loc4_.scaleX;
      _loc5_.scaleY = _loc4_.scaleY;
      _loc5_.color1 = _loc4_.color1 != -1 ? Number("0x" + _loc4_.color1) : _loc4_.color1;
      _loc5_.color2 = _loc4_.color2 != -1 ? Number("0x" + _loc4_.color2) : _loc4_.color2;
      _loc5_.color3 = _loc4_.color3 != -1 ? Number("0x" + _loc4_.color3) : _loc4_.color3;
      this.setSpriteAccessories(_loc5_,_loc4_.accessories);
      if(_loc4_.extraClipID >= 0)
      {
         _loc5_.extraClipID = _loc4_.extraClipID;
      }
      return _loc5_;
   }
   function createOfflineCharacter(sID, §\x1e\x0f\x16§, §\x1e\x19\x15§)
   {
      var _loc5_ = this.api.datacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         _loc5_ = new dofus.datacenter["\x1e\x19\f"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_.gfxID + ".swf",_loc4_.cell,_loc4_.dir,_loc4_.gfxID);
         this.api.datacenter.Sprites.addItemAt(sID,_loc5_);
      }
      _loc5_.GameActionsManager.init();
      _loc5_.cellNum = _loc4_.cell;
      _loc5_.name = _loc3_;
      _loc5_.scaleX = _loc4_.scaleX;
      _loc5_.scaleY = _loc4_.scaleY;
      _loc5_.color1 = _loc4_.color1 != -1 ? Number("0x" + _loc4_.color1) : _loc4_.color1;
      _loc5_.color2 = _loc4_.color2 != -1 ? Number("0x" + _loc4_.color2) : _loc4_.color2;
      _loc5_.color3 = _loc4_.color3 != -1 ? Number("0x" + _loc4_.color3) : _loc4_.color3;
      this.setSpriteAccessories(_loc5_,_loc4_.accessories);
      if(_loc4_.guildName != undefined)
      {
         _loc5_.guildName = _loc4_.guildName;
      }
      _loc5_.emblem = this.createGuildEmblem(_loc4_.emblem);
      _loc5_.offlineType = _loc4_.offlineType;
      return _loc5_;
   }
   function createTaxCollector(sID, §\x1e\x0f\x16§, §\x1e\x19\x15§)
   {
      var _loc5_ = this.api.datacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         _loc5_ = new dofus.datacenter["\x1e\x0b\r"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_.gfxID + ".swf",_loc4_.cell,_loc4_.dir,_loc4_.gfxID);
         this.api.datacenter.Sprites.addItemAt(sID,_loc5_);
      }
      _loc5_.GameActionsManager.init();
      _loc5_.cellNum = _loc4_.cell;
      _loc5_.scaleX = _loc4_.scaleX;
      _loc5_.scaleY = _loc4_.scaleY;
      _loc5_.name = this.api.lang.getFullNameText(_loc3_.split(","));
      _loc5_.Level = _loc4_.level;
      if(_loc4_.guildName != undefined)
      {
         _loc5_.guildName = _loc4_.guildName;
      }
      _loc5_.emblem = this.createGuildEmblem(_loc4_.emblem);
      if(_loc4_.LP != undefined)
      {
         _loc5_.LP = _loc4_.LP;
      }
      if(_loc4_.LP != undefined)
      {
         _loc5_.LPmax = _loc4_.LP;
      }
      if(_loc4_.AP != undefined)
      {
         _loc5_.AP = _loc4_.AP;
      }
      if(_loc4_.AP != undefined)
      {
         _loc5_.APinit = _loc4_.AP;
      }
      if(_loc4_.MP != undefined)
      {
         _loc5_.MP = _loc4_.MP;
      }
      if(_loc4_.MP != undefined)
      {
         _loc5_.MPinit = _loc4_.MP;
      }
      if(_loc4_.resistances != undefined)
      {
         _loc5_.resistances = _loc4_.resistances;
      }
      _loc5_.Team = _loc4_.team != undefined ? _loc4_.team : null;
      return _loc5_;
   }
   function createPrism(sID, §\x1e\x0f\x16§, §\x1e\x19\x15§)
   {
      var _loc5_ = this.api.datacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         _loc5_ = new dofus.datacenter["\x1e\x16\b"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_.gfxID + ".swf",_loc4_.cell,_loc4_.dir,_loc4_.gfxID);
         this.api.datacenter.Sprites.addItemAt(sID,_loc5_);
      }
      _loc5_.GameActionsManager.init();
      _loc5_.cellNum = _loc4_.cell;
      _loc5_.scaleX = _loc4_.scaleX;
      _loc5_.scaleY = _loc4_.scaleY;
      _loc5_.linkedMonster = Number(_loc3_);
      _loc5_.Level = _loc4_.level;
      _loc5_.alignment = _loc4_.alignment;
      return _loc5_;
   }
   function createParkMount(sID, §\x1e\x0f\x16§, §\x1e\x19\x15§)
   {
      var _loc5_ = this.api.datacenter.Sprites.getItemAt(sID);
      if(_loc5_ == undefined)
      {
         _loc5_ = new dofus.datacenter["\x1e\x17\x01"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_.gfxID + ".swf",_loc4_.cell,_loc4_.dir,_loc4_.gfxID,_loc4_.modelID);
         this.api.datacenter.Sprites.addItemAt(sID,_loc5_);
      }
      _loc5_.GameActionsManager.init();
      _loc5_.cellNum = _loc4_.cell;
      _loc5_.name = _loc3_;
      _loc5_.scaleX = _loc4_.scaleX;
      _loc5_.scaleY = _loc4_.scaleY;
      _loc5_.ownerName = _loc4_.ownerName;
      _loc5_.level = _loc4_.level;
      return _loc5_;
   }
   function createMutant(sID, §\x1e\x19\x15§)
   {
      var _loc4_ = this.api.datacenter.Sprites.getItemAt(sID);
      if(_loc4_ == undefined)
      {
         _loc4_ = new dofus.datacenter["\t\x07"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc3_.gfxID + ".swf",_loc3_.cell,_loc3_.dir,_loc3_.gfxID);
         this.api.datacenter.Sprites.addItemAt(sID,_loc4_);
      }
      _loc4_.GameActionsManager.init();
      _loc4_.scaleX = _loc3_.scaleX;
      _loc4_.scaleY = _loc3_.scaleY;
      _loc4_.cellNum = Number(_loc3_.cell);
      _loc4_.Guild = Number(_loc3_.spriteType);
      _loc4_.powerLevel = Number(_loc3_.powerLevel);
      _loc4_.Sex = _loc3_.sex == undefined ? 1 : _loc3_.sex;
      _loc4_.showIsPlayer = _loc3_.showIsPlayer;
      _loc4_.monsterID = _loc3_.monsterID;
      _loc4_.playerName = _loc3_.playerName;
      this.setSpriteAccessories(_loc4_,_loc3_.accessories);
      if(_loc3_.LP != undefined)
      {
         _loc4_.LP = _loc3_.LP;
      }
      if(_loc3_.LP != undefined)
      {
         _loc4_.LPmax = _loc3_.LP;
      }
      if(_loc3_.AP != undefined)
      {
         _loc4_.AP = _loc3_.AP;
      }
      if(_loc3_.AP != undefined)
      {
         _loc4_.APinit = _loc3_.AP;
      }
      if(_loc3_.MP != undefined)
      {
         _loc4_.MP = _loc3_.MP;
      }
      if(_loc3_.MP != undefined)
      {
         _loc4_.MPinit = _loc3_.MP;
      }
      _loc4_.Team = _loc3_.team != undefined ? _loc3_.team : null;
      if(_loc3_.emote != undefined && _loc3_.emote.length != 0)
      {
         _loc4_.direction = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].convertHeightToFourDirection(_loc3_.dir);
         if(_loc3_.emoteTimer != undefined && _loc3_.emote.length != 0)
         {
            _loc4_.startAnimationTimer = _loc3_.emoteTimer;
         }
         _loc4_.startAnimation = "EmoteStatic" + _loc3_.emote;
      }
      if(_loc3_.restrictions != undefined)
      {
         _loc4_.restrictions = _global.parseInt(_loc3_.restrictions,36);
      }
      return _loc4_;
   }
   function getItemObjectFromData(§\x1e\x13\x04§)
   {
      if(_loc2_.length == 0)
      {
         return null;
      }
      var _loc3_ = _loc2_.split("~");
      var _loc4_ = _global.parseInt(_loc3_[0],16);
      var _loc5_ = _global.parseInt(_loc3_[1],16);
      var _loc6_ = _global.parseInt(_loc3_[2],16);
      var _loc7_ = _loc3_[3].length != 0 ? _global.parseInt(_loc3_[3],16) : -1;
      var _loc8_ = _loc3_[4];
      var _loc9_ = new dofus.datacenter["\f\f"](_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      _loc9_.priceMultiplicator = this.api.lang.getConfigText("SELL_PRICE_MULTIPLICATOR");
      return _loc9_;
   }
   function getSpellObjectFromData(§\x1e\x13\x04§)
   {
      var _loc3_ = _loc2_.split("~");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = Number(_loc3_[1]);
      var _loc6_ = _loc3_[2];
      var _loc7_ = new dofus.datacenter["\x1e\x0e\x1c"](_loc4_,_loc5_,_loc6_);
      return _loc7_;
   }
   function getNameFromData(§\x1e\x13\x04§)
   {
      var _loc3_ = new Object();
      var _loc4_ = _loc2_.split(",");
      if(_loc4_.length == 2)
      {
         _loc3_.name = this.api.lang.getFullNameText(_loc4_);
         _loc3_.type = "taxcollector";
      }
      else if(_global.isNaN(Number(_loc2_)))
      {
         _loc3_.name = _loc2_;
         _loc3_.type = "player";
      }
      else
      {
         _loc3_.name = this.api.lang.getMonstersText(Number(_loc2_)).n;
         _loc3_.type = "monster";
      }
      return _loc3_;
   }
   function setSpriteAccessories(oSprite, §\x1e\x14\x1b§)
   {
      if(_loc3_.length != 0)
      {
         var _loc4_ = new Array();
         var _loc5_ = _loc3_.split(",");
         var _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            if(_loc5_[_loc6_].indexOf("~") != -1)
            {
               var _loc10_ = _loc5_[_loc6_].split("~");
               var _loc7_ = _global.parseInt(_loc10_[0],16);
               var _loc9_ = _global.parseInt(_loc10_[1]);
               var _loc8_ = _global.parseInt(_loc10_[2]) - 1;
               if(_loc8_ < 0)
               {
                  _loc8_ = 0;
               }
            }
            else
            {
               _loc7_ = _global.parseInt(_loc5_[_loc6_],16);
               _loc9_ = undefined;
               _loc8_ = undefined;
            }
            if(!_global.isNaN(_loc7_))
            {
               var _loc11_ = new dofus.datacenter["\x11"](_loc7_,_loc9_,_loc8_);
               _loc4_[_loc6_] = _loc11_;
            }
            _loc6_ = _loc6_ + 1;
         }
         oSprite.accessories = _loc4_;
      }
   }
   function createGuildEmblem(§\x1e\x12\x18§)
   {
      if(_loc2_ != undefined)
      {
         var _loc3_ = _loc2_.split(",");
         var _loc4_ = _global.parseInt(_loc3_[0],36);
         var _loc5_ = _global.parseInt(_loc3_[2],36);
         if(_loc4_ < 1 || _loc4_ > dofus.Constants.EMBLEM_BACKS_COUNT)
         {
            _loc4_ = 1;
         }
         if(_loc5_ < 1 || _loc5_ > dofus.Constants.EMBLEM_UPS_COUNT)
         {
            _loc5_ = 1;
         }
         var _loc6_ = new Object();
         _loc6_.backID = _loc4_;
         _loc6_.backColor = _global.parseInt(_loc3_[1],36);
         _loc6_.upID = _loc5_;
         _loc6_.upColor = _global.parseInt(_loc3_[3],36);
         return _loc6_;
      }
      return undefined;
   }
}
