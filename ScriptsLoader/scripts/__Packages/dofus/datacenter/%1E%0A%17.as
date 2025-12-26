class dofus.datacenter.§\x1e\n\x17§ extends dofus.datacenter.§\x1e\n\x16§
{
   var _sActionCode;
   var _aParams;
   var _mNextBlocID;
   var _bKeepLastWaitingBloc;
   function §\x1e\n\x17§(sID, sActionCode, §\x1e\x01§, §\n\x03§, bKeepLastWaitingBloc)
   {
      super(sID,dofus.datacenter["\x1e\n\x16"].TYPE_ACTION);
      this._sActionCode = sActionCode;
      this._aParams = _loc5_;
      this._mNextBlocID = _loc6_;
      this._bKeepLastWaitingBloc = bKeepLastWaitingBloc;
   }
   function get actionCode()
   {
      return this._sActionCode;
   }
   function get params()
   {
      return this._aParams;
   }
   function get nextBlocID()
   {
      return this._mNextBlocID;
   }
   function get keepLastWaitingBloc()
   {
      return this._bKeepLastWaitingBloc == true;
   }
}
