class dofus.§\r\x14§.gapi.controls.ColorSelector extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nBreed;
   var _nSex;
   var _oColors;
   var _oBakColors;
   var _btnColor1;
   var _btnColor2;
   var _btnColor3;
   var _cpColorPicker;
   var _btnReset;
   var _mcRandomColor1;
   var _mcRandomColor2;
   var _mcRandomColor3;
   var _mcRandomAll;
   var dispatchEvent;
   static var CLASS_NAME = "ColorSelector";
   static var MAXIMUM_COLOR_INDEX = 3;
   var _nSelectedColorIndex = 1;
   static var HEX_CHARS = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];
   function ColorSelector()
   {
      super();
   }
   function set colors(§\f§)
   {
      this.addToQueue({object:this,method:this.applyColor,params:[_loc2_[0],1]});
      this.addToQueue({object:this,method:this.applyColor,params:[_loc2_[1],2]});
      this.addToQueue({object:this,method:this.applyColor,params:[_loc2_[2],3]});
   }
   function set breed(§\b\x02§)
   {
      this._nBreed = _loc2_;
   }
   function set sex(§\x1e\x1d\x0f§)
   {
      this._nSex = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.ColorSelector.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.addListeners});
   }
   function initData()
   {
      this._oColors = {color1:-1,color2:-1,color3:-1};
      this._oBakColors = {color1:-1,color2:-1,color3:-1};
   }
   function addListeners()
   {
      this._btnColor1.addEventListener("click",this);
      this._btnColor2.addEventListener("click",this);
      this._btnColor3.addEventListener("click",this);
      this._btnColor1.addEventListener("over",this);
      this._btnColor2.addEventListener("over",this);
      this._btnColor3.addEventListener("over",this);
      this._btnColor1.addEventListener("out",this);
      this._btnColor2.addEventListener("out",this);
      this._btnColor3.addEventListener("out",this);
      this._cpColorPicker.addEventListener("change",this);
      this._btnReset.addEventListener("click",this);
      this._btnReset.addEventListener("over",this);
      this._btnReset.addEventListener("out",this);
      var ref = this;
      this._mcRandomColor1.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcRandomColor2.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcRandomColor3.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcRandomAll.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcRandomColor1.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcRandomColor2.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcRandomColor3.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcRandomAll.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcRandomColor1.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcRandomColor2.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcRandomColor3.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcRandomAll.onRollOut = function()
      {
         ref.out({target:this});
      };
   }
   function setColorIndex(§\x04\n§)
   {
      var _loc3_ = this["_btnColor" + this._nSelectedColorIndex];
      var _loc4_ = this["_btnColor" + _loc2_];
      _loc3_.selected = false;
      _loc4_.selected = true;
      this._nSelectedColorIndex = _loc2_;
   }
   function applyColor(§\x06\x1d§, §\x04\n§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = this._nSelectedColorIndex;
      }
      var _loc4_ = {ColoredButton:{bgcolor:(_loc2_ != -1 ? _loc2_ : 16711680),highlightcolor:(_loc2_ != -1 ? _loc2_ : 16777215),bgdowncolor:(_loc2_ != -1 ? _loc2_ : 16711680),highlightdowncolor:(_loc2_ != -1 ? _loc2_ : 16777215)}};
      ank.gapi.styles["\x1e\f\b"].loadStylePackage(_loc4_);
      this["_btnColor" + _loc3_].styleName = "ColoredButton";
      this._oColors["color" + _loc3_] = _loc2_;
      this._oBakColors["color" + _loc3_] = _loc2_;
   }
   function selectColor(§\x04\n§)
   {
      var _loc3_ = this._oBakColors["color" + _loc2_];
      if(_loc3_ != -1)
      {
         this._cpColorPicker.setColor(_loc3_);
      }
      this.setColorIndex(_loc2_);
   }
   static function d2h(§\x11\x10§)
   {
      if(_loc2_ > 255)
      {
         _loc2_ = 255;
      }
      return dofus["\r\x14"].gapi.controls.ColorSelector.HEX_CHARS[Math.floor(_loc2_ / 16)] + dofus["\r\x14"].gapi.controls.ColorSelector.HEX_CHARS[_loc2_ % 16];
   }
   function displayColorCode(§\x04\n§)
   {
      this.selectColor(_loc2_);
      var _loc3_ = (this._oColors["color" + _loc2_] & 0xFF0000) >> 16;
      var _loc4_ = (this._oColors["color" + _loc2_] & 0xFF00) >> 8;
      var _loc5_ = this._oColors["color" + _loc2_] & 0xFF;
      var _loc6_ = dofus["\r\x14"].gapi.controls.ColorSelector.d2h(_loc3_) + dofus["\r\x14"].gapi.controls.ColorSelector.d2h(_loc4_) + dofus["\r\x14"].gapi.controls.ColorSelector.d2h(_loc5_);
      if(this._oColors["color" + _loc2_] == undefined || this._oColors["color" + _loc2_] == -1)
      {
         _loc6_ = "";
      }
      var _loc7_ = this.gapi.loadUIComponent("PopupHexa","PopupHexa",{value:_loc6_,params:{targetType:"colorCode",colorIndex:_loc2_}});
      _loc7_.addEventListener("validate",this);
   }
   function setColor(§\x04\n§, §\x1e\x1b\n§)
   {
      this.setColorIndex(_loc2_);
      this.change({target:this._cpColorPicker,value:_loc3_});
      this.click({target:this["_btnColor" + _loc2_]});
   }
   function hueVariation(§\x06\x1d§, §\x1e\x1b\t§, §\x17\r§)
   {
      var _loc5_ = this.rgb2hsl(_loc2_);
      if(_loc5_.h < 0.5 && !_loc4_)
      {
         _loc3_ = - _loc3_;
      }
      _loc5_.h += _loc3_;
      if(_loc5_.h > 1)
      {
         _loc5_.h--;
      }
      if(_loc5_.h < 0)
      {
         _loc5_.h++;
      }
      return this.hsl2rgb(_loc5_.h,_loc5_.s,_loc5_.l);
   }
   function lightVariation(§\x06\x1d§, §\x1e\x1b\t§)
   {
      var _loc4_ = this.rgb2hsl(_loc2_);
      _loc4_.l += _loc3_;
      if(_loc4_.l > 1)
      {
         _loc4_.l = 1;
      }
      if(_loc4_.l < 0)
      {
         _loc4_.l = 0;
      }
      return this.hsl2rgb(_loc4_.h,_loc4_.s,_loc4_.l);
   }
   function complementaryColor(§\x06\x1d§)
   {
      var _loc3_ = this.rgb2hsl(_loc2_);
      var _loc4_ = _loc3_.h + 0.5;
      if(_loc4_ > 1)
      {
         _loc4_ = _loc4_ - 1;
      }
      return this.hsl2rgb(_loc4_,_loc3_.s,_loc3_.l);
   }
   function hsl2rgb(§\r\n§, §\x1e\x14\x1c§, §\x0b\x1d§)
   {
      if(_loc3_ == 0)
      {
         var _loc5_ = _loc4_ * 255;
         var _loc6_ = _loc4_ * 255;
         var _loc7_ = _loc4_ * 255;
      }
      else
      {
         if(_loc4_ < 0.5)
         {
            var _loc8_ = _loc4_ * (1 + _loc3_);
         }
         else
         {
            _loc8_ = _loc4_ + _loc3_ - _loc3_ * _loc4_;
         }
         var _loc9_ = 2 * _loc4_ - _loc8_;
         _loc5_ = 255 * this.h2rgb(_loc9_,_loc8_,_loc2_ + 1 / 3);
         _loc6_ = 255 * this.h2rgb(_loc9_,_loc8_,_loc2_);
         _loc7_ = 255 * this.h2rgb(_loc9_,_loc8_,_loc2_ - 1 / 3);
      }
      return Number("0x" + dofus["\r\x14"].gapi.controls.ColorSelector.d2h(Math.round(_loc5_)) + dofus["\r\x14"].gapi.controls.ColorSelector.d2h(Math.round(_loc6_)) + dofus["\r\x14"].gapi.controls.ColorSelector.d2h(Math.round(_loc7_)));
   }
   function rgb2hsl(§\x06\x1d§)
   {
      var _loc3_ = ((_loc2_ & 0xFF0000) >> 16) / 255;
      var _loc4_ = ((_loc2_ & 0xFF00) >> 8) / 255;
      var _loc5_ = (_loc2_ & 0xFF) / 255;
      var _loc6_ = this.min(_loc3_,_loc4_,_loc5_);
      var _loc7_ = this.max(_loc3_,_loc4_,_loc5_);
      var _loc8_ = _loc7_ - _loc6_;
      var _loc9_ = (_loc7_ + _loc6_) / 2;
      if(_loc8_ == 0)
      {
         var _loc10_ = 0;
         var _loc11_ = 0;
      }
      else
      {
         if(_loc9_ < 0.5)
         {
            _loc11_ = _loc8_ / (_loc7_ + _loc6_);
         }
         else
         {
            _loc11_ = _loc8_ / (2 - _loc7_ - _loc6_);
         }
         var _loc12_ = ((_loc7_ - _loc3_) / 6 + _loc8_ / 2) / _loc8_;
         var _loc13_ = ((_loc7_ - _loc4_) / 6 + _loc8_ / 2) / _loc8_;
         var _loc14_ = ((_loc7_ - _loc5_) / 6 + _loc8_ / 2) / _loc8_;
         if(_loc3_ == _loc7_)
         {
            _loc10_ = _loc14_ - _loc13_;
         }
         else if(_loc4_ == _loc7_)
         {
            _loc10_ = 1 / 3 + _loc12_ - _loc14_;
         }
         else if(_loc5_ == _loc7_)
         {
            _loc10_ = 2 / 3 + _loc13_ - _loc12_;
         }
         if(_loc10_ < 0)
         {
            _loc10_ = _loc10_ + 1;
         }
         if(_loc10_ > 1)
         {
            _loc10_ = _loc10_ - 1;
         }
      }
      return {h:_loc10_,s:_loc11_,l:_loc9_};
   }
   function h2rgb(§\x1e\n\x05§, §\x1e\n\x04§, §\r\n§)
   {
      if(_loc4_ < 0)
      {
         _loc4_ = _loc4_ + 1;
      }
      if(_loc4_ > 1)
      {
         _loc4_ = _loc4_ - 1;
      }
      if(6 * _loc4_ < 1)
      {
         return _loc2_ + (_loc3_ - _loc2_) * 6 * _loc4_;
      }
      if(2 * _loc4_ < 1)
      {
         return _loc3_;
      }
      if(3 * _loc4_ < 2)
      {
         return _loc2_ + (_loc3_ - _loc2_) * ((2 / 3 - _loc4_) * 6);
      }
      return _loc2_;
   }
   function min()
   {
      var _loc2_ = Number.POSITIVE_INFINITY;
      var _loc3_ = 0;
      while(_loc3_ < arguments.length)
      {
         if(!_global.isNaN(Number(arguments[_loc3_])) && _loc2_ > Number(arguments[_loc3_]))
         {
            _loc2_ = Number(arguments[_loc3_]);
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
   function max()
   {
      var _loc2_ = Number.NEGATIVE_INFINITY;
      var _loc3_ = 0;
      while(_loc3_ < arguments.length)
      {
         if(!_global.isNaN(Number(arguments[_loc3_])) && _loc2_ < Number(arguments[_loc3_]))
         {
            _loc2_ = Number(arguments[_loc3_]);
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
   function isSkin(§\x04\n§)
   {
      return dofus.Constants.BREED_SKIN_INDEXES[this._nSex][this._nBreed - 1] == _loc2_;
   }
   function randomSkin()
   {
      return this.lightVariation(dofus.Constants.BREED_SKIN_BASE_COLOR[this._nSex][this._nBreed - 1],Math.random() * 0.2 * (Math.random() <= 0.5 ? -1 : 1));
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnColor1:
         case this._btnColor2:
         case this._btnColor3:
            var _loc3_ = Number(_loc2_.target._name.substr(9));
            if(Key.isDown(Key.SHIFT))
            {
               this.displayColorCode(_loc3_);
            }
            else if(Key.isDown(Key.CONTROL))
            {
               this.applyColor(-1,_loc3_);
            }
            else
            {
               this.selectColor(_loc3_);
            }
            break;
         case this._mcRandomColor1:
         case this._mcRandomColor2:
         case this._mcRandomColor3:
            var _loc4_ = Number(_loc2_.target._name.substr(14));
            this.setColor(_loc4_,Math.round(Math.random() * 16777215));
            break;
         case this._mcRandomAll:
            var _loc5_ = Math.floor(Math.random() * dofus["\r\x14"].gapi.controls.ColorSelector.MAXIMUM_COLOR_INDEX);
            var _loc6_ = Math.ceil(Math.random() * 16777215);
            this.setColor(_loc5_,!this.isSkin(_loc5_) ? _loc6_ : this.randomSkin());
            _loc5_ = _loc5_ + 1;
            if(_loc5_ > dofus["\r\x14"].gapi.controls.ColorSelector.MAXIMUM_COLOR_INDEX)
            {
               _loc5_ -= dofus["\r\x14"].gapi.controls.ColorSelector.MAXIMUM_COLOR_INDEX;
            }
            this.setColor(_loc5_,!this.isSkin(_loc5_) ? this.complementaryColor(_loc6_) : this.randomSkin());
            _loc5_ = _loc5_ + 1;
            if(_loc5_ > dofus["\r\x14"].gapi.controls.ColorSelector.MAXIMUM_COLOR_INDEX)
            {
               _loc5_ -= dofus["\r\x14"].gapi.controls.ColorSelector.MAXIMUM_COLOR_INDEX;
            }
            this.setColor(_loc5_,!this.isSkin(_loc5_) ? this.hueVariation(_loc6_,Math.random()) : this.randomSkin());
            break;
         case this._btnReset:
            var _loc7_ = 1;
            while(_loc7_ <= dofus["\r\x14"].gapi.controls.ColorSelector.MAXIMUM_COLOR_INDEX)
            {
               this.applyColor(-1,_loc7_);
               _loc7_ = _loc7_ + 1;
            }
            this.dispatchEvent({type:"change",value:this._oColors});
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnColor1:
         case this._btnColor2:
         case this._btnColor3:
            var _loc3_ = Number(_loc2_.target._name.substr(9));
            this.dispatchEvent({type:"over",index:_loc3_});
            break;
         case this._btnReset:
            this.gapi.showTooltip(this.api.lang.getText("REINIT_WORD"),_loc2_.target,-20);
            break;
         case this._mcRandomColor1:
         case this._mcRandomColor2:
         case this._mcRandomColor3:
            this.gapi.showTooltip(this.api.lang.getText("RANDOM_COLOR"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcRandomAll:
            this.gapi.showTooltip(this.api.lang.getText("RANDOM_ALL_COLORS"),_root._xmouse,_root._ymouse - 20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._btnColor1:
         case this._btnColor2:
         case this._btnColor3:
            var _loc3_ = Number(_loc2_.target._name.substr(9));
            this.dispatchEvent({type:"out",index:_loc3_});
            break;
         default:
            this.gapi.hideTooltip();
      }
   }
   function change(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) === this._cpColorPicker)
      {
         this.applyColor(_loc2_.value);
         this.dispatchEvent({type:"change",value:this._oColors});
      }
   }
   function validate(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.params.targetType) === "colorCode")
      {
         if(!(_global.isNaN(_loc2_.value) || (_loc2_.value > 16777215 || _loc2_.value == undefined)))
         {
            this.setColor(_loc2_.params.colorIndex,_loc2_.value);
         }
      }
   }
}
