if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x14"])
{
   _global.dofus["\r\x14"] = new Object();
}
if(!dofus["\r\x14"].gapi)
{
   _global.dofus["\r\x14"].gapi = new Object();
}
if(!dofus["\r\x14"].gapi.ui)
{
   _global.dofus["\r\x14"].gapi.ui = new Object();
}
_global.dofus["\r\x14"].gapi.ui.ChooseReward = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.ChooseReward.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.ui.ChooseReward.prototype;
_loc1.__set__items = function(_loc2_)
{
   this.sItems = _loc2_;
};
_loc1.__set__tokens = function(aTokens)
{
   this._aTokens = aTokens;
};
_loc1.__set__currentRoom = function(nCurrentRoom)
{
   this._nCurrentRoom = nCurrentRoom;
};
_loc1.__set__openProgres = function(nOpenProg)
{
   this._openProgres = nOpenProg;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.ChooseReward.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initText});
};
_loc1.addListeners = function()
{
   this._btnValidate.addEventListener("click",this);
   this._btnHide.addEventListener("click",this);
   var _loc2_ = 0;
   while(_loc2_ < dofus["\r\x14"].gapi.ui.ChooseReward.SLOT_CHOICES)
   {
      var _loc3_ = this["_ctr" + _loc2_];
      _loc3_.addEventListener("click",this);
      _loc3_.addEventListener("dblClick",this);
      _loc3_.addEventListener("over",this);
      _loc3_.addEventListener("out",this);
      _loc2_ += 1;
   }
};
_loc1.initText = function()
{
   this._bIsDisplayed = true;
   this._winBackgroundSmall._visible = false;
   this._winItemViewerProgress.title = this.api.lang.getText("YOUR_PROGRESS");
   this._winBackgroundSmall.title = this.api.lang.getText("CHOOSE_LOOT");
   this._lblTitles.text = this.api.lang.getText("CHOOSE_LOOT");
   this._btnValidate.label = this.api.lang.getText("VALIDATE");
   this._lblEffects.text = this.api.lang.getText("EFFECTS") + " :";
   this._lblBonus.text = this.api.lang.getText("BONUS_CHOOSEREWARD") + " : ";
   this.setTonicName(0);
   this.setTonicName(1);
   this.setTonicName(2);
   var _loc2_ = 0;
   while(_loc2_ < this._aTokens.length)
   {
      var _loc3_ = this._mcProgressClip["_lblTokens" + _loc2_];
      _loc3_.text = this._aTokens[_loc2_];
      _loc2_ += 1;
   }
   this._mcProgressClip._visible = this._openProgres;
   this._winItemViewerProgress._visible = this._openProgres;
   this.animateProgression(this._nCurrentRoom);
};
_loc1.initData = function()
{
   this.setItemsSlots(this.sItems);
};
_loc1.validateReward = function(_loc2_)
{
   this.api.network.Items.selectRouletteItem(_loc2_);
};
_loc1.animateProgression = function(nCurrentRoom)
{
   this._mcProgressClip.gotoAndStop(nCurrentRoom);
};
_loc1.setTonicName = function(_loc2_)
{
   var _loc2_ = this["_lblTonic" + _loc2_];
   _loc2_.text = this.sItems[_loc2_].realItem.name;
};
_loc1.windowHidder = function()
{
   if(this._bIsDisplayed)
   {
      this._bIsDisplayed = false;
      this._btnHide.backgroundDown = "ButtonMaximizeDown";
      this._btnHide.backgroundUp = "ButtonMaximizeUp";
      this._btnHide.styleName = "OrangeButton";
      this._btnHide._x = 188;
      this._btnHide._y = 417;
      this.swapDepths(this.getDepth() - 666);
   }
   else
   {
      this._bIsDisplayed = true;
      this._btnHide.backgroundDown = "ButtonMinimizeDown";
      this._btnHide.backgroundUp = "ButtonMinimizeUp";
      this._btnHide.styleName = "OrangeButton";
      this._btnHide._x = 574;
      this._btnHide._y = 157;
      this.swapDepths(this.getDepth() + 666);
   }
   this._lblEffects._visible = this._bIsDisplayed;
   this._btnValidate._visible = this._bIsDisplayed;
   this._ctr0._visible = this._bIsDisplayed;
   this._ctr1._visible = this._bIsDisplayed;
   this._ctr2._visible = this._bIsDisplayed;
   this._lblBonus._visible = this._bIsDisplayed;
   this._lblTitles._visible = this._bIsDisplayed;
   this._winItemViewerProgress._visible = this._bIsDisplayed && this._openProgres;
   this._lblTonic0._visible = this._bIsDisplayed;
   this._lblTonic1._visible = this._bIsDisplayed;
   this._lblTonic2._visible = this._bIsDisplayed;
   this._itvItemViewer._visible = this._bIsDisplayed;
   this._itvItemViewerBonus._visible = this._bIsDisplayed;
   this._mcRoulette0._visible = this._bIsDisplayed;
   this._mcRoulette1._visible = this._bIsDisplayed;
   this._mcRoulette2._visible = this._bIsDisplayed;
   this._hidder0._visible = this._bIsDisplayed;
   this._hidder1._visible = this._bIsDisplayed;
   this._mcCadre2._visible = this._bIsDisplayed;
   this._mcCadre1._visible = this._bIsDisplayed;
   this._hidder2._visible = this._bIsDisplayed;
   this.infoVentana._visible = this._bIsDisplayed;
   this._bgHidderWind._visible = this._bIsDisplayed;
   this._bgHidder._visible = this._bIsDisplayed;
   this._mcProgressClip._visible = this._bIsDisplayed && this._openProgres;
   this._winBackgroundSmall._visible = !this._bIsDisplayed;
   var _loc2_ = 0;
   while(_loc2_ < 7)
   {
      var _loc3_ = this["_mcCadre" + _loc2_];
      _loc3_._visible = this._bIsDisplayed;
      _loc2_ += 1;
   }
};
_loc1.setItemsSlots = function(_loc2_)
{
   var _loc3_ = 0;
   while(_loc3_ < dofus["\r\x14"].gapi.ui.ChooseReward.SLOT_CHOICES)
   {
      var _loc7_ = _loc2_[_loc3_];
      var _loc9_ = _loc7_.realItem;
      var _loc10_ = _loc7_.fakeItems;
      var _loc17_ = _loc7_.bonusEffects;
      var _loc18_ = this["_ctr" + _loc3_];
      _loc18_.contentData = _loc9_;
      this["_oBonus" + _loc3_] = _loc17_;
      var _loc6_ = this["_mcRoulette" + _loc3_];
      _loc6_._mcRealIcon.attachMovie("Loader","_ldrRealIcon",this.getNextHighestDepth(),{_width:34,_height:34,_x:-17,_y:-17,scaleContent:true,autoLoad:true,contentPath:_loc9_.iconFile});
      var _loc2_ = 0;
      while(_loc2_ < dofus.aks.ChooseReward.ICONS_NEEDED)
      {
         var _loc5_ = _loc10_[_loc2_];
         var _loc4_ = _loc6_["_mcFakeIcon" + _loc2_];
         _loc4_.attachMovie("Loader","_ldrFakeIcon" + _loc2_,this.getNextHighestDepth(),{_width:34,_height:34,_x:-17,_y:-17,scaleContent:true,autoLoad:true,contentPath:_loc5_.iconFile});
         _loc2_ += 1;
      }
      _loc3_ += 1;
   }
};
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnValidate:
         var _loc6_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoLoot",{title:this.api.lang.getText("QUESTION"),text:this.api.lang.getText("CONFIRM_LOOT",[this["_ctr" + this._nIndex].contentData.name])});
         _loc6_.addEventListener("yes",this);
         break;
      case this._btnHide:
         this.windowHidder();
         break;
      default:
         this._nIndex = _loc2_.target._name.substr(4);
         if(this._nIndex == undefined)
         {
            _global.API.kernel.showMessage(undefined,this.api.lang.getText("PLEASE_SELECT"),"ERROR_CHAT");
            return undefined;
         }
         if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
         {
            this.api.kernel.GameManager.insertItemInChat(_loc2_.target.contentData);
            return undefined;
         }
         var _loc3_ = 0;
         while(_loc3_ < dofus["\r\x14"].gapi.ui.ChooseReward.SLOT_CHOICES)
         {
            var _loc4_ = this["_ctr" + _loc3_];
            _loc4_.selected = this._nIndex == _loc3_;
            _loc3_ += 1;
         }
         this._btnValidate.enabled = true;
         this._itvItemViewer.itemData = _loc2_.target.contentData;
         this._itvItemViewerBonus.itemData = this["_oBonus" + this._nIndex];
         break;
   }
};
_loc1.dblClick = function(_loc2_)
{
   this._nIndex = _loc2_.target._name.substr(4);
   if(this._nIndex == undefined)
   {
      _global.API.kernel.showMessage(undefined,this.api.lang.getText("PLEASE_SELECT"),"ERROR_CHAT");
      return undefined;
   }
   var _loc3_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoLoot",{title:this.api.lang.getText("QUESTION"),text:this.api.lang.getText("CONFIRM_LOOT",[this["_ctr" + this._nIndex].contentData.name])});
   _loc3_.addEventListener("yes",this);
};
_loc1.yes = function(_loc2_)
{
   if(_loc2_.target._name === "AskYesNoLoot")
   {
      this.validateReward(this._nIndex);
      this.unloadThis();
   }
};
_loc1.addProperty("items",function()
{
}
,_loc1.__set__items);
_loc1.addProperty("tokens",function()
{
}
,_loc1.__set__tokens);
_loc1.addProperty("currentRoom",function()
{
}
,_loc1.__set__currentRoom);
_loc1.addProperty("openProgres",function()
{
}
,_loc1.__set__openProgres);
this._oBonus0 = "";
this._oBonus1 = "";
this._oBonus2 = "";
ASSetPropFlags(_loc1,null,1);
_loc1.sItems = "";
_loc1._nIndex = 0;
_global.dofus["\r\x14"].gapi.ui.ChooseReward.ITEM_TYPE = 126;
_global.dofus["\r\x14"].gapi.ui.ChooseReward.SLOT_CHOICES = 3;
_global.dofus["\r\x14"].gapi.ui.ChooseReward.CLASS_NAME = "ChooseReward";
