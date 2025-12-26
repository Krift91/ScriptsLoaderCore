class dofus.§\x0b\b§.InteractionsManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _playerManager;
   var _state;
   static var STATE_MOVE_SINGLE = 0;
   static var STATE_SELECT = 1;
   function InteractionsManager(§\x1e\x16\x10§, oAPI)
   {
      super();
      this.initialize(_loc3_,oAPI);
   }
   function initialize(§\x1e\x16\x10§, oAPI)
   {
      super.initialize(oAPI);
      this._playerManager = _loc3_;
   }
   function setState(§\x1a\x07§)
   {
      if(_loc2_)
      {
         this._state = dofus["\x0b\b"].InteractionsManager.STATE_SELECT;
         this._playerManager.lastClickedCell = null;
      }
      else
      {
         this._state = dofus["\x0b\b"].InteractionsManager.STATE_MOVE_SINGLE;
      }
   }
   function calculatePath(mapHandler, §\x13\t§, §\x16\x07§, §\x18\x10§, §\x19\x02§, §\x1c\x13§)
   {
      if(!_loc6_)
      {
         this.api.gfx.mapHandler.resetEmptyCells();
      }
      var _loc8_ = this._playerManager.data.cellNum;
      var _loc9_ = mapHandler.getCellData(_loc3_);
      var _loc10_ = _loc9_.spriteOnID;
      var _loc11_ = !_loc6_ && _loc10_ != undefined;
      if(_loc11_ && !this.api.datacenter.Game.isFight)
      {
         var _loc12_ = dofus["\r\x14"].gapi.ui.Party(this.api.ui.getUIComponent("Party"));
         var _loc13_ = false;
         if(_loc12_ != undefined)
         {
            for(var sID in _loc9_.allSpritesOn)
            {
               if(_loc9_.allSpritesOn[sID] && _loc12_.getMember(String(sID)) != undefined)
               {
                  _loc13_ = true;
                  break;
               }
            }
         }
         if(!_loc13_)
         {
            _loc11_ = false;
         }
      }
      if(_loc11_)
      {
         return false;
      }
      if(_loc9_.movement == 0)
      {
         return false;
      }
      if(_loc9_.movement == 1 && _loc5_)
      {
         return false;
      }
      switch(this._state)
      {
         case dofus["\x0b\b"].InteractionsManager.STATE_MOVE_SINGLE:
            this.api.datacenter.Basics.interactionsManager_path = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].pathFind(this.api,mapHandler,_loc8_,_loc3_,{bAllDirections:_loc7_,bIgnoreSprites:_loc6_});
            if(this.api.datacenter.Basics.interactionsManager_path != null)
            {
               return true;
            }
            return false;
            break;
         case dofus["\x0b\b"].InteractionsManager.STATE_SELECT:
            if(_loc4_)
            {
               this.api.gfx.select(this.convertToSimplePath(this.api.datacenter.Basics.interactionsManager_path),dofus.Constants.CELL_PATH_SELECT_COLOR);
               return this.api.datacenter.Basics.interactionsManager_path != null;
            }
            this.api.datacenter.Basics.interactionsManager_path = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].pathFind(this.api,mapHandler,_loc8_,_loc3_,{bAllDirections:false,nMaxLength:(!_loc5_ ? 500 : this._playerManager.data.MP)});
            this.api.gfx.unSelect(true);
            this.api.gfx.select(this.convertToSimplePath(this.api.datacenter.Basics.interactionsManager_path),dofus.Constants.CELL_PATH_OVER_COLOR);
            break;
      }
      return false;
   }
   function convertToSimplePath(§\x1e\x15§)
   {
      var _loc3_ = new Array();
      for(var k in _loc2_)
      {
         _loc3_.push(_loc2_[k].num);
      }
      return _loc3_;
   }
}
