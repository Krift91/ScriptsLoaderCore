class dofus.§\r\x14§.gapi.controls.§\r\r§.MountParksViewerItem extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _mcList;
   var _bUsed;
   var _oItem;
   var _lblSubArea;
   var _lblItems;
   var _lblMounts;
   var _btnTeleport;
   var _lblArea;
   function MountParksViewerItem()
   {
      super();
      this.api = _global.API;
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      this._bUsed = _loc2_;
      if(_loc2_)
      {
         this._oItem = _loc4_;
         var _loc5_ = this.api.lang.getMapText(Number(_loc4_.map)).x;
         var _loc6_ = this.api.lang.getMapText(Number(_loc4_.map)).y;
         this._lblSubArea.text = this.api.kernel.MapsServersManager.getMapName(_loc4_.map) + " (" + _loc5_ + ", " + _loc6_ + ")";
         _loc4_.sortLocalisation = this._lblSubArea.text;
         this._lblItems.text = this.api.lang.getText("MOUNTPARKS_MAX_ITEMS",[_loc4_.items]);
         this._lblMounts.text = this.api.lang.getText("MOUNTPARKS_CURRENT_MOUNTS",[_loc4_.mounts.length,_loc4_.size]);
         _loc4_.sortMounts = _loc4_.mounts.length;
         this._btnTeleport._visible = true;
         this._btnTeleport.onRollOver = function()
         {
            this._parent.gapi.showTooltip(this._parent.api.lang.getText("GUILD_FARM_TELEPORT_TOOLTIP"),this,-20);
         };
         this._btnTeleport.onRollOut = function()
         {
            this._parent.gapi.hideTooltip();
         };
      }
      else
      {
         this._btnTeleport._visible = false;
         if(this._lblArea.text != undefined)
         {
            this._lblArea.text = "";
            this._lblSubArea.text = "";
            this._lblItems.text = "-";
            this._lblMounts.text = "";
         }
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
      this._lblMounts.onRollOver = function()
      {
         this._parent.over({target:this});
      };
      this._lblMounts.onRollOut = function()
      {
         this._parent.out({target:this});
      };
      this._btnTeleport.addEventListener("click",this);
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._mcList._parent._parent.api;
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._lblMounts)
      {
         var _loc4_ = "";
         var _loc5_ = this._oItem.mounts;
         var _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            if(_loc6_ > 0)
            {
               _loc4_ += "\n\n";
            }
            var _loc7_ = _loc5_[_loc6_];
            _loc4_ += _loc3_.lang.getText("MOUNT_OF",[_loc7_.ownerName]) + " : " + _loc7_.name + "\n(" + _loc7_.modelName + ")";
            _loc6_ = _loc6_ + 1;
         }
         if(_loc4_ != "")
         {
            _loc3_.ui.showTooltip(_loc4_,_loc2_.target,-30,{bXLimit:true,bYLimit:false});
         }
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._btnTeleport)
      {
         if(!this._bUsed)
         {
            return undefined;
         }
         this.api.network.Guild.teleportToGuildFarm(this._oItem.map);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      var _loc3_ = this._mcList._parent._parent.api;
      _loc3_.ui.hideTooltip();
   }
}
