class ank.battlefield.§\f\x12§
{
   var _mcContainer;
   var _oDatacenter;
   var _extraProto;
   var _bIs8;
   function §\f\x12§(§\x13\x0f§, §\x11\x10§)
   {
      this.initialize(_loc2_,_loc3_);
   }
   function initialize(§\x13\x0f§, §\x11\x10§)
   {
      this._mcContainer = _loc2_;
      this._oDatacenter = _loc3_;
      this._extraProto = new Object();
      this.setEnabled(ank.battlefield.Constants.INTERACTION_NONE);
      this._bIs8 = Number(System.capabilities.version.substr(0,1)) >= 8;
   }
   function setEnabled(§\x1e\x1c\x17§)
   {
      switch(_loc2_)
      {
         case ank.battlefield.Constants.INTERACTION_NONE:
            this.setEnabledOffAllExtraProto();
            this.setEnabledProtoAll(ank.battlefield.mc["\x13\n"].prototype,false);
            this.setEnabledProtoAll(ank.battlefield.mc["\f\x11"].prototype,false);
            this.setEnabledProtoAll(ank.battlefield.mc["\x1e\x0e\x10"].prototype,false);
            break;
         case ank.battlefield.Constants.INTERACTION_CELL_NONE:
            this.setEnabledOffAllExtraProto();
            this.setEnabledProtoAll(ank.battlefield.mc["\x13\n"].prototype,false);
            break;
         case ank.battlefield.Constants.INTERACTION_CELL_RELEASE:
            this.setEnabledProtoRelease(ank.battlefield.mc["\x13\n"].prototype,true);
            this.setEnabledProtoOutOver(ank.battlefield.mc["\x13\n"].prototype,false);
            break;
         case ank.battlefield.Constants.INTERACTION_CELL_OVER_OUT:
            this.setEnabledProtoRelease(ank.battlefield.mc["\x13\n"].prototype,false);
            this.setEnabledProtoOutOver(ank.battlefield.mc["\x13\n"].prototype,true);
            break;
         case ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT:
            this.setEnabledProtoAll(ank.battlefield.mc["\x13\n"].prototype,true);
            break;
         case ank.battlefield.Constants.INTERACTION_OBJECT_NONE:
            this.setEnabledProtoRelease(ank.battlefield.mc["\f\x11"].prototype,false);
            this.setEnabledProtoOutOver(ank.battlefield.mc["\f\x11"].prototype,false);
            if(this._bIs8)
            {
               this.setEnabledObject2Release(false);
               this.setEnabledObject2OutOver(false);
            }
            break;
         case ank.battlefield.Constants.INTERACTION_OBJECT_RELEASE:
            this.setEnabledProtoRelease(ank.battlefield.mc["\f\x11"].prototype,true);
            this.setEnabledProtoOutOver(ank.battlefield.mc["\f\x11"].prototype,false);
            if(this._bIs8)
            {
               this.setEnabledObject2Release(true);
               this.setEnabledObject2OutOver(false);
            }
            break;
         case ank.battlefield.Constants.INTERACTION_OBJECT_OVER_OUT:
            this.setEnabledProtoRelease(ank.battlefield.mc["\f\x11"].prototype,false);
            this.setEnabledProtoOutOver(ank.battlefield.mc["\f\x11"].prototype,true);
            if(this._bIs8)
            {
               this.setEnabledObject2Release(false);
               this.setEnabledObject2OutOver(true);
            }
            break;
         case ank.battlefield.Constants.INTERACTION_OBJECT_RELEASE_OVER_OUT:
            this.setEnabledProtoAll(ank.battlefield.mc["\f\x11"].prototype,true);
            if(this._bIs8)
            {
               this.setEnabledObject2All(true);
            }
            break;
         case ank.battlefield.Constants.INTERACTION_SPRITE_NONE:
            this.setEnabledProtoRelease(ank.battlefield.mc["\x1e\x0e\x10"].prototype,false);
            this.setEnabledProtoOutOver(ank.battlefield.mc["\x1e\x0e\x10"].prototype,false);
            break;
         case ank.battlefield.Constants.INTERACTION_SPRITE_RELEASE:
            this.setEnabledProtoRelease(ank.battlefield.mc["\x1e\x0e\x10"].prototype,true);
            this.setEnabledProtoOutOver(ank.battlefield.mc["\x1e\x0e\x10"].prototype,false);
            break;
         case ank.battlefield.Constants.INTERACTION_SPRITE_OVER_OUT:
            this.setEnabledProtoRelease(ank.battlefield.mc["\x1e\x0e\x10"].prototype,false);
            this.setEnabledProtoOutOver(ank.battlefield.mc["\x1e\x0e\x10"].prototype,true);
            break;
         case ank.battlefield.Constants.INTERACTION_SPRITE_RELEASE_OVER_OUT:
            this.setEnabledProtoAll(ank.battlefield.mc["\x1e\x0e\x10"].prototype,true);
      }
   }
   function setEnabledCell(§\x07\x11§, §\x1e\x1c\x17§)
   {
      var _loc4_ = this._mcContainer["cell" + _loc2_];
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\x07"]["\x0b\f"].err("[setEnabledCell] Cell inexistante");
         return undefined;
      }
      this._extraProto[_loc4_._name] = _loc4_;
      switch(_loc3_)
      {
         case ank.battlefield.Constants.INTERACTION_NONE:
            this.setEnabledProtoAll(_loc4_,false);
            break;
         case ank.battlefield.Constants.INTERACTION_CELL_RELEASE:
            this.setEnabledProtoRelease(_loc4_,true);
            this.setEnabledProtoOutOver(_loc4_,false);
            break;
         case ank.battlefield.Constants.INTERACTION_CELL_OVER_OUT:
            this.setEnabledProtoRelease(_loc4_,false);
            this.setEnabledProtoOutOver(_loc4_,true);
            break;
         case ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT:
            this.setEnabledProtoAll(_loc4_,true);
      }
   }
   function setEnabledOffAllExtraProto(§\x1e\t\x1c§)
   {
      for(var p in this._extraProto)
      {
         var _loc3_ = this._extraProto[p];
         this.setEnabledProtoAll(_loc3_,false);
      }
      this._extraProto = new Array();
   }
   function setEnabledProtoAll(proto, §\x16\x18§)
   {
      if(_loc3_)
      {
         proto.onRelease = proto._release;
      }
      else
      {
         delete proto.onRelease;
      }
      this.setEnabledProtoOutOver(proto,_loc3_);
   }
   function setEnabledProtoRelease(proto, §\x16\x18§)
   {
      if(_loc3_)
      {
         proto.onRelease = proto._release;
      }
      else
      {
         delete proto.onRelease;
      }
   }
   function setEnabledProtoOutOver(proto, §\x16\x18§)
   {
      if(_loc3_)
      {
         proto.onRollOver = proto._rollOver;
         proto.onRollOut = proto._rollOut;
         proto.onRollOut = proto.onReleaseOutside = proto._rollOut;
      }
      else
      {
         delete proto.onRollOver;
         delete proto.onRollOut;
         delete proto.onReleaseOutside;
         var _loc4_ = _global.API;
         if(_loc4_.gfx.rollOverMcObject == proto || _loc4_.gfx.rollOverMcSprite == proto)
         {
            proto._rollOut();
         }
      }
   }
   function setEnabledObject2All(§\x16\x18§)
   {
      var _loc3_ = this._oDatacenter.Map.data;
      for(var k in _loc3_)
      {
         var _loc4_ = _loc3_[k].mcObject2;
         if(_loc3_[k].layerObject2Interactive)
         {
            if(_loc4_ != undefined)
            {
               if(_loc2_)
               {
                  _loc4_.onRelease = _loc4_._release;
               }
               else
               {
                  delete _loc4_.onRelease;
               }
               this.setEnabledProtoOutOver(_loc4_,_loc2_);
            }
         }
      }
   }
   function setEnabledObject2Release(§\x16\x18§)
   {
      var _loc3_ = this._oDatacenter.Map.data;
      for(var k in _loc3_)
      {
         var _loc4_ = _loc3_[k].mcObject2;
         if(_loc3_[k].layerObject2Interactive)
         {
            if(_loc4_ != undefined)
            {
               if(_loc2_)
               {
                  _loc4_.onRelease = _loc4_._release;
               }
               else
               {
                  delete _loc4_.onRelease;
               }
            }
         }
      }
   }
   function setEnabledObject2OutOver(§\x16\x18§)
   {
      var _loc3_ = this._oDatacenter.Map.data;
      for(var k in _loc3_)
      {
         var _loc4_ = _loc3_[k].mcObject2;
         if(_loc3_[k].layerObject2Interactive)
         {
            if(_loc4_ != undefined)
            {
               this.setEnabledProtoOutOver(_loc4_,_loc2_);
            }
         }
      }
   }
}
