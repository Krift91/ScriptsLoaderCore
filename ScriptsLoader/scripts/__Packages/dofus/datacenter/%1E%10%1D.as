class dofus.datacenter.§\x1e\x10\x1d§ extends Object
{
   var _nID;
   var _oSkillText;
   var api;
   var _nParam1;
   var _nParam2;
   var _nParam3;
   var _nParam4;
   var _oCraftsList;
   var skillName;
   function §\x1e\x10\x1d§(§\x04\x12§, §\x01\x19§, §\x01\x18§, §\x01\x17§, §\x01\x16§)
   {
      super();
      this.initialize(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
   }
   function get id()
   {
      return this._nID;
   }
   function get description()
   {
      return this._oSkillText.d;
   }
   function get job()
   {
      return this._oSkillText.j;
   }
   function get criterion()
   {
      return this._oSkillText.c;
   }
   function get item()
   {
      if(this._oSkillText.i == undefined)
      {
         return null;
      }
      return new dofus.datacenter["\f\f"](0,this._oSkillText.i);
   }
   function get interactiveObject()
   {
      return this.api.lang.getInteractiveObjectDataText(this._oSkillText.io).n;
   }
   function get param1()
   {
      return this._nParam1;
   }
   function get param2()
   {
      return this._nParam2;
   }
   function get param3()
   {
      return this._nParam3;
   }
   function get param4()
   {
      return this._nParam4;
   }
   function get craftsList()
   {
      if(this._oCraftsList instanceof Array)
      {
         return this._oCraftsList;
      }
      this._oCraftsList = new Array();
      var _loc2_ = 0;
      while(_loc2_ < this._oSkillText.cl.length)
      {
         var _loc3_ = this.api.lang.getItemUnicText(this._oSkillText.cl[_loc2_]).ep;
         if(_loc3_ <= this.api.datacenter.Basics.aks_current_regional_version && (_loc3_ != undefined && !_global.isNaN(_loc3_)))
         {
            this._oCraftsList.push(this._oSkillText.cl[_loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
      return this._oCraftsList;
   }
   function initialize(§\x04\x12§, §\x01\x19§, §\x01\x18§, §\x01\x17§, §\x01\x16§)
   {
      this.api = _global.API;
      this._nID = _loc2_;
      if(_loc3_ != 0)
      {
         this._nParam1 = _loc3_;
      }
      if(_loc4_ != 0)
      {
         this._nParam2 = _loc4_;
      }
      if(_loc5_ != 0)
      {
         this._nParam3 = _loc5_;
      }
      if(_loc6_ != 0)
      {
         this._nParam4 = _loc6_;
      }
      this._oSkillText = this.api.lang.getSkillText(_loc2_);
      this.skillName = this.description;
   }
   function getState(§\x18\b§, §\x16\x11§, §\x19\f§, §\x17\x1c§, §\x18\x1a§, §\x16\x1c§)
   {
      if(this.criterion == undefined || this.criterion.length == 0)
      {
         return "V";
      }
      var _loc8_ = this.criterion.split("?");
      var _loc9_ = _loc8_[0].split("&");
      var _loc10_ = _loc8_[1].split(":");
      var _loc11_ = _loc10_[0];
      var _loc12_ = _loc10_[1];
      var _loc13_ = 0;
      while(_loc13_ < _loc9_.length)
      {
         var _loc14_ = _loc9_[_loc13_];
         var _loc15_ = _loc14_.charAt(0) == "!";
         if(_loc15_)
         {
            _loc14_ = _loc14_.substr(1);
         }
         switch(_loc14_)
         {
            case "J":
               if(_loc15_)
               {
                  _loc2_ = !_loc2_;
               }
               if(!_loc2_)
               {
                  return _loc12_;
               }
               break;
            case "O":
               if(_loc15_)
               {
                  _loc3_ = !_loc3_;
               }
               if(!_loc3_)
               {
                  return _loc12_;
               }
               break;
            case "S":
               if(_loc15_)
               {
                  _loc4_ = !_loc4_;
               }
               if(!_loc4_)
               {
                  return _loc12_;
               }
               break;
            case "L":
               if(_loc15_)
               {
                  _loc5_ = !_loc5_;
               }
               if(!_loc5_)
               {
                  return _loc12_;
               }
               break;
            case "I":
               if(_loc15_)
               {
                  _loc6_ = !_loc6_;
               }
               if(!_loc6_)
               {
                  return _loc12_;
               }
               break;
            case "N":
               if(_loc15_)
               {
                  _loc7_ = !_loc7_;
               }
               if(!_loc7_)
               {
                  return _loc12_;
               }
               break;
         }
         _loc13_ = _loc13_ + 1;
      }
      return _loc11_;
   }
}
