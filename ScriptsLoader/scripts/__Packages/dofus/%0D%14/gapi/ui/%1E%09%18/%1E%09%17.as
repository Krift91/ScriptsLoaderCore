class dofus.§\r\x14§.gapi.ui.§\x1e\t\x18§.§\x1e\t\x17§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lblCost;
   var _lblCoords;
   var _lblName;
   var _mcRespawn;
   var _mcCurrent;
   var _btnLocate;
   function §\x1e\t\x17§()
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
         this._lblCost.text = _loc4_.cost != 0 ? _loc4_.cost + "k" : "-";
         this._lblCoords.text = _loc4_.coordinates;
         this._lblName.text = _loc4_.name;
         this._mcRespawn._visible = _loc4_.isRespawn;
         this._mcCurrent._visible = _loc4_.isCurrent;
         this._btnLocate._visible = true;
      }
      else if(this._lblCost.text != undefined)
      {
         this._lblCost.text = "";
         this._lblCoords.text = "";
         this._lblName.text = "";
         this._mcRespawn._visible = false;
         this._mcCurrent._visible = false;
         this._btnLocate._visible = false;
      }
   }
   function init()
   {
      super.init(false);
      this._mcRespawn._visible = false;
      this._mcCurrent._visible = false;
      this._btnLocate._visible = false;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._btnLocate.addEventListener("click",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      this._mcList.gapi.loadUIAutoHideComponent("MapExplorer","MapExplorer",{mapID:this._oItem.id});
   }
}
