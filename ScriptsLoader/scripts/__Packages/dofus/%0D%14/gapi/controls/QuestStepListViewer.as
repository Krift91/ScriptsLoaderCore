class dofus.§\r\x14§.gapi.controls.QuestStepListViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _eaSteps;
   var _lstSteps;
   var _lblSteps;
   var _txtDescription;
   static var CLASS_NAME = "QuestStepListViewer";
   function QuestStepListViewer()
   {
      super();
   }
   function set steps(§\x0f\x12§)
   {
      this._eaSteps = _loc2_;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.QuestStepListViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.updateData});
   }
   function addListeners()
   {
      this._lstSteps.addEventListener("itemSelected",this);
   }
   function initTexts()
   {
      this._lblSteps.text = this.api.lang.getText("QUESTS_ALL_STEPS");
   }
   function updateData()
   {
      if(this._eaSteps != undefined)
      {
         this._lstSteps.dataProvider = this._eaSteps;
         var _loc2_ = 0;
         while(_loc2_ < this._eaSteps.length)
         {
            if(this._eaSteps[_loc2_].isCurrent)
            {
               this._lstSteps.selectedIndex = _loc2_;
               this._txtDescription.text = this._eaSteps[_loc2_].description;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.row.item;
      this._txtDescription.text = _loc3_.description;
   }
}
