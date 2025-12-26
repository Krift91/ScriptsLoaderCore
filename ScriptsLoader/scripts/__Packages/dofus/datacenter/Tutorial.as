class dofus.datacenter.Tutorial extends Object
{
   var _oBlocs;
   var _sRootBlocID;
   var _sRootExitBlocID;
   var _bCanCancel;
   static var NORMAL_BLOC = 0;
   static var EXIT_BLOC = 1;
   function Tutorial(mcData)
   {
      super();
      this._oBlocs = new Object();
      this.setData(mcData.actions);
      this._sRootBlocID = mcData.rootBlocID;
      this._sRootExitBlocID = mcData.rootExitBlocID;
      this._bCanCancel = mcData.canCancel != undefined ? mcData.canCancel : true;
   }
   function get canCancel()
   {
      return this._bCanCancel;
   }
   function addBloc(§\x1e\x1a\x05§)
   {
      this._oBlocs[_loc2_.id] = _loc2_;
   }
   function setData(§\x16§)
   {
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc4_ = _loc2_[_loc3_];
         var _loc5_ = Number(_loc4_[0]);
         switch(_loc5_)
         {
            case dofus.datacenter["\x1e\n\x16"].TYPE_ACTION:
               var _loc6_ = _loc4_[1];
               var _loc7_ = _loc4_[2];
               var _loc8_ = _loc4_[3];
               var _loc9_ = _loc4_[4];
               var _loc10_ = _loc4_[5];
               var _loc11_ = new dofus.datacenter["\x1e\n\x17"](_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
               this.addBloc(_loc11_);
               break;
            case dofus.datacenter["\x1e\n\x16"].TYPE_WAITING:
               var _loc12_ = _loc4_[1];
               var _loc13_ = Number(_loc4_[2]);
               var _loc14_ = _loc4_[3];
               var _loc15_ = new dofus.datacenter["\x1e\n\x14"](_loc12_,_loc13_,_loc14_);
               this.addBloc(_loc15_);
               break;
            case dofus.datacenter["\x1e\n\x16"].TYPE_IF:
               var _loc16_ = _loc4_[1];
               var _loc17_ = _loc4_[2];
               var _loc18_ = _loc4_[3];
               var _loc19_ = _loc4_[4];
               var _loc20_ = _loc4_[5];
               var _loc21_ = _loc4_[6];
               var _loc22_ = new dofus.datacenter["\x1e\n\x15"](_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_);
               this.addBloc(_loc22_);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function getRootBloc()
   {
      return this._oBlocs[this._sRootBlocID];
   }
   function getRootExitBloc()
   {
      return this._oBlocs[this._sRootExitBlocID];
   }
   function getBloc(§\x1e\x14\x0b§)
   {
      return this._oBlocs[_loc2_];
   }
}
