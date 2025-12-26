class ank.battlefield.§\r\x16§
{
   var _oSprites;
   var _mclLoader;
   var _aFrameToGo;
   var _sAccessoriesPath;
   function §\r\x16§()
   {
      this.initialize();
   }
   function initialize()
   {
      this._oSprites = new Object();
      this._mclLoader = new MovieClipLoader();
      this._mclLoader.addListener(this);
      this._aFrameToGo = new Array();
   }
   function setAccessoriesRoot(§\x1e\x16\x1b§)
   {
      this._sAccessoriesPath = _loc2_;
   }
   function addSprite(§\n\x0e§, §\x1e\x17\x15§)
   {
      this._oSprites[_loc2_._target] = {mc:_loc2_,data:_loc3_};
      this.garbageCollector();
   }
   function setColors(§\n\x1d§, §\x12\x13§, §\x12\x12§, §\x12\x11§)
   {
      var _loc6_ = this._oSprites[_loc2_._target].data;
      if(_loc3_ != -1)
      {
         _loc6_.color1 = _loc3_;
      }
      if(_loc4_ != -1)
      {
         _loc6_.color2 = _loc4_;
      }
      if(_loc5_ != -1)
      {
         _loc6_.color3 = _loc5_;
      }
   }
   function setAccessories(§\n\x1d§, §\x19§)
   {
      var _loc4_ = this._oSprites[_loc2_._target].data;
      if(_loc3_ != undefined)
      {
         _loc4_.accessories = _loc3_;
      }
   }
   function applyColor(§\n\x1d§, §\x1e\x1a\x12§, §\f\r§)
   {
      var _loc5_ = this.getSpriteData(_loc2_);
      if(_loc5_ != undefined)
      {
         var _loc6_ = !(_loc4_ && _loc5_.mount != undefined) ? _loc5_["color" + _loc3_] : _loc5_.mount["color" + _loc3_];
         if(_loc6_ != undefined && _loc6_ != -1)
         {
            var _loc7_ = (_loc6_ & 0xFF0000) >> 16;
            var _loc8_ = (_loc6_ & 0xFF00) >> 8;
            var _loc9_ = _loc6_ & 0xFF;
            var _loc10_ = new Color(_loc2_);
            var _loc11_ = new Object();
            _loc11_ = {ra:"0",rb:_loc7_,ga:"0",gb:_loc8_,ba:"0",bb:_loc9_,aa:"100",ab:"0"};
            _loc10_.setTransform(_loc11_);
         }
      }
   }
   function getColorIndex(§\x1e\x11\x1b§, §\b\b§)
   {
      loop0:
      switch(_loc2_)
      {
         case "10":
         case "11":
            switch(_loc3_)
            {
               case 1:
                  var _loc4_ = 3;
                  break;
               case 2:
                  _loc4_ = 1;
                  break;
               case 3:
                  _loc4_ = 2;
            }
            break;
         case "20":
         case "21":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 2;
                  break;
               case 2:
                  _loc4_ = 3;
                  break;
               case 3:
                  _loc4_ = 1;
            }
            break;
         case "30":
         case "31":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 3;
                  break;
               case 2:
                  _loc4_ = 1;
                  break;
               case 3:
                  _loc4_ = 2;
            }
            break;
         case "40":
         case "41":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 2;
                  break;
               case 3:
                  _loc4_ = 1;
                  break;
               default:
                  break;
               case 2:
                  _loc4_ = 3;
            }
            break;
         case "50":
         case "51":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 2;
                  break;
               case 2:
                  _loc4_ = 3;
                  break;
               case 3:
                  _loc4_ = 1;
            }
            break;
         case "60":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 2;
                  break;
               case 2:
                  _loc4_ = 3;
                  break;
               case 3:
                  _loc4_ = 1;
            }
            break;
         case "61":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 1;
                  break;
               case 2:
                  _loc4_ = 3;
                  break;
               case 3:
                  _loc4_ = 2;
            }
            break;
         case "70":
         case "71":
         case "80":
         case "81":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 2;
                  break;
               case 2:
                  _loc4_ = 3;
                  break;
               case 3:
                  _loc4_ = 1;
            }
            break;
         case "90":
         case "91":
            _loc4_ = _loc3_;
            break;
         case "100":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 3;
                  break;
               case 2:
                  _loc4_ = 2;
                  break;
               case 3:
                  _loc4_ = 1;
            }
            break;
         case "101":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 1;
                  break;
               case 2:
                  _loc4_ = 3;
                  break;
               case 3:
                  _loc4_ = 2;
            }
            break;
         case "110":
         case "111":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 2;
                  break;
               case 2:
                  _loc4_ = 3;
                  break;
               case 3:
                  _loc4_ = 1;
            }
            break;
         case "120":
         case "121":
            switch(_loc3_)
            {
               case 1:
                  _loc4_ = 1;
                  break loop0;
               case 2:
                  _loc4_ = 3;
                  break loop0;
               case 3:
                  _loc4_ = 2;
            }
      }
      if(!_loc4_)
      {
         _loc4_ = -1;
      }
      return _loc4_;
   }
   function applyBottomColor(§\n\x1d§)
   {
      var _loc3_ = ank.battlefield.datacenter["\x1e\x0e\x10"](this.getSpriteData(_loc2_));
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      var _loc4_ = this.getColorIndex(_loc3_.gfxFileName,3);
      if(_loc4_ == -1)
      {
         return undefined;
      }
      this.applyColor(_loc2_,_loc4_);
   }
   function applyBodyColor(§\n\x1d§)
   {
      var _loc3_ = ank.battlefield.datacenter["\x1e\x0e\x10"](this.getSpriteData(_loc2_));
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      var _loc4_ = this.getColorIndex(_loc3_.gfxFileName,2);
      if(_loc4_ == -1)
      {
         return undefined;
      }
      this.applyColor(_loc2_,_loc4_);
   }
   function applyHeadColor(§\n\x1d§)
   {
      var _loc3_ = ank.battlefield.datacenter["\x1e\x0e\x10"](this.getSpriteData(_loc2_));
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      var _loc4_ = this.getColorIndex(_loc3_.gfxFileName,1);
      if(_loc4_ == -1)
      {
         return undefined;
      }
      this.applyColor(_loc2_,_loc4_);
   }
   function applyAccessory(§\n\x1d§, §\x10§, §\x1e\x11\r§, §\n\x0b§, §\x19\x1d§)
   {
      if(_loc6_ == undefined)
      {
         _loc6_ = false;
      }
      var _loc7_ = this.getSpriteData(_loc2_);
      if(_loc7_ != undefined)
      {
         var _loc8_ = _loc7_.accessories[_loc3_].gfx;
         _loc2_.clip.removeMovieClip();
         if(_loc6_)
         {
            switch(_loc7_.direction)
            {
               case 3:
               case 4:
               case 7:
                  _loc2_._x = - _loc2_._x;
            }
         }
         if(_loc8_ != undefined)
         {
            if(_loc5_ != undefined)
            {
               _loc5_.gotoAndStop(!(_loc8_.length == 0 || _loc8_ == "_") ? 2 : 1);
            }
            if(!ank.battlefield.Constants.USE_STREAMING_FILES || ank.battlefield.Constants.STREAMING_METHOD == "compact")
            {
               _loc2_.attachMovie(_loc8_,"clip",10);
               if(_loc7_.accessories[_loc3_].frame != undefined)
               {
                  _loc2_.clip.gotoAndStop(_loc4_ + _loc7_.accessories[_loc3_].frame);
               }
               else
               {
                  _loc2_.clip.gotoAndStop(_loc4_);
               }
            }
            else
            {
               var _loc9_ = _loc8_.split("_");
               if(_loc9_[0] == undefined || (_global.isNaN(Number(_loc9_[0])) || (_loc9_[1] == undefined || _global.isNaN(Number(_loc9_[1])))))
               {
                  return undefined;
               }
               var _loc10_ = _loc2_.createEmptyMovieClip("clip",10);
               if(_loc7_.skin !== undefined)
               {
                  this._aFrameToGo[_loc10_] = _loc4_ + _loc7_.skin;
               }
               else
               {
                  this._aFrameToGo[_loc10_] = _loc4_;
               }
               this._mclLoader.loadClip(this._sAccessoriesPath + _loc9_.join("/") + ".swf",_loc10_);
            }
         }
      }
   }
   function applyAnim(§\n\x1d§, §\x1e\x14\x17§)
   {
      var _loc4_ = this.getSpriteData(_loc2_);
      if(_loc4_ != undefined)
      {
         if(_loc4_.bAnimLoop)
         {
            _loc4_.mc.saveLastAnimation(_loc4_.animation);
         }
         else
         {
            _loc4_.mc.setAnim(_loc3_);
         }
      }
   }
   function applyEnd(§\n\x1d§)
   {
      var _loc3_ = this.getSpriteData(_loc2_);
      if(_loc3_ != undefined)
      {
         if(!_loc3_.bAnimLoop)
         {
            _loc3_.sequencer.onActionEnd();
         }
      }
   }
   function applySprite(§\n\x1d§)
   {
      var _loc3_ = this.getSpriteData(_loc2_);
      switch(_loc3_.direction)
      {
         case 0:
         case 4:
            _loc2_.attachMovie(_loc3_.animation + "S","clip",1);
            break;
         case 1:
         case 3:
            _loc2_.attachMovie(_loc3_.animation + "R","clip",1);
            break;
         case 2:
            _loc2_.attachMovie(_loc3_.animation + "F","clip",1);
            break;
         case 5:
         case 7:
            _loc2_.attachMovie(_loc3_.animation + "L","clip",1);
            break;
         case 6:
            _loc2_.attachMovie(_loc3_.animation + "B","clip",1);
      }
   }
   function registerCarried(§\n\x1d§)
   {
      var _loc3_ = this.getSpriteData(_loc2_);
      _loc3_.mc.mcCarried = _loc2_;
   }
   function registerChevauchor(§\n\x1d§)
   {
      var _loc3_ = this.getSpriteData(_loc2_);
      _loc3_.mc.mcChevauchorPos = _loc2_;
      _loc3_.mc.updateChevauchorPosition();
   }
   function getSpriteData(§\n\x1d§)
   {
      var _loc3_ = _loc2_._target;
      for(var name in this._oSprites)
      {
         if(_loc3_.substring(0,name.length) == name)
         {
            if(_loc3_.charAt(name.length) != "/")
            {
               continue;
            }
            if(this._oSprites[name] != undefined)
            {
               return this._oSprites[name].data;
            }
         }
      }
   }
   function garbageCollector(§\x1e\t\x1c§)
   {
      for(var o in this._oSprites)
      {
         if(this._oSprites[o].mc._target == undefined)
         {
            delete this._oSprites[o];
         }
      }
   }
   function recursiveGotoAndStop(§\n\x1d§, §\x0e\x04§)
   {
      _loc2_.stop();
      _loc2_.gotoAndStop(_loc3_);
      for(var i in _loc2_)
      {
         if(_loc2_[i] instanceof MovieClip)
         {
            this.recursiveGotoAndStop(_loc2_[i],_loc3_);
         }
      }
   }
   function onLoadInit(§\n\x1d§)
   {
      this.recursiveGotoAndStop(_loc2_,this._aFrameToGo[_loc2_]);
      delete this._aFrameToGo[_loc2_];
   }
}
