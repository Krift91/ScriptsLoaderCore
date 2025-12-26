class dofus.§\r\x14§.gapi.ui.ServerList extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _eaServers;
   var _eaServersSave;
   var _nServerID;
   var _dgServers;
   var _btnClose;
   var _btnSelect;
   var _btnSearch;
   var _btnDisplayAllCommunities;
   var _winBg;
   var _lblSearch;
   var _lblDisplayAllCommunities;
   var _tiSearch;
   var _mcPlacer;
   var _alreadySetShowAll;
   var _lblSearchResult;
   var dispatchEvent;
   static var CLASS_NAME = "ServerList";
   static var SEARCH_DELAY = 500;
   var _nLastSearchTimer = 0;
   function ServerList()
   {
      super();
   }
   function set servers(§\x0f\x16§)
   {
      this._eaServers = _loc2_;
      this._eaServersSave = _loc2_;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   function set serverID(§\x1e\x1d\x11§)
   {
      this._nServerID = _loc2_;
   }
   function get selectedServerID()
   {
      return this._nServerID;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.ServerList.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.updateData});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function addListeners()
   {
      this._dgServers.addEventListener("itemSelected",this);
      this._dgServers.addEventListener("itemdblClick",this);
      this._dgServers.addEventListener("itemRollOver",this);
      this._dgServers.addEventListener("itemRollOut",this);
      this._btnClose.addEventListener("click",this);
      this._btnSelect.addEventListener("click",this);
      this._btnSearch.addEventListener("click",this);
      this._btnDisplayAllCommunities.addEventListener("click",this);
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
      var ref = this;
      var _loc2_ = new Object();
      _loc2_.onSetFocus = function(§\x1e\x18\x1b§, §\x05\x11§)
      {
         if(eval(Selection.getFocus())._parent == ref._tiSearch)
         {
            if(ref._tiSearch.text == ref.api.lang.getText("PSEUDO_DOFUS_SIMPLE"))
            {
               ref._tiSearch.text = "";
            }
         }
         else if(ref._tiSearch.text == "")
         {
            ref._tiSearch.text = ref.api.lang.getText("PSEUDO_DOFUS_SIMPLE");
         }
      };
      Selection.addListener(_loc2_);
   }
   function initTexts()
   {
      this._winBg.title = "Liste des serveurs";
      this._btnSelect.label = this.api.lang.getText("SELECT");
      this._btnClose.label = this.api.lang.getText("BACK");
      this._btnSearch.label = this.api.lang.getText("OK");
      this._lblSearch.text = this.api.lang.getText("FIND_FRIEND");
      this._lblDisplayAllCommunities.text = this.api.lang.getText("SERVER_LIST_DISPLAY_ALL_COMMUNITIES");
      this._tiSearch.text = !this._tiSearch.text.length ? this.api.lang.getText("PSEUDO_DOFUS_SIMPLE") : this._tiSearch.text;
      this._dgServers.columnsNames = ["",this.api.lang.getText("NAME_BIG"),this.api.lang.getText("TYPE"),this.api.lang.getText("STATE"),this.api.lang.getText("COMMUNITY"),this.api.lang.getText("POPULATION")];
   }
   function updateData()
   {
      if(this.api.lang.getConfigText("SERVER_LIST_USE_FIND_FRIEND"))
      {
         this._dgServers._y = this._mcPlacer._y;
      }
      if(_global.CONFIG.onlyHardcore && !this._alreadySetShowAll)
      {
         this._btnDisplayAllCommunities.selected = true;
         this._alreadySetShowAll = true;
      }
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = new Object();
      var _loc5_ = 0;
      while(_loc5_ < this._eaServers.length)
      {
         var _loc6_ = this._eaServers[_loc5_];
         if((_loc6_.isHardcore() || (this._btnDisplayAllCommunities.selected || (_loc6_.community == this.api.datacenter.Basics.communityId || _loc6_.community == dofus.datacenter["\x1e\x12\x12"].SERVER_COMMUNITY_INTERNATIONAL))) && _loc6_.isAllowed())
         {
            _loc2_.push(this._eaServers[_loc5_]);
         }
         _loc5_ = _loc5_ + 1;
      }
      var _loc7_ = 0;
      while(_loc7_ < _loc2_.length)
      {
         var _loc8_ = _loc2_[_loc7_];
         if(_loc8_ != undefined)
         {
            var _loc9_ = _loc8_.language;
            _loc8_.sortPopulation = _loc8_.population;
            if(this.api.config.language != _loc9_)
            {
               if(_loc4_[_loc9_] == undefined)
               {
                  _loc4_[_loc9_] = new ank["\x1e\n\x07"]["\x0f\x01"]();
               }
               _loc4_[_loc9_].push(_loc8_);
            }
            else
            {
               _loc3_.push(_loc8_);
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      _loc3_.sortOn("sortPopulation");
      for(var a in _loc4_)
      {
         var _loc10_ = _loc4_[a];
         _loc10_.sortOn("sortPopulation");
         var _loc11_ = 0;
         while(_loc11_ < _loc10_.length)
         {
            _loc3_.push(_loc10_[_loc11_]);
            _loc11_ = _loc11_ + 1;
         }
      }
      this._dgServers.dataProvider = _loc3_;
      var _loc12_ = 0;
      if(this._nServerID != undefined)
      {
         var _loc13_ = 0;
         while(_loc13_ < _loc3_.length)
         {
            if(_loc3_[_loc13_].id == this._nServerID)
            {
               _loc12_ = _loc13_;
               break;
            }
            _loc13_ = _loc13_ + 1;
         }
      }
      this._dgServers.selectedIndex = _loc12_;
      this._nServerID = this._dgServers.selectedItem.id;
   }
   function findFriend()
   {
      if(this._tiSearch.text == this.api.lang.getText("PSEUDO_DOFUS_SIMPLE") || !this._tiSearch.text.length)
      {
         this._eaServers = this._eaServersSave;
         this._lblSearchResult.text = "";
         this.updateData();
         return undefined;
      }
      if(this._nLastSearchTimer + dofus["\r\x14"].gapi.ui.ServerList.SEARCH_DELAY > getTimer())
      {
         return undefined;
      }
      this._nLastSearchTimer = getTimer();
      this.api.network.Account.searchForFriend(this._tiSearch.text);
   }
   function setSearchResult(§\x1d\x12§)
   {
      this._eaServers = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = 0;
      while(_loc3_ < this._eaServersSave.length)
      {
         var _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            if(_loc2_[_loc4_].server == this._eaServersSave[_loc3_].id)
            {
               this._eaServersSave[_loc3_].friendCharactersCount = _loc2_[_loc4_].count;
               this._eaServersSave[_loc3_].search = this._tiSearch.text;
               this._eaServers.push(this._eaServersSave[_loc3_]);
               break;
            }
            _loc4_ = _loc4_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      this._eaServers.bubbleSortOn("friendCharactersCount",Array.DESCENDING | Array.NUMERIC);
      if(!this._eaServers.length)
      {
         this._lblSearchResult.text = this.api.lang.getText("SEARCH_RESULT_EMPTY");
      }
      else
      {
         this._lblSearchResult.text = "";
      }
      this.updateData();
   }
   function onServerSelected()
   {
      this._nServerID = this._dgServers.selectedItem.id;
      if(this._nServerID == undefined)
      {
         return undefined;
      }
      this.gapi.loadUIComponent("ServerInformations","ServerInformations",{server:this._nServerID});
      this.gapi.getUIComponent("ServerInformations").addEventListener("serverSelected",this);
      this.gapi.getUIComponent("ServerInformations").addEventListener("canceled",this);
   }
   function serverSelected(§\x1e\x19\x0e§)
   {
      this.gapi.unloadUIComponent("ServerInformations");
      this.dispatchEvent({type:"serverSelected",serverID:_loc2_.value});
   }
   function canceled(§\x1e\x19\x0e§)
   {
      this.gapi.unloadUIComponent("ServerInformations");
   }
   function onShortcut(§\x1e\r\x14§)
   {
      if(_loc2_ == "ACCEPT_CURRENT_DIALOG" && this._tiSearch.focused)
      {
         this.click({target:this._btnSearch});
         return false;
      }
      return true;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnSelect:
            this.onServerSelected();
            break;
         case this._btnClose:
            this.unloadThis();
            break;
         case this._btnDisplayAllCommunities:
            this.updateData();
            break;
         case this._btnSearch:
            this.findFriend();
      }
   }
   function itemRollOver(§\x1e\x19\x0e§)
   {
      _loc2_.row.cellRenderer_mc.over();
   }
   function itemRollOut(§\x1e\x19\x0e§)
   {
      _loc2_.row.cellRenderer_mc.out();
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      this._nServerID = this._dgServers.selectedItem.id;
   }
   function itemdblClick(§\x1e\x19\x0e§)
   {
      this.onServerSelected();
   }
}
