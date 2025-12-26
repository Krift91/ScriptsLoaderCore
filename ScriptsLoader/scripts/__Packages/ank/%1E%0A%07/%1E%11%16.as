class ank.§\x1e\n\x07§.§\x1e\x11\x16§ extends Object
{
   var _so;
   var data;
   var onStatus;
   var onSync;
   static var _oLocalCache = new Object();
   static var _oRemoteCache = new Object();
   function §\x1e\x11\x16§(§\x1e\x18\x0b§)
   {
      super();
      this._so = !!_loc3_.persistence ? SharedObject.getRemote(_loc3_.name,_loc3_.remotePath,_loc3_.persistence,_loc3_.secure) : SharedObject.getLocal(_loc3_.name,_loc3_.localPath,_loc3_.secure);
      if(this._so.data._Data == undefined)
      {
         this._so.data._Data = new Object();
      }
      this.data = this._so.data._Data;
      this._so.onStatus = function(§\f\x14§)
      {
         if(this.onStatus)
         {
            this.onStatus(_loc2_);
         }
      };
      this._so.onSync = function(§\x1e\x1a\b§)
      {
         if(this.onSync)
         {
            this.onSync(_loc2_);
         }
      };
   }
   function clear()
   {
      this.data = new Object();
      this._so.clear();
   }
   function close()
   {
      this._so.data._Data = this.data;
      this._so.close();
   }
   function flush(§\n\x05§)
   {
      this._so.data._Data = this.data;
      return this._so.flush(_loc2_);
   }
   function getSize()
   {
      this._so.data._Data = this.data;
      return this._so.getSize;
   }
   function connect(§\t\x03§)
   {
      this._so.data._Data = this.data;
      return this._so.connect(_loc2_);
   }
   function send(§\r\b§)
   {
      this._so.data._Data = this.data;
      this._so.send(_loc2_);
   }
   function setFps(§\x1e\n\t§)
   {
      this._so.data._Data = this.data;
      return this._so.setFps(_loc2_);
   }
   static function getLocal(§\b\x18§, §\x0b\x0e§, §\x1e\x12\x1c§)
   {
      if(!ank["\x1e\n\x07"]["\x1e\x11\x16"]._oLocalCache[_loc2_])
      {
         ank["\x1e\n\x07"]["\x1e\x11\x16"]._oLocalCache[_loc2_] = new ank["\x1e\n\x07"]["\x1e\x11\x16"]({name:_loc2_,localPath:_loc3_,secure:_loc4_});
      }
      return ank["\x1e\n\x07"]["\x1e\x11\x16"]._oLocalCache[_loc2_];
   }
   static function getRemote(§\b\x18§, §\x1e\x15\x06§, §\x1e\x16\x16§, §\x1e\x12\x1c§)
   {
      if(!ank["\x1e\n\x07"]["\x1e\x11\x16"]._oRemoteCache[_loc2_])
      {
         ank["\x1e\n\x07"]["\x1e\x11\x16"]._oRemoteCache[_loc2_] = new ank["\x1e\n\x07"]["\x1e\x11\x16"]({name:_loc2_,remotePath:_loc3_,persistence:_loc4_,secure:_loc5_});
      }
      return ank["\x1e\n\x07"]["\x1e\x11\x16"]._oRemoteCache[_loc2_];
   }
   static function deleteAll(§\x1e\n\b§)
   {
      SharedObject.deleteAll();
   }
   static function getDiskUsage(§\x1e\n\b§)
   {
      return SharedObject.getDiskUsage(_loc2_);
   }
}
