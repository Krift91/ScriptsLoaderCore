class dofus.§\r\x14§.gapi.ui.§\r\x1c§.§\r\x1b§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItems;
   var _lblName;
   var _pbXP;
   var _lblWinXP;
   var _lblGuildXP;
   var _lblMountXP;
   var _lblKama;
   var _lblLevel;
   var _mcDeadHead;
   var _mcItemPlacer;
   var _mcItems;
   var _ldrAllDrop;
   function §\r\x1b§()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      this._oItems = _loc4_;
      if(_loc2_)
      {
         switch(_loc4_.type)
         {
            case "monster":
            case "taxcollector":
            case "player":
               this._lblName.text = _loc4_.name;
               if(_global.isNaN(_loc4_.xp))
               {
                  this._pbXP._visible = false;
               }
               else
               {
                  this._pbXP._visible = true;
                  this._pbXP.minimum = _loc4_.minxp;
                  this._pbXP.maximum = _loc4_.maxxp;
                  this._pbXP.value = _loc4_.xp;
               }
               this._lblWinXP.text = !_global.isNaN(_loc4_.winxp) ? _loc4_.winxp : "";
               this._lblGuildXP.text = !_global.isNaN(_loc4_.guildxp) ? _loc4_.guildxp : "";
               this._lblMountXP.text = !_global.isNaN(_loc4_.mountxp) ? _loc4_.mountxp : "";
               this._lblKama.text = !_global.isNaN(_loc4_.kama) ? _loc4_.kama : "";
               this._lblLevel.text = _loc4_.level;
               this._mcDeadHead._visible = _loc4_.bDead;
               this.createEmptyMovieClip("_mcItems",10);
               var _loc5_ = false;
               _loc4_.items.sortOn(["_itemLevel","_itemName"],Array.DESCENDING | Array.NUMERIC);
               var _loc6_ = _loc4_.items.length;
               while((_loc6_ = _loc6_ - 1) >= 0)
               {
                  var _loc7_ = this._mcItemPlacer._x + 24 * _loc6_;
                  if(_loc7_ < this._mcItemPlacer._x + this._mcItemPlacer._width)
                  {
                     var _loc8_ = _loc4_.items[_loc6_];
                     var _loc9_ = this._mcItems.attachMovie("Container","_ctrItem" + _loc6_,_loc6_,{_x:_loc7_,_y:this._mcItemPlacer._y + 1});
                     _loc9_.setSize(18,18);
                     _loc9_.addEventListener("over",this);
                     _loc9_.addEventListener("out",this);
                     _loc9_.addEventListener("click",this);
                     _loc9_.enabled = true;
                     _loc9_.margin = 0;
                     _loc9_.contentData = _loc8_;
                  }
                  else
                  {
                     _loc5_ = true;
                  }
               }
               this._ldrAllDrop._visible = _loc5_;
         }
      }
      else if(this._lblName.text != undefined)
      {
         this._pbXP._visible = false;
         this._lblName.text = "";
         this._pbXP.minimum = 0;
         this._pbXP.maximum = 100;
         this._pbXP.value = random(99);
         this._lblWinXP.text = "";
         this._lblKama.text = "";
         this._mcDeadHead._visible = false;
         this._mcItems.removeMovieClip();
         this._ldrAllDrop._visible = false;
      }
   }
   function init()
   {
      super.init(false);
      this._mcItemPlacer._alpha = 0;
      this._mcDeadHead._visible = false;
      this.addToQueue({object:this,method:this.addListeners});
   }
   function size()
   {
      super.size();
   }
   function addListeners()
   {
      var _loc2_ = this;
      this._ldrAllDrop.addEventListener("over",this);
      this._ldrAllDrop.addEventListener("out",this);
      this._pbXP.enabled = true;
      this._pbXP.addEventListener("over",this);
      this._pbXP.addEventListener("out",this);
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._ldrAllDrop:
            var _loc3_ = this._oItems.items;
            var _loc4_ = "";
            var _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               var _loc6_ = _loc3_[_loc5_];
               if(_loc5_ > 0)
               {
                  _loc4_ += "\n";
               }
               _loc4_ += _loc6_.Quantity + " x " + _loc6_.name;
               _loc5_ = _loc5_ + 1;
            }
            if(_loc4_ != "")
            {
               this._mcList.gapi.showTooltip(_loc4_,_loc2_.target,30);
            }
            break;
         case this._pbXP:
            this._mcList.gapi.showTooltip(this._oItems.xp + " / " + this._oItems.maxxp,_loc2_.target,20);
            break;
         default:
            var _loc7_ = _loc2_.target.contentData;
            var _loc8_ = _loc7_.style + "ToolTip";
            this._mcList.gapi.showTooltip(_loc7_.Quantity + " x " + _loc7_.name,_loc2_.target,20,undefined,_loc8_);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this._mcList.gapi.hideTooltip();
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.contentData;
      if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc3_ != undefined)
      {
         this._mcList._parent.gapi.api.kernel.GameManager.insertItemInChat(_loc3_);
      }
   }
}
