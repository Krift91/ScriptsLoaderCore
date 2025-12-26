class ank.gapi.styles.§\x1e\f\b§ extends Object
{
   static var _styles = new Object();
   function §\x1e\f\b§()
   {
      super();
   }
   static function setStyle(§\x1e\r\x07§, §\x1e\x17\x10§)
   {
      if(!(_loc3_ instanceof Object))
      {
         return undefined;
      }
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      ank.gapi.styles["\x1e\f\b"]._styles[_loc2_] = _loc3_;
   }
   static function getStyle(§\x1e\r\x07§)
   {
      return ank.gapi.styles["\x1e\f\b"]._styles[_loc2_];
   }
   static function loadStylePackage(§\x1e\x18\r§)
   {
      for(var k in _loc2_)
      {
         ank.gapi.styles["\x1e\f\b"].setStyle(k,_loc2_[k]);
      }
   }
}
