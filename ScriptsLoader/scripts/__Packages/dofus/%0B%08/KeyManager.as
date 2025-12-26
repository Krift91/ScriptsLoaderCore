class dofus.§\x0b\b§.KeyManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _aAnyTimeShortcuts;
   var _aNoChatShortcuts;
   var _aListening;
   var _aKeysListening;
   var _nCurrentSet;
   var _so;
   var _lastCtrlState;
   var _bIsBroadcasting = true;
   var _bPressedKeys = new Array();
   var _bCtrlDown = false;
   var _bShiftDown = true;
   static var _sSelf = null;
   var _nLastTriggerShow = 0;
   function KeyManager(oAPI)
   {
      super();
      dofus["\x0b\b"].KeyManager._sSelf = this;
      this.initialize(oAPI);
   }
   function get Broadcasting()
   {
      return this._bIsBroadcasting;
   }
   function set Broadcasting(§\x18\x13§)
   {
      this._bIsBroadcasting = _loc2_;
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].KeyManager._sSelf;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      Key.addListener(this);
      this._aAnyTimeShortcuts = new Array();
      this._aNoChatShortcuts = new Array();
      this.addToQueue({object:this,method:this.loadShortcuts});
   }
   function addShortcutsListener(§\x1e\x0f\x1c§, §\x1e\x18\x19§)
   {
      if(this._aListening == undefined)
      {
         this._aListening = new Array();
      }
      var _loc4_ = 0;
      while(_loc4_ < this._aListening.length)
      {
         if(String(this._aListening[_loc4_].o) == String(_loc3_) && this._aListening[_loc4_].m == _loc2_)
         {
            this.removeShortcutsListener(this._aListening[_loc4_].o);
         }
         _loc4_ = _loc4_ + 1;
      }
      this._aListening.unshift({o:_loc3_,m:_loc2_});
   }
   function removeShortcutsListener(§\x1e\x18\x19§)
   {
      if(this._aListening == undefined)
      {
         return undefined;
      }
      var _loc3_ = new Array();
      var _loc4_ = 0;
      while(_loc4_ < this._aListening.length)
      {
         if(this._aListening[_loc4_].o == _loc2_)
         {
            _loc3_.push(_loc4_);
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc3_.sort(Array.DESCENDING);
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         this._aListening.splice(_loc3_[_loc5_],1);
         _loc5_ = _loc5_ + 1;
      }
   }
   function addKeysListener(§\x1e\x0f\x1c§, §\x1e\x18\x19§)
   {
      if(this._aKeysListening == undefined)
      {
         this._aKeysListening = new Array();
      }
      var _loc4_ = 0;
      while(_loc4_ < this._aKeysListening.length)
      {
         if(String(this._aKeysListening[_loc4_].o) == String(_loc3_) && this._aKeysListening[_loc4_].m == _loc2_)
         {
            this._aKeysListening[_loc4_] = undefined;
         }
         _loc4_ = _loc4_ + 1;
      }
      this._aKeysListening.unshift({o:_loc3_,m:_loc2_});
   }
   function removeKeysListener(§\x1e\x18\x19§)
   {
      if(this._aKeysListening == undefined)
      {
         return undefined;
      }
      var _loc3_ = new Array();
      var _loc4_ = 0;
      while(_loc4_ < this._aKeysListening.length)
      {
         if(this._aKeysListening[_loc4_].o == _loc2_)
         {
            _loc3_.push(_loc4_);
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc3_.sort(Array.DESCENDING);
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         this._aKeysListening.splice(_loc3_[_loc5_],1);
         _loc5_ = _loc5_ + 1;
      }
   }
   function getDefaultShortcut(§\x1e\r\x14§)
   {
      return this.api.lang.getKeyboardShortcutsKeys(this._nCurrentSet,_loc2_);
   }
   function getCurrentShortcut(§\x1e\r\x14§)
   {
      var _loc3_ = new Array();
      var _loc4_ = 0;
      while(_loc4_ < this._aAnyTimeShortcuts.length)
      {
         if(this._aAnyTimeShortcuts[_loc4_].d == _loc2_)
         {
            _loc3_.push({k:this._aAnyTimeShortcuts[_loc4_].k,c:this._aAnyTimeShortcuts[_loc4_].c,d:this._aAnyTimeShortcuts[_loc4_].l});
         }
         _loc4_ = _loc4_ + 1;
      }
      var _loc5_ = 0;
      while(_loc5_ < this._aNoChatShortcuts.length)
      {
         if(this._aNoChatShortcuts[_loc5_].d == _loc2_)
         {
            _loc3_.push({k:this._aNoChatShortcuts[_loc5_].k,c:this._aNoChatShortcuts[_loc5_].c,d:this._aNoChatShortcuts[_loc5_].l});
         }
         _loc5_ = _loc5_ + 1;
      }
      if(_loc3_.length == 1)
      {
         return _loc3_[0];
      }
      if(_loc3_.length == 2)
      {
         return {k:_loc3_[0].k,c:_loc3_[0].c,d:_loc3_[0].d,k2:_loc3_[1].k,c2:_loc3_[1].c,d2:_loc3_[1].d};
      }
      return undefined;
   }
   function clearCustomShortcuts()
   {
      this._so.clear();
      this.loadShortcuts();
   }
   function askCustomShortcut(§\x1e\r\x14§, §\x18\x14§)
   {
      this.api.ui.loadUIComponent("AskCustomShortcut","AskCustomShortcut",{title:this.api.lang.getText("SHORTCUTS_CUSTOM"),ShortcutCode:_loc2_,IsAlt:_loc3_,Description:this.api.lang.getKeyboardShortcuts()[_loc2_].d});
   }
   function setCustomShortcut(§\x1e\r\x14§, §\x18\x14§, §\x03\x19§, §\x06\x15§, §\x1e\x14\x11§)
   {
      if(_loc2_ == undefined || _loc3_ == undefined)
      {
         return undefined;
      }
      var _loc7_ = _loc2_ + (!_loc3_ ? "_MAIN" : "_ALT");
      if(_loc4_ == undefined)
      {
         this._so.data[_loc7_] = undefined;
      }
      else
      {
         if(_loc5_ == undefined)
         {
            _loc5_ = 0;
         }
         if(_loc6_ == undefined || _loc6_ == "")
         {
            _loc6_ = this.api.lang.getKeyStringFromKeyCode(_loc4_);
            _loc6_ = this.api.lang.getControlKeyString(_loc5_) + _loc6_;
         }
         this._so.data[_loc7_] = {s:_loc2_,a:_loc3_,k:_loc4_,c:_loc5_,i:_loc6_};
      }
      this._so.flush();
      this.loadShortcuts();
   }
   function getCustomShortcut(§\x1e\r\x14§, §\x18\x14§)
   {
      var _loc4_ = _loc2_ + (!_loc3_ ? "_MAIN" : "_ALT");
      return this._so.data[_loc4_];
   }
   function isCustomShortcut(§\x1e\r\x14§, §\x18\x14§)
   {
      return this.getCustomShortcut(_loc2_,_loc3_) != undefined;
   }
   function deleteCustomShortcut(§\x1e\r\x14§, §\x18\x14§)
   {
      this.setCustomShortcut(_loc2_,_loc3_);
   }
   function getCurrentDefaultSet()
   {
      var _loc2_ = Number(this.api.lang.getText("SHORTCUTS_DEFAULT_SET"));
      if(_loc2_ < 1)
      {
         _loc2_ = 1;
      }
      return _loc2_;
   }
   function dispatchCtrlState(§\x17\x0e§)
   {
      this.dispatchShortcut(!_loc2_ ? "CTRL_STATE_CHANGED_OFF" : "CTRL_STATE_CHANGED_ON");
   }
   function dispatchShortcut(§\x1e\r\x14§)
   {
      if(!this._bIsBroadcasting)
      {
         return false;
      }
      if(_loc2_ == "SEND_CHAT_MSG")
      {
         return false;
      }
      if(this._aListening == undefined)
      {
         return true;
      }
      var _loc3_ = new Array();
      var _loc4_ = true;
      var _loc5_ = 0;
      while(_loc5_ < this._aListening.length)
      {
         if(this._aListening[_loc5_] == undefined || this._aListening[_loc5_].o == undefined)
         {
            _loc3_.push(_loc5_);
         }
         else
         {
            var _loc6_ = eval(String(this._aListening[_loc5_].o) + "." + this._aListening[_loc5_].m).call(this._aListening[_loc5_].o,_loc2_);
            if(_loc6_ != undefined && _loc6_ == false)
            {
               _loc4_ = false;
               break;
            }
         }
         _loc5_ = _loc5_ + 1;
      }
      _loc3_.sort(Array.DESCENDING);
      var _loc7_ = 0;
      while(_loc7_ < _loc3_.length)
      {
         this._aListening.splice(_loc3_[_loc7_],1);
         _loc7_ = _loc7_ + 1;
      }
      if(_loc4_)
      {
         _loc4_ = this.onShortcut(_loc2_);
      }
      return _loc4_;
   }
   function dispatchKey(§\x1e\x11\x03§)
   {
      if(!this._bIsBroadcasting)
      {
         return undefined;
      }
      if(this._aKeysListening == undefined)
      {
         return undefined;
      }
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).trim().toString();
      if(_loc2_.length == 0)
      {
         return undefined;
      }
      var _loc3_ = new Array();
      var _loc4_ = 0;
      while(_loc4_ < this._aKeysListening.length)
      {
         if(this._aKeysListening[_loc4_] == undefined || this._aKeysListening[_loc4_].o == undefined)
         {
            _loc3_.push(_loc4_);
         }
         else
         {
            eval(String(this._aKeysListening[_loc4_].o) + "." + this._aKeysListening[_loc4_].m).call(this._aKeysListening[_loc4_].o,_loc2_);
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc3_.sort(Array.DESCENDING);
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         this._aKeysListening.splice(_loc3_[_loc5_],1);
         _loc5_ = _loc5_ + 1;
      }
   }
   function loadShortcuts()
   {
      var _loc2_ = this.api.datacenter.Basics.dofusPseudo;
      if(_loc2_ != undefined)
      {
         var _loc3_ = _loc2_ + "_" + dofus.Constants.GLOBAL_SO_SHORTCUTS_NAME;
         this._so = SharedObject.getLocal(_loc3_);
      }
      if(this._nCurrentSet == undefined)
      {
         this._nCurrentSet = this.api.kernel.OptionsManager.getOption("ShortcutSet");
      }
      var _loc4_ = this.api.lang.getKeyboardShortcuts();
      this._aNoChatShortcuts = new Array();
      this._aAnyTimeShortcuts = new Array();
      for(var k in _loc4_)
      {
         var _loc5_ = this.api.lang.getKeyboardShortcutsKeys(this._nCurrentSet,k);
         var _loc6_ = this.getCustomShortcut(k,false);
         if(_loc6_ != undefined && !_loc4_[k].s)
         {
            if(_loc5_.o)
            {
               this._aNoChatShortcuts.push({k:_loc6_.k,c:_loc6_.c,o:_loc5_.o,d:k,l:_loc6_.i,s:_loc4_[k].s});
            }
            else
            {
               this._aAnyTimeShortcuts.push({k:_loc6_.k,c:_loc6_.c,o:_loc5_.o,d:k,l:_loc6_.i,s:_loc4_[k].s});
            }
         }
         else if(_loc5_.o)
         {
            this._aNoChatShortcuts.push({k:_loc5_.k,c:_loc5_.c,o:_loc5_.o,d:k,l:_loc5_.s,s:_loc4_[k].s});
         }
         else if(_loc5_.k != undefined)
         {
            this._aAnyTimeShortcuts.push({k:_loc5_.k,c:_loc5_.c,o:_loc5_.o,d:k,l:_loc5_.s,s:_loc4_[k].s});
         }
         var _loc7_ = this.getCustomShortcut(k,true);
         if(_loc7_ != undefined && !_loc4_[k].s)
         {
            if(_loc5_.o)
            {
               this._aNoChatShortcuts.push({k:_loc7_.k,c:_loc7_.c,o:_loc5_.o,d:k,l:_loc7_.i,s:_loc4_[k].s});
            }
            else
            {
               this._aAnyTimeShortcuts.push({k:_loc7_.k,c:_loc7_.c,o:_loc5_.o,d:k,l:_loc7_.i,s:_loc4_[k].s});
            }
         }
         else if(!_global.isNaN(_loc5_.k2) && _loc5_.k2 != undefined)
         {
            if(_loc5_.o)
            {
               this._aNoChatShortcuts.push({k:_loc5_.k2,c:_loc5_.c2,o:_loc5_.o,d:k,l:_loc5_.s2,s:_loc4_[k].s});
            }
            else
            {
               this._aAnyTimeShortcuts.push({k:_loc5_.k2,c:_loc5_.c2,o:_loc5_.o,d:k,l:_loc5_.s2,s:_loc4_[k].s});
            }
         }
      }
      if(this._aNoChatShortcuts.length == 0 && this._aAnyTimeShortcuts.length == 0)
      {
         this._aAnyTimeShortcuts.push({k:38,c:0,o:true,d:"HISTORY_UP"});
         this._aAnyTimeShortcuts.push({k:40,c:0,o:true,d:"HISTORY_DOWN"});
         this._aAnyTimeShortcuts.push({k:13,c:1,o:true,d:"GUILD_MESSAGE"});
         this._aAnyTimeShortcuts.push({k:13,c:0,o:true,d:"ACCEPT_CURRENT_DIALOG"});
         this._aAnyTimeShortcuts.push({k:70,c:1,o:true,d:"FULLSCREEN"});
         var _loc8_ = this.api.lang.getDefaultConsoleShortcuts();
         var _loc9_ = 0;
         while(_loc9_ < _loc8_.length)
         {
            this._aAnyTimeShortcuts.push({k:_loc8_[_loc9_].k,c:1,o:true,d:"CONSOLE"});
            _loc9_ = _loc9_ + 1;
         }
         var _loc10_ = 0;
         while(_loc10_ < _loc8_.length)
         {
            this._aAnyTimeShortcuts.push({k:_loc8_[_loc10_].k,c:2,o:true,d:"CONSOLESIZE"});
            _loc10_ = _loc10_ + 1;
         }
      }
   }
   function processShortcuts(§\x1d\f§, §\x03\x19§, §\x1b\n§, §\x15\x0f§)
   {
      var _loc6_ = true;
      var _loc7_ = 0;
      while(_loc7_ < _loc2_.length)
      {
         if(Number(_loc2_[_loc7_].k) == _loc3_)
         {
            var _loc8_ = false;
            switch(_loc2_[_loc7_].c)
            {
               case 1:
                  if(_loc4_ && !_loc5_)
                  {
                     _loc8_ = true;
                  }
                  break;
               case 2:
                  if(!_loc4_ && _loc5_)
                  {
                     _loc8_ = true;
                  }
                  break;
               case 3:
                  if(_loc4_ && _loc5_)
                  {
                     _loc8_ = true;
                  }
                  break;
               default:
                  if(!_loc4_ && !_loc5_)
                  {
                     _loc8_ = true;
                     break;
                  }
            }
            if(_loc8_)
            {
               _loc6_ = this.dispatchShortcut(_loc2_[_loc7_].d);
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      return _loc6_;
   }
   function onSetChange(§\x1e\x1d\x10§)
   {
      this._nCurrentSet = _loc2_;
      this.loadShortcuts();
   }
   function onKeyDown()
   {
      var _loc2_ = Key.getCode();
      var _loc3_ = Key.getAscii();
      var _loc4_ = Key.isDown(Key.CONTROL);
      var _loc5_ = Key.isDown(Key.SHIFT);
      if(this._lastCtrlState != _loc4_)
      {
         this._lastCtrlState = _loc4_;
         this.dispatchCtrlState(_loc4_);
      }
      if(this._bPressedKeys[_loc2_] != undefined)
      {
         return undefined;
      }
      this._bPressedKeys[_loc2_] = true;
      if(this.api.gfx.mapHandler.showingFightCells && !this.api.datacenter.Game.isFight)
      {
         this.api.gfx.unSelect(true);
         this.api.gfx.mapHandler.showingFightCells = false;
      }
      if(this.api.gfx.spriteHandler.isShowingMonstersTooltip)
      {
         this.api.gfx.spriteHandler.showMonstersTooltip(false);
      }
      if(this.api.gfx.spriteHandler.isPlayerSpritesHidden)
      {
         this.api.gfx.spriteHandler.hidePlayerSprites(false);
      }
      if(this.api.kernel.AdminManager.updateSearch(_loc3_,_loc2_))
      {
         return undefined;
      }
      if(!this.processShortcuts(this._aAnyTimeShortcuts,_loc2_,_loc4_,_loc5_))
      {
         return undefined;
      }
      if(Selection.getFocus() != undefined)
      {
         return undefined;
      }
      if(!this.processShortcuts(this._aNoChatShortcuts,_loc2_,_loc4_,_loc5_))
      {
         return undefined;
      }
      if(_loc3_ > 0)
      {
         this.dispatchKey(String.fromCharCode(_loc3_));
      }
   }
   function onKeyUp()
   {
      if(this.api.gfx.mapHandler.showingFightCells && !this.api.datacenter.Game.isFight)
      {
         this.api.gfx.unSelect(true);
         this.api.gfx.mapHandler.showingFightCells = false;
      }
      if(this.api.gfx.spriteHandler.isShowingMonstersTooltip)
      {
         this.api.gfx.spriteHandler.showMonstersTooltip(false);
      }
      if(this.api.gfx.spriteHandler.isPlayerSpritesHidden)
      {
         this.api.gfx.spriteHandler.hidePlayerSprites(false);
      }
      var _loc2_ = Key.getCode();
      delete this._bPressedKeys[_loc2_];
   }
   function onShortcut(§\x1e\r\x14§)
   {
      var _loc3_ = true;
      switch(_loc2_)
      {
         case "TOGGLE_FIGHT_INFOS":
            this.api.kernel.OptionsManager.setOption("ChatEffects",!this.api.kernel.OptionsManager.getOption("ChatEffects"));
            _loc3_ = false;
            break;
         case "ESCAPE":
            this.api.datacenter.Basics.gfx_canLaunch = false;
            if(!this.api.ui.removeCursor(true))
            {
               if(this.api.ui.callCloseOnLastUI() == false)
               {
                  this.api.ui.loadUIComponent("AskMainMenu","AskMainMenu");
               }
            }
            break;
         case "CONSOLE":
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.ui.loadUIComponent("Debug","Debug",undefined,{bAlwaysOnTop:true});
               _loc3_ = false;
            }
            break;
         case "CONSOLESIZE":
            if(this.api.datacenter.Player.isAuthorized)
            {
               var _loc4_ = this.api.ui.getUIComponent("Debug");
               if(_loc4_ != undefined)
               {
                  _loc4_.changeSize();
               }
               _loc3_ = false;
            }
            break;
         case "GRID":
            this.api.kernel.OptionsManager.setOption("Grid");
            _loc3_ = false;
            break;
         case "SHOWMONSTERSTOOLTIP":
            this.api.gfx.spriteHandler.showMonstersTooltip(true);
            _loc3_ = false;
            break;
         case "SHOWTRIGGERS":
            if(this.api.datacenter.Game.isFight || getTimer() - this._nLastTriggerShow < dofus.Constants.CLICK_MIN_DELAY)
            {
               break;
            }
            if(!this.api.datacenter.Game.isFight)
            {
               if(getTimer() - this._nLastTriggerShow >= dofus.Constants.CLICK_MIN_DELAY)
               {
                  this._nLastTriggerShow = getTimer();
                  this.api.gfx.mapHandler.showTriggers();
                  this.api.gfx.mapHandler.showFightCells();
               }
               _loc3_ = false;
            }
            break;
         case "HIDESPRITES":
            this.api.gfx.spriteHandler.hidePlayerSprites(true);
            _loc3_ = false;
            break;
         case "TRANSPARENCY":
            this.api.kernel.OptionsManager.setOption("Transparency",!this.api.gfx.bGhostView);
            _loc3_ = false;
            break;
         case "SPRITEINFOS":
            this.api.kernel.OptionsManager.setOption("SpriteInfos");
            _loc3_ = false;
            break;
         case "COORDS":
            this.api.kernel.OptionsManager.setOption("MapInfos");
            _loc3_ = false;
            break;
         case "STRINGCOURSE":
            this.api.kernel.OptionsManager.setOption("StringCourse");
            _loc3_ = false;
            break;
         case "BUFF":
            this.api.kernel.OptionsManager.setOption("Buff");
            _loc3_ = false;
            break;
         case "MOVABLEBAR":
            this.api.kernel.OptionsManager.setOption("MovableBar",!this.api.kernel.OptionsManager.getOption("MovableBar"));
            _loc3_ = false;
            break;
         case "MOUNTING":
            this.api.network.Mount.ride();
            _loc3_ = false;
            break;
         case "FULLSCREEN":
            var _loc0_ = null;
            this.api.kernel.GameManager.isFullScreen = _loc0_ = !this.api.kernel.GameManager.isFullScreen;
            fscommand("fullscreen",_loc0_);
            _loc3_ = false;
            break;
         case "ALLOWSCALE":
            this.api.kernel.GameManager.isAllowingScale = _loc0_ = !this.api.kernel.GameManager.isAllowingScale;
            fscommand("allowscale",_loc0_);
            _loc3_ = false;
      }
      return _loc3_;
   }
}
