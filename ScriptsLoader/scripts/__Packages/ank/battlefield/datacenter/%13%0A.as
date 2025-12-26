class ank.battlefield.datacenter.§\x13\n§ extends Object
{
   var y;
   var allSpritesOn;
   var nPermanentLevel;
   var num;
   var active = true;
   var lineOfSight = true;
   var layerGroundRot = 0;
   var groundLevel = 7;
   var movement = 4;
   var layerGroundNum = 0;
   var groundSlope = 1;
   var layerGroundFlip = false;
   var layerObject1Num = 0;
   var layerObject1Rot = 0;
   var layerObject1Flip = false;
   var layerObject2Flip = false;
   var layerObject2Interactive = false;
   var layerObject2Num = 0;
   function §\x13\n§()
   {
      super();
   }
   function get rootY()
   {
      return this.y - (7 - this.groundLevel) * ank.battlefield.Constants.LEVEL_HEIGHT;
   }
   function get isTrigger()
   {
      var _loc2_ = false;
      var _loc3_ = 0;
      while(_loc3_ < dofus.Constants.MAP_TRIGGER_LAYEROBJECTS.length)
      {
         var _loc4_ = dofus.Constants.MAP_TRIGGER_LAYEROBJECTS[_loc3_];
         if(this.layerObject1Num == _loc4_ || this.layerObject2Num == _loc4_)
         {
            _loc2_ = true;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
   function get isUnwalkableLayerObject()
   {
      var _loc2_ = false;
      var _loc3_ = 0;
      while(_loc3_ < dofus.Constants.MAP_UNWALKABLE_LAYEROBJECTS.length)
      {
         var _loc4_ = dofus.Constants.MAP_UNWALKABLE_LAYEROBJECTS[_loc3_];
         if(this.layerObject1Num == _loc4_ || this.layerObject2Num == _loc4_)
         {
            _loc2_ = true;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
   function get isTactic()
   {
      var _loc2_ = false;
      if(this.layerGroundNum == 0 && (this.groundSlope == 1 && (this.layerObject2Num == 0 || (this.layerObject2Num == 25 || this.layerObject2Num == 1030))))
      {
         if(!this.lineOfSight)
         {
            if(this.layerObject1Num == 10000)
            {
               _loc2_ = true;
            }
         }
         else if(this.movement == 0 || this.movement == 1)
         {
            if(this.layerObject1Num == 10002)
            {
               _loc2_ = true;
            }
         }
         else if(this.layerObject1Num == 10001 || this.layerObject1Num == 10003)
         {
            _loc2_ = true;
         }
      }
      return _loc2_;
   }
   function addSpriteOnID(sID)
   {
      if(this.allSpritesOn == undefined)
      {
         this.allSpritesOn = new Object();
      }
      if(sID == undefined)
      {
         return undefined;
      }
      if(this.allSpritesOn[sID])
      {
         return undefined;
      }
      this.allSpritesOn[sID] = true;
   }
   function removeSpriteOnID(sID)
   {
      this.allSpritesOn[sID] = undefined;
      delete this.allSpritesOn[sID];
   }
   function removeAllSpritesOnID()
   {
      for(var k in this.allSpritesOn)
      {
         this.allSpritesOn[k] = undefined;
         delete this.allSpritesOn[k];
      }
      delete this.allSpritesOn;
   }
   function get spriteOnCount()
   {
      var _loc2_ = 0;
      for(var k in this.allSpritesOn)
      {
         _loc2_ = _loc2_ + 1;
      }
      return _loc2_;
   }
   function get spriteOnID()
   {
      if(this.allSpritesOn == undefined)
      {
         return undefined;
      }
      for(var k in this.allSpritesOn)
      {
         if(this.allSpritesOn[k])
         {
            return String(k);
         }
      }
      return undefined;
   }
   function get carriedSpriteOnId()
   {
      if(this.allSpritesOn == undefined)
      {
         return false;
      }
      for(var k in this.allSpritesOn)
      {
         if(this.allSpritesOn[k].hasCarriedChild())
         {
            return true;
         }
      }
      return false;
   }
   function turnTactic(mapHandler)
   {
      var _loc3_ = this.isTrigger;
      if(this.nPermanentLevel == 0)
      {
         this.nPermanentLevel = 1;
      }
      this.layerGroundNum = 0;
      this.groundSlope = 1;
      this.layerObject1Rot = 0;
      if(!this.lineOfSight)
      {
         this.layerObject1Num = 10000;
      }
      else if(this.movement == 0 || this.movement == 1)
      {
         this.layerObject1Num = 10002;
      }
      else
      {
         var _loc4_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(mapHandler,this.num);
         var _loc5_ = Math.abs(_loc4_.x) % 2 == Math.abs(_loc4_.y) % 2;
         this.layerObject1Num = !_loc5_ ? 10001 : 10001;
      }
      if(this.layerObject2Num != 25)
      {
         if(_loc3_)
         {
            this.layerObject2Num = 1030;
         }
         else
         {
            this.layerObject2Num = 0;
         }
      }
   }
}
