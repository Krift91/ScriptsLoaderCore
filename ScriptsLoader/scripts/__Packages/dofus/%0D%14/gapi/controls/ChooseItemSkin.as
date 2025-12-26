class dofus.§\r\x14§.gapi.controls.ChooseItemSkin extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oItem;
   var _oSelectedItem;
   var _cgGrid;
   static var CLASS_NAME = "ChooseItemSkin";
   function ChooseItemSkin()
   {
      super();
   }
   function set item(§\x1e\x19\x03§)
   {
      this._oItem = _loc2_;
   }
   function get selectedItem()
   {
      return this._oSelectedItem;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.ChooseItemSkin.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
   }
   function addListeners()
   {
      this._cgGrid.addEventListener("dblClickItem",this._parent);
      this._cgGrid.addEventListener("selectItem",this);
      this._cgGrid.multipleContainerSelectionEnabled = false;
   }
   function initData()
   {
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = 0;
      while(_loc3_ < this._oItem.maxSkin)
      {
         if(this._oItem.isAssociate)
         {
            _loc2_.push(new dofus.datacenter["\f\f"](-1,this._oItem.realUnicId,1,0,"",0,_loc3_,1));
         }
         else
         {
            _loc2_.push(new dofus.datacenter["\f\f"](-1,this._oItem.unicID,1,0,"",0,_loc3_,1));
         }
         _loc3_ = _loc3_ + 1;
      }
      this._cgGrid.dataProvider = _loc2_;
   }
   function selectItem(§\x1e\x19\x0e§)
   {
      this._oSelectedItem = _loc2_.target.contentData;
   }
}
