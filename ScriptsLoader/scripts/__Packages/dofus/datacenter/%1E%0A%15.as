class dofus.datacenter.§\x1e\n\x15§ extends dofus.datacenter.§\x1e\n\x16§
{
   var _mLeft;
   var _sOperator;
   var _mRight;
   var _mNextBlocTrueID;
   var _mNextBlocFalseID;
   function §\x1e\n\x15§(sID, mLeft, §\x1e\x0f\x0b§, mRight, mNextBlocTrueID, mNextBlocFalseID)
   {
      super(sID,dofus.datacenter["\x1e\n\x16"].TYPE_IF);
      this._mLeft = mLeft;
      this._sOperator = _loc5_;
      this._mRight = mRight;
      this._mNextBlocTrueID = mNextBlocTrueID;
      this._mNextBlocFalseID = mNextBlocFalseID;
   }
   function get left()
   {
      return this._mLeft;
   }
   function get operator()
   {
      return this._sOperator;
   }
   function get right()
   {
      return this._mRight;
   }
   function get nextBlocTrueID()
   {
      return this._mNextBlocTrueID;
   }
   function get nextBlocFalseID()
   {
      return this._mNextBlocFalseID;
   }
}
