class dofus.§\r\x14§.gapi.ui.CreateGuild extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _eaBacks;
   var _eaUps;
   var _nBackID;
   var _nUpID;
   var _winBg;
   var _lblName;
   var _lblEmblem;
   var _lblColors;
   var _btnCancel;
   var _btnCreate;
   var _btnTabBack;
   var _btnTabUp;
   var _btnClose;
   var _cpColors;
   var _cgGrid;
   var _itName;
   var _eEmblem;
   static var CLASS_NAME = "CreateGuild";
   var _nBackColor = 14933949;
   var _nUpColor = 0;
   var _sCurrentTab = "Back";
   function CreateGuild()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.CreateGuild.CLASS_NAME);
   }
   function callClose()
   {
      if(this._bEnabled)
      {
         this.api.network.Guild.leave();
         return true;
      }
      return false;
   }
   function createChildren()
   {
      this._eaBacks = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc2_ = 1;
      while(_loc2_ <= dofus.Constants.EMBLEM_BACKS_COUNT)
      {
         this._eaBacks.push({iconFile:dofus.Constants.EMBLEMS_BACK_PATH + _loc2_ + ".swf"});
         _loc2_ = _loc2_ + 1;
      }
      this._eaUps = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = 1;
      while(_loc3_ <= dofus.Constants.EMBLEM_UPS_COUNT)
      {
         this._eaUps.push({iconFile:dofus.Constants.EMBLEMS_UP_PATH + _loc3_ + ".swf"});
         _loc3_ = _loc3_ + 1;
      }
      this._nBackID = 1;
      this._nUpID = 1;
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.setTextFocus});
      this.addToQueue({object:this,method:this.updateCurrentTabInformations});
      this.addToQueue({object:this,method:this.updateBack});
      this.addToQueue({object:this,method:this.updateUp});
   }
   function initTexts()
   {
      this._winBg.title = this.api.lang.getText("GUILD_CREATION");
      this._lblName.text = this.api.lang.getText("GUILD_NAME");
      this._lblEmblem.text = this.api.lang.getText("EMBLEM");
      this._lblColors.text = this.api.lang.getText("CREATE_COLOR");
      this._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
      this._btnCreate.label = this.api.lang.getText("CREATE");
      this._btnTabBack.label = this.api.lang.getText("EMBLEM_BACK");
      this._btnTabUp.label = this.api.lang.getText("EMBLEM_UP");
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnCancel.addEventListener("click",this);
      this._btnCreate.addEventListener("click",this);
      this._btnTabBack.addEventListener("click",this);
      this._btnTabUp.addEventListener("click",this);
      this._cpColors.addEventListener("change",this);
      this._cgGrid.addEventListener("selectItem",this);
      this._cgGrid.multipleContainerSelectionEnabled = false;
   }
   function setTextFocus()
   {
      this._itName.setFocus();
   }
   function updateCurrentTabInformations()
   {
      switch(this._sCurrentTab)
      {
         case "Back":
            this._cpColors.setColor(this._nBackColor);
            this._cgGrid.dataProvider = this._eaBacks;
            this._cgGrid.selectedIndex = this._nBackID - 1;
            break;
         case "Up":
            this._cpColors.setColor(this._nUpColor);
            this._cgGrid.dataProvider = this._eaUps;
            this._cgGrid.selectedIndex = this._nUpID - 1;
      }
   }
   function setCurrentTab(§\x1e\x0f\x14§)
   {
      var _loc3_ = this["_btnTab" + this._sCurrentTab];
      var _loc4_ = this["_btnTab" + _loc2_];
      _loc3_.selected = true;
      _loc3_.enabled = true;
      _loc4_.selected = false;
      _loc4_.enabled = false;
      this._sCurrentTab = _loc2_;
      this.updateCurrentTabInformations();
   }
   function updateBack()
   {
      this._eEmblem.backID = this._nBackID;
      this._eEmblem.backColor = this._nBackColor;
   }
   function updateUp()
   {
      this._eEmblem.upID = this._nUpID;
      this._eEmblem.upColor = this._nUpColor;
   }
   function setEnabled(§\x1a\r§)
   {
      this._btnCancel.enabled = this._bEnabled;
      this._btnClose.enabled = this._bEnabled;
      this._btnCreate.enabled = this._bEnabled;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
         case "_btnCancel":
            this.api.network.Guild.leave();
            break;
         case "_btnCreate":
            var _loc3_ = this._itName.text;
            if(_loc3_ == undefined || _loc3_.length < 3)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("BAD_GUILD_NAME"),"ERROR_BOX");
               return undefined;
            }
            if(this._nBackID == undefined || this._nUpID == undefined)
            {
               return undefined;
            }
            if(this.api.lang.getConfigText("GUILD_NAME_FILTER"))
            {
               var _loc4_ = new dofus["\x1e\n\x07"]["\b\x16"]["\b\x17"](_loc3_);
               var _loc5_ = new dofus["\x1e\n\x07"]["\b\x16"]["\x1e\x15\x01"]["\b\x15"]();
               var _loc6_ = _loc4_.isValidAgainstWithDetails(_loc5_);
               if(!_loc6_.IS_SUCCESS)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("INVALID_GUILD_NAME") + "\r\n" + _loc6_.toString("\r\n"),"ERROR_BOX");
                  return undefined;
               }
            }
            this.enabled = false;
            this.api.network.Guild.create(this._nBackID,this._nBackColor,this._nUpID,this._nUpColor,_loc3_);
            break;
         case "_btnTabBack":
            this.setCurrentTab("Back");
            break;
         case "_btnTabUp":
            this.setCurrentTab("Up");
      }
   }
   function change(§\x1e\x19\x0e§)
   {
      switch(this._sCurrentTab)
      {
         case "Back":
            this._nBackColor = _loc2_.value;
            this.updateBack();
            break;
         case "Up":
            this._nUpColor = _loc2_.value;
            this.updateUp();
      }
   }
   function selectItem(§\x1e\x19\x0e§)
   {
      switch(this._sCurrentTab)
      {
         case "Back":
            this._nBackID = _loc2_.owner.selectedIndex + 1;
            this.updateBack();
            break;
         case "Up":
            this._nUpID = _loc2_.owner.selectedIndex + 1;
            this.updateUp();
      }
   }
}
