class dofus.§\r\x14§.gapi.ui.Waypoints extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _eaData;
   var _winBg;
   var _lblCoords;
   var _lblName;
   var _lblCost;
   var _lblRespawn;
   var _lblDescription;
   var _btnClose2;
   var _btnClose;
   var _lstWaypoints;
   static var CLASS_NAME = "Waypoints";
   function Waypoints()
   {
      super();
   }
   function set data(§\x10\f§)
   {
      this.addToQueue({object:this,method:function(§\x11\x10§)
      {
         this._eaData = _loc2_;
         if(this.initialized)
         {
            this.initData();
         }
      },params:[_loc2_]});
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.Waypoints.CLASS_NAME);
   }
   function callClose()
   {
      this.api.network.Waypoints.leave();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
   }
   function initTexts()
   {
      this._winBg.title = this.api.lang.getText("WAYPOINT_LIST");
      this._lblCoords.text = this.api.lang.getText("COORDINATES_SMALL");
      this._lblName.text = this.api.lang.getText("AREA") + " (" + this.api.lang.getText("SUBAREA") + ")";
      this._lblCost.text = this.api.lang.getText("COST");
      this._lblRespawn.text = this.api.lang.getText("RESPAWN_SMALL");
      this._lblDescription.text = this.api.lang.getText("CLICK_ON_WAYPOINT");
      this._btnClose2.label = this.api.lang.getText("CLOSE");
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnClose2.addEventListener("click",this);
      this._lstWaypoints.addEventListener("itemSelected",this);
   }
   function initData()
   {
      if(this._eaData != undefined)
      {
         this._eaData.sortOn("fieldToSort",Array.CASEINSENSITIVE);
         this._lstWaypoints.dataProvider = this._eaData;
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
         case "_btnClose2":
            this.callClose();
      }
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.row.item;
      if(_loc3_.isCurrent)
      {
         return undefined;
      }
      var _loc4_ = _loc3_.cost;
      if(this.api.datacenter.Player.Kama >= _loc4_)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_USE_WAYPOINT",[_loc3_.name,_loc3_.coordinates,_loc4_]),"CAUTION_YESNO",{name:"\x1e\t\x19",listener:this,params:{waypointID:_loc3_.id}});
      }
      else
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGH_RICH"),"ERROR_BOX");
      }
   }
   function yes(§\x1e\x19\x0e§)
   {
      this.api.network.Waypoints.use(_loc2_.target.params.waypointID);
   }
}
