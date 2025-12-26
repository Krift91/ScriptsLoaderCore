class dofus.§\r\x14§.gapi.ui.AutomaticServer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _eaServers;
   var _nRemainingTime;
   var _mcAutomaticSelect;
   var _mcManualSelect;
   var _taTitleLong;
   var _mcBgTitle;
   var _lblTitle;
   var _mcBgLongTitle;
   var _lblCopyright;
   var _lblAutomaticSelect;
   var _lblManualSelect;
   var _eaPreselectedServers;
   static var CLASS_NAME = "AutomaticServer";
   function AutomaticServer()
   {
      super();
   }
   function set servers(§\x0f\x16§)
   {
      this._eaServers = _loc2_;
   }
   function set remainingTime(§\x1e\x1e\n§)
   {
      this._nRemainingTime = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.AutomaticServer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function addListeners()
   {
      this._mcAutomaticSelect.onRelease = function()
      {
         this._parent.click({target:this});
      };
      this._mcManualSelect.onRelease = function()
      {
         this._parent.click({target:this});
      };
   }
   function initTexts()
   {
      if(this.api.datacenter.Basics.first_connection_from_miniclip)
      {
         this._taTitleLong.text = this.api.lang.getText("SERVER_FIRST_CONNECTION_MINICLIP");
         this._mcBgTitle._visible = false;
      }
      else
      {
         this._lblTitle.text = this.api.lang.getText("CHOOSE_GAME_SERVER");
         this._mcBgLongTitle._visible = false;
      }
      this._lblCopyright.text = this.api.lang.getText("COPYRIGHT");
      this._lblAutomaticSelect.text = this.api.lang.getText("AUTOMATIC_SERVER_SELECTION");
      this._lblManualSelect.text = this.api.lang.getText("MANUAL_SERVER_SELECT");
   }
   function getLessPopulatedServer(§\x0f\x16§)
   {
      if(_loc2_.length == 1)
      {
         return _loc2_[0].id;
      }
      _loc2_.sortOn("populationWeight",Array.NUMERIC | Array.ASCENDING);
      var _loc3_ = _loc2_[0].populationWeight;
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = 0;
      while(_loc5_ < _loc2_.length)
      {
         if(_loc2_[_loc5_].populationWeight == _loc3_)
         {
            _loc4_.push(_loc2_[_loc5_]);
         }
         _loc5_ = _loc5_ + 1;
      }
      _loc4_.sortOn("completion",Array.NUMERIC | Array.ASCENDING);
      var _loc6_ = _loc4_[0].completion;
      var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc8_ = 0;
      while(_loc8_ < _loc4_.length)
      {
         if(_loc4_[_loc8_].completion == _loc6_)
         {
            _loc7_.push(_loc4_[_loc8_]);
         }
         _loc8_ = _loc8_ + 1;
      }
      return _loc7_[Math.round(Math.random() * (_loc7_.length - 1))].id;
   }
   function selectServer(§\x1e\x1d\x11§)
   {
      this.gapi.loadUIComponent("ServerInformations","ServerInformations",{server:_loc2_});
      this.gapi.getUIComponent("ServerInformations").addEventListener("serverSelected",this);
      this.gapi.getUIComponent("ServerInformations").addEventListener("canceled",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_mcAutomaticSelect":
            var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
            var _loc4_ = 0;
            while(_loc4_ < this._eaServers.length)
            {
               if(this._eaServers[_loc4_].state == dofus.datacenter["\x1e\x12\x12"].SERVER_ONLINE && this._eaServers[_loc4_].isAllowed())
               {
                  _loc3_.push(this._eaServers[_loc4_]);
               }
               _loc4_ = _loc4_ + 1;
            }
            if(_loc3_.length <= 0)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("ALL_SERVERS_ARE_DOWN"),"ERROR_BOX");
               break;
            }
            var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
            var _loc6_ = 0;
            while(_loc6_ < _loc3_.length)
            {
               if(_loc3_[_loc6_].canLog && (_loc3_[_loc6_].typeNum == dofus.datacenter["\x1e\x12\x12"].SERVER_CLASSIC || _loc3_[_loc6_].typeNum == dofus.datacenter["\x1e\x12\x12"].SERVER_RETRO))
               {
                  _loc5_.push(_loc3_[_loc6_]);
               }
               _loc6_ = _loc6_ + 1;
            }
            _loc3_ = _loc5_;
            if(_loc3_.length <= 0)
            {
               if(this._nRemainingTime <= 0)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("ALL_SERVERS_ARE_FULL_NOT_FULL_MEMBER"),"ERROR_BOX");
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("ALL_SERVERS_ARE_FULL_FULL_MEMBER"),"ERROR_BOX");
               }
               break;
            }
            this._eaPreselectedServers = _loc3_;
            _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
            var _loc7_ = 0;
            while(_loc7_ < _loc3_.length)
            {
               if(_loc3_[_loc7_].community == this.api.datacenter.Basics.communityId || _loc3_[_loc7_].community == dofus.datacenter["\x1e\x12\x12"].SERVER_COMMUNITY_INTERNATIONAL)
               {
                  _loc5_.push(_loc3_[_loc7_]);
               }
               _loc7_ = _loc7_ + 1;
            }
            _loc3_ = _loc5_;
            if(_loc3_.length <= 0)
            {
               if(this._nRemainingTime <= 0)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("COMMUNITY_IS_FULL_NOT_FULL_MEMBER"),"CAUTION_YESNO",{name:"automaticServer",listener:this});
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("COMMUNITY_IS_FULL_FULL_MEMBER"),"CAUTION_YESNO",{name:"automaticServer",listener:this});
               }
               break;
            }
            this.selectServer(this.getLessPopulatedServer(_loc3_));
            break;
         case "_mcManualSelect":
            this.api.datacenter.Basics.forceManualServerSelection = true;
            this.api.network.Account.getServersList();
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = 0;
      while(_loc4_ < this._eaPreselectedServers.length)
      {
         if(this._eaPreselectedServers[_loc4_].community == dofus.datacenter["\x1e\x12\x12"].SERVER_COMMUNITY_INTERNATIONAL)
         {
            _loc3_.push(this._eaPreselectedServers[_loc4_]);
         }
         _loc4_ = _loc4_ + 1;
      }
      if(_loc3_.length > 0)
      {
         this.selectServer(this.getLessPopulatedServer(_loc3_));
      }
      else
      {
         this.selectServer(this.getLessPopulatedServer(this._eaPreselectedServers));
      }
   }
   function serverSelected(§\x1e\x19\x0e§)
   {
      this.gapi.unloadUIComponent("ServerInformations");
      var _loc3_ = new dofus.datacenter["\x1e\x12\x12"](_loc2_.value,1,0);
      if(_loc3_.isAllowed())
      {
         this.api.datacenter.Basics.aks_current_server = _loc3_;
         this.api.datacenter.Basics.createCharacter = true;
         this.api.network.Account.setServer(_loc2_.value);
      }
      else
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("SERVER_NOT_ALLOWED_IN_YOUR_LANGUAGE"),"ERROR_BOX");
      }
   }
   function canceled(§\x1e\x19\x0e§)
   {
      this.gapi.unloadUIComponent("ServerInformations");
   }
}
