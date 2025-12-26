class dofus.§\r\x14§.gapi.ui.CreateCharacter extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nRemainingTime;
   var _itCharacterName;
   var _mcMaleButton;
   var _mcFemaleButton;
   var _mcSpellButton;
   var _mcSpellButton2;
   var _mcHistoryButton;
   var _mcRandomName;
   var _mcRight;
   var _mcLeft;
   var _btnBack;
   var _btnValidate;
   var _csColors;
   var _csBreedSelection;
   var _lblTitle;
   var _lblCharacterColors;
   var _lblCharacterName;
   var _lblHistoryButton;
   var _lblSpellButton;
   var _oColors;
   var _nSex;
   var _svCharacter;
   var _nBreed;
   var _ldrClassIcon;
   var _lblClassName;
   var _txtClassDescription;
   var _txtShortClassDescription;
   var _nSavedColor;
   var onEnterFrame;
   static var CLASS_NAME = "CreateCharacter";
   static var NAME_GENERATION_DELAY = 500;
   var _nLastRegenerateTimer = 0;
   var _bLoaded = false;
   function CreateCharacter()
   {
      super();
   }
   function set remainingTime(§\x1e\x1e\n§)
   {
      this._nRemainingTime = _loc2_;
   }
   function set characterName(§\x1e\x0f\x15§)
   {
      if(this._itCharacterName.text != undefined)
      {
         this._itCharacterName.text = _loc2_;
      }
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.CreateCharacter.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.setupRestriction});
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.initComponent});
      this.addToQueue({object:this,method:this.selectRandomBreed});
      this.api.kernel.StreamingDisplayManager.onCharacterCreation();
      if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         this.getURL("JavaScript:WriteLog(\'CreateCharacter\')");
      }
   }
   function addListeners()
   {
      var ref = this;
      this._mcMaleButton.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcMaleButton.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcMaleButton.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcFemaleButton.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcFemaleButton.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcFemaleButton.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcSpellButton.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcSpellButton.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcSpellButton.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcSpellButton2.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcSpellButton2.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcSpellButton2.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcHistoryButton.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcHistoryButton.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcHistoryButton.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcRandomName.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcRandomName.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcRandomName.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcRight.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcRight.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcRight.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcLeft.onPress = function()
      {
         ref.click({target:this});
      };
      this._mcLeft.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcLeft.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._btnBack.addEventListener("click",this);
      this._btnValidate.addEventListener("click",this);
      this._itCharacterName.addEventListener("change",this);
      this._csColors.addEventListener("change",this);
      this._csColors.addEventListener("over",this);
      this._csColors.addEventListener("out",this);
      this._csBreedSelection.addEventListener("change",this);
   }
   function setupRestriction()
   {
      var _loc2_ = "";
      if(this.api.datacenter.Player.isAuthorized)
      {
         _loc2_ = "a-zA-Z\\-\\[\\]";
      }
      else
      {
         _loc2_ = "a-zA-Z\\-";
      }
      if(this.api.config.isStreaming)
      {
         _loc2_ += "0-9";
      }
      this._itCharacterName.restrict = _loc2_;
   }
   function initTexts()
   {
      this._lblTitle.text = this.api.lang.getText("CREATE_TITLE");
      this._lblCharacterColors.text = this.api.lang.getText("SPRITE_COLORS");
      this._lblCharacterName.text = this.api.lang.getText("CREATE_CHARACTER_NAME");
      this._btnBack.label = this.api.lang.getText("BACK");
      this._btnValidate.label = this.api.lang.getText("VALIDATE");
      this._lblHistoryButton.text = this.api.lang.getText("HISTORY_CLASS_WORD");
      this._lblSpellButton.text = this.api.lang.getText("SPELLS_SHORTCUT");
   }
   function initComponent()
   {
      this._oColors = {color1:-1,color2:-1,color3:-1};
      this._nSex = Math.round(Math.random());
      var _loc2_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < dofus.Constants.GUILD_ORDER.length)
      {
         if(!(this.api.config.isStreaming && dofus.Constants.GUILD_ORDER[_loc3_] == 12))
         {
            _loc2_[_loc3_] = dofus.Constants.BREEDS_SLIDER_PATH + dofus.Constants.GUILD_ORDER[_loc3_] + this._nSex + ".swf";
         }
         _loc3_ = _loc3_ + 1;
      }
      this._csBreedSelection.initialize(_loc2_);
      this._csBreedSelection.animation = true;
      this._csBreedSelection.animationSpeed = 3;
      this._svCharacter.zoom = 250;
      this._svCharacter.spriteAnims = ["StaticF","StaticR","StaticL","WalkF","RunF","Anim2R","Anim2L"];
      this._svCharacter.refreshDelay = 50;
      this._svCharacter.useSingleLoader = true;
   }
   function selectRandomBreed()
   {
      var _loc2_ = -1;
      while(_loc2_ == -1 || this.api.config.isStreaming && _loc2_ == 12)
      {
         _loc2_ = Math.round(Math.random() * (dofus.Constants.GUILD_ORDER.length - 1)) + 1;
      }
      this.setClass(_loc2_,this._nSex);
      this._bLoaded = true;
   }
   function setClass(§\x07\x01§, §\x1e\x1d\x0f§)
   {
      this._csColors.breed = _loc2_;
      this._csColors.sex = _loc3_;
      if(this._nBreed == _loc2_ && this._nSex == _loc3_)
      {
         return undefined;
      }
      this._svCharacter.spriteData = new ank.battlefield.datacenter["\x1e\x0e\x10"]("viewer",ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc2_ + _loc3_ + ".swf",undefined,5);
      this._ldrClassIcon.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + _loc2_ + ".swf";
      var _loc4_ = 0;
      while(_loc4_ < dofus.Constants.GUILD_ORDER.length)
      {
         if(!(this.api.config.isStreaming && dofus.Constants.GUILD_ORDER[_loc4_] == 12))
         {
            if(dofus.Constants.GUILD_ORDER[_loc4_] == _loc2_)
            {
               this._csBreedSelection.currentIndex = _loc4_;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      if(this._nSex != _loc3_)
      {
         var _loc5_ = new Array();
         var _loc6_ = 0;
         while(_loc6_ < dofus.Constants.GUILD_ORDER.length)
         {
            if(!(this.api.config.isStreaming && dofus.Constants.GUILD_ORDER[_loc6_] == 12))
            {
               _loc5_[_loc6_] = dofus.Constants.BREEDS_SLIDER_PATH + dofus.Constants.GUILD_ORDER[_loc6_] + _loc3_ + ".swf";
            }
            _loc6_ = _loc6_ + 1;
         }
         this._csBreedSelection.clipsList = _loc5_;
         this._csBreedSelection.updateColor(1,this._oColors.color1);
         this._csBreedSelection.updateColor(2,this._oColors.color2);
         this._csBreedSelection.updateColor(3,this._oColors.color3);
      }
      var _loc7_ = this.api.lang.getClassText(_loc2_);
      this._lblClassName.text = _loc7_.ln;
      this._txtClassDescription.text = "<font color=\'#514A3C\'>" + _loc7_.d + "</font>";
      this._txtShortClassDescription.text = "<font color=\'#514A3C\' size=\'14\'><b>" + _loc7_.sd + "</b></font>";
      this._svCharacter.setColors(this._oColors);
      if(dofus.Constants.EPISODIC_GUILD[_loc2_ - 1] > this.api.datacenter.Basics.aks_current_regional_version)
      {
         this._btnValidate.label = this.api.lang.getText("COMING_SOON_SHORT");
      }
      else
      {
         this._btnValidate.label = this.api.lang.getText("VALIDATE");
      }
      this._nBreed = _loc2_;
      this._nSex = _loc3_;
   }
   function showColorPosition(nIndex)
   {
      var bWhite = true;
      this._nSavedColor = this._svCharacter.getColor(nIndex);
      this.onEnterFrame = function()
      {
         this._svCharacter.setColor(nIndex,!(bWhite = !bWhite) ? 16746632 : 16733525);
      };
   }
   function hideColorPosition(§\x04\n§)
   {
      delete this.onEnterFrame;
      this._svCharacter.setColor(_loc2_,this._nSavedColor);
   }
   function validateCreation()
   {
      var _loc2_ = this._itCharacterName.text;
      if(_loc2_.length == 0 || _loc2_ == undefined)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("NEED_CHARACTER_NAME"),"ERROR_BOX",{name:"CREATENONAME"});
         return undefined;
      }
      if(_loc2_.length > 20)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("LONG_CHARACTER_NAME",[_loc2_,20]),"ERROR_BOX");
         return undefined;
      }
      if(this.api.lang.getConfigText("CHAR_NAME_FILTER") && !this.api.datacenter.Player.isAuthorized)
      {
         var _loc3_ = new dofus["\x1e\n\x07"]["\b\x16"]["\b\x17"](_loc2_);
         var _loc4_ = new dofus["\x1e\n\x07"]["\b\x16"]["\x1e\x15\x01"].NameCheckerCharacterNameRules();
         var _loc5_ = _loc3_.isValidAgainstWithDetails(_loc4_);
         if(!_loc5_.IS_SUCCESS)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("INVALID_CHARACTER_NAME") + "\r\n" + _loc5_.toString("\r\n"),"ERROR_BOX");
            return undefined;
         }
      }
      if(dofus.Constants.EPISODIC_GUILD[this._nBreed - 1] > this.api.datacenter.Basics.aks_current_regional_version)
      {
         var _loc6_ = this.api.lang.getClassText(this._nBreed).sn;
         this.api.kernel.showMessage(undefined,this.api.lang.getText("COMING_SOON_GUILD",[_loc6_]),"ERROR_BOX");
         return undefined;
      }
      if(dofus.Constants.PAYING_GUILD[this._nBreed - 1] && this._nRemainingTime <= 0)
      {
         var _loc7_ = this.api.lang.getClassText(this._nBreed).sn;
         this.api.kernel.showMessage(undefined,this.api.lang.getText("PAYING_GUILD",[_loc7_]),"ERROR_BOX");
         return undefined;
      }
      this.api.datacenter.Basics.hasCreatedCharacter = true;
      if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         this.getURL("JavaScript:WriteLog(\'addCharacter;" + _loc2_ + "\')");
      }
      this.api.network.Account.addCharacter(_loc2_,this._nBreed,this._oColors.color1,this._oColors.color2,this._oColors.color3,this._nSex);
   }
   function setColors(§\x1e\x19\x1c§)
   {
      this._oColors = _loc2_;
      this._svCharacter.setColors(this._oColors);
      this._csBreedSelection.updateColor(1,_loc2_.color1);
      this._csBreedSelection.updateColor(2,_loc2_.color2);
      this._csBreedSelection.updateColor(3,_loc2_.color3);
   }
   function hideGenerateRandomName()
   {
      this._mcRandomName._visible = false;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._mcRight:
            this._csBreedSelection.slide(1);
            break;
         case this._mcLeft:
            this._csBreedSelection.slide(-1);
            break;
         case this._mcMaleButton:
            this.setClass(this._nBreed,0);
            break;
         case this._mcFemaleButton:
            this.setClass(this._nBreed,1);
            break;
         case this._mcSpellButton2:
         case this._mcSpellButton:
            this.api.ui.loadUIComponent("SpellViewerOnCreate","SpellViewerOnCreate",{breed:this._nBreed});
            break;
         case this._mcHistoryButton:
            this.api.ui.loadUIComponent("HistoryViewerOnCreate","HistoryViewerOnCreate",{breed:this._nBreed});
            break;
         case this._btnValidate:
            this.validateCreation();
            break;
         case this._btnBack:
            if(this.api.datacenter.Basics.createCharacter)
            {
               this.api.kernel.changeServer(true);
            }
            else
            {
               this.api.datacenter.Basics.ignoreCreateCharacter = true;
               this.api.network.Account.getCharactersForced();
            }
            break;
         case this._mcRandomName:
            if(this._nLastRegenerateTimer + dofus["\r\x14"].gapi.ui.CreateCharacter.NAME_GENERATION_DELAY < getTimer())
            {
               this.api.network.Account.getRandomCharacterName();
               this._nLastRegenerateTimer = getTimer();
               break;
            }
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._csColors:
            this.showColorPosition(_loc2_.index);
            break;
         case this._mcRandomName:
            this.gapi.showTooltip(this.api.lang.getText("RANDOM_NICKNAME"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcMaleButton:
            this.gapi.showTooltip(this.api.lang.getText("ANIMAL_MEN"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcFemaleButton:
            this.gapi.showTooltip(this.api.lang.getText("ANIMAL_WOMEN"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcSpellButton:
            this.gapi.showTooltip(this.api.lang.getText("CLASS_SPELLS"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcRight:
            this.gapi.showTooltip(this.api.lang.getText("NEXT_WORD"),_root._xmouse,_root._ymouse - 20);
            break;
         case this._mcLeft:
            this.gapi.showTooltip(this.api.lang.getText("PREVIOUS_WORD"),_root._xmouse,_root._ymouse - 20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target) !== this._csColors)
      {
         this.gapi.hideTooltip();
      }
      else
      {
         this.hideColorPosition(_loc2_.index);
      }
   }
   function change(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._csColors:
            this.setColors(_loc2_.value);
            break;
         case this._csBreedSelection:
            if(this._bLoaded)
            {
               this.setClass(dofus.Constants.GUILD_ORDER[_loc2_.value],this._nSex);
            }
            break;
         case this._itCharacterName:
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
               break;
            }
      }
   }
}
