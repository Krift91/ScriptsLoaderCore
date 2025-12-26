class dofus.§\x0b\b§.AdminManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _bExecutingBatch;
   var _nUICounter;
   var _bRightClick;
   var xml;
   var xmlRightClick;
   var _sCurrentSearch;
   var _nSearchRefreshTimeout;
   var parent;
   var firstChild;
   var myPlayerObject;
   var playerObject;
   var playerName;
   var date;
   var hour;
   var _startupNode;
   var _preStartupNode;
   var _sSaveNode;
   var _sCurrentNode;
   static var _sSelf = null;
   static var DELAYED_REFRESH_DURATION = 100;
   function AdminManager()
   {
      super();
      dofus["\x0b\b"].AdminManager._sSelf = this;
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].AdminManager._sSelf;
   }
   function get isExecutingBatch()
   {
      return this._bExecutingBatch != undefined && this._bExecutingBatch;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      this._nUICounter = 0;
      this.loadXMLs();
   }
   function refreshVisually()
   {
      var _loc2_ = !this._bRightClick ? this.xml : this.xmlRightClick;
      var _loc3_ = _loc2_.firstChild.firstChild;
      this.createAndShowPopupMenuWithSearch(_loc3_,this._bRightClick);
   }
   function updateSearch(§\b\x0f§, §\x03\x19§)
   {
      var _loc4_ = this.api.ui.currentPopupMenu;
      if(_loc4_.removed == undefined || (_loc4_.removed || !_loc4_.adminPopupMenu))
      {
         return false;
      }
      if(_loc2_ <= 0)
      {
         switch(_loc3_)
         {
            case 38:
               _loc4_.selectPreviousItem();
               break;
            case 40:
               _loc4_.selectNextItem();
         }
         return true;
      }
      switch(_loc2_)
      {
         case 8:
            if(this._sCurrentSearch.length > 0)
            {
               this._sCurrentSearch = this._sCurrentSearch.substring(0,this._sCurrentSearch.length - 1);
            }
            if(this._nSearchRefreshTimeout != undefined)
            {
               _global.clearTimeout(this._nSearchRefreshTimeout);
            }
            this._nSearchRefreshTimeout = _global.setTimeout(this,"refreshVisually",dofus["\x0b\b"].AdminManager.DELAYED_REFRESH_DURATION);
            return true;
         case 127:
         case 27:
            if(this._sCurrentSearch.length == 0)
            {
               _loc4_.removePopupMenu();
               return true;
            }
            this._sCurrentSearch = "";
            if(this._nSearchRefreshTimeout != undefined)
            {
               _global.clearTimeout(this._nSearchRefreshTimeout);
            }
            this._nSearchRefreshTimeout = _global.setTimeout(this,"refreshVisually",dofus["\x0b\b"].AdminManager.DELAYED_REFRESH_DURATION);
            return true;
            break;
         case 13:
            if(!_loc4_.executeSelectedItem())
            {
               _loc4_.selectFirstEnabled();
            }
            return true;
         default:
            var _loc5_ = String.fromCharCode(_loc2_);
            this._sCurrentSearch += _loc5_;
            if(this._nSearchRefreshTimeout != undefined)
            {
               _global.clearTimeout(this._nSearchRefreshTimeout);
            }
            this._nSearchRefreshTimeout = _global.setTimeout(this,"refreshVisually",dofus["\x0b\b"].AdminManager.DELAYED_REFRESH_DURATION);
            return true;
      }
   }
   function loadXMLs(§\x15\x0e§)
   {
      this.loadXml(_loc2_);
      this.loadRightClickXml(false);
   }
   function loadXml(bShow)
   {
      var _loc2_ = new XML();
      _loc2_.parent = this;
      _loc2_.onLoad = function(§\x14\x16§)
      {
         if(_loc2_)
         {
            this.parent.xml = this;
            this.parent.initStartup(this.firstChild.firstChild);
         }
         else
         {
            this.parent.xml = undefined;
         }
         if(bShow)
         {
            var _loc3_ = this.parent.getAdminPopupMenu(undefined,false);
            _loc3_.show(_root._xmouse,_root._ymouse,true);
         }
      };
      _loc2_.ignoreWhite = true;
      _loc2_.load(dofus.Constants.XML_ADMIN_MENU_PATH);
   }
   function loadRightClickXml(bShow)
   {
      var _loc2_ = new XML();
      _loc2_.parent = this;
      _loc2_.onLoad = function(§\x14\x16§)
      {
         if(_loc2_)
         {
            this.parent.xmlRightClick = this;
         }
         else
         {
            this.parent.xmlRightClick = undefined;
         }
         if(bShow)
         {
            var _loc3_ = this.parent.getAdminPopupMenu(undefined,true);
            _loc3_.show(_root._xmouse,_root._ymouse,true);
         }
      };
      _loc2_.ignoreWhite = true;
      _loc2_.load(dofus.Constants.XML_ADMIN_RIGHT_CLICK_MENU_PATH);
   }
   function getAdminPopupMenu(§\x1e\x0e\x14§, §\x16\x03§)
   {
      this._bRightClick = _loc3_;
      Selection.setFocus(null);
      var _loc4_ = this.api.datacenter.Sprites.getItems();
      var _loc5_ = false;
      for(var a in _loc4_)
      {
         var _loc6_ = _loc4_[a];
         if(_loc6_.name.toUpperCase() == this.api.datacenter.Player.Name.toUpperCase())
         {
            this.myPlayerObject = _loc6_;
         }
         if(_loc6_.name.toUpperCase() == _loc2_.toUpperCase())
         {
            this.playerObject = _loc6_;
            _loc5_ = true;
            break;
         }
      }
      if(!_loc5_)
      {
         this.playerObject = null;
      }
      if(_loc2_ != undefined)
      {
         this.playerName = _loc2_;
      }
      var _loc7_ = !_loc3_ ? this.xml : this.xmlRightClick;
      if(_loc7_ != undefined)
      {
         var _loc8_ = this.createPopupMenu(_loc7_.firstChild.firstChild,_loc3_);
      }
      else
      {
         _loc8_ = this.api.ui.createPopupMenu();
         _loc8_.addStaticItem("XML not found");
         _loc8_.addItem("Reload XML",this,!_loc3_ ? this.loadXml : this.loadRightClickXml,[true]);
      }
      return _loc8_;
   }
   function generateDateString()
   {
      var _loc2_ = new Date();
      var _loc3_ = String(_loc2_.getFullYear());
      if(_loc3_.length < 2)
      {
         _loc3_ = "0" + _loc3_;
      }
      var _loc4_ = String(_loc2_.getMonth());
      if(_loc4_.length < 2)
      {
         _loc4_ = "0" + _loc4_;
      }
      var _loc5_ = String(_loc2_.getDate());
      if(_loc5_.length < 2)
      {
         _loc5_ = "0" + _loc5_;
      }
      this.date = _loc3_ + "/" + _loc4_ + "/" + _loc5_;
   }
   function generateHourString()
   {
      var _loc2_ = new Date();
      var _loc3_ = String(_loc2_.getHours());
      if(_loc3_.length < 2)
      {
         _loc3_ = "0" + _loc3_;
      }
      var _loc4_ = String(_loc2_.getMinutes());
      if(_loc4_.length < 2)
      {
         _loc4_ = "0" + _loc4_;
      }
      var _loc5_ = String(_loc2_.getSeconds());
      if(_loc5_.length < 2)
      {
         _loc5_ = "0" + _loc5_;
      }
      this.hour = _loc3_ + ":" + _loc4_ + ":" + _loc5_;
   }
   function generateHourAndDate()
   {
      this.generateDateString();
      this.generateHourString();
   }
   function createPopupMenuWithSearch(§\x02\x03§, §\x16\x03§)
   {
      if(this._sCurrentSearch == undefined || this._sCurrentSearch.length == 0)
      {
         return this.createPopupMenu(_loc2_,_loc3_);
      }
      var _loc4_ = this.api.ui.createPopupMenu(undefined,true);
      this.generateHourAndDate();
      _loc4_.addStaticItem("Search : " + this._sCurrentSearch);
      if(this._sCurrentSearch.length < 2)
      {
         return _loc4_;
      }
      var sSearch = this._sCurrentSearch.toLowerCase();
      var _loc5_ = function(§\x1e\x10\x1b§)
      {
         var _loc3_ = _loc2_ != undefined && _loc2_.removeAccents().toLowerCase().indexOf(sSearch) != -1;
         return _loc3_;
      };
      var _loc6_ = new Array();
      var _loc7_ = new Array();
      var _loc8_ = 0;
      while(_loc2_ != null && _loc2_ != undefined)
      {
         var _loc9_ = true;
         switch(_loc2_.attributes.type)
         {
            case "menu":
               if(_loc5_.call(this,_loc2_.attributes.label))
               {
                  var _loc10_ = this.replace(_loc2_.attributes.label);
                  _loc6_.push([_loc10_ + " >>",this,this.createAndShowPopupMenu,[_loc2_.firstChild,_loc3_]]);
               }
               break;
            case "menuDebug":
               if(dofus.Constants.DEBUG)
               {
                  if(_loc5_.call(this,_loc2_.attributes.label))
                  {
                     var _loc11_ = this.replace(_loc2_.attributes.label);
                     _loc6_.push([_loc11_ + " >>",this,this.createAndShowPopupMenu,[_loc2_.firstChild,_loc3_]]);
                  }
               }
               break;
            case "loadXML":
               if(_loc5_.call(this,_loc2_.attributes.label))
               {
                  var _loc12_ = this.replace(_loc2_.attributes.label);
                  _loc7_.push([_loc12_,this,!_loc3_ ? this.loadXml : this.loadRightClickXml,[true]]);
               }
               break;
            case "startup":
            case "prestartup":
               _loc9_ = false;
               break;
            case "batch":
            case "sendCommand":
            case "prepareCommand":
            case "sendChat":
            case "prepareChat":
            case "copyCommand":
               _loc9_ = false;
               if(_loc5_.call(this,_loc2_.attributes.label))
               {
                  var _loc13_ = this.replace(_loc2_.attributes.label);
                  _loc7_.push([_loc13_,this,this.executeFirst,[_loc2_]]);
                  break;
               }
         }
         if(_loc9_ && _loc2_.childNodes.length > 0)
         {
            _loc8_ = _loc8_ + 1;
            _loc2_ = _loc2_.firstChild;
         }
         else
         {
            var _loc14_ = _loc2_.nextSibling;
            if(_loc14_ == undefined || _loc14_ == null)
            {
               while(_loc8_ > 0)
               {
                  _loc8_ = _loc8_ - 1;
                  _loc2_ = _loc2_.parentNode;
                  var _loc15_ = _loc2_.nextSibling;
                  if(_loc15_ != undefined && _loc15_ != null)
                  {
                     _loc14_ = _loc15_;
                     break;
                  }
                  if(_loc8_ == 0)
                  {
                     _loc14_ = undefined;
                  }
               }
            }
            _loc2_ = _loc14_;
         }
      }
      var _loc16_ = 0;
      while(_loc16_ < _loc6_.length)
      {
         _loc4_.addItem.apply(_loc4_,_loc6_[_loc16_]);
         _loc16_ = _loc16_ + 1;
      }
      var _loc17_ = 0;
      while(_loc17_ < _loc7_.length)
      {
         _loc4_.addItem.apply(_loc4_,_loc7_[_loc17_]);
         _loc17_ = _loc17_ + 1;
      }
      return _loc4_;
   }
   function createPopupMenu(§\x02\x03§, §\x16\x03§)
   {
      this._sCurrentSearch = "";
      var _loc4_ = this.api.ui.createPopupMenu(undefined,true);
      this.generateHourAndDate();
      while(_loc2_ != null && _loc2_ != undefined)
      {
         var _loc5_ = this.replace(_loc2_.attributes.label);
         switch(_loc2_.attributes.type)
         {
            case "static":
               _loc4_.addStaticItem(_loc5_);
               break;
            case "menu":
               _loc4_.addItem(_loc5_ + " >>",this,this.createAndShowPopupMenu,[_loc2_.firstChild,_loc3_]);
               break;
            case "menuDebug":
               if(dofus.Constants.DEBUG)
               {
                  _loc4_.addItem(_loc5_ + " >>",this,this.createAndShowPopupMenu,[_loc2_.firstChild,_loc3_]);
               }
               break;
            case "loadXML":
               _loc4_.addItem(_loc5_,this,!_loc3_ ? this.loadXml : this.loadRightClickXml,[true]);
               break;
            case "startup":
            case "prestartup":
               break;
            default:
               _loc4_.addItem(_loc5_,this,this.executeFirst,[_loc2_]);
         }
         _loc2_ = _loc2_.nextSibling;
      }
      return _loc4_;
   }
   function createAndShowPopupMenu(§\x02\x03§, §\x16\x03§)
   {
      var _loc4_ = this.api.ui.currentPopupMenu;
      var _loc5_ = _loc4_.x;
      var _loc6_ = _loc4_.y;
      var _loc7_ = this.createPopupMenu(_loc2_,_loc3_);
      if(_loc5_ != undefined && _loc6_ != undefined)
      {
         _loc7_.show(_loc5_,_loc6_,true);
      }
      else
      {
         _loc7_.show(_root._xmouse,_root._ymouse,true);
      }
   }
   function createAndShowPopupMenuWithSearch(§\x02\x03§, §\x16\x03§)
   {
      var _loc4_ = this.api.ui.currentPopupMenu;
      var _loc5_ = _loc4_.x;
      var _loc6_ = _loc4_.y;
      var _loc7_ = this.createPopupMenuWithSearch(_loc2_,_loc3_);
      if(_loc5_ != undefined && _loc6_ != undefined)
      {
         _loc7_.show(_loc5_,_loc6_,true);
      }
      else
      {
         _loc7_.show(_root._xmouse,_root._ymouse,true);
      }
   }
   function initStartup(§\x02\x03§)
   {
      var _loc3_ = _loc2_;
      while(_loc2_ != null && _loc2_ != undefined)
      {
         if(_loc2_.attributes.type == "startup")
         {
            this._startupNode = _loc2_;
            break;
         }
         _loc2_ = _loc2_.nextSibling;
      }
      _loc2_ = _loc3_;
      while(_loc2_ != null && _loc2_ != undefined)
      {
         if(_loc2_.attributes.type == "prestartup")
         {
            this._preStartupNode = _loc2_;
            break;
         }
         _loc2_ = _loc2_.nextSibling;
      }
   }
   function executeFirst(§\x02\x03§)
   {
      this.removeInterval();
      this._sSaveNode = _loc2_.cloneNode(true);
      this.execute(this._sSaveNode,false);
   }
   function execute(§\x02\x03§)
   {
      if(_loc2_.attributes.check != true)
      {
         this.generateHourAndDate();
         this._sCurrentNode = _loc2_;
         var _loc3_ = _loc2_.attributes.command;
         if(_loc3_ != undefined)
         {
            _loc3_ = this.replaceCommand(_loc3_);
            if(_loc3_ == null)
            {
               return false;
            }
         }
         switch(_loc2_.attributes.type)
         {
            case "copyCommand":
               this.copyCommand(_loc3_);
               break;
            case "sendCommand":
               this.sendCommand(_loc3_);
               break;
            case "sendChat":
               this.sendChat(_loc3_);
               break;
            case "prepareCommand":
               this.prepareCommand(_loc3_);
               break;
            case "prepareChat":
               this.prepareChat(_loc3_);
               break;
            case "clearConsole":
               this.clearConsole();
               break;
            case "openConsole":
               this.openConsole();
               break;
            case "closeConsole":
               this.closeConsole();
               break;
            case "move":
               this.move(Number(_loc2_.attributes.cell),!!_loc2_.attributes.dirs);
               break;
            case "emote":
               this.emote(Number(_loc2_.attributes.num));
               break;
            case "smiley":
               this.smiley(Number(_loc2_.attributes.num));
               break;
            case "direction":
               this.direction(Number(_loc2_.attributes.num));
               break;
            case "summoner":
               this.itemSummoner();
               break;
            default:
               break;
            case "batch":
               return this.batch(_loc2_.firstChild);
         }
         _loc2_.attributes.check = true;
      }
      return true;
   }
   function batch(§\x02\x03§)
   {
      var _loc3_ = false;
      this._bExecutingBatch = true;
      while(_loc2_ != null && _loc2_ != undefined)
      {
         var _loc4_ = this.execute(_loc2_);
         if(_loc4_ == false)
         {
            return false;
         }
         if(_loc2_.attributes.type == "sendCommand")
         {
            var _loc5_ = _loc2_.attributes.command;
            if(_loc5_.indexOf("/makereport") == 0)
            {
               _loc3_ = true;
            }
         }
         var _loc6_ = _loc2_.nextSibling;
         var _loc7_ = Number(_loc2_.attributes.delay);
         if(!_global.isNaN(_loc7_) && _loc2_.attributes.delayCheck != true)
         {
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"batch",this,this.onCommandDelay,_loc7_);
            return false;
         }
         var _loc8_ = _loc2_.parentNode;
         if(_loc8_.attributes.repeatCheck == undefined)
         {
            _loc8_.attributes.repeatCheck = 1;
         }
         var _loc9_ = _loc8_.attributes.repeat;
         if(_loc6_ == undefined && (!_global.isNaN(_loc9_) && _loc8_.attributes.repeatCheck < _loc9_))
         {
            var _loc10_ = 0;
            while(_loc10_ < _loc8_.childNodes.length)
            {
               _loc8_.childNodes[_loc10_].attributes.check = false;
               _loc8_.childNodes[_loc10_].attributes.delayCheck = false;
               _loc10_ = _loc10_ + 1;
            }
            _loc8_.attributes.repeatCheck++;
            _loc6_ = _loc8_.childNodes[0];
         }
         _loc2_ = _loc6_;
      }
      this._bExecutingBatch = false;
      if(_loc3_)
      {
         var _loc11_ = this.api.datacenter.Temporary.Report;
         if(_loc11_ != undefined)
         {
            this.api.network.Basics.askReportInfos(2,_loc11_.currentTargetPseudos,_loc11_.currentTargetIsAllAccounts);
         }
      }
      return true;
   }
   function onCommandDelay()
   {
      this._sCurrentNode.attributes.delayCheck = true;
      this.removeInterval();
      this.resumeExecute();
   }
   function removeInterval()
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"batch");
   }
   function resumeExecute()
   {
      this.execute(this._sSaveNode);
   }
   function openConsole()
   {
      this.api.ui.loadUIComponent("Debug","Debug",undefined,{bAlwaysOnTop:true});
   }
   function closeConsole()
   {
      this.api.ui.unloadUIComponent("Debug");
   }
   function prepareCommand(§\x1e\x13\x17§)
   {
      this.api.ui.loadUIComponent("Debug","Debug",{command:_loc2_},{bStayIfPresent:true,bAlwaysOnTop:true});
   }
   function sendCommand(§\x1e\x13\x17§)
   {
      this.api.kernel.DebugConsole.process(_loc2_);
   }
   function prepareChat(§\x1e\x13\x17§)
   {
      this.api.ui.getUIComponent("Banner").txtConsole = _loc2_;
   }
   function sendChat(§\x1e\x13\x17§)
   {
      this.api.kernel.Console.process(_loc2_);
   }
   function copyCommand(§\x1e\x13\x17§)
   {
      System.setClipboard(_loc2_);
   }
   function clearConsole()
   {
      this.api.ui.getUIComponent("Debug").clear();
   }
   function move(§\x07\x11§, §\x1c\x12§)
   {
      this.api.datacenter.Player.InteractionsManager.calculatePath(this.api.gfx.mapHandler,_loc2_,true,this.api.datacenter.Game.isFight,true,_loc3_);
      if(this.api.datacenter.Basics.interactionsManager_path.length != 0)
      {
         var _loc4_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].compressPath(this.api.datacenter.Basics.interactionsManager_path);
         if(_loc4_ != undefined)
         {
            this.myPlayerObject.GameActionsManager.clear();
            this.myPlayerObject.GameActionsManager.transmittingMove(1,[_loc4_]);
            delete this.api.datacenter.Basics.interactionsManager_path;
         }
      }
   }
   function smiley(§\x04\n§)
   {
      this.api.network.Chat.useSmiley(_loc2_);
   }
   function emote(§\x04\n§)
   {
      this.api.network.Emotes.useEmote(_loc2_);
   }
   function direction(§\x04\n§)
   {
      this.api.network.Emotes.setDirection(_loc2_);
   }
   function itemSummoner()
   {
      this.api.ui.loadUIComponent("ItemSummoner","ItemSummoner");
   }
   function replace(§\x1e\f\x12§)
   {
      var _loc3_ = new Array();
      _loc3_.push({f:"%g",t:this.playerObject.guildName});
      _loc3_.push({f:"%c",t:this.playerObject.cellNum});
      _loc3_.push({f:"%p",t:this.playerName});
      _loc3_.push({f:"%n",t:this.api.datacenter.Player.Name});
      _loc3_.push({f:"%d",t:this.date});
      _loc3_.push({f:"%h",t:this.hour});
      _loc3_.push({f:"%t",t:this.api.kernel.NightManager.time});
      _loc3_.push({f:"%s",t:this.api.datacenter.Basics.aks_a_prompt});
      _loc3_.push({f:"%m",t:this.api.datacenter.Map.id});
      _loc3_.push({f:"%v",t:dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + " (" + dofus.Constants.VERSIONDATE + ")"});
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         _loc2_ = _loc2_.split(_loc3_[_loc4_].f).join(_loc3_[_loc4_].t);
         _loc4_ = _loc4_ + 1;
      }
      return _loc2_;
   }
   function replaceCommand(§\x1e\f\x12§)
   {
      var _loc3_ = new Array();
      _loc3_.push({f:"#item",ui:"ItemSelector"});
      _loc3_.push({f:"#look",ui:"MonsterAndLookSelector"});
      _loc3_.push({f:"#monster",ui:"MonsterAndLookSelector",p:{monster:true}});
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         if(_loc2_.indexOf(_loc3_[_loc4_].f) != -1)
         {
            var _loc5_ = this.api.ui.loadUIComponent(_loc3_[_loc4_].ui,_loc3_[_loc4_].ui + this._nUICounter++,_loc3_[_loc4_].p);
            _loc5_.addEventListener("select",this);
            _loc5_.addEventListener("cancel",this);
            return null;
         }
         _loc4_ = _loc4_ + 1;
      }
      return this.replace(_loc2_);
   }
   function replaceUI(§\x1e\f\x12§, §\x1e\f\x0b§, §\x1e\x0e\x04§)
   {
      var _loc5_ = _loc2_.indexOf(_loc3_);
      var _loc6_ = _loc2_.split("");
      _loc6_.splice(_loc5_,_loc3_.length,_loc4_);
      var _loc7_ = _loc6_.join("");
      return _loc7_;
   }
   function cancel(§\x1e\x19\x0e§)
   {
   }
   function characterSelected()
   {
      if(this._preStartupNode == null || this._preStartupNode == undefined)
      {
         return undefined;
      }
      this.playerObject = this.api.datacenter.Player;
      this.playerName = dofus.datacenter["\x0b\r"](this.playerObject).Name;
      this.batch(this._preStartupNode.firstChild);
   }
   function characterEnteringGame()
   {
      if(this._startupNode == null || this._startupNode == undefined)
      {
         return undefined;
      }
      this.playerObject = this.api.datacenter.Player;
      this.playerName = dofus.datacenter["\x0b\r"](this.playerObject).Name;
      this.batch(this._startupNode.firstChild);
   }
   function select(§\x1e\x19\x0e§)
   {
      switch(_loc2_.ui)
      {
         case "ItemSelector":
            var _loc3_ = this.replaceUI(this._sCurrentNode.attributes.command,"#item",_loc2_.itemId + " " + _loc2_.itemQuantity);
            if(_loc3_ != undefined)
            {
               _loc3_ = this.replaceCommand(_loc3_);
            }
            if(_loc3_ != null)
            {
               this.sendCommand(_loc3_);
            }
            break;
         case "LookSelector":
            this._sCurrentNode.attributes.command = this.replaceUI(this._sCurrentNode.attributes.command,"#look",_loc2_.lookId);
            this.resumeExecute();
            break;
         case "MonsterSelector":
            this._sCurrentNode.attributes.command = this.replaceUI(this._sCurrentNode.attributes.command,"#monster",_loc2_.monsterId);
            this.resumeExecute();
      }
   }
}
