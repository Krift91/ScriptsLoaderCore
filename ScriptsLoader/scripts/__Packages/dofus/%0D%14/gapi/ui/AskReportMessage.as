class dofus.§\r\x14§.gapi.ui.AskReportMessage extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _sMessage;
   var _sMessageId;
   var _sChannelId;
   var _sCharacterId;
   var _sCharacterName;
   var _btnCancel;
   var _btnOk;
   var _winBackground;
   var _lblGonnaReport;
   var _lblReason;
   var _lblIgnoreToo;
   var _taMessage;
   var _btnIgnoreToo;
   var _cbReason;
   static var CLASS_NAME = "AskReportMessage";
   function AskReportMessage()
   {
      super();
   }
   function get message()
   {
      return this._sMessage;
   }
   function set message(§\t\x0e§)
   {
      this._sMessage = _loc2_;
   }
   function get messageId()
   {
      return this._sMessageId;
   }
   function set messageId(§\f\x1c§)
   {
      this._sMessageId = _loc2_;
   }
   function get channelId()
   {
      return this._sChannelId;
   }
   function set channelId(§\f\x1c§)
   {
      this._sChannelId = _loc2_;
   }
   function get authorId()
   {
      return this._sCharacterId;
   }
   function set authorId(§\f\x1c§)
   {
      this._sCharacterId = _loc2_;
   }
   function get authorName()
   {
      return this._sCharacterName;
   }
   function set authorName(§\b\x18§)
   {
      this._sCharacterName = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.AskReportMessage.CLASS_NAME);
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
      this._btnOk.addEventListener("click",this);
   }
   function initTexts()
   {
      this._winBackground.title = this.api.lang.getText("REPORT_A_SENTANCE");
      this._lblGonnaReport.text = this.api.lang.getText("GONNA_REPORT_THIS_MESSAGE");
      this._lblReason.text = this.api.lang.getText("REASON_WORD") + ":";
      this._lblIgnoreToo.text = this.api.lang.getText("BLACKLIST_MESSAGE_AUTHOR");
      this._btnOk.label = this.api.lang.getText("VALIDATE");
      this._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
   }
   function initData()
   {
      this._taMessage.text = this._sMessage.split("<br/>").join("");
      this._btnIgnoreToo.selected = true;
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = this.api.lang.getAbuseReasons();
      _loc2_.push({id:-1,label:"(" + this.api.lang.getText("PLEASE_SELECT") + ")"});
      for(var i in _loc3_)
      {
         _loc2_.push({id:_loc3_[i].i,label:_loc3_[i].t});
      }
      this._cbReason.dataProvider = _loc2_;
      this._cbReason.selectedIndex = 0;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnOk:
            if(this._cbReason.selectedItem.id > 0)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("REPORT_MESSAGE_CONFIRMATION"),"CAUTION_YESNO",{name:"ReportMessage",listener:this});
            }
            else
            {
               this.api.kernel.showMessage(this.api.lang.getText("ERROR_WORD"),this.api.lang.getText("ERROR_MUST_SELECT_A_REASON"),"ERROR_BOX");
            }
            break;
         case this._btnCancel:
            this.unloadThis();
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "AskYesNoReportMessage")
      {
         var _loc3_ = this._sMessage.substring(this._sMessage.indexOf(": ") + 7,this._sMessage.indexOf("</font>"));
         this.api.network.Chat.reportMessage(this._sCharacterName,this._sMessageId,_loc3_,this._cbReason.selectedItem.id);
         if(this._btnIgnoreToo.selected)
         {
            this.api.kernel.ChatManager.addToBlacklist(this._sCharacterName);
            this.api.kernel.showMessage(undefined,this.api.lang.getText("TEMPORARY_BLACKLISTED_AND_REPORTED",[this._sCharacterName]),"INFO_CHAT");
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("REPORTED",[this._sCharacterName]),"INFO_CHAT");
         }
         this.unloadThis();
      }
   }
   function no(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "AskYesNoReportMessage")
      {
         this.unloadThis();
      }
   }
}
