class dofus.§\r\x14§.gapi.controls.ClassCustomize extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nClassID;
   var _nSex;
   var _itCharacterName;
   var _mcRegenerateNickName;
   var _oColors;
   var _oBakColors;
   var _ldrSprite;
   var _cpColorPicker;
   var _btnNextAnim;
   var _btnPreviousAnim;
   var _btnReset1;
   var _btnReset2;
   var _btnReset3;
   var _btnColor1;
   var _btnColor2;
   var _btnColor3;
   var _lblCharacterColors;
   var _lblCharacterName;
   var _nSelectedColorIndex;
   var onEnterFrame;
   var dispatchEvent;
   static var CLASS_NAME = "ClassCustomize";
   static var SPRITE_ANIMS = ["StaticF","StaticR","StaticL","WalkF","RunF","Anim2R","Anim2L"];
   static var NAME_GENERATION_DELAY = 500;
   var _nSpriteAnimIndex = 0;
   var _nLastRegenerateTimer = 0;
   function ClassCustomize()
   {
      super();
   }
   function set classID(§\x07\x01§)
   {
      this._nClassID = _loc2_;
      this.addToQueue({object:this,method:this.layoutContent});
   }
   function set sex(§\x1e\x1d\x0f§)
   {
      this._nSex = _loc2_;
      this.addToQueue({object:this,method:this.layoutContent});
   }
   function set colors(§\f§)
   {
      this.addToQueue({object:this,method:this.applyColor,params:[_loc2_[0],1]});
      this.addToQueue({object:this,method:this.applyColor,params:[_loc2_[1],2]});
      this.addToQueue({object:this,method:this.applyColor,params:[_loc2_[2],3]});
      this.addToQueue({object:this,method:this.updateSprite});
   }
   function set name(sName)
   {
      this.addToQueue({object:this,method:function()
      {
         if(this._itCharacterName.text != undefined)
         {
            this._itCharacterName.text = sName;
            this._itCharacterName.setFocus();
            Selection.setSelection(sName.length,sName.length);
         }
      }});
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.ClassCustomize.CLASS_NAME);
      this._mcRegenerateNickName._visible = false;
   }
   function createChildren()
   {
      this._visible = false;
      this._oColors = {color1:-1,color2:-1,color3:-1};
      this._oBakColors = {color1:-1,color2:-1,color3:-1};
      this.addToQueue({object:this,method:function()
      {
         this.setupRestriction();
      }});
      this.addToQueue({object:this,method:this.checkFeaturesAvailability});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
      this.api.colors.addSprite(this._ldrSprite,this._oColors);
      this.addToQueue({object:this,method:this.setColorIndex,params:[1]});
      this.addToQueue({object:this,method:function()
      {
         this._itCharacterName.setFocus();
      }});
      this.addToQueue({object:this,method:function()
      {
         this._visible = true;
      }});
   }
   function setupRestriction()
   {
      if(this.api.datacenter.Player.isAuthorized)
      {
         this._itCharacterName.restrict = "a-zA-Z\\-\\[\\]";
      }
      else
      {
         this._itCharacterName.restrict = "a-zA-Z\\-";
      }
   }
   function checkFeaturesAvailability()
   {
      if(this.api.lang.getConfigText("GENERATE_RANDOM_NAME") && this.api.datacenter.Basics.aks_can_generate_names !== false)
      {
         this._mcRegenerateNickName._visible = true;
      }
   }
   function addListeners()
   {
      this._cpColorPicker.addEventListener("change",this);
      this._ldrSprite.addEventListener("initialization",this);
      this._btnNextAnim.addEventListener("click",this);
      this._btnPreviousAnim.addEventListener("click",this);
      this._btnReset1.addEventListener("click",this);
      this._btnReset2.addEventListener("click",this);
      this._btnReset3.addEventListener("click",this);
      this._btnColor1.addEventListener("click",this);
      this._btnColor2.addEventListener("click",this);
      this._btnColor3.addEventListener("click",this);
      this._btnColor1.addEventListener("over",this);
      this._btnColor2.addEventListener("over",this);
      this._btnColor3.addEventListener("over",this);
      this._btnColor1.addEventListener("out",this);
      this._btnColor2.addEventListener("out",this);
      this._btnColor3.addEventListener("out",this);
      this._itCharacterName.addEventListener("change",this);
      var ref = this;
      this._mcRegenerateNickName.onRelease = function()
      {
         ref.click({target:this});
      };
      this._mcRegenerateNickName.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcRegenerateNickName.onRollOut = function()
      {
         ref.out({target:this});
      };
   }
   function initTexts()
   {
      this._lblCharacterColors.text = this.api.lang.getText("SPRITE_COLORS");
      this._lblCharacterName.text = this.api.lang.getText("CREATE_CHARACTER_NAME");
   }
   function layoutContent()
   {
      if(this._nClassID == undefined || this._nSex == undefined)
      {
         return undefined;
      }
      this._ldrSprite.contentPath = dofus.Constants.CLIPS_PERSOS_PATH + this._nClassID + this._nSex + ".swf";
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
      this.updateSprite();
   }
   function setColorIndex(§\x04\n§)
   {
      var _loc3_ = this["_btnColor" + this._nSelectedColorIndex];
      var _loc4_ = this["_btnColor" + _loc2_];
      _loc3_.selected = false;
      _loc4_.selected = true;
      this._nSelectedColorIndex = _loc2_;
   }
   function showColorPosition(nIndex)
   {
      var bWhite = true;
      this.onEnterFrame = function()
      {
         this._oColors["color" + nIndex] = !bWhite ? 16746632 : 16733525;
         this.updateSprite();
         bWhite = !bWhite;
      };
   }
   function hideColorPosition(§\x04\n§)
   {
      delete this.onEnterFrame;
      this._oColors.color1 = this._oBakColors.color1;
      this._oColors.color2 = this._oBakColors.color2;
      this._oColors.color3 = this._oBakColors.color3;
      this.updateSprite();
   }
   function updateSprite()
   {
      var _loc2_ = this._ldrSprite.content;
      _loc2_.mcAnim.removeMovieClip();
      _loc2_.attachMovie(dofus["\r\x14"].gapi.controls.ClassCustomize.SPRITE_ANIMS[this._nSpriteAnimIndex],"mcAnim",10);
      _loc2_._xscale = _loc2_._yscale = 200;
   }
   function hideGenerateRandomName()
   {
      this._mcRegenerateNickName._visible = false;
   }
   function change(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_itCharacterName":
            var _loc3_ = this._itCharacterName.text;
            if(!this.api.datacenter.Player.isAuthorized)
            {
               _loc3_ = _loc3_.substr(0,1).toUpperCase() + _loc3_.substr(1);
               var _loc4_ = _loc3_.substr(0,1);
               var _loc5_ = 1;
               while(_loc5_ < _loc3_.length)
               {
                  if(_loc3_.substr(_loc5_ - 1,1) != "-")
                  {
                     _loc4_ += _loc3_.substr(_loc5_,1).toLowerCase();
                  }
                  else
                  {
                     _loc4_ += _loc3_.substr(_loc5_,1);
                  }
                  _loc5_ = _loc5_ + 1;
               }
               this._itCharacterName.removeEventListener("change",this);
               this._itCharacterName.text = _loc4_;
               this._itCharacterName.addEventListener("change",this);
            }
            this.dispatchEvent({type:"nameChange",value:this._itCharacterName.text});
            break;
         case "_cpColorPicker":
            this.applyColor(_loc2_.value);
            this.dispatchEvent({type:"colorsChange",value:this._oColors});
      }
   }
   function initialization(§\x1e\x19\x0e§)
   {
      this.updateSprite();
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnNextAnim":
            this._nSpriteAnimIndex++;
            if(this._nSpriteAnimIndex >= dofus["\r\x14"].gapi.controls.ClassCustomize.SPRITE_ANIMS.length)
            {
               this._nSpriteAnimIndex = 0;
            }
            this.updateSprite();
            break;
         case "_btnPreviousAnim":
            this._nSpriteAnimIndex--;
            if(this._nSpriteAnimIndex < 0)
            {
               this._nSpriteAnimIndex = dofus["\r\x14"].gapi.controls.ClassCustomize.SPRITE_ANIMS.length - 1;
            }
            this.updateSprite();
            break;
         case "_btnColor1":
         case "_btnColor2":
         case "_btnColor3":
            var _loc3_ = Number(_loc2_.target._name.substr(9));
            var _loc4_ = this._oBakColors["color" + _loc3_];
            if(_loc4_ != -1)
            {
               this._cpColorPicker.setColor(_loc4_);
            }
            this.setColorIndex(_loc3_);
            break;
         case "_btnReset1":
         case "_btnReset2":
         case "_btnReset3":
            var _loc5_ = Number(_loc2_.target._name.substr(9));
            this.applyColor(-1,_loc5_);
            this.dispatchEvent({type:"colorsChange",value:this._oColors});
            break;
         case "_mcRegenerateNickName":
            if(this._nLastRegenerateTimer + dofus["\r\x14"].gapi.controls.ClassCustomize.NAME_GENERATION_DELAY < getTimer())
            {
               this.api.network.Account.getRandomCharacterName();
               this._nLastRegenerateTimer = dofus["\r\x14"].gapi.controls.ClassCustomize.NAME_GENERATION_DELAY;
               break;
            }
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnColor1":
         case "_btnColor2":
         case "_btnColor3":
            var _loc3_ = Number(_loc2_.target._name.substr(9));
            this.showColorPosition(_loc3_);
            break;
         case "_mcRegenerateNickName":
            var _loc4_ = {x:this._mcRegenerateNickName._x,y:this._mcRegenerateNickName._y};
            this._mcRegenerateNickName.localToGlobal(_loc4_);
            this.gapi.showTooltip(this.api.lang.getText("RANDOM_NICKNAME"),_loc4_.x + this._x,_loc4_.y + this._y - 20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnColor1":
         case "_btnColor2":
         case "_btnColor3":
            this.hideColorPosition();
            break;
         default:
            this.gapi.hideTooltip();
      }
   }
}
