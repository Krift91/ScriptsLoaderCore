class dofus.§\r\x14§.gapi.controls.ChooseCharacterSprite extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _bShowComboBox;
   var _oData;
   var _bDeleteButton;
   var _btnDelete;
   var _ldrSprite;
   var _ldrMerchant;
   var _mcGround;
   var _btnReset;
   var _dcCharacter;
   var onEnterFrame;
   var _cbServers;
   var _ctrServerState;
   var _mcInteraction;
   var launchAnimCharacter;
   var _mcUnknown;
   var _lblName;
   var _lblLevel;
   var _mcStateBack;
   var _nServerID;
   var _oServer;
   var _lblServer;
   var _mcSelect;
   var _nIntervalID;
   var _sDir;
   var _bFlip;
   var _sOldAnim;
   var _mcSprite;
   var dispatchEvent;
   static var CLASS_NAME = "ChooseCharacterSprite";
   static var DEATH_ALPHA = 40;
   var _bSelected = false;
   var _bOver = false;
   var _isDead = false;
   var _nDeathState = 0;
   var _nCurrAlpha = dofus["\r\x14"].gapi.controls.ChooseCharacterSprite.DEATH_ALPHA;
   var _nCurrAlphaStep = -1;
   function ChooseCharacterSprite()
   {
      super();
   }
   function set showComboBox(§\x15\f§)
   {
      this._bShowComboBox = _loc2_;
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oData = _loc2_;
      this.updateData();
   }
   function get data()
   {
      return this._oData;
   }
   function set selected(§\x15\x14§)
   {
      this._bSelected = _loc2_;
      this.updateSelected(!_loc2_ ? this.getStyle().overcolor : this.getStyle().selectedcolor);
   }
   function get selected()
   {
      return this._bSelected;
   }
   function set deleteButton(§\x15\x0e§)
   {
      this._bDeleteButton = _loc2_;
      this._btnDelete._visible = _loc2_;
   }
   function get deleteButton()
   {
      return this._bDeleteButton;
   }
   function set isDead(§\x18\x11§)
   {
      this._isDead = _loc2_;
      if(this._isDead)
      {
         var _loc3_ = {ra:dofus["\r\x14"].gapi.controls.ChooseCharacterSprite.DEATH_ALPHA,rb:100,ga:dofus["\r\x14"].gapi.controls.ChooseCharacterSprite.DEATH_ALPHA,gb:100,ba:dofus["\r\x14"].gapi.controls.ChooseCharacterSprite.DEATH_ALPHA,bb:100};
      }
      else
      {
         _loc3_ = {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0};
      }
      var _loc4_ = new Color(this._ldrSprite);
      _loc4_.setTransform(_loc3_);
      _loc4_ = new Color(this._ldrMerchant);
      _loc4_.setTransform(_loc3_);
      _loc4_ = new Color(this._mcGround._mcGround);
      _loc4_.setTransform(_loc3_);
      this._btnReset._visible = this._isDead;
      this._dcCharacter._visible = this._isDead;
   }
   function get isDead()
   {
      return this._isDead && this._isDead != undefined;
   }
   function set death(§\x06\x0e§)
   {
      this._dcCharacter.death = _loc2_;
      this._dcCharacter._alpha = 50;
   }
   function set deathState(§\x1e\x1c\x17§)
   {
      this._nDeathState = _loc2_;
      var ref = this;
      if(this._nDeathState == 2)
      {
         this.onEnterFrame = function()
         {
            ref._nCurrAlpha += ref._nCurrAlphaStep;
            var _loc2_ = ref._nCurrAlpha;
            if(ref._nCurrAlpha == 0)
            {
               ref._nCurrAlphaStep = 1;
            }
            if(ref._nCurrAlpha == 40)
            {
               ref._nCurrAlphaStep = -1;
            }
            var _loc3_ = {ra:_loc2_,rb:100,ga:_loc2_,gb:100,ba:_loc2_,bb:100};
            var _loc4_ = new Color(ref._ldrSprite);
            _loc4_.setTransform(_loc3_);
            _loc4_ = new Color(ref._ldrMerchant);
            _loc4_.setTransform(_loc3_);
            _loc4_ = new Color(ref._mcGround._mcGround);
            _loc4_.setTransform(_loc3_);
         };
      }
      else
      {
         delete this.onEnterFrame;
      }
   }
   function get deathState()
   {
      return this._nDeathState;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.ChooseCharacterSprite.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this._btnDelete._visible = false;
      this._btnReset._visible = false;
   }
   function addListeners()
   {
      this._ldrSprite.addEventListener("initialization",this);
      this._btnDelete.addEventListener("click",this);
      this._btnDelete.addEventListener("over",this);
      this._btnDelete.addEventListener("out",this);
      this._btnReset.addEventListener("click",this);
      this._btnReset.addEventListener("over",this);
      this._btnReset.addEventListener("out",this);
      this._cbServers.addEventListener("itemSelected",this);
      this._ctrServerState.addEventListener("over",this);
      this._ctrServerState.addEventListener("out",this);
      this.api.datacenter.Basics.aks_servers.addEventListener("modelChanged",this);
      Key.addListener(this);
   }
   function initData()
   {
      this.updateData();
   }
   function setEnabled()
   {
      if(this._bEnabled)
      {
         this._mcInteraction.launchAnimCharacter = function()
         {
            this._parent.onEnterFrame = this._parent.animCharacter;
         };
         this._mcInteraction.onPress = function()
         {
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"AnimCharacter",this,this.launchAnimCharacter,500);
         };
         this._mcInteraction.onRelease = function()
         {
            delete this._parent.onEnterFrame;
            this._parent.innerRelease();
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this,"AnimCharacter");
         };
         this._mcInteraction.onRollOver = this._mcInteraction.onDragOver = function()
         {
            this._parent.innerOver();
         };
         this._mcInteraction.onRollOut = this._mcInteraction.onReleaseOutside = function()
         {
            delete this._parent.onEnterFrame;
            this._parent.innerOut();
         };
         this._mcInteraction.onDragOut = function()
         {
            this._parent.innerOut();
         };
         this._mcUnknown._visible = false;
      }
      else
      {
         delete this._mcInteraction.onRelease;
         delete this._mcInteraction.onRollOver;
         delete this._mcInteraction.onRollOut;
         delete this._mcInteraction.onReleaseOutside;
         delete this._mcInteraction.onPress;
         delete this._mcInteraction.onDragOut;
         delete this._mcInteraction.onDragOver;
         this._mcUnknown._visible = true;
         this.selected = false;
      }
      this.isDead = this._isDead;
   }
   function updateData()
   {
      if(this._oData != undefined)
      {
         this._lblName.text = this._oData.name;
         this._lblLevel.text = this._oData.Level == undefined ? this._oData.title : this.api.lang.getText("LEVEL") + " " + this._oData.Level;
         if(this._oData.Merchant)
         {
            this._ldrMerchant.contentPath = dofus.Constants.EXTRA_PATH + "0.swf";
         }
         this._ldrSprite.forceReload = true;
         this._ldrSprite.contentPath = this._oData.gfxFile;
         this._btnDelete._visible = this._bDeleteButton;
         this._cbServers._visible = true;
         this.updateServer(this._oData.serverID);
         this._mcStateBack._visible = true;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._lblLevel.text = "";
         this._ldrSprite.forceReload = true;
         this._ldrSprite.contentPath = "";
         this._btnDelete._visible = false;
         this._cbServers._visible = false;
         this._ctrServerState.contentPath = "";
         this._mcStateBack._visible = false;
      }
   }
   function updateServer(§\x1e\x1d\x11§)
   {
      if(_loc2_ != undefined)
      {
         this._nServerID = _loc2_;
      }
      var _loc3_ = this.api.datacenter.Basics.aks_servers;
      var _loc4_ = 0;
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         var _loc6_ = _loc3_[_loc5_].id;
         if(_loc6_ == this._nServerID)
         {
            _loc4_ = _loc5_;
            this._oServer = _loc3_[_loc5_];
            break;
         }
         _loc5_ = _loc5_ + 1;
      }
      var _loc7_ = _loc3_[_loc4_];
      if(_loc7_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("Serveur " + this._nServerID + " inconnu");
      }
      else
      {
         this.enabled = _loc7_.state == dofus.datacenter["\x1e\x12\x12"].SERVER_ONLINE;
         this._ctrServerState.contentPath = "ChooseCharacterServerState" + _loc7_.state;
      }
      if(this._bShowComboBox && this._lblServer.text != undefined)
      {
         this._cbServers.dataProvider = _loc3_;
         this._cbServers.selectedIndex = _loc4_;
         this._cbServers.buttonIcon = "ComboBoxButtonNormalIcon";
         this._lblServer.text = "";
         this._cbServers.enabled = true;
      }
      else
      {
         this._cbServers.buttonIcon = "";
         this._lblServer.text = _loc7_.label;
         this._cbServers.enabled = false;
      }
   }
   function updateSelected(§\x06\x1d§)
   {
      if(this._bSelected || this._bOver && this._bEnabled)
      {
         this.setMovieClipColor(this._mcSelect,_loc2_);
         this._mcSelect.gotoAndPlay(1);
         this._mcSelect._visible = true;
      }
      else
      {
         this._mcSelect.stop();
         this._mcSelect._visible = false;
      }
   }
   function changeSpriteOrientation(§\n\x0e§)
   {
      _global.clearInterval(this._nIntervalID);
      var _loc3_ = _loc2_.attachMovie("staticF","mcAnim",10);
      if(!_loc3_)
      {
         _loc3_ = _loc2_.attachMovie("staticR","mcAnim",10);
      }
      if(!_loc3_)
      {
         this.addToQueue({object:this,method:this.changeSpriteOrientation,params:[_loc2_]});
      }
   }
   function animCharacter(§\b\x13§, §\x1a\x02§)
   {
      var _loc4_ = 55;
      var _loc5_ = 100;
      if(_loc2_ == undefined)
      {
         _loc2_ = Math.atan2(this._ymouse - _loc5_,this._xmouse - _loc4_);
      }
      this._sDir = "F";
      this._bFlip = false;
      var _loc6_ = Math.PI / 8;
      if(_loc2_ < -9 * _loc6_)
      {
         this._sDir = "S";
         this._bFlip = true;
      }
      else if(_loc2_ < -5 * _loc6_)
      {
         this._sDir = "L";
      }
      else if(_loc2_ < -3 * _loc6_)
      {
         this._sDir = "B";
      }
      else if(_loc2_ < - _loc6_)
      {
         this._sDir = "L";
         this._bFlip = true;
      }
      else if(_loc2_ < _loc6_)
      {
         this._sDir = "S";
      }
      else if(_loc2_ < 3 * _loc6_)
      {
         this._sDir = "R";
      }
      else if(_loc2_ < 5 * _loc6_)
      {
         this._sDir = "F";
      }
      else if(_loc2_ < 7 * _loc6_)
      {
         this._sDir = "R";
         this._bFlip = true;
      }
      else
      {
         this._sDir = "S";
         this._bFlip = true;
      }
      var _loc7_ = "static";
      if(Key.isDown(Key.SHIFT))
      {
         _loc7_ = "walk";
      }
      if(Key.isDown(Key.CONTROL))
      {
         _loc7_ = "run";
      }
      this.setAnim(_loc7_);
   }
   function onKeyUp()
   {
      if(this._bSelected)
      {
         var _loc2_ = Number(String.fromCharCode(Key.getCode()));
         if(!_global.isNaN(_loc2_))
         {
            if(Key.isDown(Key.SHIFT))
            {
               _loc2_ += 10;
            }
            this.setAnim("emote" + _loc2_);
         }
      }
   }
   function setAnim(§\x1e\x14\x17§, §\x16\x04§)
   {
      if(_loc3_)
      {
         this._sDir = "R";
         this._bFlip = false;
      }
      var _loc4_ = _loc2_ + this._sDir;
      if(this._sOldAnim != _loc4_ || (!this._bFlip ? 180 : -180) != this._mcSprite._xscale)
      {
         this._mcSprite.attachMovie(_loc4_,"anim",10);
         this._mcSprite._xscale = !this._bFlip ? 180 : -180;
         this._sOldAnim = _loc4_;
      }
   }
   function initialization(§\x1e\x19\x0e§)
   {
      this._mcSprite = _loc2_.clip;
      this.gapi.api.colors.addSprite(this._mcSprite,this._oData);
      this._mcSprite._xscale = this._mcSprite._yscale = 180;
      this.addToQueue({object:this,method:this.changeSpriteOrientation,params:[this._mcSprite]});
   }
   function innerRelease()
   {
      if(this.isDead)
      {
         return undefined;
      }
      this.selected = true;
      this.dispatchEvent({type:"select",serverID:this._nServerID});
   }
   function innerOver()
   {
      if(this.isDead)
      {
         return undefined;
      }
      this._bOver = true;
      this.updateSelected(!this._bSelected ? this.getStyle().overcolor : this.getStyle().selectedcolor);
   }
   function innerOut()
   {
      this._bOver = false;
      this.updateSelected(this.getStyle().selectedcolor);
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnDelete:
            if(this._nDeathState == 2)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CAUTION_WRONG_DEAD_STATE"),"ERROR_BOX",{name:"noSelection",listener:this});
               return undefined;
            }
            this.dispatchEvent({type:"remove"});
            break;
         case this._btnReset:
            if(this._nDeathState == 2)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CAUTION_WRONG_DEAD_STATE"),"ERROR_BOX",{name:"noSelection",listener:this});
               return undefined;
            }
            this.dispatchEvent({type:"reset"});
            break;
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnDelete:
            this.gapi.showTooltip(this.api.lang.getText("DELETE_CHARACTER"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._btnReset:
            this.gapi.showTooltip(this.api.lang.getText("RESET_CHARACTER"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._ctrServerState:
            this.gapi.showTooltip(this._oServer.stateStr,_root._xmouse,_root._ymouse - 20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.selectedItem;
      this._nServerID = _loc3_.id;
      this.updateServer();
      if(!this._bSelected && this._bEnabled)
      {
         this.innerRelease();
      }
      else if(!this._bEnabled)
      {
         this.dispatchEvent({type:"unselect"});
      }
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      if(this._oData != undefined)
      {
         this.updateServer();
         this.dispatchEvent({type:"unselect"});
      }
   }
}
