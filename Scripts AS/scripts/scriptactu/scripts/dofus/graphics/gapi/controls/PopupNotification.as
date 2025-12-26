_global.dofus["\r\x14"].gapi.controls.PopupNotification = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.PopupNotification.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.PopupNotification.prototype;
_loc1.__get__time = function()
{
   return this._nTime;
};
_loc1.__set__time = function(nTime)
{
   this._nTime = nTime;
};
_loc1.__get__textId = function()
{
   return this._nTextId;
};
_loc1.__set__textId = function(nTextId)
{
   this._nTextId = nTextId;
};
_loc1.destroy = function()
{
   ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this._nTimeoutTimer,"refresh");
};
_loc1.init = function()
{
   super.init(false,_global.dofus["\r\x14"].gapi.controls.PopupNotification.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnReduce.addEventListener("click",this);
   this._btnExpand.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnAccept.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._lblDesc.text = this.api.lang.getText("POPUP_DESC_" + this.textId);
};
_loc1.initData = function()
{
   if(this.time == undefined)
   {
      this.time = 0;
   }
   this._nTimeoutTimer = new Object();
   this.refreshProgressBar();
};
_loc1.refreshProgressBar = function()
{
   var _loc2_ = this._progressBar.value;
   if(this._progressBar.value + 1 > this._progressBar.maximum)
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this._nTimeoutTimer,"timeout");
      this.api.network.Basics.popupResponse(false);
      this.unloadThis();
   }
   else
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this._nTimeoutTimer,"timeout",this,this.refreshProgressBar,this.time / 100);
   }
   this._progressBar.value = Number(_loc2_) + Number(1);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnExpand":
      case "_btnReduce":
         if(this._lblDesc._visible)
         {
            this._win._width = 30;
            this._win._height = 16;
            this._win._x = 0;
            this._win._y = 232.95;
            this._btnCancel._x = 2;
            this._btnCancel._y = 234;
            this._btnAccept._visible = false;
            this._progressBar._visible = false;
            this._lblDesc._visible = false;
            this._btnExpand._visible = true;
            this._btnReduce._visible = false;
         }
         else
         {
            this._win._width = 180;
            this._win._height = 105;
            this._win._x = 28;
            this._win._y = 200;
            this._btnCancel._x = 191.25;
            this._btnCancel._y = 203.4;
            this._btnAccept._visible = true;
            this._progressBar._visible = true;
            this._lblDesc._visible = true;
            this._btnReduce._visible = true;
            this._btnExpand._visible = false;
         }
         break;
      case "_btnAccept":
         this.api.network.Basics.popupResponse(true);
         this.unloadThis();
         break;
      case "_btnCancel":
         this.api.network.Basics.popupResponse(false);
         this.unloadThis();
   }
};
_loc1.addProperty("time",_loc1.__get__time,_loc1.__set__time);
_loc1.addProperty("textId",_loc1.__get__textId,_loc1.__set__textId);
_global.dofus["\r\x14"].gapi.controls.PopupNotification.CLASS_NAME = "PopupNotification";
