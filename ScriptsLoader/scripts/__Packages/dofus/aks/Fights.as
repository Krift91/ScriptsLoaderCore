class dofus.aks.Fights extends dofus.aks.Handler
{
   function Fights(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function getList()
   {
      this.aks.send("fL");
   }
   function getDetails(§\x04\x12§)
   {
      this.aks.send("fD" + _loc2_,false);
   }
   function blockSpectators()
   {
      this.aks.send("fS");
   }
   function blockJoinerExceptParty()
   {
      this.aks.send("fP");
   }
   function blockJoiner()
   {
      this.aks.send("fN");
   }
   function needHelp()
   {
      this.aks.send("fH");
   }
   function onCount(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      if(_global.isNaN(_loc3_) || (_loc2_.length == 0 || _loc3_ == 0))
      {
         this.api.ui.getUIComponent("Banner").fightsCount = 0;
      }
      else if(_loc3_ < 0)
      {
         if(this.api.ui.getUIComponent("Banner").fightsCount >= _loc3_)
         {
            this.api.ui.getUIComponent("Banner").fightsCount = this.api.ui.getUIComponent("Banner").fightsCount + _loc3_;
         }
      }
      else
      {
         this.api.ui.getUIComponent("Banner").fightsCount = _loc3_;
      }
   }
   function onList(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = new Array();
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         if(String(_loc3_[_loc5_]).length != 0)
         {
            var _loc6_ = _loc3_[_loc5_].split(";");
            var _loc7_ = Number(_loc6_[0]);
            var _loc8_ = Number(_loc6_[1]);
            var _loc9_ = _loc8_ != -1 ? this.api.kernel.NightManager.getDiffDate(_loc8_) : -1;
            var _loc10_ = new dofus.datacenter["\x0e\x0e"](_loc7_,_loc9_);
            var _loc11_ = String(_loc6_[2]).split(",");
            var _loc12_ = Number(_loc11_[0]);
            var _loc13_ = Number(_loc11_[1]);
            var _loc14_ = Number(_loc11_[2]);
            _loc10_.addTeam(1,_loc12_,_loc13_,_loc14_);
            var _loc15_ = String(_loc6_[3]).split(",");
            var _loc16_ = Number(_loc15_[0]);
            var _loc17_ = Number(_loc15_[1]);
            var _loc18_ = Number(_loc15_[2]);
            _loc10_.addTeam(2,_loc16_,_loc17_,_loc18_);
            _loc4_.push(_loc10_);
         }
         _loc5_ = _loc5_ + 1;
      }
      var _loc19_ = this.api.ui.getUIComponent("FightsInfos").fights;
      if(_loc19_ != null)
      {
         _loc19_.splice(0,_loc19_.length);
         _loc19_.replaceAll(0,_loc4_);
      }
   }
   function onDetails(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc6_ = _loc3_[1].split(";");
      var _loc7_ = 0;
      while(_loc7_ < _loc6_.length)
      {
         if(_loc6_[_loc7_] != "")
         {
            var _loc8_ = _loc6_[_loc7_].split("~");
            _loc5_.push({name:this.api.kernel.CharactersManager.getNameFromData(_loc8_[0]).name,level:Number(_loc8_[1]),type:this.api.kernel.CharactersManager.getNameFromData(_loc8_[0]).type});
         }
         _loc7_ = _loc7_ + 1;
      }
      var _loc9_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc10_ = _loc3_[2].split(";");
      var _loc11_ = 0;
      while(_loc11_ < _loc10_.length)
      {
         if(_loc10_[_loc11_] != "")
         {
            var _loc12_ = _loc10_[_loc11_].split("~");
            _loc9_.push({name:this.api.kernel.CharactersManager.getNameFromData(_loc12_[0]).name,level:Number(_loc12_[1]),type:this.api.kernel.CharactersManager.getNameFromData(_loc12_[0]).type});
         }
         _loc11_ = _loc11_ + 1;
      }
      this.api.ui.getUIComponent("FightsInfos").addFightTeams(_loc4_,_loc5_,_loc9_);
   }
}
