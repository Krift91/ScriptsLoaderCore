if(!dofus)
{
   dofus = new Object();
}
if(!dofus.aks)
{
   dofus.aks = new Object();
}
dofus.aks.ChooseReward = function(oAKS, oAPI)
{
   super.initialize(oAKS,oAPI);
};
dofus.aks.ChooseReward.prototype = new dofus.aks.Handler();
var _loc1 = dofus.aks.ChooseReward.prototype;
_loc1.ChooseReward = function(oAKS, oAPI)
{
   super.initialize(oAKS,oAPI);
};
_loc1.getReward = function(_loc2_)
{
   this.api.network.Items.selectRouletteItem(_loc2_);
};
_loc1.onData = function(_loc2_)
{
   if(_loc2_.length != 0)
   {
      var _loc13_ = new Array();
      var _loc12_ = _loc2_.split("|");
      var _loc14_ = _loc12_[3];
      var _loc4_ = 0;
      while(_loc4_ < _loc12_.length)
      {
         var _loc6_ = new Array();
         var _loc7_ = _loc12_[_loc4_].split(";");
         var _loc9_ = new dofus.datacenter["\f\f"](undefined,_loc7_[0]);
         var _loc10_ = _loc7_[2].slice(14);
         var _loc11_ = new dofus.datacenter["\f\f"](undefined,undefined,1,0,String(_loc10_));
         var _loc8_ = _loc7_[1].split(",");
         var _loc2_ = 0;
         while(_loc2_ < dofus.aks.ChooseReward.ICONS_NEEDED)
         {
            _loc6_.push(new dofus.datacenter["\f\f"](undefined,_loc8_[_loc2_]));
            _loc2_ += 1;
         }
         var _loc5_ = new Object();
         _loc5_.fakeItems = _loc6_;
         _loc5_.realItem = _loc9_;
         _loc5_.bonusEffects = _loc11_;
         _loc13_.push(_loc5_);
         _loc4_ += 1;
      }
      if(dofus.aks.ChooseReward.TOKENS_ARRAY == undefined)
      {
         dofus.aks.ChooseReward.TOKENS_ARRAY = _loc12_[4].split(";");
         var _loc3_ = 1;
         while(_loc3_ < dofus.aks.ChooseReward.TOKENS_ARRAY.length)
         {
            dofus.aks.ChooseReward.TOKENS_ARRAY[_loc3_] = Number(dofus.aks.ChooseReward.TOKENS_ARRAY[_loc3_ - 1]) + Number(dofus.aks.ChooseReward.TOKENS_ARRAY[_loc3_]);
            _loc3_ += 1;
         }
      }
      var _loc15_ = _loc12_[5] == "1";
      if(this.api.ui.getUIComponent("ChooseReward") == undefined)
      {
         this.api.ui.loadUIComponent("ChooseReward","ChooseReward",{items:_loc13_,tokens:dofus.aks.ChooseReward.TOKENS_ARRAY,currentRoom:_loc14_,openProgres:_loc15_},{bAlwaysOnTop:true});
      }
   }
};
dofus.aks.ChooseReward.ICONS_NEEDED = 6;
