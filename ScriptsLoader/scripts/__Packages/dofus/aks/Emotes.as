class dofus.aks.Emotes extends dofus.aks.Handler
{
   function Emotes(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }
   function useEmote(§\x05\x15§)
   {
      if(this.api.datacenter.Game.isFight)
      {
         return undefined;
      }
      if(getTimer() - this.api.datacenter.Basics.aks_emote_lastActionTime < dofus.Constants.CLICK_MIN_DELAY)
      {
         return undefined;
      }
      this.api.datacenter.Basics.aks_emote_lastActionTime = getTimer();
      this.aks.send("eU" + _loc2_,true);
   }
   function setDirection(§\x06\x07§)
   {
      this.aks.send("eD" + _loc2_,true);
   }
   function onUse(§\x14\x16§, §\x1e\x12\r§)
   {
      if(this.api.datacenter.Game.isFight)
      {
         return undefined;
      }
      if(!_loc2_)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_USE_EMOTE"),"ERROR_CHAT");
         return undefined;
      }
      var _loc4_ = _loc3_.split("|");
      var _loc5_ = _loc4_[0];
      var _loc6_ = Number(_loc4_[1]);
      var _loc7_ = Number(_loc4_[2]);
      if(_loc6_ != 1 && !this.api.electron.isWindowFocused)
      {
         return undefined;
      }
      var _loc8_ = !_global.isNaN(_loc6_) ? "emote" + _loc6_ : "static";
      this.api.gfx.convertHeightToFourSpriteDirection(_loc5_);
      if(_global.isNaN(_loc7_) && _global.isNaN(_loc6_))
      {
         this.api.gfx.setForcedSpriteAnim(_loc5_,_loc8_);
      }
      else
      {
         this.api.gfx.setSpriteTimerAnim(_loc5_,_loc8_,true,_loc7_);
      }
   }
   function onList(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = Number(_loc3_[1]);
      var _loc6_ = this.api.datacenter.Player;
      _loc6_.clearEmotes();
      var _loc7_ = 0;
      while(_loc7_ < 32)
      {
         if((_loc4_ >> _loc7_ & 1) == 1)
         {
            if(this.api.lang.getEmoteText(_loc7_ + 1) != undefined)
            {
               _loc6_.addEmote(_loc7_ + 1);
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      var _loc8_ = 0;
      while(_loc8_ < 32)
      {
         if((_loc5_ >> _loc8_ & 1) == 1)
         {
            if(this.api.lang.getEmoteText(_loc8_ + 1) != undefined)
            {
               _loc6_.addEmote(_loc8_ + 1);
            }
         }
         _loc8_ = _loc8_ + 1;
      }
      this.refresh();
   }
   function onAdd(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = _loc3_[1] == "0";
      if(!_loc5_)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("NEW_EMOTE",[this.api.lang.getEmoteText(_loc4_).n]),"INFO_CHAT");
      }
      this.refresh();
   }
   function onRemove(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = _loc3_[1] == "0";
      if(!_loc5_)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("REMOVE_EMOTE",[this.api.lang.getEmoteText(_loc4_).n]),"INFO_CHAT");
      }
      this.refresh();
   }
   function onDirection(§\x1e\x12\r§)
   {
      if(this.api.datacenter.Game.isFight)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = _loc3_[0];
      var _loc5_ = Number(_loc3_[1]);
      var _loc6_ = this.api.gfx.getSprite(_loc4_).animation;
      this.api.gfx.setSpriteDirection(_loc4_,_loc5_);
      this.api.gfx.setSpriteAnim(_loc4_,_loc6_);
   }
   function refresh()
   {
      this.api.ui.getUIComponent("Banner").updateSmileysEmotes();
      this.api.ui.getUIComponent("Banner").showSmileysEmotesPanel(true);
   }
}
