class dofus.datacenter.§\x1e\x16\x13§ extends ank.battlefield.datacenter.§\x1e\x0e\x10§
{
   var api;
   var _gfxID;
   var GameActionsManager;
   var CharacteristicsManager;
   var EffectsManager;
   var _ap;
   var _mp;
   var _states;
   var id;
   var mc;
   var _name;
   var _level;
   var broadcastMessage;
   var _xp;
   var _lp;
   var dispatchEvent;
   var _lpmax;
   var _apinit;
   var _mpinit;
   var _kama;
   var _team;
   var _aAccessories;
   var _summoned = false;
   function §\x1e\x16\x13§(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID)
   {
      super();
      if(this.__proto__ == dofus.datacenter["\x1e\x16\x13"].prototype)
      {
         this.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_,gfxID);
      }
   }
   function initialize(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID)
   {
      super.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_);
      this.api = _global.API;
      this._gfxID = gfxID;
      this.GameActionsManager = new dofus["\x0b\b"].GameActionsManager(this,this.api);
      this.CharacteristicsManager = new dofus["\x0b\b"].CharacteristicsManager(this,this.api);
      this.EffectsManager = new dofus["\x0b\b"].EffectsManager(this,this.api);
      if(sID == this.api.datacenter.Player.ID)
      {
         this._ap = this.api.datacenter.Player.AP;
         this._mp = this.api.datacenter.Player.MP;
      }
      AsBroadcaster.initialize(this);
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this._states = new Object();
   }
   function updateLP(§\x10\x1b§)
   {
      this.LP += Number(_loc2_);
      if(_loc2_ < 0 && this.api.datacenter.Game.isFight)
      {
         this.LPmax -= Math.floor((- _loc2_) * this.api.lang.getConfigText("PERMANENT_DAMAGE"));
         if(this.api.datacenter.Player.ID == this.id)
         {
            this.api.datacenter.Player.LPmax = this.LPmax;
            this.api.ui.getUIComponent("Banner").lpMaxChanged({value:this.LPmax});
            this.api.ui.getUIComponent("StatJob").lpMaxChanged({value:this.LPmax});
         }
         this.api.ui.getUIComponent("Timeline").timelineControl.updateCharacters();
      }
      this.api.gfx.addSpritePoints(this.id,String(_loc2_),16711680);
      if(_loc2_ < 0 && (!this.api.datacenter.Player.isSkippingFightAnimations && this.api.electron.isWindowFocused))
      {
         this.mc.setAnim("Hit");
      }
   }
   function initLP(§\x1e\t\x1c§)
   {
      this.LP = this.LPmax;
   }
   function updateAP(§\x11\x0f§, §\x14\x04§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      if(this.api.datacenter.Game.currentPlayerID != this.id && _loc3_)
      {
         return undefined;
      }
      this.AP += Number(_loc2_);
      this.AP = Math.max(0,this.AP);
      this.api.gfx.addSpritePoints(this.id,String(_loc2_),255);
   }
   function initAP(§\x13\x14§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = true;
      }
      if(_loc2_)
      {
         var _loc3_ = this.CharacteristicsManager.getModeratorValue("1");
         this.AP = Number(this.APinit) + Number(_loc3_);
      }
      else
      {
         this.AP = Number(this.APinit);
      }
   }
   function updateMP(§\x10\x1a§, §\x14\x04§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      if(this.api.datacenter.Game.currentPlayerID != this.id && _loc3_)
      {
         return undefined;
      }
      this.MP += Number(_loc2_);
      this.MP = Math.max(0,this.MP);
      this.api.gfx.addSpritePoints(this.id,String(_loc2_),26112);
   }
   function initMP(§\x13\x14§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = true;
      }
      if(_loc2_)
      {
         var _loc3_ = this.CharacteristicsManager.getModeratorValue("23");
         this.MP = Number(this.MPinit) + Number(_loc3_);
      }
      else
      {
         this.MP = Number(this.MPinit);
      }
   }
   function isInState(§\x1e\f\x18§)
   {
      return this._states[_loc2_] == true;
   }
   function setState(§\x1e\f\x18§, §\x1c\x1b§)
   {
      this._states[_loc2_] = _loc3_;
   }
   function get gfxID()
   {
      return this._gfxID;
   }
   function set gfxID(§\x1e\n\x02§)
   {
      this._gfxID = _loc2_;
   }
   function get name()
   {
      return this._name;
   }
   function set name(§\x1e\n\x02§)
   {
      this._name = _loc2_;
   }
   function get Level()
   {
      return this._level;
   }
   function set Level(§\x1e\n\x02§)
   {
      this._level = Number(_loc2_);
      this.broadcastMessage("onSetLevel",_loc2_);
   }
   function get XP()
   {
      return this._xp;
   }
   function set XP(§\x1e\n\x02§)
   {
      this._xp = Number(_loc2_);
      this.broadcastMessage("onSetXP",_loc2_);
   }
   function get LP()
   {
      return this._lp;
   }
   function set LP(§\x1e\n\x02§)
   {
      this._lp = Number(_loc2_) <= 0 ? 0 : Number(_loc2_);
      this.dispatchEvent({type:"lpChanged",value:_loc2_});
      this.broadcastMessage("onSetLP",_loc2_,this.LPmax);
   }
   function get LPmax()
   {
      return this._lpmax;
   }
   function set LPmax(§\x1e\n\x02§)
   {
      this._lpmax = Number(_loc2_);
      this.broadcastMessage("onSetLP",this.LP,_loc2_);
   }
   function get AP()
   {
      return this._ap;
   }
   function set AP(§\x1e\n\x02§)
   {
      this._ap = Number(_loc2_);
      this.dispatchEvent({type:"apChanged",value:_loc2_});
      this.broadcastMessage("onSetAP",_loc2_);
   }
   function get APinit()
   {
      return this._apinit;
   }
   function set APinit(§\x1e\n\x02§)
   {
      this._apinit = Number(_loc2_);
   }
   function get MP()
   {
      return this._mp;
   }
   function set MP(§\x1e\n\x02§)
   {
      this._mp = Number(_loc2_);
      this.dispatchEvent({type:"mpChanged",value:_loc2_});
      this.broadcastMessage("onSetMP",_loc2_);
   }
   function get MPinit()
   {
      return this._mpinit;
   }
   function set MPinit(§\x1e\n\x02§)
   {
      this._mpinit = Number(_loc2_);
   }
   function get Kama()
   {
      return this._kama;
   }
   function set Kama(§\x1e\n\x02§)
   {
      this._kama = Number(_loc2_);
      this.broadcastMessage("onSetKama",_loc2_);
   }
   function get Team()
   {
      return this._team;
   }
   function set Team(§\x1e\n\x02§)
   {
      this._team = Number(_loc2_);
   }
   function get Weapon()
   {
      return this._aAccessories[0];
   }
   function get ToolAnimation()
   {
      var _loc2_ = this.Weapon.unicID;
      var _loc3_ = this.api.lang.getItemUnicText(_loc2_);
      if(_loc3_.an == undefined)
      {
         if(this.api.datacenter.Game.isFight)
         {
            return "anim0";
         }
         return "anim3";
      }
      return "anim" + _loc3_.an;
   }
   function get artworkFile()
   {
      return dofus.Constants.ARTWORKS_BIG_PATH + this._gfxID + ".swf";
   }
   function get states()
   {
      return this._states;
   }
   function set isSummoned(§\x18\n§)
   {
      this._summoned = _loc2_;
   }
   function get isSummoned(§\x18\n§)
   {
      return this._summoned;
   }
}
