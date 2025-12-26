class dofus.datacenter.§\x02\x01§ extends ank.battlefield.datacenter.§\x1e\x0e\x10§
{
   var api;
   var _nUnicID;
   var _oNpcText;
   var _gfxID;
   var _nExtraClipID;
   var _nCustomArtwork;
   var id;
   function §\x02\x01§(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID, §\x11\x14§)
   {
      super();
      this.api = _global.API;
      if(this.__proto__ == dofus.datacenter["\x02\x01"].prototype)
      {
         this.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_,gfxID,_loc9_);
      }
   }
   function get unicID()
   {
      return this._nUnicID;
   }
   function set unicID(§\x1e\n\x02§)
   {
      this._nUnicID = _loc2_;
      this._oNpcText = this.api.lang.getNonPlayableCharactersText(_loc2_);
   }
   function get name()
   {
      return this.api.lang.fetchString(this._oNpcText.n);
   }
   function get actions()
   {
      var _loc2_ = new Array();
      var _loc3_ = this._oNpcText.a;
      var _loc4_ = _loc3_.length;
      while(_loc4_-- > 0)
      {
         var _loc5_ = _loc3_[_loc4_];
         _loc2_.push({name:this.api.lang.getNonPlayableCharactersActionText(_loc3_[_loc4_]),actionId:_loc5_,action:this.getActionFunction(_loc3_[_loc4_])});
      }
      return _loc2_;
   }
   function get gfxID()
   {
      return this._gfxID;
   }
   function set gfxID(§\x1e\n\x02§)
   {
      this._gfxID = _loc2_;
   }
   function get extraClipID()
   {
      return this._nExtraClipID;
   }
   function set extraClipID(§\x05\f§)
   {
      this._nExtraClipID = _loc2_;
   }
   function get customArtwork()
   {
      return this._nCustomArtwork;
   }
   function set customArtwork(§\x06\x11§)
   {
      this._nCustomArtwork = _loc2_;
   }
   function initialize(sID, clipClass, §\x1e\x11\x1c§, §\x13\x05§, §\x10\x1d§, gfxID, §\x11\x14§)
   {
      super.initialize(sID,clipClass,_loc5_,_loc6_,_loc7_);
      this._gfxID = gfxID;
      this._nCustomArtwork = _loc9_;
   }
   function getActionFunction(§\t\x01§)
   {
      switch(_loc2_)
      {
         case 1:
            return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[0,this.id]};
         case 2:
            return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[2,this.id]};
         case 3:
            return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startDialog,params:[this.id]};
         case 4:
            return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[9,this.id]};
         case 5:
            return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[10,this.id]};
         case 6:
            return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[11,this.id]};
         case 7:
            return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[17,this.id]};
         case 8:
            return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[18,this.id]};
         default:
            return new Object();
      }
   }
}
