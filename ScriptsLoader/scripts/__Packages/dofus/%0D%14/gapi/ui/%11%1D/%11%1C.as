class dofus.§\r\x14§.gapi.ui.§\x11\x1d§.§\x11\x1c§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lblName;
   var _lblLevel;
   var _lblPlace;
   var _lblWorkshop;
   var _lblCoord;
   var _lblNotFree;
   var _lblMinSlot;
   var _ldrGuild;
   var _btnProfil;
   function §\x11\x1c§()
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
         _loc4_.sortName = _loc4_.name;
         _loc4_.sortLevel = _loc4_.job.level;
         _loc4_.sortIsNotFree = _loc4_.job.options.isNotFree;
         _loc4_.sortMinSlots = Number(_loc4_.job.options.minSlots);
         _loc4_.sortSubarea = _loc4_.subarea != undefined ? _loc4_.subarea : "-";
         var _loc5_ = _loc4_.coord;
         _loc4_.sortCoord = _loc5_ == undefined ? "-" : _loc5_.x + "," + _loc5_.y;
         _loc4_.sortInWorkshop = _loc4_.inWorkshop;
         this._lblName.text = _loc4_.sortName;
         this._lblLevel.text = _loc4_.sortLevel.toString();
         this._lblPlace.text = _loc4_.subarea != undefined ? _loc4_.subarea : " ";
         var _loc6_ = this._mcList._parent._parent.api;
         this._lblWorkshop.text = !_loc4_.sortInWorkshop ? _loc6_.lang.getText("NO") : _loc6_.lang.getText("YES");
         this._lblCoord.text = _loc4_.sortCoord;
         this._lblNotFree.text = !_loc4_.sortIsNotFree ? _loc6_.lang.getText("NO") : _loc6_.lang.getText("YES");
         this._lblMinSlot.text = _loc4_.sortMinSlots.toString();
         this._ldrGuild.contentPath = _loc4_.gfxBreedFile;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._lblLevel.text = "";
         this._lblPlace.text = "";
         this._lblWorkshop.text = "";
         this._lblCoord.text = "";
         this._lblNotFree.text = "";
         this._lblMinSlot.text = "";
         this._ldrGuild.contentPath = "";
      }
   }
   function init()
   {
      super.init(false);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._btnProfil.addEventListener("click",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) === "_btnProfil")
      {
         this._mcList.gapi.loadUIComponent("CrafterCard","CrafterCard",{crafter:this._oItem});
      }
   }
}
