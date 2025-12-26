class dofus.§\r\x14§.gapi.ui.MakeReport extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _bAllAccounts;
   var _sTargetPseudos;
   var _sDescription;
   var _sJailDialog;
   var _sPenal;
   var _sFindAccounts;
   var _sReason;
   var _btnCancel;
   var _btnClose;
   var _btnOk;
   var _btnSwitch;
   var _taDescription;
   var _taComplementary;
   var _taFindAccounts;
   var _taJailDialog;
   var _taPenal;
   var _tiReasonName;
   var _winBackground;
   var _lblTarget;
   var _lblReason;
   var _lblDescription;
   var _lblJailDialog;
   var _lblComplementary;
   var _lblAllAccounts;
   var _lblFindAccounts;
   var _lblPenal;
   var _lblTargetName;
   var _mcTextInputBackground;
   var _nCurrentView;
   var _sComplementary;
   static var CLASS_NAME = "MakeReport";
   static var FIRST_VIEW = 0;
   static var FAPENAL_VIEW = 1;
   function MakeReport()
   {
      super();
   }
   function get isAllAccounts()
   {
      return this._bAllAccounts;
   }
   function set isAllAccounts(§\x1c\x14§)
   {
      this._bAllAccounts = _loc2_;
   }
   function get targetPseudos()
   {
      return this._sTargetPseudos;
   }
   function set targetPseudos(§\x1e\x0b\x0f§)
   {
      this._sTargetPseudos = _loc2_;
   }
   function get description()
   {
      return this._sDescription;
   }
   function set description(§\x11\x02§)
   {
      this._sDescription = _loc2_;
   }
   function get jailDialog()
   {
      return this._sJailDialog;
   }
   function set jailDialog(§\x1e\x11\x06§)
   {
      this._sJailDialog = _loc2_;
   }
   function get penal()
   {
      return this._sPenal;
   }
   function set penal(§\x1e\x16\x17§)
   {
      this._sPenal = _loc2_;
   }
   function get findAccounts()
   {
      return this._sFindAccounts;
   }
   function set findAccounts(§\x0e\b§)
   {
      this._sFindAccounts = _loc2_;
   }
   function get reason()
   {
      return this._sReason;
   }
   function set reason(§\x1e\x15\b§)
   {
      this._sReason = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.MakeReport.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.initData});
   }
   function addListeners()
   {
      this._btnCancel.addEventListener("click",this);
      this._btnClose.addEventListener("click",this);
      this._btnOk.addEventListener("click",this);
      this._btnSwitch.addEventListener("click",this);
      this._taDescription.addEventListener("change",this);
      this._taComplementary.addEventListener("change",this);
      this._taFindAccounts.addEventListener("change",this);
      this._taJailDialog.addEventListener("change",this);
      this._taPenal.addEventListener("change",this);
      this._tiReasonName.addEventListener("change",this);
   }
   function initTexts()
   {
      this._winBackground.title = "Make Report";
      this._lblTarget.text = "Target(s) :";
      this._lblReason.text = "Reason :";
      this._lblDescription.text = "Description :";
      this._lblJailDialog.text = "Jail dialog :";
      this._lblComplementary.text = "Comments :";
      this._lblAllAccounts.text = "All Accounts : " + (!this._bAllAccounts ? "No" : "Yes");
      this._btnOk.label = "Validate";
      this._btnCancel.label = "Cancel";
      this._btnSwitch.label = "Switch view";
      this._lblFindAccounts.text = "Find Accounts :";
      this._lblPenal.text = "Penal :";
   }
   function initData()
   {
      this._lblTargetName.text = this._sTargetPseudos;
      this._taDescription.text = this._sDescription;
      this._taFindAccounts.text = this._sFindAccounts;
      this._taJailDialog.text = this._sJailDialog;
      this._taPenal.text = this._sPenal;
      this._tiReasonName.text = this._sReason;
      this.showViewData(dofus["\r\x14"].gapi.ui.MakeReport.FIRST_VIEW);
   }
   function showViewData(§\x1e\x1b\b§)
   {
      var _loc3_ = _loc2_ == dofus["\r\x14"].gapi.ui.MakeReport.FIRST_VIEW;
      this._lblTarget._visible = _loc3_;
      this._tiReasonName._visible = _loc3_;
      this._lblReason._visible = _loc3_;
      this._lblDescription._visible = _loc3_;
      this._taDescription._visible = _loc3_;
      this._lblComplementary._visible = _loc3_;
      this._taComplementary._visible = _loc3_;
      this._lblAllAccounts._visible = _loc3_;
      this._lblTargetName._visible = _loc3_;
      this._mcTextInputBackground._visible = _loc3_;
      var _loc4_ = _loc2_ == dofus["\r\x14"].gapi.ui.MakeReport.FAPENAL_VIEW;
      this._lblPenal._visible = _loc4_;
      this._lblFindAccounts._visible = _loc4_;
      this._lblJailDialog._visible = _loc4_;
      this._taFindAccounts._visible = _loc4_;
      this._taJailDialog._visible = _loc4_;
      this._taPenal._visible = _loc4_;
      this._nCurrentView = _loc2_;
   }
   function makeReport()
   {
      if(!this.api.electron.enabled)
      {
         this.api.kernel.showMessage(undefined,"This feature is not compatible on a Flash Projector","ERROR_CHAT");
         return undefined;
      }
      if(this._sTargetPseudos == undefined || this._sTargetPseudos.length < 1)
      {
         this.api.kernel.showMessage(undefined,"Target(s) cannot be empty","ERROR_CHAT");
         return undefined;
      }
      if(this._sReason == undefined || this._sReason.length < 1)
      {
         this.api.kernel.showMessage(undefined,"Reason cannot be empty","ERROR_CHAT");
         return undefined;
      }
      if(this._sPenal == undefined || this._sPenal.length < 1)
      {
         this.api.kernel.showMessage(undefined,"Penal cannot be empty","ERROR_CHAT");
         return undefined;
      }
      var _loc2_ = this.api.datacenter.Temporary.Report;
      var _loc3_ = _loc2_.targetAccountPseudo;
      var _loc4_ = _loc2_.targetAccountId;
      var _loc5_ = _loc2_.sanctionnatedAccounts;
      this.api.electron.makeReport(this._sReason,_loc3_,_loc4_,_loc5_,this._sDescription,this._sFindAccounts,this._sPenal,this._sJailDialog,this._sComplementary);
      this.unloadThis();
   }
   function update()
   {
      var _loc2_ = this.api.datacenter.Temporary.Report;
      this._sTargetPseudos = _loc2_.targetPseudos;
      this._lblTargetName.text = this._sTargetPseudos;
      if(_loc2_.description != undefined)
      {
         this._sDescription = this._taDescription.tf.htmlText + "\n" + _loc2_.description;
         this._taDescription.text = this._sDescription;
      }
      this._sPenal = this._taPenal.tf.htmlText + "\n" + _loc2_.penal;
      this._taPenal.text = this._sPenal;
      this._sFindAccounts = this._taFindAccounts.tf.htmlText + "\n" + _loc2_.findAccounts;
      this._taFindAccounts.text = this._sFindAccounts;
      this.api.kernel.showMessage(undefined,"Report updated","COMMANDS_CHAT");
   }
   function destroy()
   {
      this.api.datacenter.Temporary.Report = undefined;
   }
   function change(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target;
      switch(_loc3_)
      {
         case this._taComplementary:
            this._sComplementary = _loc3_.text;
            break;
         case this._taDescription:
            this._sDescription = _loc3_.text;
            break;
         case this._taFindAccounts:
            this._sFindAccounts = _loc3_.text;
            break;
         case this._taPenal:
            this._sPenal = _loc3_.text;
            break;
         case this._tiReasonName:
            this._sReason = _loc3_.text;
            break;
         case this._taJailDialog:
            this._sJailDialog = _loc3_.text;
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnOk:
            this.api.kernel.showMessage(undefined,"Are you sure ?","CAUTION_YESNO",{name:"MakeReport",listener:this});
            break;
         case this._btnCancel:
         case this._btnClose:
            this.unloadThis();
            break;
         case this._btnSwitch:
            var _loc3_ = this._nCurrentView != dofus["\r\x14"].gapi.ui.MakeReport.FIRST_VIEW ? dofus["\r\x14"].gapi.ui.MakeReport.FIRST_VIEW : dofus["\r\x14"].gapi.ui.MakeReport.FAPENAL_VIEW;
            this.showViewData(_loc3_);
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "AskYesNoMakeReport")
      {
         this.makeReport();
      }
   }
}
