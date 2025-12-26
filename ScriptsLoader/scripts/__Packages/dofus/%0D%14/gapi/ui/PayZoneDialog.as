class dofus.§\r\x14§.gapi.ui.PayZoneDialog extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nNpcID;
   var _sName;
   var _sGfx;
   var _nDialogID;
   var _ldrArtwork;
   var _winBackgroundUp;
   var _qvQuestionViewer;
   var _mcQuestionViewer;
   var _winBackground;
   static var CLASS_NAME = "PayZoneDialog";
   static var PAYZONE_INFOS = 1;
   static var PAYZONE_DETAILS = 2;
   static var PAYZONE_YES = 0;
   static var PAYZONE_NO = 1;
   static var PAYZONE_BE_MEMBER = 2;
   static var PAYZONE_MORE_INFOS = 4;
   function PayZoneDialog()
   {
      super();
   }
   function set id(§\x02\x06§)
   {
      this._nNpcID = _loc2_;
   }
   function set name(§\x1e\x0f\x16§)
   {
      this._sName = _loc2_;
   }
   function set gfx(§\x1e\x11\x1d§)
   {
      this._sGfx = _loc2_;
   }
   function set dialogID(§\x06\t§)
   {
      this._nDialogID = _loc2_;
      this.addToQueue({object:this,method:this.setDialog,params:[_loc2_]});
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.PayZoneDialog.CLASS_NAME);
   }
   function callClose()
   {
      this.api.network.Dialog.leave();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.setNpcCharacteristics});
      this.gapi.unloadLastUIAutoHideComponent();
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
   }
   function setNpcCharacteristics()
   {
      this._ldrArtwork.contentPath = dofus.Constants.ARTWORKS_BIG_PATH + this._sGfx + ".swf";
      this._winBackgroundUp.title = this._sName;
   }
   function setDialog(§\x04\n§)
   {
      var _loc3_ = new Object();
      _loc3_.responses = new ank["\x1e\n\x07"]["\x0f\x01"]();
      switch(_loc2_)
      {
         case dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_INFOS:
            _loc3_.label = this.api.lang.getText("PAYZONE_INFOS");
            _loc3_.responses.push({label:this.api.lang.getText("YES"),id:dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_YES});
            _loc3_.responses.push({label:this.api.lang.getText("NO"),id:dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_NO});
            break;
         case dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_DETAILS:
            _loc3_.label = this.api.lang.getText("PAYZONE_DETAILS");
            _loc3_.responses.push({label:this.api.lang.getText("PAYZONE_BE_MEMBER"),id:dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_BE_MEMBER});
            break;
         default:
            _loc3_.label = this.api.lang.getText("PAYZONE_MSG_" + this._nDialogID) + "\n\n" + this.api.lang.getText("PAYZONE_BASE");
            _loc3_.responses.push({label:this.api.lang.getText("PAYZONE_MORE_INFOS"),id:dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_MORE_INFOS});
      }
      this.setQuestion(_loc3_);
   }
   function setQuestion(§\x1e\x18\x07§)
   {
      if(this._qvQuestionViewer == undefined)
      {
         this.attachMovie("QuestionViewer","_qvQuestionViewer",10,{_x:this._mcQuestionViewer._x,_y:this._mcQuestionViewer._y,question:_loc2_,isFirstQuestion:true});
         this._qvQuestionViewer.addEventListener("response",this);
         this._qvQuestionViewer.addEventListener("resize",this);
      }
      else
      {
         this._qvQuestionViewer.isFirstQuestion = true;
         this._qvQuestionViewer.question = _loc2_;
      }
   }
   function closeDialog()
   {
      this.callClose();
   }
   function response(§\x1e\x19\x0e§)
   {
      switch(_loc2_.response.id)
      {
         case dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_YES:
            this.setDialog(dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_DETAILS);
            break;
         case dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_NO:
            this.unloadThis();
            break;
         case dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_BE_MEMBER:
            this.getURL(this.api.lang.getConfigText("PAY_LINK"),"_blank");
            this.unloadThis();
            break;
         case dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_MORE_INFOS:
            this.getURL(this.api.lang.getConfigText("MEMBERS_LINK"),"_blank");
            this.unloadThis();
      }
   }
   function resize(§\x1e\x19\x0e§)
   {
      this._winBackground.setSize(undefined,_loc2_.target.height + (_loc2_.target._y - this._winBackground._y) + 12);
      this._winBackgroundUp.setSize(undefined,_loc2_.target.height + (_loc2_.target._y - this._winBackground._y) + 10);
   }
}
