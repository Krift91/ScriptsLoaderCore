class ank.gapi.§\r\x19§ extends ank.§\x1e\n\x07§.§\x1e\x15\x11§
{
   var pmPopupMenu;
   var _oAPI;
   var _nScreenWidth;
   var _nScreenHeight;
   var _oUIComponentsList;
   var _eaUIComponentsInstances;
   var nPopupMenuCnt;
   var _mcLayer_Popup;
   var _nLastSetCursorTimer;
   var _mcLayer_Cursor;
   var dispatchEvent;
   var _sLastAutoHideComponent;
   var _mcLayer_UI_Top;
   var _mcLayer_UI_Ultimate;
   var _mcLayer_UI;
   static var MAX_DELAY_CURSOR = 250;
   static var CURSOR_MAX_SIZE = 40;
   static var CURSOR_CENTER = [-20,-20];
   static var DBLCLICK_DELAY = 250;
   var _oDragClipsList = null;
   var _oCursorData = null;
   var _oCursorAligment = null;
   function §\r\x19§()
   {
      super();
      this.initialize();
   }
   function get currentPopupMenu()
   {
      return this.pmPopupMenu;
   }
   function set api(oAPI)
   {
      this._oAPI = oAPI;
   }
   function get api()
   {
      return this._oAPI;
   }
   function get screenWidth()
   {
      return this._nScreenWidth != undefined ? this._nScreenWidth : Stage.width;
   }
   function get screenHeight()
   {
      return this._nScreenHeight != undefined ? this._nScreenHeight : Stage.height;
   }
   function clear()
   {
      this.createEmptyMovieClip("_mcLayer_UI",10).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["GAPI/UI"];
      this.createEmptyMovieClip("_mcLayer_UI_Top",20).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["GAPI/UITop"];
      this.createEmptyMovieClip("_mcLayer_UI_Ultimate",30).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["GAPI/UIUltimate"];
      this.createEmptyMovieClip("_mcLayer_Popup",40).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["GAPI/Popup"];
      this.createEmptyMovieClip("_mcLayer_Cursor",50).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["GAPI/Cursor"];
      this._oUIComponentsList = new Object();
      this._eaUIComponentsInstances = new ank["\x1e\n\x07"]["\x0f\x01"]();
   }
   function setScreenSize(§\x1e\x1b\x02§, §\x04\x17§)
   {
      this._nScreenWidth = _loc2_;
      this._nScreenHeight = _loc3_;
   }
   function createPopupMenu(§\x1e\r\x07§, §\x1c\x16§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      var _loc4_ = this.pmPopupMenu;
      if(_loc2_ == undefined)
      {
         _loc2_ = "BrownPopupMenu";
      }
      if(this.nPopupMenuCnt == undefined)
      {
         this.nPopupMenuCnt = 0;
      }
      var _loc5_ = this.nPopupMenuCnt++;
      this.pmPopupMenu = ank.gapi.controls.PopupMenu(this._mcLayer_Popup.attachMovie("PopupMenu","_mcPopupMenu" + _loc5_,_loc5_,{styleName:_loc2_,gapi:this}));
      _loc4_.removeMovieClip();
      this.pmPopupMenu.adminPopupMenu = _loc3_;
      return this.pmPopupMenu;
   }
   function removePopupMenu()
   {
      this.pmPopupMenu.removeMovieClip();
   }
   function showFixedTooltip(§\x1e\f\x12§, §\x1e\t\r§, §\x1e\t\x0b§, §\x1e\x18\x0b§, §\x1e\x0f\x16§)
   {
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      if(typeof _loc3_ == "movieclip")
      {
         var _loc8_ = _loc3_;
         var _loc9_ = {x:_loc8_._x,y:_loc8_._y};
         _loc8_._parent.localToGlobal(_loc9_);
         var _loc7_ = _loc9_.x;
         _loc4_ += _loc9_.y;
      }
      else
      {
         _loc7_ = Number(_loc3_);
      }
      if(this._mcLayer_Popup["_mcToolTip" + _loc6_] != undefined)
      {
         var _loc10_ = this._mcLayer_Popup["_mcToolTip" + _loc6_];
         _loc10_.params = _loc5_;
         _loc10_.x = _loc7_;
         _loc10_.y = _loc4_;
         _loc10_.text = _loc2_;
      }
      else
      {
         this._mcLayer_Popup.attachMovie("ToolTip","_mcToolTip" + _loc6_,this._mcLayer_Popup.getNextHighestDepth(),{text:_loc2_,x:_loc7_,y:_loc4_,params:_loc5_,gapi:this});
      }
   }
   function showTooltip(§\x1e\f\x12§, §\x1e\t\r§, §\x1e\t\x0b§, §\x1e\x18\x0b§, §\x1e\r\x07§)
   {
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      if(typeof _loc3_ == "movieclip")
      {
         var _loc8_ = _loc3_;
         var _loc9_ = {x:_loc8_._x,y:_loc8_._y};
         _loc8_._parent.localToGlobal(_loc9_);
         this.globalToLocal(_loc9_);
         var _loc7_ = _loc9_.x;
         _loc4_ += _loc9_.y;
      }
      else
      {
         _loc7_ = Number(_loc3_);
      }
      if(this._mcLayer_Popup._mcToolTip != undefined)
      {
         var _loc10_ = this._mcLayer_Popup._mcToolTip;
         _loc10_.params = _loc5_;
         _loc10_.x = _loc7_;
         _loc10_.y = _loc4_;
         _loc10_.text = _loc2_;
      }
      else
      {
         this._mcLayer_Popup.attachMovie("ToolTip","_mcToolTip",this._mcLayer_Popup.getNextHighestDepth(),{text:_loc2_,x:_loc7_,y:_loc4_,params:_loc5_,gapi:this,styleName:_loc6_});
      }
   }
   function hideTooltip()
   {
      this._mcLayer_Popup._mcToolTip.removeMovieClip();
   }
   function onContentLoaded(§\x1e\x19\x0e§)
   {
      if(!dofus.Constants.DOUBLEFRAMERATE)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.content;
      var _loc4_ = this.api.kernel.OptionsManager.getOption("RemasteredSpellIconsPack");
      _loc3_.gotoAndStop(_loc4_);
   }
   function setCursor(§\x1e\x19\x15§, §\x1e\x1a\r§, §\x14\x1c§)
   {
      if(_loc4_ == undefined)
      {
         _loc4_ = false;
      }
      this._nLastSetCursorTimer = getTimer();
      this.removeCursor();
      if(_loc3_ == undefined)
      {
         _loc3_ = new Object();
      }
      _loc3_.width = _loc3_.width == undefined ? ank.gapi["\r\x19"].CURSOR_MAX_SIZE : _loc3_.width;
      _loc3_.height = _loc3_.height == undefined ? ank.gapi["\r\x19"].CURSOR_MAX_SIZE : _loc3_.height;
      _loc3_.x = _loc3_.x == undefined ? ank.gapi["\r\x19"].CURSOR_CENTER[0] : _loc3_.x;
      _loc3_.y = _loc3_.y == undefined ? ank.gapi["\r\x19"].CURSOR_CENTER[1] : _loc3_.y;
      var _loc5_ = ank.gapi.controls.Container(this._mcLayer_Cursor.attachMovie("Container","cursor1",10));
      if(_loc4_)
      {
         _loc5_.addEventListener("onContentLoaded",this);
      }
      _loc5_.setSize(_loc3_.width,_loc3_.height);
      _loc5_.move(_loc3_.x,_loc3_.y);
      _loc5_.contentData = _loc2_;
      this._oCursorAligment = _loc3_;
      this._oCursorData = _loc2_;
      this._mcLayer_Cursor.startDrag(true);
   }
   function setCursorForbidden(§\x19\x1c§, §\x1e\x13\x06§)
   {
      if(this.isCursorHidden())
      {
         return undefined;
      }
      if(_loc2_ == undefined)
      {
         _loc2_ = false;
      }
      if(_loc2_)
      {
         if(this._mcLayer_Cursor.mcForbidden == undefined)
         {
            var _loc4_ = this._mcLayer_Cursor.attachMovie("Loader","mcForbidden",20,{scaleContent:true});
            _loc4_.setSize(this._oCursorAligment.width,this._oCursorAligment.height);
            _loc4_.move(this._oCursorAligment.x,this._oCursorAligment.y);
            _loc4_.contentPath = _loc3_;
         }
      }
      else
      {
         this._mcLayer_Cursor.mcForbidden.removeMovieClip();
      }
   }
   function getCursor()
   {
      return this._oCursorData;
   }
   function isCursorHidden()
   {
      return this._mcLayer_Cursor.cursor1 == undefined;
   }
   function removeCursor(§\x1b\x06§)
   {
      this.hideCursor(_loc2_);
      if(this._oCursorData == undefined)
      {
         return false;
      }
      delete this._oCursorData;
      return true;
   }
   function hideCursor(§\x1b\x06§)
   {
      this.setCursorForbidden(false);
      this._mcLayer_Cursor.stopDrag();
      this._mcLayer_Cursor.cursor1.removeMovieClip();
      if(_loc2_ == true)
      {
         this.dispatchEvent({type:"removeCursor"});
      }
   }
   function unloadLastUIAutoHideComponent()
   {
      return this.unloadUIComponent(this._sLastAutoHideComponent);
   }
   function loadUIAutoHideComponent(§\x1e\x10\x0e§, §\x1e\x11\b§, §\x1e\x19\x1a§, §\x1e\x17\x0b§)
   {
      if(this._sLastAutoHideComponent != _loc2_)
      {
         this.unloadUIComponent(this._sLastAutoHideComponent);
      }
      this._sLastAutoHideComponent = _loc2_;
      return this.loadUIComponent(_loc2_,_loc3_,_loc4_,_loc5_);
   }
   function loadUIComponent(§\x1e\x10\x0e§, §\x1e\x11\b§, §\x1e\x19\x1a§, §\x1e\x17\x0b§)
   {
      if(_loc5_.bForceLoad == undefined)
      {
         var _loc6_ = false;
      }
      else
      {
         _loc6_ = _loc5_.bForceLoad;
      }
      if(_loc5_.bStayIfPresent == undefined)
      {
         var _loc7_ = false;
      }
      else
      {
         _loc7_ = _loc5_.bStayIfPresent;
      }
      if(_loc5_.bAlwaysOnTop == undefined)
      {
         var _loc8_ = false;
      }
      else
      {
         _loc8_ = _loc5_.bAlwaysOnTop;
      }
      if(_loc5_.bUltimateOnTop == undefined)
      {
         var _loc9_ = false;
      }
      else
      {
         _loc9_ = _loc5_.bUltimateOnTop;
      }
      if(dofus.Constants.DOUBLEFRAMERATE)
      {
         switch(_loc2_)
         {
            case "AutomaticServer":
            case "BigStoreBuy":
            case "JoinFriend":
            case "StringCourse":
            case "Waiting":
            case "AskGameBegin":
            case "Login":
            case "Inventory":
               _loc2_ += "_DoubleFramerate";
         }
      }
      if(_loc2_.substring(0,3) == "Ask")
      {
         _loc9_ = true;
      }
      if(this._oUIComponentsList[_loc3_] != undefined)
      {
         if(_loc7_)
         {
            var _loc10_ = this._oUIComponentsList[_loc3_];
            for(var k in _loc4_)
            {
               _loc10_[k] = _loc4_[k];
            }
            return null;
         }
         this.unloadUIComponent(_loc3_);
         if(!_loc6_)
         {
            return null;
         }
      }
      if(_loc4_ == undefined)
      {
         _loc4_ = new Object();
      }
      _loc4_.api = this._oAPI;
      _loc4_.gapi = this;
      _loc4_.instanceName = _loc3_;
      if(_loc8_)
      {
         var _loc11_ = this._mcLayer_UI_Top;
      }
      else if(_loc9_)
      {
         _loc11_ = this._mcLayer_UI_Ultimate;
      }
      else
      {
         _loc11_ = this._mcLayer_UI;
      }
      var _loc12_ = _loc11_.attachMovie("UI_" + _loc2_,_loc3_,_loc11_.getNextHighestDepth(),_loc4_);
      this._oUIComponentsList[_loc3_] = _loc12_;
      this._eaUIComponentsInstances.push({name:_loc3_});
      return _loc12_;
   }
   function unloadUIComponent(§\x1e\x11\b§)
   {
      var _loc3_ = this.getUIComponent(_loc2_);
      delete this._oUIComponentsList[_loc2_];
      var _loc4_ = this._eaUIComponentsInstances.findFirstItem("name",_loc2_);
      if(_loc4_.index != -1)
      {
         this._eaUIComponentsInstances.removeItems(_loc4_.index,1);
      }
      if(_loc3_ == undefined)
      {
         return false;
      }
      _loc3_.destroy();
      Key.removeListener(_loc3_);
      this.api.kernel.KeyManager.removeShortcutsListener(_loc3_);
      this.api.kernel.KeyManager.removeKeysListener(_loc3_);
      _loc3_.removeMovieClip();
      return true;
   }
   function getUIComponent(§\x1e\x11\b§)
   {
      var _loc3_ = this._mcLayer_UI[_loc2_];
      if(_loc3_ == undefined)
      {
         _loc3_ = this._mcLayer_UI_Top[_loc2_];
      }
      if(_loc3_ == undefined)
      {
         _loc3_ = this._mcLayer_UI_Ultimate[_loc2_];
      }
      if(_loc3_ == undefined)
      {
         return null;
      }
      return _loc3_;
   }
   function callCloseOnLastUI(§\x04\n§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = this._eaUIComponentsInstances.length - 1;
      }
      if(_loc2_ < 0)
      {
         return false;
      }
      if(_global.isNaN(_loc2_))
      {
         return false;
      }
      var _loc3_ = this.getUIComponent(this._eaUIComponentsInstances[_loc2_].name);
      if(_loc3_.callClose() == true)
      {
         return true;
      }
      return this.callCloseOnLastUI(_loc2_ - 1);
   }
   function initialize()
   {
      this.clear();
      ank.gapi.styles["\x1e\f\b"].loadStylePackage(ank.gapi.styles["\x11\x06"]);
      eval("\t\x04").events["\x0f\x03"].initialize(this);
   }
   function addDragClip()
   {
   }
   function removeDragClip()
   {
   }
   function onMouseUp()
   {
      if(this._oCursorData == undefined)
      {
         return undefined;
      }
      var _loc2_ = getTimer() - this._nLastSetCursorTimer;
      if(_global.isNaN(_loc2_))
      {
         return undefined;
      }
      if(_loc2_ < ank.gapi["\r\x19"].MAX_DELAY_CURSOR)
      {
         return undefined;
      }
      this.hideCursor(true);
   }
}
