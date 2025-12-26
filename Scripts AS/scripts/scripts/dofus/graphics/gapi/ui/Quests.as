var _loc1 = dofus["\r\x14"].gapi.ui.Quests.prototype;
_loc1.initTexts = function()
{
   this._winBg.title = this.api.lang.getText("QUESTS_LIST");
   this._winBgViewer.title = this.api.lang.getText("STEPS");
   this._btnTabCurrent.label = this.api.lang.getText("QUESTS_CURRENT_STEP");
   this._btnTabAll.label = this.api.lang.getText("QUESTS_STEPS_LIST");
   this._dgQuests.columnsNames = [this.api.lang.getText("STATE"),this.api.lang.getText("NAME_BIG")];
   this._lblFinished.text = this.api.lang.getText("DISPLAY_FINISHED_QUESTS");
   this._btnObjetivos.label = this.api.lang.getText("OBJETIVOS_DIARIOS");
};
_loc1.addListeners = function()
{
   this._btnObjetivos.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
   this._btnCloseStep.addEventListener("click",this);
   this._btnTabCurrent.addEventListener("click",this);
   this._btnTabAll.addEventListener("click",this);
   this._btnFinished.addEventListener("click",this);
   this._dgQuests.addEventListener("itemSelected",this);
   this.api.datacenter.Temporary["\x1e\x15\x1a"].quests.addEventListener("modelChanged",this);
};
_loc1.datos = function(datos)
{
   this._datos = datos;
};
_loc1.showStepViewer = function(_loc2_)
{
   if(_loc2_)
   {
      this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_QUEST_WALKTHOUGH);
   }
   this._btnCloseStep._visible = _loc2_;
   this._winBgViewer._visible = _loc2_;
   this._mcTab._visible = _loc2_;
   this._mcTab2._visible = _loc2_;
   this._btnTabCurrent._visible = _loc2_;
   this._btnTabAll._visible = _loc2_;
   this._mcBackButtons._visible = _loc2_;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnClose":
         this.callClose();
         break;
      case "_btnObjetivos":
         this.showStepViewer(true);
         this._mcTab2.removeMovieClip();
         this.attachMovie("QuestsObjetivos","_mcTab2",this.getNextHighestDepth(),{_x:this._mcTabPlacer2._x,_y:this._mcTabPlacer2._y,datos:this._datos});
         this.api.network.send("QO");
         this._winBgViewer.title = this.api.lang.getText("ENCARGOS_DIARIOS");
         break;
      case "_btnTabCurrent":
         this.setCurrentTab("Current");
         this._mcTab2._visible = false;
         break;
      case "_btnTabAll":
         this.setCurrentTab("All");
         this._mcTab2._visible = false;
         break;
      case "_btnFinished":
         this.modelChanged();
         break;
      case "_btnCloseStep":
         this._dgQuests.selectedIndex = -1;
         this.showStepViewer(false);
   }
};
_loc1._datos = "";
