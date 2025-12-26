class dofus.§\x0b\b§.§\x1e\n\n§
{
   var receiving_lc;
   var sending_lc;
   var _status;
   var _connId;
   static var _self;
   static var SERVER = 1;
   static var CLIENT = 2;
   static var NONE = 3;
   function §\x1e\n\n§()
   {
      this.receiving_lc = new LocalConnection();
      this.sending_lc = new LocalConnection();
      this._status = dofus["\x0b\b"]["\x1e\n\n"].NONE;
      this._connId = "_dofus" + Math.floor(Math.random() * 100000000);
   }
   function get api()
   {
      return _global.API;
   }
   static function getInstance()
   {
      if(!dofus["\x0b\b"]["\x1e\n\n"]._self)
      {
         dofus["\x0b\b"]["\x1e\n\n"]._self = new dofus["\x0b\b"]["\x1e\n\n"]();
      }
      return dofus["\x0b\b"]["\x1e\n\n"]._self;
   }
   function update()
   {
      var _loc2_ = this.receiving_lc.connect("_dofus");
      if(this._status != dofus["\x0b\b"]["\x1e\n\n"].SERVER && _loc2_)
      {
         this.makeServer();
      }
      else if(this._status != dofus["\x0b\b"]["\x1e\n\n"].SERVER)
      {
         if(this._status != dofus["\x0b\b"]["\x1e\n\n"].CLIENT)
         {
            this.makeClient();
         }
         this.receiving_lc.connect(this._connId);
         this.sending_lc.send("_dofus","getUId",this._connId);
      }
   }
   function makeServer()
   {
      this._status = dofus["\x0b\b"]["\x1e\n\n"].SERVER;
      this.receiving_lc.getUId = function(§\x12\f§)
      {
         var _loc3_ = SharedObject.getLocal(dofus.Constants.GLOBAL_SO_IDENTITY_NAME);
         if(_loc3_.data.identity)
         {
            dofus["\x0b\b"]["\x1e\n\n"].getInstance().sending_lc.send(_loc2_,"setUId",_loc3_.data.identity);
         }
         _loc3_.close();
      };
   }
   function makeClient()
   {
      this._status = dofus["\x0b\b"]["\x1e\n\n"].CLIENT;
      this.receiving_lc.setUId = function(§\x1e\n\x0b§)
      {
         var _loc3_ = SharedObject.getLocal(dofus.Constants.GLOBAL_SO_IDENTITY_NAME);
         _loc3_.data.identity = _loc2_;
         _loc3_.close();
         dofus["\x0b\b"]["\x1e\n\n"].getInstance().receiving_lc.close();
      };
   }
}
