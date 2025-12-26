class ank.battlefield.§\x1e\n\x07§.§\x12\r§ extends ank.§\x1e\n\x07§.§\x12\r§
{
   function §\x12\r§()
   {
      super();
   }
   static function uncompressMap(§\x0b\x05§, §\b\x18§, §\x1e\t\x16§, §\r\x07§, §\x1c\x1c§, §\x1e\x13\x04§, §\x1e\x18\x17§, §\x19\x19§)
   {
      if(_loc8_ == undefined)
      {
         return undefined;
      }
      var _loc10_ = new Array();
      var _loc11_ = _loc7_.length;
      var _loc13_ = 0;
      var _loc14_ = 0;
      while(_loc14_ < _loc11_)
      {
         var _loc12_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].uncompressCell(_loc7_.substring(_loc14_,_loc14_ + 10),_loc9_,0);
         _loc12_.num = _loc13_;
         _loc10_.push(_loc12_);
         _loc13_ = _loc13_ + 1;
         _loc14_ += 10;
      }
      _loc8_.id = Number(_loc2_);
      _loc8_.name = _loc3_;
      _loc8_.width = Number(_loc4_);
      _loc8_.height = Number(_loc5_);
      _loc8_.backgroundNum = _loc6_;
      _loc8_.data = _loc10_;
   }
   static function uncompressCell(§\x1e\x13\x04§, §\x19\x19§, nPermanentLevel)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = false;
      }
      if(nPermanentLevel == undefined)
      {
         nPermanentLevel = 0;
      }
      else
      {
         nPermanentLevel = Number(nPermanentLevel);
      }
      var _loc5_ = new ank.battlefield.datacenter["\x13\n"]();
      var _loc6_ = _loc2_.split("");
      var _loc7_ = _loc6_.length - 1;
      var _loc8_ = new Array();
      while(_loc7_ >= 0)
      {
         _loc8_[_loc7_] = ank["\x1e\n\x07"]["\x12\r"]._self._hashCodes[_loc6_[_loc7_]];
         _loc7_ = _loc7_ - 1;
      }
      _loc5_.active = !((_loc8_[0] & 0x20) >> 5) ? false : true;
      if(_loc5_.active || _loc3_)
      {
         _loc5_.nPermanentLevel = nPermanentLevel;
         _loc5_.lineOfSight = !(_loc8_[0] & 1) ? false : true;
         _loc5_.layerGroundRot = (_loc8_[1] & 0x30) >> 4;
         _loc5_.groundLevel = _loc8_[1] & 0x0F;
         _loc5_.movement = (_loc8_[2] & 0x38) >> 3;
         _loc5_.layerGroundNum = ((_loc8_[0] & 0x18) << 6) + ((_loc8_[2] & 7) << 6) + _loc8_[3];
         _loc5_.groundSlope = (_loc8_[4] & 0x3C) >> 2;
         _loc5_.layerGroundFlip = !((_loc8_[4] & 2) >> 1) ? false : true;
         _loc5_.layerObject1Num = ((_loc8_[0] & 4) << 11) + ((_loc8_[4] & 1) << 12) + (_loc8_[5] << 6) + _loc8_[6];
         _loc5_.layerObject1Rot = (_loc8_[7] & 0x30) >> 4;
         _loc5_.layerObject1Flip = !((_loc8_[7] & 8) >> 3) ? false : true;
         _loc5_.layerObject2Flip = !((_loc8_[7] & 4) >> 2) ? false : true;
         _loc5_.layerObject2Interactive = !((_loc8_[7] & 2) >> 1) ? false : true;
         _loc5_.layerObject2Num = ((_loc8_[0] & 2) << 12) + ((_loc8_[7] & 1) << 12) + (_loc8_[8] << 6) + _loc8_[9];
         _loc5_.layerObjectExternal = "";
         _loc5_.layerObjectExternalInteractive = false;
      }
      return _loc5_;
   }
   static function compressMap(§\x1e\x18\x17§)
   {
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      var _loc3_ = new Array();
      var _loc4_ = _loc2_.data;
      var _loc5_ = _loc4_.length;
      var _loc6_ = 0;
      while(_loc6_ < _loc5_)
      {
         _loc3_.push(ank.battlefield["\x1e\n\x07"]["\x12\r"].compressCell(_loc4_[_loc6_]));
         _loc6_ = _loc6_ + 1;
      }
      return _loc3_.join("");
   }
   static function compressCell(§\x1e\x1a\x03§)
   {
      var _loc4_ = new Array(0,0,0,0,0,0,0,0,0,0);
      _loc4_[0] = (!_loc2_.active ? 0 : 1) << 5;
      _loc4_[0] |= !_loc2_.lineOfSight ? 0 : 1;
      _loc4_[0] |= (_loc2_.layerGroundNum & 0x0600) >> 6;
      _loc4_[0] |= (_loc2_.layerObject1Num & 0x2000) >> 11;
      _loc4_[0] |= (_loc2_.layerObject2Num & 0x2000) >> 12;
      _loc4_[1] = (_loc2_.layerGroundRot & 3) << 4;
      _loc4_[1] |= _loc2_.groundLevel & 0x0F;
      _loc4_[2] = (_loc2_.movement & 7) << 3;
      _loc4_[2] |= _loc2_.layerGroundNum >> 6 & 7;
      _loc4_[3] = _loc2_.layerGroundNum & 0x3F;
      _loc4_[4] = (_loc2_.groundSlope & 0x0F) << 2;
      _loc4_[4] |= (!_loc2_.layerGroundFlip ? 0 : 1) << 1;
      _loc4_[4] |= _loc2_.layerObject1Num >> 12 & 1;
      _loc4_[5] = _loc2_.layerObject1Num >> 6 & 0x3F;
      _loc4_[6] = _loc2_.layerObject1Num & 0x3F;
      _loc4_[7] = (_loc2_.layerObject1Rot & 3) << 4;
      _loc4_[7] |= (!_loc2_.layerObject1Flip ? 0 : 1) << 3;
      _loc4_[7] |= (!_loc2_.layerObject2Flip ? 0 : 1) << 2;
      _loc4_[7] |= (!_loc2_.layerObject2Interactive ? 0 : 1) << 1;
      _loc4_[7] |= _loc2_.layerObject2Num >> 12 & 1;
      _loc4_[8] = _loc2_.layerObject2Num >> 6 & 0x3F;
      _loc4_[9] = _loc2_.layerObject2Num & 0x3F;
      var _loc5_ = _loc4_.length - 1;
      while(_loc5_ >= 0)
      {
         _loc4_[_loc5_] = ank["\x1e\n\x07"]["\x12\r"].encode64(_loc4_[_loc5_]);
         _loc5_ = _loc5_ - 1;
      }
      var _loc3_ = _loc4_.join("");
      return _loc3_;
   }
   static function compressPath(§\x1e\x14§, §\x13\x15§)
   {
      var _loc4_ = new String();
      var _loc5_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].makeLightPath(_loc2_,_loc3_);
      var _loc11_ = _loc5_.length;
      var _loc6_ = 0;
      while(_loc6_ < _loc11_)
      {
         var _loc7_ = _loc5_[_loc6_];
         var _loc8_ = _loc7_.dir & 7;
         var _loc9_ = (_loc7_.num & 0x0FC0) >> 6;
         var _loc10_ = _loc7_.num & 0x3F;
         _loc4_ += ank["\x1e\n\x07"]["\x12\r"].encode64(_loc8_);
         _loc4_ += ank["\x1e\n\x07"]["\x12\r"].encode64(_loc9_);
         _loc4_ += ank["\x1e\n\x07"]["\x12\r"].encode64(_loc10_);
         _loc6_ = _loc6_ + 1;
      }
      return _loc4_;
   }
   static function makeLightPath(§\x1e\x15§, §\x13\x15§)
   {
      if(_loc2_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("Le chemin est vide");
         return new Array();
      }
      var _loc4_ = new Array();
      if(_loc3_)
      {
         _loc4_.push(_loc2_[0]);
      }
      var _loc6_ = _loc2_.length - 1;
      while(_loc6_ >= 0)
      {
         if(_loc2_[_loc6_].dir != _loc5_)
         {
            _loc4_.splice(0,0,_loc2_[_loc6_]);
            var _loc5_ = _loc2_[_loc6_].dir;
         }
         _loc6_ = _loc6_ - 1;
      }
      return _loc4_;
   }
   static function extractFullPath(mapHandler, §\x12\x0f§)
   {
      var _loc4_ = new Array();
      var _loc5_ = _loc3_.split("");
      var _loc7_ = _loc3_.length;
      var _loc8_ = mapHandler.getCellCount();
      var _loc6_ = 0;
      while(_loc6_ < _loc7_)
      {
         _loc5_[_loc6_] = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc5_[_loc6_]);
         _loc5_[_loc6_ + 1] = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc5_[_loc6_ + 1]);
         _loc5_[_loc6_ + 2] = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc5_[_loc6_ + 2]);
         var _loc9_ = (_loc5_[_loc6_ + 1] & 0x0F) << 6 | _loc5_[_loc6_ + 2];
         if(_loc9_ < 0)
         {
            ank["\x1e\n\x07"]["\x0b\f"].err("Case pas sur carte");
            return null;
         }
         if(_loc9_ > _loc8_)
         {
            ank["\x1e\n\x07"]["\x0b\f"].err("Case pas sur carte");
            return null;
         }
         _loc4_.push({num:_loc9_,dir:_loc5_[_loc6_]});
         _loc6_ += 3;
      }
      return ank.battlefield["\x1e\n\x07"]["\x12\r"].makeFullPath(mapHandler,_loc4_);
   }
   static function makeFullPath(mapHandler, §\x1e\r§)
   {
      var _loc4_ = new Array();
      var _loc6_ = 0;
      var _loc7_ = mapHandler.getWidth();
      var _loc8_ = [1,_loc7_,_loc7_ * 2 - 1,_loc7_ - 1,-1,- _loc7_,- _loc7_ * 2 + 1,- (_loc7_ - 1)];
      var _loc5_ = _loc3_[0].num;
      _loc4_[_loc6_] = _loc5_;
      var _loc9_ = 1;
      while(_loc9_ < _loc3_.length)
      {
         var _loc10_ = _loc3_[_loc9_].num;
         var _loc11_ = _loc3_[_loc9_].dir;
         var _loc12_ = 2 * _loc7_ + 1;
         while(_loc4_[_loc6_] != _loc10_)
         {
            _loc5_ += _loc8_[_loc11_];
            _loc4_[_loc6_ = _loc6_ + 1] = _loc5_;
            if((_loc12_ = _loc12_ - 1) < 0)
            {
               ank["\x1e\n\x07"]["\x0b\f"].err("Chemin impossible");
               return null;
            }
         }
         _loc5_ = _loc10_;
         _loc9_ = _loc9_ + 1;
      }
      return _loc4_;
   }
}
