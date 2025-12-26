class dofus.datacenter.HuntMatchmakingStatus
{
   function HuntMatchmakingStatus(bActive, sCurrentStatus)
   {
      this._bActive = bActive;
      this._sCurrentStatus = sCurrentStatus;
   }
   function get isActive()
   {
      return this._bActive;
   }
   function get currentStatus()
   {
      return this._sCurrentStatus;
   }
}
