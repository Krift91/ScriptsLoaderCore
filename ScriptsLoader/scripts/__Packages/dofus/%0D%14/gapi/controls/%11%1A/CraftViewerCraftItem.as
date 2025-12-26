class dofus.§\r\x14§.gapi.controls.§\x11\x1a§.CraftViewerCraftItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _ctrItemIcon;
   var _lblItemName;
   var _mcTooltip;
   var _lblSkill;
   function CraftViewerCraftItem()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      this._oItem = _loc4_;
      if(_loc2_)
      {
         this._ctrItemIcon.contentData = _loc4_.craftItem;
         this._ctrItemIcon._visible = true;
         this._lblItemName.text = _loc4_.craftItem.name + " (" + this._mcList._parent.api.lang.getText("LEVEL_SMALL") + " " + _loc4_.craftItem.level + ")";
         switch(_loc4_.difficulty)
         {
            case 1:
               this._lblItemName.styleName = "DarkGrayLeftSmallLabel";
               break;
            case 2:
               this._lblItemName.styleName = "GreenLeftSmallBoldLabel";
               break;
            case 3:
               this._lblItemName.styleName = "RedLeftSmallBoldLabel";
         }
         this._mcTooltip.onRollOver = function()
         {
            this._parent.onTooltipRollOver();
         };
         this._mcTooltip.onRollOut = function()
         {
            this._parent.onTooltipRollOut();
         };
         this._mcTooltip.onRelease = function()
         {
            this._parent.click({target:{_name:"_lblItemIcon"}});
         };
         if(_loc4_.skill != undefined)
         {
            this._lblSkill.text = "(" + _loc4_.skill.description + " " + this._mcList._parent.api.lang.getText("ON") + " " + _loc4_.skill.interactiveObject + ")";
         }
         var _loc5_ = _loc4_.items;
         var _loc6_ = _loc5_.length;
         var _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            var _loc8_ = _loc5_[_loc7_];
            this["_ctr" + _loc7_]._visible = true;
            this["_ctr" + _loc7_].contentData = _loc8_;
            this["_lblPlus" + _loc7_]._visible = true;
            _loc7_ = _loc7_ + 1;
         }
         var _loc9_ = _loc6_;
         while(_loc9_ < 8)
         {
            this["_ctr" + _loc9_]._visible = false;
            this["_lblPlus" + _loc9_]._visible = false;
            _loc9_ = _loc9_ + 1;
         }
      }
      else if(this._lblItemName.text != undefined)
      {
         this._ctrItemIcon.contentData = "";
         this._ctrItemIcon._visible = false;
         this._lblItemName.text = "";
         this._lblSkill.text = "";
         var _loc10_ = 0;
         while(_loc10_ < 8)
         {
            this["_ctr" + _loc10_]._visible = false;
            this["_lblPlus" + _loc10_]._visible = false;
            _loc10_ = _loc10_ + 1;
         }
      }
   }
   function init()
   {
      super.init(false);
      this._ctrItemIcon._visible = false;
      var _loc3_ = 0;
      while(_loc3_ < 8)
      {
         this["_ctr" + _loc3_]._visible = this["_lblPlus" + _loc3_]._visible = false;
         _loc3_ = _loc3_ + 1;
      }
      this.addToQueue({object:this,method:this.addListeners});
   }
   function size()
   {
      super.size();
   }
   function addListeners()
   {
      var _loc2_ = 0;
      while(_loc2_ < 8)
      {
         this["_ctr" + _loc2_].addEventListener("over",this);
         this["_ctr" + _loc2_].addEventListener("out",this);
         this["_ctr" + _loc2_].addEventListener("click",this);
         _loc2_ = _loc2_ + 1;
      }
      this._ctrItemIcon.addEventListener("click",this);
   }
   function setContainerContentData(§\x04\n§, §\x1e\x19\x03§)
   {
      this["_ctr" + _loc2_].contentData = _loc3_;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_ctrItemIcon":
         case "_lblItemIcon":
            if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && this._oItem != undefined)
            {
               this._mcList._parent.gapi.api.kernel.GameManager.insertItemInChat(this._oItem.craftItem,"","=");
               var _loc3_ = 0;
               while(_loc3_ < this._oItem.items.length)
               {
                  var _loc4_ = this._oItem.items[_loc3_];
                  this._mcList._parent.gapi.api.kernel.GameManager.insertItemInChat(_loc4_,_loc4_.Quantity + "x",_loc3_ >= this._oItem.items.length - 1 ? "" : "+");
                  _loc3_ = _loc3_ + 1;
               }
            }
            else
            {
               this._mcList._parent.craftItem(this._ctrItemIcon.contentData);
            }
            break;
         default:
            var _loc5_ = _loc2_.target.contentData;
            if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc5_ != undefined)
            {
               this._mcList._parent.gapi.api.kernel.GameManager.insertItemInChat(_loc5_);
               break;
            }
            this._mcList._parent.craftItem(_loc5_);
            break;
      }
   }
   function onTooltipRollOver()
   {
      var _loc2_ = "";
      switch(this._oItem.difficulty)
      {
         case 1:
            _loc2_ = this._mcList._parent.gapi.api.lang.getText("CRAFT_DIFFICULTY1");
            break;
         case 2:
            _loc2_ = this._mcList._parent.gapi.api.lang.getText("CRAFT_DIFFICULTY2");
            break;
         case 3:
            _loc2_ = this._mcList._parent.gapi.api.lang.getText("CRAFT_DIFFICULTY3");
      }
      this._mcList._parent.gapi.showTooltip(_loc2_,this._mcTooltip,15);
   }
   function onTooltipRollOut()
   {
      this._mcList._parent.gapi.hideTooltip();
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.contentData;
      this._mcList._parent.gapi.showTooltip("x" + _loc3_.Quantity + " - " + _loc3_.name,_loc2_.target,-20);
   }
   function out(§\x1e\x19\x0e§)
   {
      this._mcList._parent.gapi.hideTooltip();
   }
}
