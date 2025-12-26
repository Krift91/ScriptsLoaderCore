class dofus.datacenter.§\x0e\x0f§ extends Object
{
   var state;
   var id;
   var showTarget;
   var targetId;
   var basicXpBonus;
   var teamXpBonus;
   var basicDropBonus;
   var teamDropBonus;
   var description;
   var iconPath;
   function §\x0e\x0f§(§\f\x1c§, showTarget, targetId, basicXpBonus, teamXpBonus, basicDropBonus, teamDropBonus, state)
   {
      super();
      if(_global.isNaN(state))
      {
         this.state = 0;
      }
      else
      {
         this.state = state;
      }
      this.id = _loc3_;
      this.showTarget = showTarget;
      this.targetId = targetId;
      this.basicXpBonus = basicXpBonus;
      this.teamXpBonus = teamXpBonus;
      this.basicDropBonus = basicDropBonus;
      this.teamDropBonus = teamDropBonus;
      var _loc11_ = dofus["\x1e\n\x07"]["\x1d\x1b"](_global.API);
      var _loc12_ = _loc11_.datacenter.Sprites.getItemAt(targetId).name + " (" + _loc11_.lang.getText("LEVEL_SMALL") + " " + _loc11_.datacenter.Sprites.getItemAt(targetId).mc.data.Level + ")";
      this.description = _loc11_.lang.getFightChallenge(_loc3_).d.split("%1").join(_loc12_);
      this.iconPath = dofus.Constants.FIGHT_CHALLENGE_PATH + _loc11_.lang.getFightChallenge(_loc3_).g + ".swf";
   }
   function clone()
   {
      return new dofus.datacenter["\x0e\x0f"](this.id,this.showTarget,this.targetId,this.basicXpBonus,this.teamXpBonus,this.basicDropBonus,this.teamDropBonus,this.state);
   }
}
