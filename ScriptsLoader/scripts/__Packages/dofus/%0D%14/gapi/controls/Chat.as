class dofus.§\r\x14§.gapi.controls.Chat extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _btnFilter0;
   var _btnFilter1;
   var _btnFilter2;
   var _btnFilter3;
   var _btnFilter4;
   var _btnFilter5;
   var _btnFilter6;
   var _btnFilter7;
   var _btnFilter8;
   var _txtChat;
   var _btnOpenClose;
   var _sSmileys;
   var _bSmileysOpened;
   var _btnSitDown;
   var _btnSmileys;
   var dispatchEvent;
   static var CLASS_NAME = "Chat";
   static var OPEN_OFFSET = 350;
   var _bOpened = false;
   function Chat()
   {
      super();
   }
   function get filters()
   {
      return new Array(this._btnFilter0.selected,this._btnFilter1.selected,this._btnFilter2.selected,this._btnFilter3.selected,this._btnFilter4.selected,this._btnFilter5.selected,this._btnFilter6.selected,this._btnFilter7.selected,this._btnFilter8.selected);
   }
   function get selectable()
   {
      return this._txtChat.selectable;
   }
   function set selectable(§\x15\x15§)
   {
      this._txtChat.selectable = _loc2_;
   }
   function open(§\x16\x17§)
   {
      if(_loc2_ == !this._bOpened)
      {
         return undefined;
      }
      this._btnOpenClose.selected = !_loc2_;
      if(_loc2_)
      {
         var _loc3_ = -1;
      }
      else
      {
         _loc3_ = 1;
      }
      this._txtChat.setSize(this._txtChat.width,this._txtChat.height + _loc3_ * dofus["\r\x14"].gapi.controls.Chat.OPEN_OFFSET);
      this._y -= _loc3_ * dofus["\r\x14"].gapi.controls.Chat.OPEN_OFFSET;
      this._bOpened = !_loc2_;
   }
   function setText(§\x1e\f\x12§)
   {
      this._txtChat.text = _loc2_;
   }
   function updateSmileysEmotes()
   {
      this._sSmileys.update();
   }
   function hideSmileys(§\x19\t§)
   {
      this._sSmileys._visible = !_loc2_;
      this._bSmileysOpened = !_loc2_;
   }
   function showSitDown(§\x15\x0e§)
   {
      this._btnSitDown._visible = _loc2_;
   }
   function selectFilter(§\x05\x03§, §\x15\x16§)
   {
      this["_btnFilter" + _loc2_].selected = _loc3_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.Chat.CLASS_NAME);
      this.api.kernel.ChatManager.updateRigth();
   }
   function createChildren()
   {
      var _loc2_ = this.api.lang.getConfigText("CHAT_FILTERS");
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(_loc2_[_loc3_] != 1)
         {
            this["_btnFilter" + (_loc3_ + 1)]._visible = false;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.addToQueue({object:this,method:this.addListeners});
      this.hideSmileys(true);
   }
   function addListeners()
   {
      this._btnOpenClose.addEventListener("click",this);
      this._btnSmileys.addEventListener("click",this);
      this._btnFilter0.addEventListener("click",this);
      this._btnFilter1.addEventListener("click",this);
      this._btnFilter2.addEventListener("click",this);
      this._btnFilter3.addEventListener("click",this);
      this._btnFilter4.addEventListener("click",this);
      this._btnFilter5.addEventListener("click",this);
      this._btnFilter6.addEventListener("click",this);
      this._btnFilter7.addEventListener("click",this);
      this._btnFilter8.addEventListener("click",this);
      this._btnSitDown.addEventListener("click",this);
      this._btnOpenClose.addEventListener("over",this);
      this._btnSmileys.addEventListener("over",this);
      this._btnFilter0.addEventListener("over",this);
      this._btnFilter1.addEventListener("over",this);
      this._btnFilter2.addEventListener("over",this);
      this._btnFilter3.addEventListener("over",this);
      this._btnFilter4.addEventListener("over",this);
      this._btnFilter5.addEventListener("over",this);
      this._btnFilter6.addEventListener("over",this);
      this._btnFilter7.addEventListener("over",this);
      this._btnFilter8.addEventListener("over",this);
      this._btnSitDown.addEventListener("over",this);
      this._btnOpenClose.addEventListener("out",this);
      this._btnSmileys.addEventListener("out",this);
      this._btnFilter0.addEventListener("out",this);
      this._btnFilter1.addEventListener("out",this);
      this._btnFilter2.addEventListener("out",this);
      this._btnFilter3.addEventListener("out",this);
      this._btnFilter4.addEventListener("out",this);
      this._btnFilter5.addEventListener("out",this);
      this._btnFilter6.addEventListener("out",this);
      this._btnFilter7.addEventListener("out",this);
      this._btnFilter8.addEventListener("out",this);
      this._btnSitDown.addEventListener("out",this);
      this._sSmileys.addEventListener("selectSmiley",this);
      this._sSmileys.addEventListener("selectEmote",this);
      this._txtChat.addEventListener("href",this);
      var _loc2_ = this._btnFilter0;
      var _loc3_ = 0;
      while(_loc2_ != undefined)
      {
         _loc2_.selected = this.api.datacenter.Basics.chat_type_visible[_loc3_] == true;
         this.api.kernel.ChatManager.setTypeVisible(_loc3_,_loc2_.selected);
         _loc3_ = _loc3_ + 1;
         _loc2_ = this["_btnFilter" + _loc3_];
      }
      this.api.kernel.ChatManager.setTypeVisible(1,true);
      this.api.kernel.ChatManager.refresh();
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnSitDown":
            this.api.sounds.events.onBannerChatButtonClick();
            var _loc3_ = this.api.lang.getEmoteID("sit");
            if(_loc3_ != undefined)
            {
               this.api.network.Emotes.useEmote(_loc3_);
            }
            break;
         case "_btnSmileys":
            this.api.sounds.events.onBannerChatButtonClick();
            this.hideSmileys(this._bSmileysOpened);
            break;
         case "_btnOpenClose":
            this.api.sounds.events.onBannerChatButtonClick();
            this.open(!_loc2_.target.selected);
            break;
         default:
            this.dispatchEvent({type:"filterChanged",filter:Number(_loc2_.target._name.substr(10)),selected:_loc2_.target.selected});
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnSmileys":
            this.gapi.showTooltip(this.api.lang.getText("CHAT_SHOW_SMILEYS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         case "_btnOpenClose":
            this.gapi.showTooltip(this.api.lang.getText("CHAT_SHOW_MORE"),_loc2_.target,-33,{bXLimit:true,bYLimit:false});
            break;
         case "_btnSitDown":
            this.gapi.showTooltip(this.api.lang.getText("SITDOWN_TOOLTIP"),_loc2_.target,-46,{bXLimit:true,bYLimit:false});
            break;
         default:
            var _loc3_ = Number(_loc2_.target._name.substr(10));
            this.gapi.showTooltip(this.api.lang.getText("CHAT_TYPE" + _loc3_),_loc2_.target,-20,{bXLimit:true,bYLimit:true});
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function selectSmiley(§\x1e\x19\x0e§)
   {
      if(!this.api.datacenter.Player.data.isInMove)
      {
         this.dispatchEvent(_loc2_);
         if(this.api.kernel.OptionsManager.getOption("AutoHideSmileys"))
         {
            this.hideSmileys(true);
            this._btnSmileys.selected = false;
         }
      }
   }
   function selectEmote(§\x1e\x19\x0e§)
   {
      if(!this.api.datacenter.Player.data.isInMove)
      {
         this.dispatchEvent(_loc2_);
         if(this.api.kernel.OptionsManager.getOption("AutoHideSmileys"))
         {
            this.hideSmileys(true);
         }
         this._btnSmileys.selected = false;
      }
   }
   function href(§\x1e\x19\x0e§)
   {
      this.dispatchEvent(_loc2_);
   }
}
