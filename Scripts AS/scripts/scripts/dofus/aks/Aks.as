var _loc1 = dofus.aks["\x1e\x0f"].prototype;
_loc1.electron = function(sData)
{
   this.sValue = sData;
};
_loc1.initialize = function(_loc2_)
{
   super.initialize(_loc3_);
   this.Basics = new dofus.aks.Basics(this,_loc3_);
   this.Account = new dofus.aks.Account(this,_loc3_);
   this.Friends = new dofus.aks.Friends(this,_loc3_);
   this.Enemies = new dofus.aks.Enemies(this,_loc3_);
   this.Chat = new dofus.aks.Chat(this,_loc3_);
   this.Dialog = new dofus.aks.Dialog(this,_loc3_);
   this.Exchange = new dofus.aks.Exchange(this,_loc3_);
   this.Game = new dofus.aks.Game(this,_loc3_);
   this.GameActions = new dofus.aks.GameActions(this,_loc3_);
   this.Houses = new dofus.aks.Houses(this,_loc3_);
   this.Infos = new dofus.aks.Infos(this,_loc3_);
   this.Items = new dofus.aks.Items(this,_loc3_);
   this.Job = new dofus.aks.Job(this,_loc3_);
   this.Key = new dofus.aks.Key(this,_loc3_);
   this.Spells = new dofus.aks.Spells(this,_loc3_);
   this.Storages = new dofus.aks.Storages(this,_loc3_);
   this.Emotes = new dofus.aks.Emotes(this,_loc3_);
   this.Documents = new dofus.aks.Documents(this,_loc3_);
   this.Guild = new dofus.aks.Guild(this,_loc3_);
   this.Waypoints = new dofus.aks.Waypoints(this,_loc3_);
   this.Zones = new dofus.aks.Zones(this,_loc3_);
   this.Koliseo = new dofus.aks.Koliseo(this,_loc3_);
   this.InventoryShortcuts = new dofus.aks.InventoryShortcuts(this,_loc3_);
   this.Subareas = new dofus.aks.Subareas(this,_loc3_);
   this.Specialization = new dofus.aks.Specialization(this,_loc3_);
   this.Fights = new dofus.aks.Fights(this,_loc3_);
   this.Tutorial = new dofus.aks.Tutorial(this,_loc3_);
   this.Quests = new dofus.aks.Quests(this,_loc3_);
   this.Party = new dofus.aks.Party(this,_loc3_);
   this.Subway = new dofus.aks.Subway(this,_loc3_);
   this.Mount = new dofus.aks.Mount(this,_loc3_);
   this.Conquest = new dofus.aks.Conquest(this,_loc3_);
   this.ChooseReward = new dofus.aks.ChooseReward(this,_loc3_);
   this.Ping = new Object();
   this.Lag = new Object();
   this.Deco = new Object();
   this._bLag = false;
   this._bAutoReco = this.api.lang.getConfigText("AUTO_RECONNECT") == true;
   this._oDataProcessor = new dofus.aks["\x11\f"](this,_loc3_);
   this._xSocket = new XMLSocket();
   this._aLastPings = new Array();
   var aks = this;
   this._xSocket.onClose = function()
   {
      aks.onClose();
      aks.resetKeys();
   };
   this._xSocket.onConnect = function(_loc2_)
   {
      aks.onConnect(_loc2_);
   };
   this._xSocket.onData = function(_loc2_)
   {
      aks.onData(_loc2_);
   };
   this._oLoader = new LoadVars();
   this._oLoader.onLoad = function(_loc2_)
   {
      aks.onLoad(_loc2_);
   };
};
_loc1.send2 = function(heroID, _loc2, _loc3, _loc4, _loc5, _loc6)
{
   _global.HERO_ID = heroID;
   this.send(_loc2,_loc3,_loc4,_loc5,_loc6);
};
_loc1.send = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_)
{
   if(_global.HERO_ID)
   {
      _loc2_ = "-" + _global.HERO_ID + "|" + _loc2_;
      _global.HERO_ID = undefined;
   }
   if(_loc5_ != true && _loc2_.length > dofus.Constants.MAX_MESSAGE_LENGTH)
   {
      _loc2_ = _loc2_.substring(0,dofus.Constants.MAX_MESSAGE_LENGTH - 1);
   }
   this.api.kernel.GameManager.signalActivity();
   if(_loc3_ || _loc3_ == undefined)
   {
      if(_loc4_ != undefined)
      {
         this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:_loc4_},{bAlwaysOnTop:true,bForceLoad:true});
      }
      this._sDebug = _loc2_;
      this.api.ui.loadUIComponent("Waiting","Waiting");
      this._isWaitingForData = true;
      if(this.api.datacenter.Basics.inGame && this._bAutoReco)
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this.Lag,"lag",this,this.onLag,Number(this.api.lang.getConfigText("DELAY_RECO_MESSAGE")));
      }
   }
   if(dofus.Constants.DEBUG_DATAS)
   {
      this.api.electron.debugRequest(true,_loc2_);
   }
   if(this.api.datacenter.Basics.inGame && this.api.datacenter.Player.sessionToken)
   {
      if(_loc2_.indexOf("*") === -1)
      {
         _loc2_ += "*" + this.api.datacenter.Player.sessionToken;
      }
   }
   if(!_loc6_)
   {
      _loc2_ = this.prepareData(_loc2_);
   }
   if(_loc2_.charAt(_loc2_.length - 1) != "\n")
   {
      _loc2_ += "\n";
   }
   this._xSocket.send(_loc2_);
   if(_loc3_ || _loc3_ == undefined)
   {
      this._nLastWaitingSend = getTimer();
   }
};
