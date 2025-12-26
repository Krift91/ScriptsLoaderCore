class dofus.§\r\x14§.gapi.ui.Spells extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _sfivSpellFullInfosViewer;
   var _nSelectedSpellType;
   var _mcSpellFullInfosPlacer;
   var _btnClose;
   var _dgSpells;
   var _cbType;
   var _winBackground;
   var _lblBonusTitle;
   var _lblSpellType;
   var _lblBonus;
   var _sbvSpellBoostViewer;
   static var CLASS_NAME = "Spells";
   static var TAB_LIST = ["Guild","Water","Fire","Earth","Air"];
   static var TAB_TITLE_LIST = ["SPELL_TAB_GUILD_TITLE","SPELL_TAB_WATER_TITLE","SPELL_TAB_FIRE_TITLE","SPELL_TAB_EARTH_TITLE","SPELL_TAB_AIR_TITLE"];
   function Spells()
   {
      super();
   }
   function get spellFullInfosViewer()
   {
      return this._sfivSpellFullInfosViewer;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Spells.CLASS_NAME);
      this.gapi.getUIComponent("Banner").shortcuts.setCurrentTab("Spells");
   }
   function destroy()
   {
      this.gapi.hideTooltip();
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this._nSelectedSpellType = 0;
      this._mcSpellFullInfosPlacer._visible = false;
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTexts});
      this.hideSpellBoostViewer(true);
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._dgSpells.addEventListener("itemRollOver",this);
      this._dgSpells.addEventListener("itemRollOut",this);
      this._dgSpells.addEventListener("itemDrag",this);
      this._dgSpells.addEventListener("itemSelected",this);
      this._cbType.addEventListener("itemSelected",this);
      this.api.datacenter.Player.addEventListener("bonusSpellsChanged",this);
      this.api.datacenter.Player.Spells.addEventListener("modelChanged",this);
   }
   function initData()
   {
      this.updateBonus();
   }
   function initTexts()
   {
      this._winBackground.title = this.api.lang.getText("YOUR_SPELLS");
      this._dgSpells.columnsNames = [this.api.lang.getText("NAME_BIG"),this.api.lang.getText("LEVEL")];
      this._lblBonusTitle.text = this.api.lang.getText("SPELL_BOOST_POINT");
      this._lblSpellType.text = this.api.lang.getText("SPELL_TYPE");
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc2_.push({label:this.api.lang.getText("WITHOUT_TYPE_FILTER"),type:-2});
      _loc2_.push({label:this.api.lang.getText("SPELL_TAB_GUILD"),type:0});
      _loc2_.push({label:this.api.lang.getText("SPELL_TAB_WATER"),type:1});
      _loc2_.push({label:this.api.lang.getText("SPELL_TAB_FIRE"),type:2});
      _loc2_.push({label:this.api.lang.getText("SPELL_TAB_EARTH"),type:3});
      _loc2_.push({label:this.api.lang.getText("SPELL_TAB_AIR"),type:4});
      this._cbType.dataProvider = _loc2_;
      this._cbType.selectedIndex = 1;
   }
   function updateSpells()
   {
      var _loc2_ = this.api.datacenter.Player.Spells;
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      for(var k in _loc2_)
      {
         var _loc4_ = _loc2_[k];
         if(_loc4_.classID != -1 && (_loc4_.classID == this._nSelectedSpellType || this._nSelectedSpellType == -2))
         {
            _loc3_.push(_loc4_);
         }
      }
      if(this.api.kernel.OptionsManager.getOption("SeeAllSpell") && this.api.datacenter.Basics.canUseSeeAllSpell)
      {
         var _loc5_ = this.api.lang.getClassText(this.api.datacenter.Player.Guild).s;
         var _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            var _loc7_ = _loc5_[_loc6_];
            var _loc8_ = false;
            var _loc9_ = 0;
            while(_loc9_ < _loc3_.length && !_loc8_)
            {
               _loc8_ = _loc3_[_loc9_].ID == _loc7_;
               _loc9_ = _loc9_ + 1;
            }
            var _loc10_ = new dofus.datacenter["\x1e\x0e\x1c"](_loc7_,1);
            if(!_loc8_ && (_loc10_.classID == this._nSelectedSpellType || this._nSelectedSpellType == -2))
            {
               _loc3_.push(_loc10_);
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      _loc3_.sortOn("_minPlayerLevel",Array.NUMERIC);
      this._dgSpells.dataProvider = _loc3_;
   }
   function updateBonus(§\x1e\x1b\n§)
   {
      this._lblBonus.text = _loc2_ != undefined ? String(_loc2_) : String(this.api.datacenter.Player.BonusPointsSpell);
      this.updateSpells();
   }
   function hideSpellBoostViewer(§\x19\t§, §\x1e\x17\x17§)
   {
      this._sbvSpellBoostViewer._visible = !_loc2_;
      if(_loc3_ != undefined)
      {
         this._sbvSpellBoostViewer.spell = _loc3_;
      }
   }
   function showDetails(§\x15\x0e§)
   {
      this._sfivSpellFullInfosViewer.removeMovieClip();
      if(_loc2_)
      {
         this.attachMovie("SpellFullInfosViewer","_sfivSpellFullInfosViewer",this.getNextHighestDepth(),{_x:this._mcSpellFullInfosPlacer._x,_y:this._mcSpellFullInfosPlacer._y});
         this._sfivSpellFullInfosViewer.addEventListener("close",this);
      }
   }
   function boostSpell(§\x1e\x17\x17§)
   {
      this.api.sounds.events.onSpellsBoostButtonClick();
      if(this.canBoost(_loc2_) != undefined)
      {
         var _loc3_ = new dofus.datacenter["\x1e\x0e\x1c"](_loc2_.ID,_loc2_.level + 1);
         if(this.api.datacenter.Player.Level < _loc3_.minPlayerLevel)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("LEVEL_NEED_TO_BOOST",[_loc3_.minPlayerLevel]),"ERROR_BOX");
            return false;
         }
         this.hideSpellBoostViewer(true);
         this.api.network.Spells.boost(_loc2_.ID);
         this._sfivSpellFullInfosViewer.spell = _loc3_;
         return true;
      }
      return false;
   }
   function getCostForBoost(§\x1e\x17\x17§)
   {
      return _loc2_.level >= _loc2_.maxLevel ? -1 : dofus.Constants.SPELL_BOOST_BONUS[_loc2_.level];
   }
   function canBoost(§\x1e\x17\x17§)
   {
      if(_loc2_ != undefined)
      {
         if(this.getCostForBoost(_loc2_) > this.api.datacenter.Player.BonusPointsSpell)
         {
            return false;
         }
         if(_loc2_.level < _loc2_.maxLevel)
         {
            return true;
         }
      }
      return false;
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "_btnClose")
      {
         this.callClose();
      }
   }
   function itemDrag(§\x1e\x19\x0e§)
   {
      if(_loc2_.row.item == undefined)
      {
         return undefined;
      }
      if(this.api.datacenter.Player.Level < _loc2_.row.item._minPlayerLevel)
      {
         return undefined;
      }
      this.gapi.removeCursor();
      this.gapi.setCursor(_loc2_.row.item,undefined,true);
   }
   function itemRollOver(§\x1e\x19\x0e§)
   {
   }
   function itemRollOut(§\x1e\x19\x0e§)
   {
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._dgSpells:
            if(_loc2_.row.item != undefined)
            {
               if(this._sfivSpellFullInfosViewer.spell.ID != _loc2_.row.item.ID)
               {
                  this.showDetails(true);
                  this._sfivSpellFullInfosViewer.spell = _loc2_.row.item;
               }
               else
               {
                  this.showDetails(false);
               }
            }
            break;
         case this._cbType:
            this._nSelectedSpellType = _loc2_.target.selectedItem.type;
            this.updateSpells();
      }
   }
   function bonusSpellsChanged(§\x1e\x19\x0e§)
   {
      this.updateBonus(_loc2_.value);
   }
   function close(§\x1e\x19\x0e§)
   {
      this.showDetails(false);
   }
   function modelChanged(§\x1e\x19\x0e§)
   {
      switch(_loc2_.eventName)
      {
         case "updateOne":
         case "updateAll":
      }
      this.updateSpells();
      this.hideSpellBoostViewer(true);
   }
}
