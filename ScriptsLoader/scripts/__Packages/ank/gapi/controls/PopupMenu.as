class ank.gapi.controls.PopupMenu extends ank.gapi.core.§\x1e\n\f§
{
   var _nX;
   var _nY;
   var _bAdminPopupMenu;
   var _aItems;
   var __width;
   var __height;
   var _mcItems;
   var _mcBorder;
   var _mcBackground;
   var _mcForeground;
   static var currentPopupMenu;
   static var CLASS_NAME = "PopupMenu";
   static var LAST_POPUP_VALIDATION = 0;
   static var LAST_POPUP_VALIDATION_WAIT_DELAY = 500;
   static var MAX_ITEM_WIDTH = 150;
   static var ITEM_HEIGHT = 18;
   var _bOver = false;
   var _bRemoved = false;
   var _bCloseOnMouseUp = true;
   var _bGatherPopupMenu = false;
   function PopupMenu()
   {
      super();
   }
   function get isGatherPopupMenu()
   {
      return this._bGatherPopupMenu;
   }
   function set isGatherPopupMenu(§\x19\x0b§)
   {
      this._bGatherPopupMenu = _loc2_;
   }
   function get x()
   {
      return this._nX;
   }
   function get y()
   {
      return this._nY;
   }
   function get removed()
   {
      return this._bRemoved;
   }
   function get adminPopupMenu()
   {
      return this._bAdminPopupMenu;
   }
   function set adminPopupMenu(§\x1c\x16§)
   {
      this._bAdminPopupMenu = _loc2_;
   }
   function addStaticItem(§\x1e\x0b\b§)
   {
      var _loc3_ = new Object();
      _loc3_.text = _loc2_;
      _loc3_.bStatic = true;
      _loc3_.bEnabled = false;
      this._aItems.push(_loc3_);
   }
   function addItem(§\x1e\x0b\b§, §\x1e\x1a\t§, §\x0e\x06§, §\x1d\x11§, §\x1a\r§)
   {
      if(_loc6_ == undefined)
      {
         _loc6_ = true;
      }
      var _loc7_ = new Object();
      _loc7_.text = _loc2_;
      _loc7_.bStatic = false;
      _loc7_.bEnabled = _loc6_;
      _loc7_.obj = _loc3_;
      _loc7_.fn = _loc4_;
      _loc7_.args = _loc5_;
      this._aItems.push(_loc7_);
   }
   function get items()
   {
      return this._aItems;
   }
   function show(nX, nY, §\x17\x17§, §\x13\x1d§, §\x1e\x1b\x1a§)
   {
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this._name);
      if(nX == undefined)
      {
         nX = _root._xmouse;
      }
      if(nY == undefined)
      {
         nY = _root._ymouse;
      }
      this._nX = nX;
      this._nY = nY;
      this.layoutContent(nX,nY,_loc4_,_loc5_);
      if(!_global.isNaN(Number(_loc6_)))
      {
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,this._name,this,this.remove,_loc6_);
         this._bCloseOnMouseUp = false;
      }
      ank.gapi.controls.PopupMenu.currentPopupMenu = this;
      this.addToQueue({object:Mouse,method:Mouse.addListener,params:[this]});
   }
   function init()
   {
      super.init(false,ank.gapi.controls.PopupMenu.CLASS_NAME);
      this._aItems = new Array();
   }
   function createChildren()
   {
      this.createEmptyMovieClip("_mcBorder",10);
      this.createEmptyMovieClip("_mcBackground",20);
      this.createEmptyMovieClip("_mcForeground",30);
      this.createEmptyMovieClip("_mcItems",40);
   }
   function size()
   {
      this.arrange();
   }
   function arrange()
   {
      if(this._bInitialized && (this.__width != undefined && this.__height != undefined))
      {
         this._mcItems._x = this._mcItems._y = 2;
         this._mcBorder._width = this.__width;
         this._mcBorder._height = this.__height;
         this._mcBackground._x = this._mcBackground._y = 1;
         this._mcBackground._width = this.__width - 2;
         this._mcBackground._height = this.__height - 2;
         this._mcForeground._x = this._mcForeground._y = 2;
         this._mcForeground._width = this.__width - 4;
         this._mcForeground._height = this.__height - 4;
         var _loc2_ = this._aItems.length;
         while(_loc2_-- > 0)
         {
            this.arrangeItem(_loc2_,this.__width - 4);
         }
      }
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
      this._mcBorder.clear();
      this._mcBackground.clear();
      this._mcForeground.clear();
      this.drawRoundRect(this._mcBorder,0,0,1,1,0,_loc2_.bordercolor);
      this.drawRoundRect(this._mcBackground,0,0,1,1,0,_loc2_.backgroundcolor);
      this.drawRoundRect(this._mcForeground,0,0,1,1,0,_loc2_.foregroundcolor);
   }
   function drawItem(i, §\f\x15§, nY)
   {
      var _loc4_ = this._mcItems.createEmptyMovieClip("item" + _loc2_,_loc2_);
      var _loc5_ = ank.gapi.controls.Label(_loc4_.attachMovie("Label","_lbl",20,{_width:ank.gapi.controls.PopupMenu.MAX_ITEM_WIDTH,styleName:this.getStyle().labelenabledstyle,wordWrap:true,text:i.text}));
      _loc5_.setPreferedSize("left");
      var _loc6_ = Math.max(ank.gapi.controls.PopupMenu.ITEM_HEIGHT,_loc5_.textHeight + 6);
      if(i.bStatic)
      {
         _loc5_.styleName = this.getStyle().labelstaticstyle;
      }
      else if(!i.bEnabled)
      {
         _loc5_.styleName = this.getStyle().labeldisabledstyle;
      }
      _loc4_.createEmptyMovieClip("bg",10);
      this.drawRoundRect(_loc4_.bg,0,0,1,_loc6_,0,this.getStyle().itembgcolor);
      _loc4_.bg.over = false;
      _loc4_._y = nY;
      if(i.bEnabled)
      {
         _loc4_.bg.onRelease = function()
         {
            ank.gapi.controls.PopupMenu.LAST_POPUP_VALIDATION = getTimer();
            i.fn.apply(i.obj,i.args);
            this._parent._parent._parent.remove();
         };
         _loc4_.bg.onRollOver = function()
         {
            this._parent._parent._parent.onItemOver(this,true);
         };
         _loc4_.bg.onRollOut = _loc4_.bg.onReleaseOutside = function()
         {
            this._parent._parent._parent.onItemOut(this,true);
         };
      }
      else
      {
         _loc4_.bg.onPress = function()
         {
         };
         _loc4_.bg.useHandCursor = false;
         var _loc7_ = new Color(_loc4_.bg);
         if(i.bStatic)
         {
            _loc7_.setRGB(this.getStyle().itemstaticbgcolor);
         }
         else
         {
            _loc7_.setRGB(this.getStyle().itembgcolor);
         }
      }
      return {w:_loc5_.textWidth,h:_loc6_};
   }
   function arrangeItem(§\x04\n§, §\x1e\x1b\x02§)
   {
      var _loc4_ = this._mcItems["item" + _loc2_];
      _loc4_._lbl.setSize(_loc3_,ank.gapi.controls.PopupMenu.ITEM_HEIGHT);
      _loc4_.bg._width = _loc3_;
   }
   function layoutContent(§\x1e\t\x14§, §\x1e\t\x0b§, §\x17\x17§, §\x13\x1d§)
   {
      var _loc6_ = this._aItems.length;
      var _loc7_ = 0;
      var _loc8_ = 0;
      var _loc9_ = 0;
      while(_loc9_ < this._aItems.length)
      {
         var _loc10_ = this.drawItem(this._aItems[_loc9_],_loc9_,_loc8_);
         _loc8_ += _loc10_.h;
         _loc7_ = Math.max(_loc7_,_loc10_.w);
         _loc9_ = _loc9_ + 1;
      }
      this.setSize(_loc7_ + 16,_loc8_ + 4);
      var _loc11_ = !_loc4_ ? this.gapi.screenWidth : Stage.width;
      var _loc12_ = !_loc4_ ? this.gapi.screenHeight : Stage.height;
      if(_loc5_ == true)
      {
         _loc2_ -= this.__width;
      }
      if(_loc2_ > _loc11_ - this.__width)
      {
         this._x = _loc11_ - this.__width;
      }
      else if(_loc2_ < 0)
      {
         this._x = 0;
      }
      else
      {
         this._x = _loc2_;
      }
      if(_loc3_ > _loc12_ - this.__height)
      {
         this._y = _loc12_ - this.__height;
      }
      else if(_loc3_ < 0)
      {
         this._y = 0;
      }
      else
      {
         this._y = _loc3_;
      }
   }
   function removePopupMenu()
   {
      this.remove();
   }
   function remove()
   {
      if(this._bGatherPopupMenu)
      {
         var _loc2_ = _global.API;
         this.addToQueue({object:_loc2_.mouseClicksMemorizer,method:_loc2_.mouseClicksMemorizer.resetForGather});
      }
      ank.gapi.controls.PopupMenu.currentPopupMenu = undefined;
      this._bRemoved = true;
      Mouse.removeListener(this);
      this.removeMovieClip();
   }
   function getEnabledItems()
   {
      var _loc2_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < this._aItems.length)
      {
         var _loc4_ = this._aItems[_loc3_];
         if(_loc4_.bStatic || !_loc4_.bEnabled)
         {
            _loc2_.push(undefined);
         }
         else
         {
            _loc2_.push(_loc4_);
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
   function selectFirstEnabled(§\x1e\x1a§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = this.getEnabledItems();
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc4_ = _loc2_[_loc3_];
         if(_loc4_ != undefined)
         {
            var _loc5_ = this._mcItems["item" + _loc3_];
            this.onItemOver(_loc5_.bg);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function selectLastEnabled(§\x1e\x1a§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = this.getEnabledItems();
      }
      var _loc3_ = _loc2_.length - 1;
      while(_loc3_ >= 0)
      {
         var _loc4_ = _loc2_[_loc3_];
         if(_loc4_ != undefined)
         {
            var _loc5_ = this._mcItems["item" + _loc3_];
            this.onItemOver(_loc5_.bg);
            break;
         }
         _loc3_ = _loc3_ - 1;
      }
   }
   function unselectAll()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._aItems.length)
      {
         var _loc3_ = this._mcItems["item" + _loc2_];
         this.onItemOut(_loc3_.bg);
         _loc2_ = _loc2_ + 1;
      }
   }
   function executeSelectedItem()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._aItems.length)
      {
         var _loc3_ = this._aItems[_loc2_];
         var _loc4_ = this._mcItems["item" + _loc2_];
         if(_loc4_.bg.over)
         {
            _loc3_.fn.apply(_loc3_.obj,_loc3_.args);
            this.remove();
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
   function selectNextItem()
   {
      var _loc2_ = this.getEnabledItems();
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc4_ = _loc2_[_loc3_];
         if(_loc4_ != undefined)
         {
            var _loc5_ = this._mcItems["item" + _loc3_];
            if(_loc5_.bg.over)
            {
               var _loc6_ = _loc3_ + 1;
               while(_loc6_ < _loc2_.length)
               {
                  var _loc7_ = _loc2_[_loc6_];
                  if(_loc7_ != undefined)
                  {
                     var _loc8_ = this._mcItems["item" + _loc6_];
                     this.onItemOver(_loc8_.bg);
                     return undefined;
                  }
                  _loc6_ = _loc6_ + 1;
               }
               break;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      this.selectFirstEnabled(_loc2_);
   }
   function selectPreviousItem()
   {
      var _loc2_ = this.getEnabledItems();
      var _loc3_ = _loc2_.length - 1;
      loop0:
      while(_loc3_ >= 0)
      {
         var _loc4_ = _loc2_[_loc3_];
         if(_loc4_ != undefined)
         {
            var _loc5_ = this._mcItems["item" + _loc3_];
            if(_loc5_.bg.over)
            {
               var _loc6_ = _loc3_ - 1;
               while(true)
               {
                  if(_loc6_ < 0)
                  {
                     break loop0;
                  }
                  var _loc7_ = _loc2_[_loc6_];
                  if(_loc7_ != undefined)
                  {
                     break;
                  }
                  _loc6_ = _loc6_ - 1;
               }
               var _loc8_ = this._mcItems["item" + _loc6_];
               this.onItemOver(_loc8_.bg);
               return undefined;
            }
         }
         _loc3_ = _loc3_ - 1;
      }
      this.selectLastEnabled(_loc2_);
   }
   function onItemOver(§\n\x1b§, §\x16\x0b§)
   {
      if(_loc3_)
      {
         this._bOver = true;
      }
      if(_loc2_.over)
      {
         return undefined;
      }
      this.unselectAll();
      _loc2_.over = true;
      var _loc4_ = new Color(_loc2_);
      _loc4_.setRGB(this.getStyle().itemovercolor);
   }
   function onItemOut(§\n\x1b§, §\x16\x0b§)
   {
      if(_loc3_)
      {
         this._bOver = false;
      }
      if(!_loc2_.over)
      {
         return undefined;
      }
      _loc2_.over = false;
      var _loc4_ = new Color(_loc2_);
      _loc4_.setRGB(this.getStyle().itembgcolor);
   }
   function onMouseUp()
   {
      if(!this._bOver && this._bCloseOnMouseUp)
      {
         this.remove();
      }
   }
}
