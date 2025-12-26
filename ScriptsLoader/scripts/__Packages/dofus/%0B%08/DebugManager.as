class dofus.§\x0b\b§.DebugManager extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _bDebugEnabled;
   static var _sSelf = null;
   function DebugManager(oAPI)
   {
      super();
      dofus["\x0b\b"].DebugManager._sSelf = this;
      this.initialize(oAPI);
   }
   static function getInstance()
   {
      return dofus["\x0b\b"].DebugManager._sSelf;
   }
   function initialize(oAPI)
   {
      super.initialize(oAPI);
      this.setDebug(dofus.Constants.DEBUG == true);
   }
   function setDebug(§\x16\x1a§)
   {
      this._bDebugEnabled = _loc2_;
      this.print("Debug mode " + (!_loc2_ ? "OFF" : "ON"),5,true);
   }
   function toggleDebug()
   {
      this.setDebug(!this._bDebugEnabled);
   }
   function print(§\x1e\x0f\x17§, §\x03\x11§, §\x1a\x0b§)
   {
      if(!_loc4_ && !this._bDebugEnabled)
      {
         return undefined;
      }
      var _loc5_ = this.getTimestamp() + " ";
      _loc5_ += _loc2_;
      var _loc6_ = "DEBUG_INFO";
      switch(_loc3_)
      {
         case 5:
            _loc6_ = "ERROR_CHAT";
            break;
         case 4:
            _loc6_ = "MESSAGE_CHAT";
            break;
         case 3:
            _loc6_ = "DEBUG_ERROR";
            break;
         case 2:
            _loc6_ = "DEBUG_LOG";
            break;
         default:
            _loc6_ = "DEBUG_INFO";
      }
      this.api.kernel.showMessage(undefined,_loc5_,_loc6_);
   }
   function getFormattedMessage(§\x1e\x0f\x17§)
   {
      var _loc3_ = "";
      do
      {
         var _loc4_ = _loc2_.indexOf("#");
         if(_loc4_ != -1)
         {
            _loc3_ += _loc2_.substring(0,_loc4_);
            _loc2_ = _loc2_.substring(_loc4_ + 1);
            var _loc5_ = _loc2_.split("|");
            _loc5_.splice(2);
            var _loc6_ = null;
            if(_loc5_ != undefined && _loc5_.length > 1)
            {
               switch(_loc5_[0])
               {
                  case "getioname":
                     var _loc7_ = Number(_loc5_[1]);
                     if(_loc7_ != undefined && !_global.isNaN(_loc7_))
                     {
                        _loc6_ = this.api.lang.getInteractiveObjectDataText(_loc7_).n;
                        if(_loc6_ == undefined)
                        {
                           _loc6_ = "-";
                        }
                     }
                     break;
                  case "getitemname":
                     var _loc8_ = Number(_loc5_[1]);
                     if(_loc8_ != undefined && !_global.isNaN(_loc8_))
                     {
                        _loc6_ = this.api.lang.getItemUnics()[_loc8_].n;
                        if(_loc6_ == undefined)
                        {
                           _loc6_ = "-";
                        }
                     }
                     break;
                  case "getsubareaname":
                     var _loc9_ = Number(_loc5_[1]);
                     if(_loc9_ != undefined && !_global.isNaN(_loc9_))
                     {
                        _loc6_ = this.api.lang.getMapSubAreaText(_loc9_).n;
                        if(_loc6_ == undefined)
                        {
                           _loc6_ = "-";
                        }
                     }
                     break;
                  case "getiogfxname":
                     var _loc10_ = Number(_loc5_[1]);
                     if(_loc10_ != undefined && !_global.isNaN(_loc10_))
                     {
                        _loc6_ = this.api.lang.getInteractiveObjectDataByGfxText(_loc10_).n;
                        if(_loc6_ == undefined)
                        {
                           _loc6_ = "-";
                        }
                     }
                     break;
                  case "getcelliogfxname":
                     var _loc11_ = Number(_loc5_[1]);
                     if(_loc11_ != undefined && !_global.isNaN(_loc11_))
                     {
                        var _loc12_ = this.api.gfx.mapHandler.getCellData(_loc11_).layerObject2Num;
                        if(!_global.isNaN(_loc12_))
                        {
                           _loc6_ = this.api.lang.getInteractiveObjectDataByGfxText(_loc12_).n;
                        }
                        if(_loc6_ == undefined)
                        {
                           _loc6_ = "-";
                        }
                     }
                     break;
                  case "getmonstername":
                     var _loc13_ = Number(_loc5_[1]);
                     if(_loc13_ != undefined && !_global.isNaN(_loc13_))
                     {
                        _loc6_ = this.api.lang.getMonstersText(_loc13_).n;
                        if(_loc6_ == undefined)
                        {
                           _loc6_ = "-";
                        }
                        break;
                     }
               }
            }
            if(_loc6_ != null && _loc6_.length > 0)
            {
               _loc3_ += _loc6_;
               _loc2_ = _loc2_.substring(_loc5_.join("|").length + 1);
            }
            else
            {
               _loc3_ += "#";
            }
         }
      }
      while(_loc4_ == undefined || _loc4_ != -1);
      
      _loc3_ += _loc2_;
      return _loc3_;
   }
   function getTimestamp()
   {
      var _loc2_ = new Date();
      return "[" + new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.getHours()).addLeftChar("0",2) + ":" + new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.getMinutes()).addLeftChar("0",2) + ":" + new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.getSeconds()).addLeftChar("0",2) + ":" + new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.getMilliseconds()).addLeftChar("0",3) + "]";
   }
}
