class dofus.§\r\x14§.gapi.controls.§\f\x0e§ extends dofus.§\r\x14§.gapi.controls.InventoryViewer
{
   var _nCurrentFilterID;
   var _btnFilterAll;
   var _btnSelectedFilterButton;
   var _aSelectedSuperTypes;
   var _lblFilter;
   static var DEFAULT_FILTER = 3;
   static var FILTER_ID_ALL = 3;
   static var FILTER_ALL = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,false];
   function §\f\x0e§()
   {
      super();
   }
   function setFilter(§\x05\x03§)
   {
      if(_loc3_ == this._nCurrentFilterID)
      {
         return undefined;
      }
      if(_loc3_ == dofus["\r\x14"].gapi.controls["\f\x0e"].FILTER_ID_ALL)
      {
         this.click({target:this._btnFilterAll});
         this._btnFilterAll.selected = true;
      }
      else
      {
         super.setFilter(_loc3_);
      }
   }
   function createChildren()
   {
      super.createChildren();
   }
   function addListeners()
   {
      super.addListeners();
      this._btnFilterAll.addEventListener("click",this);
      this._btnFilterAll.addEventListener("over",this);
      this._btnFilterAll.addEventListener("out",this);
   }
   function getDefaultFilter()
   {
      return dofus["\r\x14"].gapi.controls["\f\x0e"].FILTER_ID_ALL;
   }
   function setPreferedFilter()
   {
      this.setFilter(this.getDefaultFilter());
   }
   function click(§\x1e\x19\x0e§)
   {
      if(_loc3_.target == this._btnFilterAll)
      {
         if(_loc3_.target != this._btnSelectedFilterButton)
         {
            this._btnSelectedFilterButton.selected = false;
            this._btnSelectedFilterButton = _loc3_.target;
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.controls["\f\x0e"].FILTER_ALL;
            this._lblFilter.text = this.api.lang.getText("ALL");
            this._nCurrentFilterID = dofus["\r\x14"].gapi.controls["\f\x0e"].FILTER_ID_ALL;
            this.updateData();
         }
         else
         {
            _loc3_.target.selected = true;
         }
      }
      else
      {
         super.click(_loc3_);
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      if(_loc3_.target == this._btnFilterAll)
      {
         this.api.ui.showTooltip(this.api.lang.getText("ALL"),_loc3_.target,-20);
      }
      else
      {
         super.over(_loc3_);
      }
   }
}
