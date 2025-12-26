class dofus.datacenter.§\x1e\x15\x19§ extends Object
{
   var _nQuestionID;
   var _sQuestionText;
   var api;
   var _eaResponsesObjects;
   function §\x1e\x15\x19§(§\x1e\x1e\x18§, §\x1d\x13§, §\x1d\x16§)
   {
      super();
      this.initialize(_loc3_,_loc4_,_loc5_);
   }
   function get id()
   {
      return this._nQuestionID;
   }
   function get label()
   {
      return this.api.lang.fetchString(this._sQuestionText);
   }
   function get responses()
   {
      return this._eaResponsesObjects;
   }
   function initialize(§\x1e\x1e\x18§, §\x1d\x13§, §\x1d\x16§)
   {
      this.api = _global.API;
      this._nQuestionID = _loc2_;
      var _loc5_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this.api.lang.getDialogQuestionText(_loc2_),_loc4_);
      if(dofus.Constants.DEBUG)
      {
         _loc5_ = _loc5_ + " (" + _loc2_ + ")";
      }
      this._sQuestionText = _loc5_;
      this._eaResponsesObjects = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc6_ = 0;
      while(_loc6_ < _loc3_.length)
      {
         var _loc7_ = Number(_loc3_[_loc6_]);
         this._eaResponsesObjects.push({label:this.api.lang.fetchString(this.api.lang.getDialogResponseText(_loc7_)),id:_loc7_});
         _loc6_ = _loc6_ + 1;
      }
   }
}
