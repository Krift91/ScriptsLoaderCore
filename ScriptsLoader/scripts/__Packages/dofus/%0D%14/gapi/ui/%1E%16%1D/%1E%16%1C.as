class dofus.§\r\x14§.gapi.ui.§\x1e\x16\x1d§.§\x1e\x16\x1c§ extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oSprite;
   var _bIsFollowing;
   var _mcFollow;
   var _bIsLeader;
   var _mcLeader;
   var _bIsInGroup;
   var _mcHealth;
   var _mcBack;
   var _btn;
   var _ldrSprite;
   function §\x1e\x16\x1c§()
   {
      super();
   }
   function set data(oSprite)
   {
      this._oSprite = oSprite;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   function set isFollowing(§\x18\x0f§)
   {
      this._bIsFollowing = _loc2_;
      this._mcFollow._visible = _loc2_;
   }
   function set isLeader(§\x18\r§)
   {
      this._bIsLeader = _loc2_;
      this._mcLeader._visible = _loc2_;
   }
   function get isLeader()
   {
      return this._bIsLeader;
   }
   function get isInGroup(§\x18\x0e§)
   {
      return this._bIsInGroup;
   }
   function setHealth(oSprite)
   {
      if(oSprite.life == undefined)
      {
         return undefined;
      }
      var _loc3_ = oSprite.life.split(",");
      this._mcHealth._yscale = _loc3_[0] / _loc3_[1] * 100;
      this._oSprite.life = oSprite.life;
   }
   function setData(oSprite)
   {
      if(this.doReload(oSprite))
      {
         this._oSprite = oSprite;
         if(this.initialized)
         {
            this.updateData();
         }
      }
      else
      {
         this.setHealth(oSprite);
      }
   }
   function doReload(oSprite)
   {
      var _loc3_ = true;
      if(this._oSprite.accessories && (oSprite.accessories.length == this._oSprite.accessories.length && oSprite.id == this._oSprite.id))
      {
         var _loc4_ = this._oSprite.accessories;
         var _loc5_ = oSprite.accessories;
         var _loc6_ = new Array();
         var _loc7_ = new Array();
         for(var i in _loc4_)
         {
            _loc6_.push(_loc4_[i].unicID);
         }
         for(var i in _loc5_)
         {
            _loc7_.push(_loc5_[i].unicID);
         }
         _loc6_.sort();
         _loc7_.sort();
         _loc3_ = !_loc6_ || _loc6_.join(",") != _loc7_.join(",");
      }
      return _loc3_;
   }
   function init()
   {
      super.init(false);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this._mcBack._visible = false;
      this._mcFollow._visible = false;
      this._mcHealth._visible = false;
      this._btn._visible = false;
   }
   function addListeners()
   {
      this._ldrSprite.addEventListener("initialization",this);
      this._btn.addEventListener("over",this);
      this._btn.addEventListener("out",this);
      this._btn.addEventListener("click",this);
   }
   function updateData()
   {
      if(this._oSprite != undefined)
      {
         this._ldrSprite.contentPath = this._oSprite.gfxFile != undefined ? this._oSprite.gfxFile : "";
         this.api.colors.addSprite(this._ldrSprite,this._oSprite);
         this._mcBack._visible = true;
         this._btn.enabled = true;
         this._btn._visible = true;
         this._mcHealth._visible = true;
         this.setHealth(this._oSprite.life);
         this._bIsInGroup = true;
         this._visible = true;
      }
      else
      {
         this._ldrSprite.contentPath = "";
         this._mcBack._visible = false;
         this._mcFollow._visible = false;
         this._btn.enabled = false;
         this._btn._visible = false;
         this._mcHealth._visible = false;
         this._bIsInGroup = false;
         this._visible = false;
      }
   }
   function isLocalPlayerLeader()
   {
      return this._parent.leaderID == this.api.datacenter.Player.ID;
   }
   function isLocalPlayer()
   {
      return this._oSprite.id == this.api.datacenter.Player.ID;
   }
   function partyWhere()
   {
      this.api.network.Party.where();
      this.api.ui.loadUIAutoHideComponent("MapExplorer","MapExplorer");
   }
   function initialization(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.content;
      _loc3_.attachMovie("staticR","anim",10);
      _loc3_._xscale = -65;
      _loc3_._yscale = 65;
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._oSprite.life.split(",");
      this._mcHealth._yscale = _loc3_[0] / _loc3_[1] * 100;
      this.gapi.showTooltip(this._oSprite.name + "\n" + this.api.lang.getText("LEVEL") + " : " + this._oSprite.level + "\n" + this.api.lang.getText("LIFEPOINTS") + " : " + _loc3_[0] + " / " + _loc3_[1],_loc2_.target,30);
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function click(§\x1e\x19\x0e§)
   {
      this.api.kernel.GameManager.showPlayerPopupMenu(undefined,this._oSprite.name,this);
   }
   function addPartyMenuItems(§\x1e\x16\x0e§)
   {
      _loc2_.addStaticItem(this.api.lang.getText("PARTY"));
      _loc2_.addItem(this.api.lang.getText("PARTY_WHERE"),this,this.partyWhere,[]);
      if(this._oSprite.id == this.api.datacenter.Player.ID)
      {
         _loc2_.addItem(this.api.lang.getText("LEAVE_PARTY"),this.api.network.Party,this.api.network.Party.leave,[]);
         if(this.isLocalPlayerLeader())
         {
            if(this._bIsFollowing)
            {
               _loc2_.addItem(this.api.lang.getText("PARTY_STOP_FOLLOW_ME_ALL"),this.api.network.Party,this.api.network.Party.followAll,[true,this._oSprite.id]);
            }
            else
            {
               _loc2_.addItem(this.api.lang.getText("PARTY_FOLLOW_ME_ALL"),this.api.network.Party,this.api.network.Party.followAll,[false,this._oSprite.id]);
            }
         }
      }
      else
      {
         if(this.isLocalPlayer)
         {
            if(this._bIsFollowing)
            {
               _loc2_.addItem(this.api.lang.getText("STOP_FOLLOW"),this.api.network.Party,this.api.network.Party.follow,[true,this._oSprite.id]);
            }
            else
            {
               _loc2_.addItem(this.api.lang.getText("FOLLOW"),this.api.network.Party,this.api.network.Party.follow,[false,this._oSprite.id]);
            }
         }
         if(this.isLocalPlayerLeader())
         {
            if(this._bIsFollowing)
            {
               _loc2_.addItem(this.api.lang.getText("PARTY_STOP_FOLLOW_HIM_ALL"),this.api.network.Party,this.api.network.Party.followAll,[true,this._oSprite.id]);
            }
            else
            {
               _loc2_.addItem(this.api.lang.getText("PARTY_FOLLOW_HIM_ALL"),this.api.network.Party,this.api.network.Party.followAll,[false,this._oSprite.id]);
            }
            _loc2_.addItem(this.api.lang.getText("KICK_FROM_PARTY"),this.api.network.Party,this.api.network.Party.leave,[this._oSprite.id]);
         }
      }
   }
}
