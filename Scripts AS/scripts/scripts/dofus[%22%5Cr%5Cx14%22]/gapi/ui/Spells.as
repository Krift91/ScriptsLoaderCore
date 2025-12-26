var _loc1 = dofus["\r\x14"].gapi.ui.Spells.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Spells.CLASS_NAME);
   this.player = this.api.datacenter.Player;
   var _loc3_ = this.api.datacenter.getHero(this.heroID);
   if(_loc3_ != undefined)
   {
      this.player = _loc3_;
   }
   this.gapi.getUIComponent("Banner").shortcuts.setCurrentTab("Spells",this.player);
};
_loc1.createChildren = function()
{
   this._nSelectedSpellType = 0;
   this._mcSpellFullInfosPlacer._visible = false;
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initTexts});
   this.hideSpellBoostViewer(true);
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("YOUR_SPELLS") + " - " + this.player.Name;
   this._dgSpells.columnsNames = [this.api.lang.getText("NAME_BIG"),this.api.lang.getText("LEVEL")];
   this._lblBonusTitle.text = this.api.lang.getText("SPELL_BOOST_POINT");
   this._lblSpellType.text = this.api.lang.getText("SPELL_TYPE");
   var _loc3_ = new _global.palmad.ank.utils.ExtendedArray();
   _loc3_.push({label:this.api.lang.getText("WITHOUT_TYPE_FILTER"),type:-2});
   _loc3_.push({label:this.api.lang.getText("SPELL_TAB_GUILD"),type:0});
   _loc3_.push({label:this.api.lang.getText("SPELL_TAB_WATER"),type:1});
   _loc3_.push({label:this.api.lang.getText("SPELL_TAB_FIRE"),type:2});
   _loc3_.push({label:this.api.lang.getText("SPELL_TAB_EARTH"),type:3});
   _loc3_.push({label:this.api.lang.getText("SPELL_TAB_AIR"),type:4});
   this._cbType.dataProvider = _loc3_;
   this._cbType.selectedIndex = 1;
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._dgSpells.addEventListener("itemRollOver",this);
   this._dgSpells.addEventListener("itemRollOut",this);
   this._dgSpells.addEventListener("itemDrag",this);
   this._dgSpells.addEventListener("itemSelected",this);
   this._cbType.addEventListener("itemSelected",this);
   this.player.addEventListener("bonusSpellsChanged",this);
   this.player.Spells.addEventListener("modelChanged",this);
};
_loc1.updateSpells = function()
{
   var _loc10_ = this.player.Spells;
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   for(var _loc11_ in _loc10_)
   {
      var _loc5_ = _loc10_[_loc11_];
      if(_loc5_.classID != -1 && (_loc5_.classID == this._nSelectedSpellType || this._nSelectedSpellType == -2))
      {
         _loc4_.push(_loc5_);
      }
   }
   if(this.api.kernel.OptionsManager.getOption("SeeAllSpell") && this.api.datacenter.Basics.canUseSeeAllSpell)
   {
      var _loc9_ = this.api.lang.getClassText(this.player.Guild).s;
      var _loc7_ = 0;
      while(_loc7_ < _loc9_.length)
      {
         var _loc6_ = _loc9_[_loc7_];
         var _loc3_ = false;
         var _loc2_ = 0;
         while(_loc2_ < _loc4_.length && !_loc3_)
         {
            _loc3_ = _loc4_[_loc2_].ID == _loc6_;
            _loc2_ += 1;
         }
         var _loc8_ = new dofus.datacenter["\x1e\x0e\x1c"](_loc6_,1);
         if(!_loc3_ && (_loc8_.classID == this._nSelectedSpellType || this._nSelectedSpellType == -2))
         {
            _loc4_.push(_loc8_);
         }
         _loc7_ += 1;
      }
   }
   _loc4_.sortOn("_minPlayerLevel",Array.NUMERIC);
   this._dgSpells.dataProvider = _loc4_;
};
_loc1.updateBonus = function(_loc2_)
{
   this._lblBonus.text = _loc2_ == undefined ? String(this.player.BonusPointsSpell) : String(_loc2_);
   this.updateSpells();
};
_loc1.boostSpell = function(_loc2_)
{
   this.api.sounds.events.onSpellsBoostButtonClick();
   if(this.canBoost(_loc2_) != undefined)
   {
      var _loc3_ = new dofus.datacenter["\x1e\x0e\x1c"](_loc2_.ID,_loc2_.level + 1);
      if(this.player.Level < _loc3_.minPlayerLevel)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("LEVEL_NEED_TO_BOOST",[_loc3_.minPlayerLevel]),"ERROR_BOX");
         return false;
      }
      this.hideSpellBoostViewer(true);
      _global.HERO_ID = this.heroID;
      this.api.network.Spells.boost(_loc2_.ID);
      this._sfivSpellFullInfosViewer.spell = _loc3_;
      return true;
   }
   return false;
};
_loc1.canBoost = function(_loc2_)
{
   if(_loc2_ != undefined)
   {
      if(this.getCostForBoost(_loc2_) > this.player.BonusPointsSpell)
      {
         return false;
      }
      if(_loc2_.level < _loc2_.maxLevel)
      {
         return true;
      }
   }
   return false;
};
_loc1.itemDrag = function(_loc2_)
{
   if(_loc2_.row.item == undefined)
   {
      return undefined;
   }
   if(this.player.Level < _loc2_.row.item._minPlayerLevel)
   {
      return undefined;
   }
   _loc2_.row.item.heroID = this.player.ID;
   trace("itemDrag spells " + _loc2_.row.item.heroID);
   this.gapi.removeCursor();
   this.gapi.setCursor(_loc2_.row.item,undefined,true);
};
_loc1.player;
