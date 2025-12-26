class dofus.datacenter.§\x1e\x15\x1b§ extends Object
{
   var _nID;
   var _bFinished;
   var api;
   var _oCurrentStep;
   var _eoSteps;
   var sortOrder;
   function §\x1e\x15\x1b§(§\x04\x12§, §\x1a\x04§, §\x1e\x1d\x03§)
   {
      super();
      this.initialize(_loc3_,_loc4_,_loc5_);
   }
   function get id()
   {
      return this._nID;
   }
   function get isFinished()
   {
      return this._bFinished;
   }
   function get name()
   {
      var _loc2_ = this.api.lang.getQuestText(this._nID);
      if(_loc2_ != null && dofus.Constants.DEBUG)
      {
         _loc2_ = _loc2_ + " (" + this._nID + ")";
      }
      return _loc2_;
   }
   function get currentStep()
   {
      return this._oCurrentStep;
   }
   function addStep(§\x1e\x17\x11§)
   {
      this._eoSteps.addItemAt(_loc2_.id,_loc2_);
      if(_loc2_.isCurrent)
      {
         this._oCurrentStep = _loc2_;
      }
   }
   function initialize(§\x04\x12§, §\x1a\x04§, §\x1e\x1d\x03§)
   {
      this.api = _global.API;
      this._eoSteps = new ank["\x1e\n\x07"]["\x0e\x1d"]();
      this._nID = _loc2_;
      this._bFinished = _loc3_;
      this.sortOrder = _loc4_;
   }
}
