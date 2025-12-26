class dofus.§\r\x14§.gapi.controls.ItemViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _bPrice;
   var _lblPrice;
   var _mcKamaSymbol;
   var _bDesc;
   var _txtDescription;
   var _oItem;
   var _lstInfos;
   var _mcTitle;
   var _lblLevel;
   var _btnTabCharacteristics;
   var _pbEthereal;
   var _ldrTwoHanded;
   var _btnTabEffects;
   var _btnTabConditions;
   var _btnAction;
   var _lblName;
   var _ldrIcon;
   var _lblWeight;
   var dispatchEvent;
   static var CLASS_NAME = "ItemViewer";
   var _nDisplayWidth = 316;
   var _bUseButton = false;
   var _bDestroyButton = false;
   var _bTargetButton = false;
   var _sCurrentTab = "Effects";
   var _bShowBaseEffects = false;
   function ItemViewer()
   {
      super();
   }
   function set useButton(§\x14\x05§)
   {
      this._bUseButton = _loc2_;
   }
   function get useButton()
   {
      return this._bUseButton;
   }
   function set destroyButton(§\x1b\b§)
   {
      this._bDestroyButton = _loc2_;
   }
   function get destroyButton()
   {
      return this._bDestroyButton;
   }
   function set targetButton(§\x14\x13§)
   {
      this._bTargetButton = _loc2_;
   }
   function get targetButton()
   {
      return this._bTargetButton;
   }
   function set displayPrice(§\x1b\x01§)
   {
      this._bPrice = _loc2_;
      this._lblPrice._visible = _loc2_;
      this._mcKamaSymbol._visible = _loc2_;
   }
   function get displayPrice()
   {
      return this._bPrice;
   }
   function set hideDesc(§\x1b\x05§)
   {
      this._bDesc = !_loc2_;
      this._txtDescription._visible = this._bDesc;
      this._txtDescription.scrollBarRight = this._bDesc;
   }
   function get hideDesc()
   {
      return this._bDesc;
   }
   function set itemData(§\x1e\x19\x03§)
   {
      this._oItem = _loc2_;
      this.addToQueue({object:this,method:this.showItemData,params:[_loc2_]});
   }
   function get itemData()
   {
      return this._oItem;
   }
   function set displayWidth(§\x06\x01§)
   {
      this._nDisplayWidth = Math.max(316,_loc2_ + 2);
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.ItemViewer.CLASS_NAME);
   }
   function arrange()
   {
      this._lstInfos._width = this._nDisplayWidth - this._lstInfos._x;
      this._txtDescription._width = this._nDisplayWidth - this._txtDescription._x - 1;
      this._mcTitle._width = this._nDisplayWidth - this._mcTitle._x;
      this._lblLevel._x = this._nDisplayWidth - (316 - this._lblLevel._x);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this._btnTabCharacteristics._visible = false;
      this._pbEthereal._visible = false;
      this._ldrTwoHanded._visible = false;
   }
   function initTexts()
   {
      this._btnTabEffects.label = this.api.lang.getText("EFFECTS");
      this._btnTabConditions.label = this.api.lang.getText("CONDITIONS");
      this._btnTabCharacteristics.label = this.api.lang.getText("CHARACTERISTICS");
   }
   function addListeners()
   {
      this._btnAction.addEventListener("click",this);
      this._btnAction.addEventListener("over",this);
      this._btnAction.addEventListener("out",this);
      this._btnTabEffects.addEventListener("click",this);
      this._btnTabCharacteristics.addEventListener("click",this);
      this._btnTabConditions.addEventListener("click",this);
      this._pbEthereal.addEventListener("over",this);
      this._pbEthereal.addEventListener("out",this);
      this._ldrTwoHanded.addEventListener("over",this);
      this._ldrTwoHanded.addEventListener("out",this);
   }
   function showItemData(§\x1e\x19\x03§)
   {
      if(_loc2_ != undefined)
      {
         this._lblName.text = _loc2_.name;
         if(dofus.Constants.DEBUG)
         {
            var _loc3_ = " (" + _loc2_.unicID;
            if(_loc2_.ID != 0)
            {
               _loc3_ += ", " + _loc2_.ID;
            }
            _loc3_ += ")";
            this._lblName.text += _loc3_;
         }
         if(_loc2_.style == "")
         {
            this._lblName.styleName = "WhiteLeftMediumBoldLabel";
         }
         else
         {
            this._lblName.styleName = _loc2_.style + "LeftMediumBoldLabel";
         }
         this._lblLevel.text = this.api.lang.getText("LEVEL_SMALL") + _loc2_.level;
         this._txtDescription.text = _loc2_.description;
         this._ldrIcon.contentParams = _loc2_.params;
         this._ldrIcon.contentPath = _loc2_.iconFile;
         this._bShowBaseEffects = false;
         this.updateCurrentTabInformations();
         if(_loc2_.superType == 2)
         {
            this._btnTabCharacteristics._visible = true;
         }
         else
         {
            if(this._sCurrentTab == "Characteristics")
            {
               this.setCurrentTab("Effects");
            }
            this._btnTabCharacteristics._visible = false;
         }
         this._lblPrice.text = _loc2_.price != undefined ? new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.price).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) : "";
         this._lblWeight.text = _loc2_.weight + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this._parent.api.lang.getText("PODS"),"m",_loc2_.weight < 2);
         if(_loc2_.isEthereal)
         {
            var _loc4_ = _loc2_.etherealResistance;
            this._pbEthereal.maximum = _loc4_.param3;
            this._pbEthereal.value = _loc4_.param2;
            this._pbEthereal._visible = true;
            if(_loc4_.param2 < 4)
            {
               this._pbEthereal.styleName = "EtherealCriticalProgressBar";
            }
            else
            {
               this._pbEthereal.styleName = "EtherealNormalProgressBar";
            }
         }
         else
         {
            this._pbEthereal._visible = false;
         }
         this._ldrTwoHanded._visible = _loc2_.needTwoHands;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._lblLevel.text = "";
         this._txtDescription.text = "";
         this._ldrIcon.contentPath = "";
         this._lstInfos.removeAll();
         this._lblPrice.text = "";
         this._lblWeight.text = "";
         this._pbEthereal._visible = false;
         this._ldrTwoHanded._visible = false;
      }
   }
   function updateCurrentTabInformations()
   {
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      switch(this._sCurrentTab)
      {
         case "Effects":
            for(var s in this._oItem.effects)
            {
               if(this._oItem.effects[s].description.length > 0)
               {
                  _loc2_.push(this._oItem.effects[s]);
               }
            }
            break;
         case "Characteristics":
            for(var s in this._oItem.characteristics)
            {
               if(this._oItem.characteristics[s].length > 0)
               {
                  _loc2_.push(this._oItem.characteristics[s]);
               }
            }
            break;
         case "Conditions":
            for(var s in this._oItem.conditions)
            {
               if(this._oItem.conditions[s].length > 0)
               {
                  _loc2_.push(this._oItem.conditions[s]);
               }
            }
      }
      _loc2_.reverse();
      this._lstInfos.dataProvider = _loc2_;
   }
   function setCurrentTab(§\x1e\x0f\x14§)
   {
      this._bShowBaseEffects = false;
      var _loc3_ = this["_btnTab" + this._sCurrentTab];
      var _loc4_ = this["_btnTab" + _loc2_];
      _loc3_.selected = true;
      _loc3_.enabled = true;
      _loc4_.selected = false;
      if(_loc2_ != "Effects")
      {
         _loc4_.enabled = false;
      }
      this._sCurrentTab = _loc2_;
      this.updateCurrentTabInformations();
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnTabEffects":
            if(this._sCurrentTab == "Effects")
            {
               var _loc3_ = this["_btnTab" + this._sCurrentTab];
               _loc3_.selected = false;
               if(this._bShowBaseEffects)
               {
                  this.updateCurrentTabInformations();
               }
               else
               {
                  var _loc4_ = this.api.lang.getItemStats(this._oItem.unicID);
                  if(_loc4_ != undefined)
                  {
                     var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
                     var _loc6_ = new Array();
                     var _loc7_ = _loc4_.split(",");
                     var _loc8_ = 0;
                     while(_loc8_ < _loc7_.length)
                     {
                        var _loc9_ = _loc7_[_loc8_].split("#");
                        _loc9_[0] = _global.parseInt(_loc9_[0],16);
                        _loc9_[1] = _loc9_[1] != "0" ? _global.parseInt(_loc9_[1],16) : undefined;
                        _loc9_[2] = _loc9_[2] != "0" ? _global.parseInt(_loc9_[2],16) : undefined;
                        _loc9_[3] = _loc9_[3] != "0" ? _global.parseInt(_loc9_[3],16) : undefined;
                        _loc6_.push(_loc9_);
                        _loc8_ = _loc8_ + 1;
                     }
                     var _loc10_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc6_);
                     for(var s in _loc10_)
                     {
                        if(_loc10_[s].description.length > 0)
                        {
                           _loc5_.push(_loc10_[s]);
                        }
                     }
                     _loc5_.reverse();
                     this._lstInfos.dataProvider = _loc5_;
                  }
               }
               this._bShowBaseEffects = !this._bShowBaseEffects;
            }
            else
            {
               this.setCurrentTab("Effects");
            }
            break;
         case "_btnTabCharacteristics":
            this.setCurrentTab("Characteristics");
            break;
         case "_btnTabConditions":
            this.setCurrentTab("Conditions");
            break;
         case "_btnAction":
            this.createActionPopupMenu(this._oItem);
      }
   }
   function createActionPopupMenu(§\x1e\x19\x03§)
   {
      var _loc3_ = this.api.ui.createPopupMenu();
      _loc3_.addStaticItem(_loc2_.name);
      if(this._bUseButton && _loc2_.canUse)
      {
         _loc3_.addItem(this.api.lang.getText("CLICK_TO_USE"),this,this.dispatchEvent,[{type:"useItem",item:_loc2_}]);
      }
      _loc3_.addItem(this.api.lang.getText("CLICK_TO_INSERT"),this.api.kernel.GameManager,this.api.kernel.GameManager.insertItemInChat,[_loc2_]);
      if(this._bTargetButton && _loc2_.canTarget)
      {
         _loc3_.addItem(this.api.lang.getText("CLICK_TO_TARGET"),this,this.dispatchEvent,[{type:"targetItem",item:_loc2_}]);
      }
      _loc3_.addItem(this.api.lang.getText("ASSOCIATE_RECEIPTS"),this.api.ui,this.api.ui.loadUIComponent,["ItemUtility","ItemUtility",{item:_loc2_}]);
      if(this._bDestroyButton)
      {
         if(_loc2_.canDestroy)
         {
            _loc3_.addItem(this.api.lang.getText("CLICK_TO_DESTROY"),this,this.dispatchEvent,[{type:"destroyItem",item:_loc2_}]);
         }
         if(_loc2_.hasCustomGfx())
         {
            _loc3_.addItem(this.api.lang.getText("CLICK_TO_DESTROY_MIMIBIOTE"),this,this.dispatchEvent,[{type:"destroyMimibiote",item:_loc2_}]);
         }
      }
      for(var s in _loc2_.effects)
      {
         var _loc4_ = _loc2_.effects[s];
         if(_loc4_.type == 995)
         {
            _loc3_.addItem(this.api.lang.getText("VIEW_MOUNT_DETAILS"),this.api.network.Mount,this.api.network.Mount.data,[_loc4_.param1,_loc4_.param2]);
            break;
         }
      }
      _loc3_.show(_root._xmouse,_root._ymouse);
   }
   function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_pbEthereal":
            var _loc3_ = this._oItem.etherealResistance;
            this.gapi.showTooltip(_loc3_.description,_loc2_.target,-20);
            break;
         case "_ldrTwoHanded":
            this.gapi.showTooltip(this.api.lang.getText("TWO_HANDS_WEAPON"),this._ldrTwoHanded,-20);
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
}
