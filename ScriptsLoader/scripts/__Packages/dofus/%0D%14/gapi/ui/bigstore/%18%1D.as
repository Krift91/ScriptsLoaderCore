class dofus.§\r\x14§.gapi.ui.bigstore.§\x18\x1d§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _mcRow;
   var _nSelectedSet;
   var _oItem;
   var _btnPriceSet1;
   var _btnPriceSet2;
   var _btnPriceSet3;
   var _btnBuy;
   var _ldrIcon;
   function §\x18\x1d§()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function set row(§\n\x0f§)
   {
      this._mcRow = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      delete this._nSelectedSet;
      if(_loc2_)
      {
         this._oItem = _loc4_;
         var _loc5_ = this._mcList._parent._parent.isThisPriceSelected(_loc4_.id,1);
         var _loc6_ = this._mcList._parent._parent.isThisPriceSelected(_loc4_.id,2);
         var _loc7_ = this._mcList._parent._parent.isThisPriceSelected(_loc4_.id,3);
         if(_loc5_)
         {
            var _loc8_ = this._btnPriceSet1;
         }
         if(_loc6_)
         {
            _loc8_ = this._btnPriceSet2;
         }
         if(_loc7_)
         {
            _loc8_ = this._btnPriceSet3;
         }
         if(_loc5_ || (_loc6_ || _loc7_))
         {
            var _loc9_ = this._btnBuy;
         }
         if(_loc9_ != undefined)
         {
            this._mcList._parent._parent.setButtons(_loc8_,_loc9_);
         }
         this._btnPriceSet1.selected = _loc5_ && !_global.isNaN(_loc4_.priceSet1);
         this._btnPriceSet2.selected = _loc6_ && !_global.isNaN(_loc4_.priceSet2);
         this._btnPriceSet3.selected = _loc7_ && !_global.isNaN(_loc4_.priceSet3);
         if(_loc5_)
         {
            this._nSelectedSet = 1;
         }
         else if(_loc6_)
         {
            this._nSelectedSet = 2;
         }
         else if(_loc7_)
         {
            this._nSelectedSet = 3;
         }
         this._btnBuy.enabled = this._nSelectedSet != undefined;
         this._btnBuy._visible = true;
         this._btnPriceSet1._visible = true;
         this._btnPriceSet2._visible = true;
         this._btnPriceSet3._visible = true;
         this._btnPriceSet1.enabled = !_global.isNaN(_loc4_.priceSet1);
         this._btnPriceSet2.enabled = !_global.isNaN(_loc4_.priceSet2);
         this._btnPriceSet3.enabled = !_global.isNaN(_loc4_.priceSet3);
         this._btnPriceSet1.label = !_global.isNaN(_loc4_.priceSet1) ? new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.priceSet1).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  " : "-  ";
         this._btnPriceSet2.label = !_global.isNaN(_loc4_.priceSet2) ? new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.priceSet2).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  " : "-  ";
         this._btnPriceSet3.label = !_global.isNaN(_loc4_.priceSet3) ? new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.priceSet3).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  " : "-  ";
         this._ldrIcon.contentParams = _loc4_.item.params;
         this._ldrIcon.contentPath = _loc4_.item.iconFile;
      }
      else if(this._ldrIcon.contentPath != undefined)
      {
         this._btnPriceSet1._visible = false;
         this._btnPriceSet2._visible = false;
         this._btnPriceSet3._visible = false;
         this._btnBuy._visible = false;
         this._ldrIcon.contentPath = "";
      }
   }
   function init()
   {
      super.init(false);
      this._btnPriceSet1._visible = false;
      this._btnPriceSet2._visible = false;
      this._btnPriceSet3._visible = false;
      this._btnBuy._visible = false;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function addListeners()
   {
      this._btnPriceSet1.addEventListener("click",this);
      this._btnPriceSet2.addEventListener("click",this);
      this._btnPriceSet3.addEventListener("click",this);
      this._btnBuy.addEventListener("click",this);
   }
   function initTexts()
   {
      this._btnBuy.label = this._mcList.gapi.api.lang.getText("BUY");
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnPriceSet1":
         case "_btnPriceSet2":
         case "_btnPriceSet3":
            var _loc3_ = Number(_loc2_.target._name.substr(12));
            this._mcList._parent._parent.selectPrice(this._oItem,_loc3_,_loc2_.target,this._btnBuy);
            if(_loc2_.target.selected)
            {
               this._nSelectedSet = _loc3_;
               this._mcRow.select();
               this._btnBuy.enabled = true;
            }
            else
            {
               delete this._nSelectedSet;
               this._btnBuy.enabled = false;
            }
            break;
         case "_btnBuy":
            if(!this._nSelectedSet || _global.isNaN(this._nSelectedSet))
            {
               this._btnBuy.enabled = false;
               return undefined;
            }
            this._mcList._parent._parent.askBuy(this._oItem.item,this._nSelectedSet,this._oItem["priceSet" + this._nSelectedSet]);
            this._mcList._parent._parent.askMiddlePrice(this._oItem.item);
            break;
      }
   }
}
