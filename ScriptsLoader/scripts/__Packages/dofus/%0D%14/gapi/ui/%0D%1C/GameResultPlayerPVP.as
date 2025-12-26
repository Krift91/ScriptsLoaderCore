class dofus.§\r\x14§.gapi.ui.§\r\x1c§.GameResultPlayerPVP extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItems;
   var _lblName;
   var _pbHonour;
   var _lblWinHonour;
   var _pbDisgrace;
   var _lblWinDisgrace;
   var _lblRank;
   var _lblKama;
   var _lblLevel;
   var _mcDeadHead;
   var _mcItemPlacer;
   var _mcItems;
   var _ldrAllDrop;
   function GameResultPlayerPVP()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      _loc4_.items.sortOn("_itemLevel",Array.DESCENDING | Array.NUMERIC);
      this._oItems = _loc4_;
      var _loc5_ = this._mcList._parent.api;
      if(_loc2_)
      {
         switch(_loc4_.type)
         {
            case "monster":
            case "taxcollector":
            case "player":
               this._lblName.text = _loc4_.name;
               if(_loc4_.rank == 0 && !_loc5_.datacenter.Basics.aks_current_server.isHardcore())
               {
                  this._pbHonour._visible = false;
                  this._lblWinHonour._visible = false;
                  this._pbDisgrace._visible = false;
                  this._lblWinDisgrace._visible = false;
                  this._lblRank._visible = false;
               }
               else
               {
                  this._pbHonour._visible = true;
                  this._pbDisgrace._visible = true;
                  this._lblWinDisgrace._visible = true;
                  this._lblWinHonour._visible = true;
                  this._lblRank._visible = true;
                  if(_loc5_.datacenter.Basics.aks_current_server.isHardcore())
                  {
                     if(_global.isNaN(_loc4_.minxp))
                     {
                        this._pbDisgrace._visible = false;
                     }
                     this._pbDisgrace.minimum = _loc4_.minxp;
                     this._pbDisgrace.maximum = _loc4_.maxxp;
                     this._pbDisgrace.value = _loc4_.xp;
                  }
                  else
                  {
                     this._pbDisgrace.minimum = _loc4_.mindisgrace;
                     this._pbDisgrace.maximum = _loc4_.maxdisgrace;
                     this._pbDisgrace.value = _loc4_.disgrace;
                  }
                  this._pbHonour.minimum = _loc4_.minhonour;
                  this._pbHonour.maximum = _loc4_.maxhonour;
                  this._pbHonour.value = _loc4_.honour;
               }
               this._lblWinHonour.text = !_global.isNaN(_loc4_.winhonour) ? _loc4_.winhonour : "";
               if(!_loc5_.datacenter.Basics.aks_current_server.isHardcore())
               {
                  this._lblWinDisgrace.text = !_global.isNaN(_loc4_.windisgrace) ? _loc4_.windisgrace : "";
               }
               else
               {
                  this._lblWinDisgrace.text = !_global.isNaN(_loc4_.winxp) ? _loc4_.winxp : "";
               }
               this._lblRank.text = !_global.isNaN(_loc4_.rank) ? _loc4_.rank : "";
               this._lblKama.text = !_global.isNaN(_loc4_.kama) ? _loc4_.kama : "";
               this._lblLevel.text = _loc4_.level;
               this._mcDeadHead._visible = _loc4_.bDead;
               this.createEmptyMovieClip("_mcItems",10);
               var _loc6_ = false;
               var _loc7_ = _loc4_.items.length;
               while((_loc7_ = _loc7_ - 1) >= 0)
               {
                  var _loc8_ = this._mcItemPlacer._x + 24 * _loc7_;
                  if(_loc8_ < this._mcItemPlacer._x + this._mcItemPlacer._width)
                  {
                     var _loc9_ = _loc4_.items[_loc7_];
                     var _loc10_ = this._mcItems.attachMovie("Container","_ctrItem" + _loc7_,_loc7_,{_x:_loc8_,_y:this._mcItemPlacer._y + 1});
                     _loc10_.setSize(18,18);
                     _loc10_.addEventListener("over",this);
                     _loc10_.addEventListener("out",this);
                     _loc10_.addEventListener("click",this);
                     _loc10_.enabled = true;
                     _loc10_.margin = 0;
                     _loc10_.contentData = _loc9_;
                  }
                  else
                  {
                     _loc6_ = true;
                  }
               }
               this._ldrAllDrop._visible = _loc6_;
         }
      }
      else if(this._lblName.text != undefined)
      {
         this._pbHonour._visible = false;
         this._lblName.text = "";
         this._pbHonour.minimum = 0;
         this._pbHonour.maximum = 100;
         this._pbHonour.value = 0;
         this._pbDisgrace.minimum = 0;
         this._pbDisgrace.maximum = 100;
         this._pbDisgrace.value = 0;
         this._lblWinHonour.text = "";
         this._lblWinDisgrace.text = "";
         this._lblKama.text = "";
         this._mcDeadHead._visible = false;
         this._mcItems.removeMovieClip();
      }
   }
   function init()
   {
      super.init(false);
      this._mcItemPlacer._visible = false;
      this._pbHonour._visible = false;
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
      this._pbHonour.enabled = true;
      this._pbHonour.addEventListener("over",this);
      this._pbHonour.addEventListener("out",this);
      this._pbDisgrace.enabled = true;
      this._pbDisgrace.addEventListener("over",this);
      this._pbDisgrace.addEventListener("out",this);
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
         case this._pbHonour:
         case this._pbDisgrace:
            this._mcList.gapi.showTooltip(_loc2_.target.value + " / " + _loc2_.target.maximum,_loc2_.target,20);
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
