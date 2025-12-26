class ank.gapi.core.§\x1e\n\f§ extends ank.§\x1e\n\x07§.§\x1e\x15\x11§
{
   var createChildren;
   var draw;
   var arrange;
   var _mcGAPI;
   var _sClassName;
   var setEnabled;
   var __width;
   var __height;
   var _oParams;
   var boundingBox_mc;
   var border_mc;
   static var BORDER_TICKNESS = 1;
   static var BORDER_ALPHA = 50;
   var _bInitialized = false;
   var _sStyleName = "default";
   var _bEnabled = true;
   function §\x1e\n\f§()
   {
      super();
      this.init();
      this.createChildren();
      this.draw();
      this.arrange();
      this.size();
      this._bInitialized = true;
   }
   function set gapi(§\n\x16§)
   {
      this._mcGAPI = _loc2_;
   }
   function get gapi()
   {
      if(this._mcGAPI == undefined)
      {
         return this._parent.gapi;
      }
      return this._mcGAPI;
   }
   function get className()
   {
      return this._sClassName;
   }
   function set enabled(§\x1a\r§)
   {
      this._bEnabled = _loc2_;
      this.addToQueue({object:this,method:this.setEnabled});
   }
   function get enabled()
   {
      return this._bEnabled;
   }
   function set styleName(§\x1e\r\x07§)
   {
      this._sStyleName = _loc2_;
      if(this._bInitialized && (_loc2_ != "none" && _loc2_ != undefined))
      {
         this.draw();
      }
   }
   function get styleName()
   {
      var _loc2_ = this._sStyleName;
      if(_loc2_.length == 0 || (_loc2_ == undefined || _loc2_ == "default"))
      {
         var _loc3_ = this._parent;
         while(!(_loc3_ instanceof ank.gapi.core["\x1e\n\f"]) && _loc3_ != undefined)
         {
            _loc3_ = _loc3_._parent;
         }
         _loc2_ = _loc3_.styleName;
      }
      if(_loc2_ == undefined)
      {
         _loc2_ = this._sClassName;
      }
      return _loc2_;
   }
   function set width(§\x1e\x1b\x02§)
   {
      this.setSize(_loc2_,null);
   }
   function get width()
   {
      return this.__width;
   }
   function set height(§\x04\x17§)
   {
      this.setSize(null,_loc2_);
   }
   function get height()
   {
      return this.__height;
   }
   function set params(§\x1e\x18\x0b§)
   {
      this._oParams = _loc2_;
   }
   function get params()
   {
      return this._oParams;
   }
   function get initialized()
   {
      return this._bInitialized;
   }
   function setSize(§\x1e\t\x1b§, §\r\n§)
   {
      if(Math.abs(this._rotation) == 90)
      {
         var _loc4_ = _loc2_;
         _loc2_ = _loc3_;
         _loc3_ = _loc4_;
      }
      if(_loc2_ != undefined && _loc2_ != null)
      {
         this.__width = _loc2_;
      }
      if(_loc3_ != undefined && _loc3_ != null)
      {
         this.__height = _loc3_;
      }
      this.size();
   }
   function move(§\x1e\t\x14§, §\x1e\t\x0b§)
   {
      if(_loc2_ != undefined)
      {
         this._x = _loc2_;
      }
      if(_loc2_ != undefined)
      {
         this._y = _loc3_;
      }
   }
   function init(§\x1a\x18§, §\x1e\x13\x1a§)
   {
      this._sClassName = _loc3_;
      if(Math.ceil(this._rotation % 180) > 45)
      {
         this.__width = this._height;
         this.__height = this._width;
      }
      else
      {
         this.__width = this._width;
         this.__height = this._height;
      }
      if(!_loc2_)
      {
         this.boundingBox_mc._visible = false;
         this.boundingBox_mc._width = this.boundingBox_mc._height = 0;
      }
      eval("\t\x04").events["\x0f\x03"].initialize(this);
   }
   function getStyle()
   {
      return ank.gapi.styles["\x1e\f\b"].getStyle(this.styleName);
   }
   function size()
   {
      this.initScale();
   }
   function initScale()
   {
      this._xscale = this._yscale = 100;
   }
   function drawBorder()
   {
      if(this.border_mc == undefined)
      {
         this.createEmptyMovieClip("border_mc",0);
      }
      this.border_mc.clear();
      this.border_mc.lineStyle(ank.gapi.core["\x1e\n\f"].BORDER_TICKNESS,7305079,ank.gapi.core["\x1e\n\f"].BORDER_ALPHA);
      this.border_mc.lineTo(this.__width,0);
      this.border_mc.lineStyle(ank.gapi.core["\x1e\n\f"].BORDER_TICKNESS,9542041,ank.gapi.core["\x1e\n\f"].BORDER_ALPHA);
      this.border_mc.lineTo(this.__width,this.__height);
      this.border_mc.lineStyle(ank.gapi.core["\x1e\n\f"].BORDER_TICKNESS,14015965,ank.gapi.core["\x1e\n\f"].BORDER_ALPHA);
      this.border_mc.lineTo(0,this.__height);
      this.border_mc.lineStyle(ank.gapi.core["\x1e\n\f"].BORDER_TICKNESS,9542041,ank.gapi.core["\x1e\n\f"].BORDER_ALPHA);
      this.border_mc.lineTo(0,0);
      this.border_mc.moveTo(1,1);
      this.border_mc.lineStyle(ank.gapi.core["\x1e\n\f"].BORDER_TICKNESS,13290700,ank.gapi.core["\x1e\n\f"].BORDER_ALPHA);
      this.border_mc.lineTo(this.__width - 1,1);
      this.border_mc.lineStyle(ank.gapi.core["\x1e\n\f"].BORDER_TICKNESS,14015965,ank.gapi.core["\x1e\n\f"].BORDER_ALPHA);
      this.border_mc.lineTo(this.__width - 1,this.__height - 1);
      this.border_mc.lineStyle(ank.gapi.core["\x1e\n\f"].BORDER_TICKNESS,15658734,ank.gapi.core["\x1e\n\f"].BORDER_ALPHA);
      this.border_mc.lineTo(1,this.__height - 1);
      this.border_mc.lineStyle(ank.gapi.core["\x1e\n\f"].BORDER_TICKNESS,14015965,ank.gapi.core["\x1e\n\f"].BORDER_ALPHA);
      this.border_mc.lineTo(1,1);
   }
   function drawRoundRect(§\n\x1d§, §\x1e\t\x14§, §\x1e\t\x0b§, §\x1e\t\x1b§, §\r\n§, §\x1e\x15\x0f§, §\x13\x0f§, §\x1e\x07§, rot, §\r\x15§, §\x1e\x15\n§)
   {
      if(typeof _loc7_ == "object")
      {
         var _loc13_ = _loc7_.br;
         var _loc14_ = _loc7_.bl;
         var _loc15_ = _loc7_.tl;
         var _loc16_ = _loc7_.tr;
      }
      else
      {
         _loc13_ = _loc14_ = _loc15_ = _loc16_ = _loc7_;
      }
      if(_loc9_ == undefined)
      {
         _loc9_ = 100;
      }
      if(typeof _loc8_ == "object")
      {
         if(typeof _loc9_ != "object")
         {
            var _loc17_ = [_loc9_,_loc9_];
         }
         else
         {
            _loc17_ = _loc9_;
         }
         if(_loc12_ == undefined)
         {
            _loc12_ = [0,255];
         }
         var _loc18_ = _loc6_ * 0.7;
         if(typeof rot != "object")
         {
            var _loc19_ = {matrixType:"box",x:- _loc18_,y:_loc18_,w:_loc5_ * 2,h:_loc6_ * 4,r:rot * 0.0174532925199433};
         }
         else
         {
            _loc19_ = rot;
            if(_loc19_.w == undefined)
            {
               _loc19_.w = _loc5_;
            }
            if(_loc19_.h == undefined)
            {
               _loc19_.h = _loc6_;
            }
         }
         if(_loc11_ == "radial")
         {
            _loc2_.beginGradientFill("radial",_loc8_,_loc17_,_loc12_,_loc19_);
         }
         else
         {
            _loc2_.beginGradientFill("linear",_loc8_,_loc17_,_loc12_,_loc19_);
         }
      }
      else if(_loc8_ != undefined)
      {
         _loc2_.beginFill(_loc8_,_loc9_);
      }
      _loc7_ = _loc13_;
      if(_loc7_ != 0)
      {
         var _loc20_ = _loc7_ - _loc7_ * 0.707106781186547;
         var _loc21_ = _loc7_ - _loc7_ * 0.414213562373095;
         _loc2_.moveTo(_loc3_ + _loc5_,_loc4_ + _loc6_ - _loc7_);
         _loc2_.lineTo(_loc3_ + _loc5_,_loc4_ + _loc6_ - _loc7_);
         _loc2_.curveTo(_loc3_ + _loc5_,_loc4_ + _loc6_ - _loc21_,_loc3_ + _loc5_ - _loc20_,_loc4_ + _loc6_ - _loc20_);
         _loc2_.curveTo(_loc3_ + _loc5_ - _loc21_,_loc4_ + _loc6_,_loc3_ + _loc5_ - _loc7_,_loc4_ + _loc6_);
      }
      else
      {
         _loc2_.moveTo(_loc3_ + _loc5_,_loc4_ + _loc6_);
      }
      _loc7_ = _loc14_;
      if(_loc7_ != 0)
      {
         var _loc22_ = _loc7_ - _loc7_ * 0.707106781186547;
         var _loc23_ = _loc7_ - _loc7_ * 0.414213562373095;
         _loc2_.lineTo(_loc3_ + _loc7_,_loc4_ + _loc6_);
         _loc2_.curveTo(_loc3_ + _loc23_,_loc4_ + _loc6_,_loc3_ + _loc22_,_loc4_ + _loc6_ - _loc22_);
         _loc2_.curveTo(_loc3_,_loc4_ + _loc6_ - _loc23_,_loc3_,_loc4_ + _loc6_ - _loc7_);
      }
      else
      {
         _loc2_.lineTo(_loc3_,_loc4_ + _loc6_);
      }
      _loc7_ = _loc15_;
      if(_loc7_ != 0)
      {
         var _loc24_ = _loc7_ - _loc7_ * 0.707106781186547;
         var _loc25_ = _loc7_ - _loc7_ * 0.414213562373095;
         _loc2_.lineTo(_loc3_,_loc4_ + _loc7_);
         _loc2_.curveTo(_loc3_,_loc4_ + _loc25_,_loc3_ + _loc24_,_loc4_ + _loc24_);
         _loc2_.curveTo(_loc3_ + _loc25_,_loc4_,_loc3_ + _loc7_,_loc4_);
      }
      else
      {
         _loc2_.lineTo(_loc3_,_loc4_);
      }
      _loc7_ = _loc16_;
      if(_loc7_ != 0)
      {
         var _loc26_ = _loc7_ - _loc7_ * 0.707106781186547;
         var _loc27_ = _loc7_ - _loc7_ * 0.414213562373095;
         _loc2_.lineTo(_loc3_ + _loc5_ - _loc7_,_loc4_);
         _loc2_.curveTo(_loc3_ + _loc5_ - _loc27_,_loc4_,_loc3_ + _loc5_ - _loc26_,_loc4_ + _loc26_);
         _loc2_.curveTo(_loc3_ + _loc5_,_loc4_ + _loc27_,_loc3_ + _loc5_,_loc4_ + _loc7_);
         _loc2_.lineTo(_loc3_ + _loc5_,_loc4_ + _loc6_ - _loc7_);
      }
      else
      {
         _loc2_.lineTo(_loc3_ + _loc5_,_loc4_);
         _loc2_.lineTo(_loc3_ + _loc5_,_loc4_ + _loc6_);
      }
      if(_loc8_ != undefined)
      {
         _loc2_.endFill();
      }
   }
   function setMovieClipColor(§\n\x1d§, §\x06\x1d§)
   {
      var _loc4_ = new Color(_loc2_);
      _loc4_.setRGB(_loc3_);
      if(_loc3_ == -1)
      {
         _loc2_._alpha = 0;
      }
   }
   function setMovieClipTransform(§\n\x1d§, §\x1e\x17\r§)
   {
      var _loc4_ = new Color(_loc2_);
      _loc4_.setTransform(_loc3_);
   }
}
