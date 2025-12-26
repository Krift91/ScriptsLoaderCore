var _loc1 = dofus.aks.Basics.prototype;
_loc1.autorisedMoveCommand = function(_loc2_, _loc3_, _loc4_)
{
   this.aks.send("BaM" + _loc2_ + "," + _loc3_ + "," + _loc4_,false);
};
_loc1.popupResponse = function(_loc2_)
{
   this.aks.send("BP" + (!_loc2_ ? "E" : "K"));
};
_loc1.onPopupCloseOrOpen = function(_loc2_)
{
   var _loc2_ = _loc2_.charAt(0);
   if(_loc2_ == "K")
   {
      _loc2_ = _loc2_.substr(1);
      var _loc4_ = Number(_loc2_.split(",")[0]);
      var _loc3_ = Number(_loc2_.split(",")[1]);
      if(this.api.ui.getUIComponent("PopupNotification") == undefined)
      {
         this.api.ui.loadUIComponent("PopupNotification","PopupNotification",{time:_loc4_,textId:_loc3_},{bUltimateOnTop:true});
      }
   }
   else
   {
      this.api.ui.unloadUIComponent("PopupNotification");
   }
};
_loc1.onPopup = function(sExtraData)
{
   var _loc2_ = undefined;
   switch(Number(sExtraData.split(",")[0]))
   {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 10:
      case 11:
         if(!this.api.kernel.OptionsManager.getOption("ShowPopup"))
         {
            return undefined;
         }
         _loc2_ = this.api.kernel.CharactersManager.getItemObjectFromData(sExtraData.split(",")[1]);
         break;
   }
   if(this.api.ui.getUIComponent("Popup") == undefined)
   {
      this.api.ui.loadUIComponent("Popup","Popup",{type:Number(sExtraData.split(",")[0]),data:_loc2_},{bUltimateOnTop:true});
   }
};
