class ank.§\x1e\n\x07§.§\x1e\x16\x19§
{
   function §\x1e\x16\x19§()
   {
   }
   static function getDescription(§\x1e\f\x12§, §\x1e\x01§)
   {
      ank["\x1e\n\x07"]["\x0e\x1b"].addExtensions();
      var _loc4_ = _loc2_.split("");
      var _loc5_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].decodeDescription(_loc4_,_loc3_).join("");
      return _loc5_;
   }
   static function combine(§\x1e\f\n§, §\r\x18§, §\x1e\x11\n§)
   {
      ank["\x1e\n\x07"]["\x0e\x1b"].addExtensions();
      var _loc5_ = _loc2_.split("");
      var _loc6_ = new Object();
      _loc6_.m = _loc3_ == "m";
      _loc6_.f = _loc3_ == "f";
      _loc6_.n = _loc3_ == "n";
      _loc6_.p = !_loc4_;
      _loc6_.s = _loc4_;
      var _loc7_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].decodeCombine(_loc5_,_loc6_).join("");
      return _loc7_;
   }
   static function replace(§\x1e\r\x0b§, §\x1e\x0e\x1d§)
   {
      var _loc4_ = _loc2_.split("##");
      var _loc5_ = 1;
      while(_loc5_ < _loc4_.length)
      {
         var _loc6_ = _loc4_[_loc5_].split(",");
         _loc4_[_loc5_] = ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(_loc3_,_loc6_);
         _loc5_ += 2;
      }
      return _loc4_.join("");
   }
   static function replaceStr(§\x1e\r\x0b§, §\x1e\r\x1a§, §\x1e\x0e\x03§)
   {
      var _loc5_ = _loc2_.split(_loc3_);
      return _loc5_.join(_loc4_);
   }
   static function decodeDescription(§\x1d\b§, §\x1e\x01§)
   {
      var _loc4_ = 0;
      var _loc5_ = new String();
      var _loc6_ = _loc2_.length;
      while(_loc4_ < _loc6_)
      {
         _loc5_ = _loc2_[_loc4_];
         switch(_loc5_)
         {
            case "#":
               var _loc7_ = _loc2_[_loc4_ + 1];
               if(!_global.isNaN(_loc7_))
               {
                  if(_loc3_[_loc7_ - 1] != undefined)
                  {
                     _loc2_.splice(_loc4_,2,_loc3_[_loc7_ - 1]);
                     _loc4_ = _loc4_ - 1;
                  }
                  else
                  {
                     _loc2_.splice(_loc4_,2);
                     _loc4_ -= 2;
                  }
               }
               break;
            case "~":
               var _loc8_ = _loc2_[_loc4_ + 1];
               if(!_global.isNaN(_loc8_))
               {
                  if(_loc3_[_loc8_ - 1] == undefined)
                  {
                     return _loc2_.slice(0,_loc4_);
                  }
                  _loc2_.splice(_loc4_,2);
                  _loc4_ -= 2;
               }
               break;
            case "{":
               var _loc9_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].find(_loc2_.slice(_loc4_),"}");
               var _loc10_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].decodeDescription(_loc2_.slice(_loc4_ + 1,_loc4_ + _loc9_),_loc3_).join("");
               _loc2_.splice(_loc4_,_loc9_ + 1,_loc10_);
               break;
            case "[":
               var _loc11_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].find(_loc2_.slice(_loc4_),"]");
               var _loc12_ = Number(_loc2_.slice(_loc4_ + 1,_loc4_ + _loc11_).join(""));
               if(!_global.isNaN(_loc12_))
               {
                  _loc2_.splice(_loc4_,_loc11_ + 1,_loc3_[_loc12_] + " ");
                  _loc4_ -= _loc11_;
               }
               break;
         }
         _loc4_ = _loc4_ + 1;
      }
      return _loc2_;
   }
   static function decodeCombine(§\x1d\b§, §\x1e\x18\x0b§)
   {
      var _loc4_ = 0;
      var _loc5_ = new String();
      var _loc6_ = _loc2_.length;
      while(_loc4_ < _loc6_)
      {
         _loc5_ = _loc2_[_loc4_];
         switch(_loc5_)
         {
            case "~":
               var _loc7_ = _loc2_[_loc4_ + 1];
               if(!_loc3_[_loc7_])
               {
                  return _loc2_.slice(0,_loc4_);
               }
               _loc2_.splice(_loc4_,2);
               _loc4_ -= 2;
               break;
            case "{":
               var _loc8_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].find(_loc2_.slice(_loc4_),"}");
               var _loc9_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].decodeCombine(_loc2_.slice(_loc4_ + 1,_loc4_ + _loc8_),_loc3_).join("");
               _loc2_.splice(_loc4_,_loc8_ + 1,_loc9_);
               break;
         }
         _loc4_ = _loc4_ + 1;
      }
      return _loc2_;
   }
   static function find(§\x1c§, §\x0e\x17§)
   {
      var _loc4_ = _loc2_.length;
      var _loc5_ = 0;
      while(_loc5_ < _loc4_)
      {
         if(_loc2_[_loc5_] == _loc3_)
         {
            return _loc5_;
         }
         _loc5_ = _loc5_ + 1;
      }
      return -1;
   }
}
