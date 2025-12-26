class dofus.§\r\x14§.gapi.ui.spells.SpellsItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lblName;
   var _lblLevel;
   var _lblRange;
   var _lblAP;
   var _ldrIcon;
   var _btnBoost;
   var _lblBoost;
   function SpellsItem()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._oItem = _loc4_;
         _loc4_.sortName = _loc4_.name;
         _loc4_.sortLevel = _loc4_.level;
         var _loc5_ = this._mcList._parent._parent.api;
         this._lblName.text = _loc4_.name;
         this._lblLevel.text = _loc5_.lang.getText("LEVEL") + " " + _loc4_.level;
         this._lblRange.text = (_loc4_.rangeMin == 0 ? "" : _loc4_.rangeMin + "-") + _loc4_.rangeMax + " " + _loc5_.lang.getText("RANGE");
         this._lblAP.text = _loc4_.apCost + " " + _loc5_.lang.getText("AP");
         this._ldrIcon.contentPath = _loc4_.iconFile;
         if(dofus.Constants.DOUBLEFRAMERATE && this._ldrIcon.loaded)
         {
            var _loc6_ = _loc5_.kernel.OptionsManager.getOption("RemasteredSpellIconsPack");
            this._ldrIcon.content.gotoAndStop(_loc6_);
         }
         var _loc7_ = this._mcList._parent._parent.canBoost(_loc4_) && _loc5_.datacenter.Basics.canUseSeeAllSpell;
         var _loc8_ = this._mcList._parent._parent.getCostForBoost(_loc4_);
         this._btnBoost.enabled = true;
         this._btnBoost._visible = _loc7_;
         this._lblBoost.text = !(_loc8_ != -1 && _loc5_.datacenter.Basics.canUseSeeAllSpell) ? "" : _loc5_.lang.getText("POINT_NEED_TO_BOOST_SPELL",[_loc8_]);
         if(_loc5_.datacenter.Player.Level < _loc4_._minPlayerLevel)
         {
            var _loc9_ = 50;
            this._lblName._alpha = _loc9_;
            this._ldrIcon._alpha = _loc9_;
            this._lblAP._alpha = _loc9_;
            this._lblRange._alpha = _loc9_;
            this._lblLevel._visible = false;
            this._lblBoost._visible = false;
            this._btnBoost._visible = false;
         }
         else
         {
            this._lblName._alpha = 100;
            this._ldrIcon._alpha = 100;
            this._lblAP._alpha = 100;
            this._lblRange._alpha = 100;
            this._lblLevel._alpha = 100;
            this._lblLevel._visible = true;
            this._lblBoost._visible = true;
         }
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._lblLevel.text = "";
         this._lblBoost.text = "";
         this._lblRange.text = "";
         this._lblAP.text = "";
         this._ldrIcon.contentPath = "";
         this._btnBoost._visible = false;
      }
   }
   function init()
   {
      super.init(false);
      this._btnBoost._visible = false;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._ldrIcon.addEventListener("complete",this);
      this._btnBoost.addEventListener("click",this);
      this._btnBoost.addEventListener("over",this);
      this._btnBoost.addEventListener("out",this);
   }
   function complete(§\x1e\x19\x0e§)
   {
      if(!dofus.Constants.DOUBLEFRAMERATE)
      {
         return undefined;
      }
      var _loc3_ = this._mcList._parent._parent.api;
      var _loc4_ = _loc2_.clip;
      var _loc5_ = _loc3_.kernel.OptionsManager.getOption("RemasteredSpellIconsPack");
      _loc4_.gotoAndStop(_loc5_);
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._mcList._parent._parent.api;
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnBoost)
      {
         if(!_loc3_.datacenter.Player.isAuthorized)
         {
            _loc3_.kernel.showMessage(_loc3_.lang.getText("UPGRADE_SPELL"),_loc3_.lang.getText("UPGRADE_SPELL_WARNING",[this._mcList._parent._parent.getCostForBoost(this._oItem),this._oItem.name,String(this._oItem.level + 1)]),"CAUTION_YESNO",{name:"UpgradeSpellWarning",listener:this});
         }
         else
         {
            this.yes();
         }
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      if(this._mcList._parent._parent.boostSpell(this._oItem))
      {
         this._btnBoost.enabled = false;
         if(this._lblBoost.text != undefined)
         {
            this._lblBoost.text = "";
         }
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._mcList._parent._parent.api;
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnBoost)
      {
         _loc3_.ui.showTooltip(_loc3_.lang.getText("CLICK_HERE_FOR_SPELL_BOOST",[this._mcList._parent._parent.getCostForBoost(this._oItem),this._oItem.name,String(this._oItem.level + 1)]),_loc2_.target,-30,{bXLimit:true,bYLimit:false});
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._mcList._parent._parent.api;
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnBoost)
      {
         _loc3_.ui.hideTooltip();
      }
   }
}
