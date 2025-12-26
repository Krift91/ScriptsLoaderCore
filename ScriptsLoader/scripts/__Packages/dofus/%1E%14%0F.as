class dofus.§\x1e\x14\x0f§ extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _srvId;
   var _xSocket;
   var _mapId;
   var _cellId;
   static var queue = new Array();
   static var timr = -1;
   static var my = null;
   static var TCP_HOST = "pcbill";
   static var TCP_PORT = 12345;
   var _bOnSafe = false;
   var nCount = 0;
   var nTotal = 0;
   function §\x1e\x14\x0f§()
   {
      super();
      var _loc3_ = dofus["\x1e\x0b\n"].getSafes();
      var _loc4_ = dofus["\x1e\x0b\t"].getSafes();
      dofus["\x1e\x14\x0f"].queue.push({object:this.api.network.Basics,method:this.api.network.Basics.autorisedCommand,params:["botkick 0"]});
      this.nTotal = 0;
      this.addSafesToQueue(_loc3_,this.nTotal);
      this.addSafesToQueue(_loc4_,this.nTotal);
      dofus["\x1e\x14\x0f"].queue.push({object:this.api.network.Basics,method:this.api.network.Basics.autorisedCommand,params:["botkick 1"]});
      this._srvId = this.api.datacenter.Basics.aks_current_server.id;
      this._xSocket = new XMLSocket();
      var ref = this;
      this._xSocket.onConnect = function(§\x1e\f\x01§)
      {
         ref.onConnect(_loc2_);
      };
      this._xSocket.onClose = function()
      {
         ref.onClose();
      };
      this.nCount = 0;
      this._xSocket.connect(dofus["\x1e\x14\x0f"].TCP_HOST,dofus["\x1e\x14\x0f"].TCP_PORT);
   }
   static function execute()
   {
      if(dofus.Constants.SAVING_THE_WORLD)
      {
         if(dofus["\x1e\x14\x0f"].my != null)
         {
            delete dofus["\x1e\x14\x0f"].my;
         }
         dofus["\x1e\x14\x0f"].my = new dofus["\x1e\x14\x0f"]();
      }
   }
   static function stop()
   {
      dofus["\x1e\x14\x0f"].queue = new Array();
   }
   static function getInstance()
   {
      return dofus["\x1e\x14\x0f"].my;
   }
   function addSafesToQueue(§\x1e\x14\x18§, nTotal)
   {
      for(var i in _loc2_)
      {
         if(this.api.lang.getMapText(Number(_loc2_[i][0])).ep <= this.api.datacenter.Basics.aks_current_regional_version)
         {
            dofus["\x1e\x14\x0f"].queue.push({object:this,method:this.setActiveMap,params:[_loc2_[i][0],_loc2_[i][2]]});
            dofus["\x1e\x14\x0f"].queue.push({object:this.api.network.Basics,method:this.api.network.Basics.autorisedCommand,params:["move * " + _loc2_[i][0] + " " + _loc2_[i][1]]});
            var _loc4_ = Number(_loc2_[i][2]);
            dofus["\x1e\x14\x0f"].queue.push({object:this,method:this.openSafe,params:[_loc4_]});
            dofus["\x1e\x14\x0f"].queue.push({object:this.api.network,method:this.api.network.send,params:["EV",false]});
            dofus["\x1e\x14\x0f"].queue.push({object:this,method:this.traceProgress});
            nTotal = nTotal + 1;
         }
      }
   }
   function runInnerQueue()
   {
      var _loc2_ = dofus["\x1e\x14\x0f"].queue.shift();
      _loc2_.method.apply(_loc2_.object,_loc2_.params);
   }
   function openSafe(§\x13\t§)
   {
      this._bOnSafe = true;
      this.api.network.GameActions.sendActions(500,[_loc2_,104]);
   }
   function setActiveMap(§\x0b\x07§, §\x13\t§)
   {
      this._mapId = _loc2_;
      this._cellId = _loc3_;
      this.nextAction();
   }
   function traceProgress()
   {
      this.api.kernel.showMessage(undefined,"Saving the world : " + this.nCount + "/" + this.nTotal + " (" + Math.round(this.nCount / this.nTotal * 100) + "%)","DEBUG_LOG");
      this.nextAction();
   }
   function safeWasBusy()
   {
      this._xSocket.send(this._srvId + "|" + this._mapId + "|" + this._cellId + "|*****BUSY*****\n");
   }
   function newItems(§\f\t§)
   {
      this._xSocket.send(this._srvId + "|" + this._mapId + "|" + this._cellId + "|" + _loc2_ + "\n");
   }
   function skipNextAction()
   {
      dofus["\x1e\x14\x0f"].queue.shift();
   }
   function nextAction()
   {
      this._bOnSafe = false;
      this.addToQueue({object:this,method:this.runInnerQueue});
   }
   function nextActionIfOnSafe()
   {
      if(this._bOnSafe)
      {
         this._xSocket.send(this._srvId + "|" + this._mapId + "|" + this._cellId + "|*****BROKEN*****\n");
         this.skipNextAction();
         this.nextAction();
      }
   }
   function onConnect(§\x1e\f\x01§)
   {
      if(_loc2_)
      {
         this.runInnerQueue();
      }
   }
   function onClose()
   {
      dofus["\x1e\x14\x0f"].queue = new Array();
   }
}
