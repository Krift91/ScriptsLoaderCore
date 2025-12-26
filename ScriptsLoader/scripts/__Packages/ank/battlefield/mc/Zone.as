class ank.battlefield.mc.Zone extends MovieClip
{
   var _oMap;
   var _mcZone;
   static var ALPHA = 30;
   function Zone(§\x0b\x07§)
   {
      super();
      this.initialize(_loc3_);
   }
   function initialize(§\x0b\x07§)
   {
      this._oMap = _loc2_;
      this.clear();
   }
   function clear()
   {
      this.createEmptyMovieClip("_mcZone",10);
   }
   function remove()
   {
      this.removeMovieClip();
   }
   function drawCircle(§\x1e\x1e\x16§, §\x06\x1d§, §\x07\x0f§)
   {
      var _loc5_ = this._mcZone;
      _loc5_.beginFill(_loc3_,ank.battlefield.mc.Zone.ALPHA);
      this.drawCircleBorder(_loc2_,_loc3_,_loc4_);
      _loc5_.endFill();
   }
   function drawRing(§\x1e\x1e\x15§, §\x1e\x1e\x14§, §\x06\x1d§, §\x07\x0f§)
   {
      var _loc6_ = this._mcZone;
      _loc6_.beginFill(_loc4_,ank.battlefield.mc.Zone.ALPHA);
      this.drawCircleBorder(_loc3_,_loc4_,_loc5_);
      this.drawCircleBorder(_loc2_,_loc4_,_loc5_);
      _loc6_.endFill();
   }
   function drawRectangle(§\x1e\x1b\x02§, §\x04\x17§, §\x06\x1d§, §\x07\x0f§)
   {
      var _loc6_ = this._mcZone;
      _loc6_.beginFill(_loc4_,ank.battlefield.mc.Zone.ALPHA);
      this.drawRectangleBorder(_loc2_,_loc3_,_loc4_,_loc5_);
      _loc6_.endFill();
   }
   function drawCross(§\x1e\x1e\x16§, §\x06\x1d§, §\x07\x0f§)
   {
      var _loc5_ = ank.battlefield.Constants.CELL_COORD;
      var _loc6_ = this._oMap.getWidth();
      var _loc7_ = _loc4_;
      var _loc10_ = this._mcZone;
      _loc10_.beginFill(_loc3_,ank.battlefield.mc.Zone.ALPHA);
      _loc10_.lineStyle(1,_loc3_,100);
      var _loc9_ = this.getGroundData(_loc7_);
      _loc10_.moveTo(_loc5_[_loc9_.gf][0][0],_loc5_[_loc9_.gf][0][1] - _loc9_.gl * 20);
      var _loc8_ = 1;
      while(_loc8_ <= _loc2_)
      {
         _loc7_ -= _loc6_;
         _loc9_ = this.getGroundData(_loc7_);
         _loc10_.lineTo(_loc5_[_loc9_.gf][0][0] - _loc8_ * ank.battlefield.Constants.CELL_HALF_WIDTH,_loc5_[_loc9_.gf][0][1] - _loc9_.gl * 20 - _loc8_ * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         _loc8_ = _loc8_ + 1;
      }
      _loc8_ = _loc2_;
      while(_loc8_ >= 0)
      {
         if(_loc8_ != _loc2_)
         {
            _loc7_ += _loc6_;
         }
         _loc9_ = this.getGroundData(_loc7_);
         _loc10_.lineTo(_loc5_[_loc9_.gf][1][0] - _loc8_ * ank.battlefield.Constants.CELL_HALF_WIDTH,_loc5_[_loc9_.gf][1][1] - _loc9_.gl * 20 - _loc8_ * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         _loc8_ = _loc8_ - 1;
      }
      _loc8_ = 1;
      while(_loc8_ <= _loc2_)
      {
         _loc7_ -= _loc6_ - 1;
         _loc9_ = this.getGroundData(_loc7_);
         _loc10_.lineTo(_loc5_[_loc9_.gf][1][0] + _loc8_ * ank.battlefield.Constants.CELL_HALF_WIDTH,_loc5_[_loc9_.gf][1][1] - _loc9_.gl * 20 - _loc8_ * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         _loc8_ = _loc8_ + 1;
      }
      _loc8_ = _loc2_;
      while(_loc8_ >= 0)
      {
         if(_loc8_ != _loc2_)
         {
            _loc7_ += _loc6_ - 1;
         }
         _loc9_ = this.getGroundData(_loc7_);
         _loc10_.lineTo(_loc5_[_loc9_.gf][2][0] + _loc8_ * ank.battlefield.Constants.CELL_HALF_WIDTH,_loc5_[_loc9_.gf][2][1] - _loc9_.gl * 20 - _loc8_ * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         _loc8_ = _loc8_ - 1;
      }
      _loc8_ = 1;
      while(_loc8_ <= _loc2_)
      {
         _loc7_ += _loc6_;
         _loc9_ = this.getGroundData(_loc7_);
         _loc10_.lineTo(_loc5_[_loc9_.gf][2][0] + _loc8_ * ank.battlefield.Constants.CELL_HALF_WIDTH,_loc5_[_loc9_.gf][2][1] - _loc9_.gl * 20 + _loc8_ * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         _loc8_ = _loc8_ + 1;
      }
      _loc8_ = _loc2_;
      while(_loc8_ >= 0)
      {
         if(_loc8_ != _loc2_)
         {
            _loc7_ -= _loc6_;
         }
         _loc9_ = this.getGroundData(_loc7_);
         _loc10_.lineTo(_loc5_[_loc9_.gf][3][0] + _loc8_ * ank.battlefield.Constants.CELL_HALF_WIDTH,_loc5_[_loc9_.gf][3][1] - _loc9_.gl * 20 + _loc8_ * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         _loc8_ = _loc8_ - 1;
      }
      _loc8_ = 1;
      while(_loc8_ <= _loc2_)
      {
         _loc7_ += _loc6_ - 1;
         _loc9_ = this.getGroundData(_loc7_);
         _loc10_.lineTo(_loc5_[_loc9_.gf][3][0] - _loc8_ * ank.battlefield.Constants.CELL_HALF_WIDTH,_loc5_[_loc9_.gf][3][1] - _loc9_.gl * 20 + _loc8_ * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         _loc8_ = _loc8_ + 1;
      }
      _loc8_ = _loc2_;
      while(_loc8_ > 0)
      {
         if(_loc8_ != _loc2_)
         {
            _loc7_ -= _loc6_ - 1;
         }
         _loc9_ = this.getGroundData(_loc7_);
         _loc10_.lineTo(_loc5_[_loc9_.gf][0][0] - _loc8_ * ank.battlefield.Constants.CELL_HALF_WIDTH,_loc5_[_loc9_.gf][0][1] - _loc9_.gl * 20 + _loc8_ * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         _loc8_ = _loc8_ - 1;
      }
      _loc10_.endFill();
   }
   function drawLine(§\x0b\x13§, §\x06\x1d§, §\x0e\x18§, §\x1e\x15\x07§, §\x1b\x13§, §\x16\x14§)
   {
      var _loc8_ = 0;
      var _loc9_ = 0;
      if(_loc6_ == true)
      {
         var _loc10_ = this._oMap.getCellData(_loc4_);
         var _loc11_ = this._oMap.getCellData(_loc5_);
         _loc8_ = _loc10_.x - _loc11_.x;
         _loc9_ = _loc10_.rootY - _loc11_.rootY;
      }
      var _loc12_ = ank.battlefield.Constants.CELL_COORD;
      var _loc13_ = this._oMap.getWidth();
      var _loc14_ = _loc4_;
      var _loc19_ = [0,0,0,0,0,0,0,0];
      if(_loc5_ != _loc4_)
      {
         var _loc20_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getDirection(this._oMap,_loc5_,_loc4_);
         if(_loc7_ == true)
         {
            _loc19_[(_loc20_ + 6) % 8] = _loc2_;
            _loc19_[(_loc20_ + 10) % 8] = _loc2_;
         }
         else
         {
            _loc19_[_loc20_] = _loc2_;
         }
      }
      var _loc18_ = this._mcZone;
      _loc18_.beginFill(_loc3_,ank.battlefield.mc.Zone.ALPHA);
      _loc18_.lineStyle(1,_loc3_,100);
      var _loc17_ = this.getGroundData(_loc14_);
      _loc18_.moveTo(_loc12_[_loc17_.gf][0][0] + _loc8_,_loc12_[_loc17_.gf][0][1] - _loc17_.gl * 20 + _loc9_);
      var _loc15_ = 1;
      while(_loc15_ <= _loc19_[5])
      {
         _loc14_ -= _loc13_;
         _loc17_ = this.getGroundData(_loc14_);
         _loc18_.lineTo(_loc12_[_loc17_.gf][0][0] - _loc15_ * ank.battlefield.Constants.CELL_HALF_WIDTH + _loc8_,_loc12_[_loc17_.gf][0][1] - _loc17_.gl * 20 - _loc15_ * ank.battlefield.Constants.CELL_HALF_HEIGHT + _loc9_);
         _loc15_ = _loc15_ + 1;
      }
      _loc15_ = _loc19_[5];
      while(_loc15_ >= 0)
      {
         if(_loc15_ != _loc19_[5])
         {
            _loc14_ += _loc13_;
         }
         _loc17_ = this.getGroundData(_loc14_);
         _loc18_.lineTo(_loc12_[_loc17_.gf][1][0] - _loc15_ * ank.battlefield.Constants.CELL_HALF_WIDTH + _loc8_,_loc12_[_loc17_.gf][1][1] - _loc17_.gl * 20 - _loc15_ * ank.battlefield.Constants.CELL_HALF_HEIGHT + _loc9_);
         _loc15_ = _loc15_ - 1;
      }
      _loc15_ = 1;
      while(_loc15_ <= _loc19_[7])
      {
         _loc14_ -= _loc13_ - 1;
         _loc17_ = this.getGroundData(_loc14_);
         _loc18_.lineTo(_loc12_[_loc17_.gf][1][0] + _loc15_ * ank.battlefield.Constants.CELL_HALF_WIDTH + _loc8_,_loc12_[_loc17_.gf][1][1] - _loc17_.gl * 20 - _loc15_ * ank.battlefield.Constants.CELL_HALF_HEIGHT + _loc9_);
         _loc15_ = _loc15_ + 1;
      }
      _loc15_ = _loc19_[7];
      while(_loc15_ >= 0)
      {
         if(_loc15_ != _loc19_[7])
         {
            _loc14_ += _loc13_ - 1;
         }
         _loc17_ = this.getGroundData(_loc14_);
         _loc18_.lineTo(_loc12_[_loc17_.gf][2][0] + _loc15_ * ank.battlefield.Constants.CELL_HALF_WIDTH + _loc8_,_loc12_[_loc17_.gf][2][1] - _loc17_.gl * 20 - _loc15_ * ank.battlefield.Constants.CELL_HALF_HEIGHT + _loc9_);
         _loc15_ = _loc15_ - 1;
      }
      _loc15_ = 1;
      while(_loc15_ <= _loc19_[1])
      {
         _loc14_ += _loc13_;
         _loc17_ = this.getGroundData(_loc14_);
         _loc18_.lineTo(_loc12_[_loc17_.gf][2][0] + _loc15_ * ank.battlefield.Constants.CELL_HALF_WIDTH + _loc8_,_loc12_[_loc17_.gf][2][1] - _loc17_.gl * 20 + _loc15_ * ank.battlefield.Constants.CELL_HALF_HEIGHT + _loc9_);
         _loc15_ = _loc15_ + 1;
      }
      _loc15_ = _loc19_[1];
      while(_loc15_ >= 0)
      {
         if(_loc15_ != _loc19_[1])
         {
            _loc14_ -= _loc13_;
         }
         _loc17_ = this.getGroundData(_loc14_);
         _loc18_.lineTo(_loc12_[_loc17_.gf][3][0] + _loc15_ * ank.battlefield.Constants.CELL_HALF_WIDTH + _loc8_,_loc12_[_loc17_.gf][3][1] - _loc17_.gl * 20 + _loc15_ * ank.battlefield.Constants.CELL_HALF_HEIGHT + _loc9_);
         _loc15_ = _loc15_ - 1;
      }
      _loc15_ = 1;
      while(_loc15_ <= _loc19_[3])
      {
         _loc14_ += _loc13_ - 1;
         _loc17_ = this.getGroundData(_loc14_);
         _loc18_.lineTo(_loc12_[_loc17_.gf][3][0] - _loc15_ * ank.battlefield.Constants.CELL_HALF_WIDTH + _loc8_,_loc12_[_loc17_.gf][3][1] - _loc17_.gl * 20 + _loc15_ * ank.battlefield.Constants.CELL_HALF_HEIGHT + _loc9_);
         _loc15_ = _loc15_ + 1;
      }
      _loc15_ = _loc19_[3];
      while(_loc15_ > 0)
      {
         if(_loc15_ != _loc19_[3])
         {
            _loc14_ -= _loc13_ - 1;
         }
         _loc17_ = this.getGroundData(_loc14_);
         _loc18_.lineTo(_loc12_[_loc17_.gf][0][0] - _loc15_ * ank.battlefield.Constants.CELL_HALF_WIDTH + _loc8_,_loc12_[_loc17_.gf][0][1] - _loc17_.gl * 20 + _loc15_ * ank.battlefield.Constants.CELL_HALF_HEIGHT + _loc9_);
         _loc15_ = _loc15_ - 1;
      }
      _loc18_.endFill();
   }
   function getGroundData(§\x07\x11§)
   {
      var _loc3_ = this._oMap.getCellData(_loc2_);
      var _loc4_ = _loc3_.groundSlope != undefined ? _loc3_.groundSlope : 1;
      var _loc5_ = _loc3_.groundLevel != undefined ? _loc3_.groundLevel - 7 : 0;
      return {gf:_loc4_,gl:_loc5_};
   }
   function drawCircleBorder(§\x1e\x1e\x16§, §\x06\x1d§, §\x07\x0f§)
   {
      var _loc5_ = ank.battlefield.Constants.CELL_COORD;
      var _loc6_ = this._oMap.getWidth();
      var _loc7_ = _loc6_ * 2 - 1;
      var _loc8_ = _loc4_ - _loc2_ * _loc6_;
      var _loc13_ = (- _loc2_) * ank.battlefield.Constants.CELL_HALF_WIDTH;
      var _loc14_ = (- _loc2_) * ank.battlefield.Constants.CELL_HALF_HEIGHT;
      var _loc12_ = this._mcZone;
      _loc12_.lineStyle(1,_loc3_,100);
      var _loc11_ = this.getGroundData(_loc8_);
      _loc12_.moveTo(_loc13_ + _loc5_[_loc11_.gf][0][0],_loc14_ + _loc5_[_loc11_.gf][0][1] - _loc11_.gl * 20);
      var _loc9_ = 0;
      while(_loc9_ < _loc2_ + 1)
      {
         if(_loc9_ != 0)
         {
            _loc8_ = _loc8_ + 1;
         }
         _loc11_ = this.getGroundData(_loc8_);
         _loc12_.lineTo(_loc13_ + _loc5_[_loc11_.gf][1][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc5_[_loc11_.gf][1][1] - _loc11_.gl * 20);
         _loc12_.lineTo(_loc13_ + _loc5_[_loc11_.gf][2][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc5_[_loc11_.gf][2][1] - _loc11_.gl * 20);
         _loc9_ = _loc9_ + 1;
      }
      _loc9_ -= 1;
      var _loc10_ = 0;
      while(_loc10_ < _loc2_)
      {
         _loc8_ += _loc7_;
         _loc11_ = this.getGroundData(_loc8_);
         _loc12_.lineTo(_loc13_ + _loc5_[_loc11_.gf][1][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc5_[_loc11_.gf][1][1] + (_loc10_ + 1) * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc12_.lineTo(_loc13_ + _loc5_[_loc11_.gf][2][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc5_[_loc11_.gf][2][1] + (_loc10_ + 1) * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc10_ = _loc10_ + 1;
      }
      _loc9_ = _loc2_;
      while(_loc9_ >= 0)
      {
         if(_loc9_ != _loc2_)
         {
            _loc8_ = _loc8_ - 1;
         }
         _loc11_ = this.getGroundData(_loc8_);
         _loc12_.lineTo(_loc13_ + _loc5_[_loc11_.gf][3][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc5_[_loc11_.gf][3][1] + _loc10_ * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc12_.lineTo(_loc13_ + _loc5_[_loc11_.gf][0][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc5_[_loc11_.gf][0][1] + _loc10_ * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc9_ = _loc9_ - 1;
      }
      _loc9_ += 1;
      _loc10_ = _loc2_ - 1;
      while(_loc10_ >= 0)
      {
         _loc8_ -= _loc7_;
         _loc11_ = this.getGroundData(_loc8_);
         _loc12_.lineTo(_loc13_ + _loc5_[_loc11_.gf][3][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc5_[_loc11_.gf][3][1] + _loc10_ * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc12_.lineTo(_loc13_ + _loc5_[_loc11_.gf][0][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc5_[_loc11_.gf][0][1] + _loc10_ * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc10_ = _loc10_ - 1;
      }
   }
   function drawRectangleBorder(§\x1e\x1b\x02§, §\x04\x17§, §\x06\x1d§, §\x07\x0f§)
   {
      var _loc6_ = ank.battlefield.Constants.CELL_COORD;
      var _loc7_ = this._oMap.getWidth() * 2 - 1;
      var _loc8_ = Number(_loc5_);
      var _loc13_ = 0;
      var _loc14_ = 0;
      var _loc12_ = this._mcZone;
      _loc12_.lineStyle(1,_loc4_,100);
      var _loc11_ = this.getGroundData(_loc8_);
      _loc12_.moveTo(_loc13_ + _loc6_[_loc11_.gf][0][0],_loc14_ + _loc6_[_loc11_.gf][0][1] - _loc11_.gl * 20);
      var _loc9_ = 0;
      while(_loc9_ < _loc2_)
      {
         if(_loc9_ != 0)
         {
            _loc8_ = _loc8_ + 1;
         }
         _loc11_ = this.getGroundData(_loc8_);
         _loc12_.lineTo(_loc13_ + _loc6_[_loc11_.gf][1][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc6_[_loc11_.gf][1][1] - _loc11_.gl * 20);
         _loc12_.lineTo(_loc13_ + _loc6_[_loc11_.gf][2][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc6_[_loc11_.gf][2][1] - _loc11_.gl * 20);
         _loc9_ = _loc9_ + 1;
      }
      _loc9_ -= 1;
      var _loc10_ = 0;
      while(_loc10_ < _loc3_ - 1)
      {
         _loc8_ += _loc7_;
         _loc11_ = this.getGroundData(_loc8_);
         _loc12_.lineTo(_loc13_ + _loc6_[_loc11_.gf][1][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc6_[_loc11_.gf][1][1] + (_loc10_ + 1) * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc12_.lineTo(_loc13_ + _loc6_[_loc11_.gf][2][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc6_[_loc11_.gf][2][1] + (_loc10_ + 1) * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc10_ = _loc10_ + 1;
      }
      _loc9_ = _loc2_ - 1;
      while(_loc9_ >= 0)
      {
         if(_loc9_ != _loc2_ - 1)
         {
            _loc8_ = _loc8_ - 1;
         }
         _loc11_ = this.getGroundData(_loc8_);
         _loc12_.lineTo(_loc13_ + _loc6_[_loc11_.gf][3][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc6_[_loc11_.gf][3][1] + _loc10_ * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc12_.lineTo(_loc13_ + _loc6_[_loc11_.gf][0][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc6_[_loc11_.gf][0][1] + _loc10_ * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc9_ = _loc9_ - 1;
      }
      _loc9_ += 1;
      _loc10_ = _loc3_ - 2;
      while(_loc10_ >= 0)
      {
         _loc8_ -= _loc7_;
         _loc11_ = this.getGroundData(_loc8_);
         _loc12_.lineTo(_loc13_ + _loc6_[_loc11_.gf][3][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc6_[_loc11_.gf][3][1] + _loc10_ * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc12_.lineTo(_loc13_ + _loc6_[_loc11_.gf][0][0] + _loc9_ * ank.battlefield.Constants.CELL_WIDTH,_loc14_ + _loc6_[_loc11_.gf][0][1] + _loc10_ * ank.battlefield.Constants.CELL_HEIGHT - _loc11_.gl * 20);
         _loc10_ = _loc10_ - 1;
      }
   }
}
