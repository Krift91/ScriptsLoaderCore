class dofus.§\r\x14§.gapi.ui.FightOptionButtons extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnTactic;
   var _btnFlag;
   var _btnBlockJoinerExceptParty;
   var _btnBlockJoiner;
   var _btnHelp;
   var _btnBlockSpectators;
   var _btnToggleSprites;
   static var CLASS_NAME = "FightOptionButtons";
   function FightOptionButtons()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.FightOptionButtons.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
   }
   function addListeners()
   {
      this._btnTactic.addEventListener("click",this);
      this._btnTactic.addEventListener("over",this);
      this._btnTactic.addEventListener("out",this);
      this._btnFlag.addEventListener("click",this);
      this._btnFlag.addEventListener("over",this);
      this._btnFlag.addEventListener("out",this);
      this._btnBlockJoinerExceptParty.addEventListener("click",this);
      this._btnBlockJoinerExceptParty.addEventListener("over",this);
      this._btnBlockJoinerExceptParty.addEventListener("out",this);
      this._btnBlockJoiner.addEventListener("click",this);
      this._btnBlockJoiner.addEventListener("over",this);
      this._btnBlockJoiner.addEventListener("out",this);
      this._btnHelp.addEventListener("click",this);
      this._btnHelp.addEventListener("over",this);
      this._btnHelp.addEventListener("out",this);
      this._btnBlockSpectators.addEventListener("click",this);
      this._btnBlockSpectators.addEventListener("over",this);
      this._btnBlockSpectators.addEventListener("out",this);
      this._btnToggleSprites.addEventListener("click",this);
      this._btnToggleSprites.addEventListener("over",this);
      this._btnToggleSprites.addEventListener("out",this);
   }
   function initData()
   {
      if(!this.api.datacenter.Game.isSpectator)
      {
         if(!this.api.datacenter.Player.inParty)
         {
            this._btnBlockJoinerExceptParty._visible = false;
            this._btnTactic._x = 642;
         }
         else
         {
            this._btnBlockJoinerExceptParty.selected = this.api.kernel.OptionsManager.getOption("FightGroupAutoLock");
            if(this._btnBlockJoinerExceptParty.selected)
            {
               this.api.network.Fights.blockJoinerExceptParty();
            }
            this._btnTactic._x = 622;
         }
      }
      else
      {
         this._btnBlockJoinerExceptParty._visible = false;
         this._btnBlockJoiner._visible = false;
         this._btnHelp._visible = false;
         this._btnBlockSpectators._visible = false;
         this._btnFlag._visible = false;
         this._btnTactic._x = 722;
      }
      this._btnTactic.selected = this.api.datacenter.Game.isTacticMode;
      this._btnToggleSprites._visible = false;
   }
   function onGameRunning()
   {
      this._btnBlockJoinerExceptParty._visible = false;
      this._btnBlockJoiner._visible = false;
      this._btnHelp._visible = false;
      this._btnToggleSprites._visible = true;
      this._btnTactic._x = 662;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnTactic:
            this.api.datacenter.Game.isTacticMode = !this.api.datacenter.Game.isTacticMode;
            break;
         case this._btnFlag:
            this.api.kernel.GameManager.switchToFlagSet();
            break;
         case this._btnBlockJoinerExceptParty:
            this.api.network.Fights.blockJoinerExceptParty();
            break;
         case this._btnBlockJoiner:
            this.api.network.Fights.blockJoiner();
            break;
         case this._btnHelp:
            this.api.network.Fights.needHelp();
            break;
         case this._btnBlockSpectators:
            this.api.network.Fights.blockSpectators();
            break;
         case this._btnToggleSprites:
            this.api.datacenter.Basics.gfx_isSpritesHidden = !this.api.datacenter.Basics.gfx_isSpritesHidden;
            if(this.api.datacenter.Basics.gfx_isSpritesHidden)
            {
               this.api.gfx.spriteHandler.maskAllSprites();
               break;
            }
            this.api.gfx.spriteHandler.unmaskAllSprites();
            break;
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnTactic:
            this.gapi.showTooltip(this.api.lang.getText("TACTIC_MODE"),this._btnFlag,-30);
            break;
         case this._btnFlag:
            this.gapi.showTooltip(this.api.lang.getText("FLAG_INDICATOR_HELP"),this._btnFlag,-30);
            break;
         case this._btnBlockJoinerExceptParty:
            this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_BLOCKJOINEREXCEPTPARTY"),this._btnFlag,-30);
            break;
         case this._btnBlockJoiner:
            this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_BLOCKJOINER"),this._btnFlag,-30);
            break;
         case this._btnHelp:
            this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_HELP"),this._btnFlag,-30);
            break;
         case this._btnBlockSpectators:
            this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_SPECTATOR"),this._btnFlag,-30);
            break;
         case this._btnToggleSprites:
            this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_SPRITES"),this._btnFlag,-30);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function moveButtons(§\x05\x1d§)
   {
      this._btnTactic._y += _loc2_;
      this._btnFlag._y += _loc2_;
      this._btnBlockJoinerExceptParty._y += _loc2_;
      this._btnBlockJoiner._y += _loc2_;
      this._btnHelp._y += _loc2_;
      this._btnBlockSpectators._y += _loc2_;
      this._btnToggleSprites._y += _loc2_;
   }
}
