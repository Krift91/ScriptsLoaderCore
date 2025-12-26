class dofus.§\r\x14§.gapi.ui.§\x0e\x03§.§\x0e\x01§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lblName;
   var _btnRemove;
   function §\x0e\x01§()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._oItem = _loc4_;
         this._lblName.text = _loc4_.account;
         this._btnRemove._visible = true;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._btnRemove._visible = false;
      }
   }
   function remove()
   {
      this._oItem.owner.removeFriend(this._oItem.name);
   }
   function init()
   {
      super.init(false);
      this._btnRemove._visible = false;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._btnRemove.addEventListener("click",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      this._mcList._parent._parent.removeFriend("*" + this._oItem.account);
   }
}
