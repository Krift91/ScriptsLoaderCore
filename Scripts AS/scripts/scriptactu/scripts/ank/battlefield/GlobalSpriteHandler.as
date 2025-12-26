var _loc1 = _global.ank.battlefield["\r\x16"].prototype;
_loc1.applyBottomColor = function(_loc2_)
{
   this.sashaColor(_loc2_,3);
};
_loc1.applyBodyColor = function(_loc2_)
{
   this.sashaColor(_loc2_,2);
};
_loc1.applyHeadColor = function(_loc2_)
{
   this.sashaColor(_loc2_,1);
};
_loc1.sashaColor = function(mc, nZone, isMount)
{
   var _loc3_ = this.getSpriteData(mc);
   if(_loc3_ != undefined)
   {
      var _loc2_ = isMount && _loc3_.mount != undefined ? _loc3_.mount["color" + nZone] : _loc3_["color" + nZone];
      if(_loc2_ != undefined && _loc2_ != -1)
      {
         var _loc7_ = (_loc2_ & 0xFF0000) >> 16;
         var _loc5_ = (_loc2_ & 0xFF00) >> 8;
         var _loc8_ = _loc2_ & 0xFF;
         var _loc6_ = new Color(mc);
         var _loc4_ = new Object();
         _loc4_ = {ra:"0",rb:_loc7_,ga:"0",gb:_loc5_,ba:"0",bb:_loc8_,aa:"100",ab:"0"};
         _loc6_.setTransform(_loc4_);
      }
   }
};
_loc1.aplicarEmblema = function(mc, mc1, mc2)
{
   var _loc5_ = this.getSpriteData(mc);
   if(_loc5_ != undefined)
   {
      var _loc11_ = _loc5_.accessories[6].unicID;
      mc.clip.removeMovieClip();
      if(_loc11_ != undefined)
      {
         mc.attachMovie("emblemas","clip",10);
         mc.clip.gotoAndStop(_global.parseInt(_loc5_.accessories[6].type) + 1);
         var _loc3_ = _loc5_.accessories[6].frame;
         var _loc10_ = (_loc3_ & 0xFF0000) >> 16;
         var _loc9_ = (_loc3_ & 0xFF00) >> 8;
         var _loc7_ = _loc3_ & 0xFF;
         var _loc8_ = new Color(mc.clip);
         var _loc4_ = new Object();
         _loc4_ = {ra:"0",rb:_loc10_,ga:"0",gb:_loc9_,ba:"0",bb:_loc7_,aa:"100",ab:"0"};
         _loc8_.setTransform(_loc4_);
         _loc3_ = _loc5_.accessories[6].unicID;
         _loc10_ = (_loc3_ & 0xFF0000) >> 16;
         _loc9_ = (_loc3_ & 0xFF00) >> 8;
         _loc7_ = _loc3_ & 0xFF;
         _loc8_ = new Color(mc2);
         _loc4_ = new Object();
         _loc4_ = {ra:"0",rb:_loc10_,ga:"0",gb:_loc9_,ba:"0",bb:_loc7_,aa:"100",ab:"0"};
         _loc8_.setTransform(_loc4_);
      }
   }
};
