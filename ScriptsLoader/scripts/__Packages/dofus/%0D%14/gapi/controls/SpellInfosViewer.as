class dofus.§\r\x14§.gapi.controls.SpellInfosViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oSpell;
   var _lblEffectsTitle;
   var _lblCriticalHitTitle;
   var _lblHelp;
   var _lblName;
   var _lblLevel;
   var _lblRange;
   var _lblAP;
   var _txtDescription;
   var _txtEffects;
   var _txtCriticalHit;
   var _ldrIcon;
   static var CLASS_NAME = "SpellInfosViewer";
   function SpellInfosViewer()
   {
      super();
   }
   function set spell(§\x1e\x17\x17§)
   {
      if(_loc2_ == this._oSpell)
      {
         return;
      }
      this._oSpell = _loc2_;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   function get spell()
   {
      return this._oSpell;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.SpellInfosViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function initData()
   {
      this.updateData();
   }
   function initTexts()
   {
      this._lblEffectsTitle.text = this.api.lang.getText("EFFECTS") + " :";
      this._lblCriticalHitTitle.text = this.api.lang.getText("CRITICAL_HIT") + " :";
      this._lblHelp.text = this.api.lang.getText("HOW_GET_DETAILS");
   }
   function updateData()
   {
      if(this._oSpell != undefined)
      {
         this._lblCriticalHitTitle._visible = this._oSpell.descriptionCriticalHit != undefined;
         this._lblName.text = this._oSpell.name;
         this._lblLevel.text = this.api.lang.getText("LEVEL") + " " + this._oSpell.level;
         this._lblRange.text = (this._oSpell.rangeMin == 0 ? "" : this._oSpell.rangeMin + "-") + this._oSpell.rangeMax + " " + this.api.lang.getText("RANGE");
         this._lblAP.text = this._oSpell.apCost + " " + this.api.lang.getText("AP");
         this._txtDescription.text = this._oSpell.description;
         this._txtEffects.text = this._oSpell.descriptionNormalHit;
         this._txtCriticalHit.text = this._oSpell.descriptionCriticalHit == undefined ? "" : this._oSpell.descriptionCriticalHit;
         this._ldrIcon.contentPath = this._oSpell.iconFile;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblCriticalHitTitle._visible = false;
         this._lblName.text = "";
         this._lblLevel.text = "";
         this._lblRange.text = "";
         this._lblAP.text = "";
         this._txtDescription.text = "";
         this._txtEffects.text = "";
         this._txtCriticalHit.text = "";
         this._ldrIcon.contentPath = "";
      }
   }
}
