class dofus.§\r\x14§.gapi.ui.SpellForget extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnValidate;
   var _btnClose;
   var _btnCancel;
   var _lstSpells;
   var _winBg;
   var _lblName;
   var _lblLevel;
   static var CLASS_NAME = "SpellForget";
   function SpellForget()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.SpellForget.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.initData});
   }
   function addListeners()
   {
      this._btnValidate.enabled = false;
      this._btnClose.addEventListener("click",this);
      this._btnCancel.addEventListener("click",this);
      this._btnValidate.addEventListener("click",this);
      this._lstSpells.addEventListener("itemSelected",this);
   }
   function initTexts()
   {
      this._winBg.title = this.api.lang.getText("SPELL_FORGET");
      this._lblName.text = this.api.lang.getText("SPELLS_SHORTCUT");
      this._lblLevel.text = this.api.lang.getText("LEVEL");
      this._btnValidate.label = this.api.lang.getText("VALIDATE");
      this._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
   }
   function initData()
   {
      var _loc2_ = this.api.datacenter.Player.Spells;
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      for(var k in _loc2_)
      {
         var _loc4_ = _loc2_[k];
         if(_loc4_.classID != -1 && _loc4_.level > 1)
         {
            _loc3_.push(_loc4_);
         }
      }
      this._lstSpells.dataProvider = _loc3_;
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      this._btnValidate.enabled = true;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnValidate:
            var _loc3_ = dofus.datacenter["\x1e\x0e\x1c"](this._lstSpells.selectedItem);
            this.api.kernel.showMessage(this.api.lang.getText("SPELL_FORGET"),this.api.lang.getText("SPELL_FORGET_CONFIRM",[_loc3_.name]),"CAUTION_YESNO",{name:"SpellForget",listener:this,params:{spell:_loc3_}});
            break;
         case this._btnClose:
         case this._btnCancel:
            this.api.network.Spells.spellForget(-1);
            this.unloadThis();
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "AskYesNoSpellForget")
      {
         var _loc3_ = _loc2_.target.params.spell;
         this.api.network.Spells.spellForget(_loc3_.ID);
         this.unloadThis();
      }
   }
}
