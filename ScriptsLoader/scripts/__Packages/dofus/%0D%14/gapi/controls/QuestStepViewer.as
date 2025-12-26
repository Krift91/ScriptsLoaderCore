class dofus.§\r\x14§.gapi.controls.QuestStepViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oStep;
   var _btnDialog;
   var _lstObjectives;
   var _lblObjectives;
   var _lblStep;
   var _lblRewards;
   var _txtDescription;
   var _lstRewards;
   static var CLASS_NAME = "QuestStepViewer";
   function QuestStepViewer()
   {
      super();
   }
   function set step(§\x1e\x17\x11§)
   {
      this._oStep = _loc2_;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.QuestStepViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.updateData});
      this._btnDialog._visible = false;
   }
   function addListeners()
   {
      this._btnDialog.addEventListener("click",this);
      this._btnDialog.addEventListener("over",this);
      this._btnDialog.addEventListener("out",this);
      this._lstObjectives.addEventListener("itemSelected",this);
   }
   function initTexts()
   {
      this._lblObjectives.text = this.api.lang.getText("QUESTS_OBJECTIVES");
      this._lblStep.text = this.api.lang.getText("STEP");
      this._lblRewards.text = this.api.lang.getText("QUESTS_REWARDS");
   }
   function updateData()
   {
      if(this._oStep != undefined)
      {
         this._lblStep.text = this.api.lang.getText("STEP") + " : " + this._oStep.name;
         this._txtDescription.text = this._oStep.description;
         this._lstObjectives.dataProvider = this._oStep.objectives;
         this._lstRewards.dataProvider = this._oStep.rewards;
         this._btnDialog._visible = this._oStep.dialogID != undefined;
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._oStep.dialogID;
      var _loc4_ = this._oStep.dialogParams;
      var _loc5_ = new dofus.datacenter["\x1e\x15\x19"](_loc3_,undefined,_loc4_);
      this.gapi.showTooltip(this.api.lang.getText("STEP_DIALOG") + " :\n\n" + _loc5_.label,_loc2_.target,20);
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._oStep.dialogID;
      var _loc4_ = this._oStep.dialogParams;
      var _loc5_ = new dofus.datacenter["\x1e\x15\x19"](_loc3_,undefined,_loc4_);
      this.api.kernel.showMessage(this.api.lang.getText("STEP_DIALOG"),_loc5_.label,"ERROR_BOX");
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.row.item;
      if(_loc3_.x != undefined && _loc3_.y != undefined)
      {
         this.api.kernel.GameManager.updateCompass(_loc3_.x,_loc3_.y);
      }
   }
}
