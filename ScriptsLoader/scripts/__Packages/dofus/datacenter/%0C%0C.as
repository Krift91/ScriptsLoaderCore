class dofus.datacenter.§\f\f§ extends Object
{
   var _nQuantity;
   var _nID;
   var _nUnicID;
   var _sEffects;
   var _nRemainingHours;
   var _nPosition;
   var _nPriceMultiplicator;
   var _oUnicInfos;
   var api;
   var _nRealType;
   var _aEffects;
   var _sGfx;
   var _sCustomFullGfx;
   var _sRealGfx;
   var _nPrice;
   var _aEffectZones;
   var _nMood;
   var _nSkin;
   var _bIsSkineable;
   var _nRealUnicId;
   var _nLivingXp;
   var _bCanBeExchange;
   var _itemDateId;
   var _itemLevel;
   var _itemType;
   var _itemPrice;
   var _itemName;
   var _itemWeight;
   static var OBJECT_ACTION_SUMMON = 623;
   static var LEVEL_STEP = [0,10,21,33,46,60,75,91,108,126,145,165,186,208,231,255,280,306,333,361];
   static var DATE_ID = 0;
   function §\f\f§(§\x04\x12§, §\x1e\x1b\x10§, §\x01\x01§, §\x01\n§, §\x1e\x12\x1a§, §\x01\x07§, §\x1e\x1d\n§, §\x02\n§)
   {
      super();
      this.initialize(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
   }
   function get label()
   {
      return this._nQuantity <= 1 ? undefined : this._nQuantity;
   }
   function get ID()
   {
      return this._nID;
   }
   function get unicID()
   {
      return this._nUnicID;
   }
   function get compressedEffects()
   {
      return this._sEffects;
   }
   function set Quantity(§\x1e\n\x02§)
   {
      if(_global.isNaN(Number(_loc2_)))
      {
         return;
      }
      this._nQuantity = Number(_loc2_);
   }
   function get Quantity()
   {
      return this._nQuantity;
   }
   function set remainingHours(§\x1e\x1e\x0b§)
   {
      this._nRemainingHours = _loc2_;
   }
   function get remainingHours()
   {
      return this._nRemainingHours;
   }
   function set position(§\x1e\n\x02§)
   {
      if(_global.isNaN(Number(_loc2_)))
      {
         return;
      }
      this._nPosition = Number(_loc2_);
   }
   function get position()
   {
      return this._nPosition;
   }
   function set priceMultiplicator(§\x1e\n\x02§)
   {
      if(_global.isNaN(Number(_loc2_)))
      {
         return;
      }
      this._nPriceMultiplicator = Number(_loc2_);
   }
   function get priceMultiplicator()
   {
      return this._nPriceMultiplicator;
   }
   function get name()
   {
      return ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this.api.lang.fetchString(this._oUnicInfos.n),this.api.lang.getItemUnicStringText());
   }
   function get description()
   {
      var _loc2_ = this.api.lang.getItemTypeText(this.type).n;
      var _loc3_ = "";
      if(this.isFromItemSet)
      {
         var _loc4_ = new dofus.datacenter.ItemSet(this.itemSetID);
         _loc3_ = "<u>" + _loc4_.name + " (" + this.api.lang.getText("ITEM_TYPE") + " : " + _loc2_ + ")</u>\n";
      }
      else
      {
         _loc3_ = "<u>" + this.api.lang.getText("ITEM_TYPE") + " : " + _loc2_ + "</u>\n";
      }
      return _loc3_ + ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this.api.lang.fetchString(this._oUnicInfos.d),this.api.lang.getItemUnicStringText());
   }
   function get type()
   {
      if(this._nRealType)
      {
         return this._nRealType;
      }
      return Number(this._oUnicInfos.t);
   }
   function set type(§\x1e\x1b\x13§)
   {
      this._nRealType = _loc2_;
   }
   function get realType()
   {
      return Number(this._oUnicInfos.t);
   }
   function get enhanceable()
   {
      return !!this._oUnicInfos.fm;
   }
   function get style()
   {
      if(this.isFromItemSet)
      {
         return "ItemSet";
      }
      if(this.isEthereal)
      {
         return "Ethereal";
      }
      return "";
   }
   function get needTwoHands()
   {
      return this._oUnicInfos.tw == true;
   }
   function get isEthereal()
   {
      return this._oUnicInfos.et == true;
   }
   function get isHidden()
   {
      return this._oUnicInfos.h == true;
   }
   function get etherealResistance()
   {
      if(this.isEthereal)
      {
         for(var k in this._aEffects)
         {
            var _loc2_ = this._aEffects[k];
            if(_loc2_[0] == 812)
            {
               while(§§pop() != null)
               {
               }
               return new dofus.datacenter["\x0f\r"](_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
            }
         }
      }
      return new Array();
   }
   function get isFromItemSet()
   {
      return this._oUnicInfos.s != undefined;
   }
   function get itemSetID()
   {
      return this._oUnicInfos.s;
   }
   function get typeText()
   {
      return this.api.lang.getItemTypeText(this.type);
   }
   function get superType()
   {
      return this.typeText.t;
   }
   function get superTypeText()
   {
      return this.api.lang.getItemSuperTypeText(this.superType);
   }
   function get iconFile()
   {
      return dofus.Constants.ITEMS_PATH + this.type + "/" + this.gfx + ".swf";
   }
   function get effects()
   {
      return dofus.datacenter["\f\f"].getItemDescriptionEffects(this._aEffects);
   }
   function get visibleEffects()
   {
      return dofus.datacenter["\f\f"].getItemDescriptionEffects(this._aEffects,true);
   }
   function get canUse()
   {
      return this._oUnicInfos.u != undefined ? true : false;
   }
   function get canTarget()
   {
      return this._oUnicInfos.ut != undefined ? true : false;
   }
   function get canDestroy()
   {
      return this.superType != 14 && !this.isCursed;
   }
   function get canDrop()
   {
      return this.superType != 14 && !this.isCursed;
   }
   function get canMoveToShortut()
   {
      return this.canUse == true || this.canTarget == true;
   }
   function get level()
   {
      return Number(this._oUnicInfos.l);
   }
   function get gfx()
   {
      if(this._sGfx)
      {
         return this._sGfx;
      }
      if(this._sCustomFullGfx != undefined)
      {
         return this._sCustomFullGfx;
      }
      return this._oUnicInfos.g;
   }
   function set gfx(§\x1e\x11\x1d§)
   {
      this._sGfx = _loc2_;
   }
   function get realGfx()
   {
      if(this._sCustomFullGfx != undefined)
      {
         return this._sCustomFullGfx;
      }
      return this._sRealGfx;
   }
   function get price()
   {
      if(this._nPrice == undefined)
      {
         return Math.max(0,Math.round(Number(this._oUnicInfos.p) * (this._nPriceMultiplicator != undefined ? this._nPriceMultiplicator : 0)));
      }
      return this._nPrice;
   }
   function get weight()
   {
      return Number(this._oUnicInfos.w);
   }
   function get isCursed()
   {
      return this._oUnicInfos.m;
   }
   function get normalHit()
   {
      return this._aEffects;
   }
   function get criticalHitBonus()
   {
      return this.getItemFightEffectsText(0);
   }
   function get apCost()
   {
      return this.getItemFightEffectsText(1);
   }
   function get rangeMin()
   {
      return this.getItemFightEffectsText(2);
   }
   function get rangeMax()
   {
      return this.getItemFightEffectsText(3);
   }
   function get criticalHit()
   {
      return this.getItemFightEffectsText(4);
   }
   function get criticalFailure()
   {
      return this.getItemFightEffectsText(5);
   }
   function get lineOnly()
   {
      return this.getItemFightEffectsText(6);
   }
   function get lineOfSight()
   {
      return this.getItemFightEffectsText(7);
   }
   function get effectZones()
   {
      return this._aEffectZones;
   }
   function get characteristics()
   {
      var _loc2_ = new Array();
      _loc2_.push(this.api.lang.getText("ITEM_AP",[this.apCost]));
      _loc2_.push(this.api.lang.getText("ITEM_RANGE",[(this.rangeMin == 0 ? "" : this.rangeMin + " " + this.api.lang.getText("TO_RANGE") + " ") + this.rangeMax]));
      _loc2_.push(this.api.lang.getText("ITEM_CRITICAL_BONUS",[this.criticalHitBonus <= 0 ? String(this.criticalHitBonus) : "+" + this.criticalHitBonus]));
      _loc2_.push((this.criticalHit == 0 ? "" : this.api.lang.getText("ITEM_CRITICAL",[this.criticalHit])) + (!(this.criticalHit != 0 && this.criticalFailure != 0) ? "" : " - ") + (this.criticalFailure == 0 ? "" : this.api.lang.getText("ITEM_MISS",[this.criticalFailure])));
      if(this.criticalHit > 0 && this.ID == this.api.datacenter.Player.weaponItem.ID)
      {
         var _loc3_ = this.api.kernel.GameManager.getCriticalHitChance(this.criticalHit);
         _loc2_.push(this.api.lang.getText("ITEM_CRITICAL_REAL",["1/" + _loc3_]));
      }
      return _loc2_;
   }
   function get conditions()
   {
      var _loc2_ = [">","<","=","!"];
      var _loc3_ = this._oUnicInfos.c;
      if(_loc3_ == undefined || _loc3_.length == 0)
      {
         return [String(this.api.lang.getText("NO_CONDITIONS"))];
      }
      var _loc4_ = _loc3_.split("&");
      var _loc5_ = new Array();
      var _loc6_ = 0;
      while(_loc6_ < _loc4_.length)
      {
         _loc4_[_loc6_] = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_[_loc6_]).replace(["(",")"],["",""]);
         var _loc7_ = _loc4_[_loc6_].split("|");
         var _loc8_ = 0;
         for(; _loc8_ < _loc7_.length; _loc8_ = _loc8_ + 1)
         {
            var _loc11_ = 0;
            while(_loc11_ < _loc2_.length)
            {
               var _loc10_ = _loc2_[_loc11_];
               var _loc9_ = _loc7_[_loc8_].split(_loc10_);
               if(_loc9_.length > 1)
               {
                  break;
               }
               _loc11_ = _loc11_ + 1;
            }
            if(_loc9_ != undefined)
            {
               var _loc12_ = String(_loc9_[0]);
               var _loc13_ = _loc9_[1];
               if(_loc12_ == "PZ")
               {
                  break;
               }
               switch(_loc12_)
               {
                  case "Ps":
                     _loc13_ = this.api.lang.getAlignment(Number(_loc13_)).n;
                     break;
                  case "PS":
                     _loc13_ = _loc13_ != "1" ? this.api.lang.getText("MALE") : this.api.lang.getText("FEMELE");
                     break;
                  case "Pr":
                     _loc13_ = this.api.lang.getAlignmentSpecialization(Number(_loc13_)).n;
                     break;
                  case "Pg":
                     var _loc14_ = _loc13_.split(",");
                     if(_loc14_.length == 2)
                     {
                        _loc13_ = this.api.lang.getAlignmentFeat(Number(_loc14_[0])).n + " (" + Number(_loc14_[1]) + ")";
                     }
                     else
                     {
                        _loc13_ = this.api.lang.getAlignmentFeat(Number(_loc13_)).n;
                     }
                     break;
                  case "PG":
                     _loc13_ = this.api.lang.getClassText(Number(_loc13_)).sn;
                     break;
                  case "PJ":
                  case "Pj":
                     var _loc15_ = _loc13_.split(",");
                     _loc13_ = this.api.lang.getJobText(_loc15_[0]).n + (_loc15_[1] != undefined ? " (" + this.api.lang.getText("LEVEL_SMALL") + " " + _loc15_[1] + ")" : "");
                     break;
                  case "PM":
                     continue;
                  default:
                     if(_loc0_ !== "PO")
                     {
                        break;
                     }
                     var _loc16_ = new dofus.datacenter["\f\f"](-1,Number(_loc13_),1,0,"",0);
                     _loc13_ = _loc16_.name;
                     break;
               }
               _loc12_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc12_).replace(["CS","Cs","CV","Cv","CA","Ca","CI","Ci","CW","Cw","CC","Cc","CA","PG","PJ","Pj","PM","PA","PN","PE","<NO>","PS","PR","PL","PK","Pg","Pr","Ps","Pa","PP","PZ","CM"],this.api.lang.getText("ITEM_CHARACTERISTICS").split(","));
               var _loc17_ = _loc10_ == "!";
               _loc10_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc10_).replace(["!"],[this.api.lang.getText("ITEM_NO")]);
               switch(_loc12_)
               {
                  case "BI":
                     _loc5_.push(this.api.lang.getText("UNUSABLE"));
                     break;
                  case "PO":
                     if(_loc17_)
                     {
                        _loc5_.push(this.api.lang.getText("ITEM_DO_NOT_POSSESS",[_loc13_]) + " <" + _loc10_ + ">");
                     }
                     else
                     {
                        _loc5_.push(this.api.lang.getText("ITEM_DO_POSSESS",[_loc13_]) + " <" + _loc10_ + ">");
                     }
                     break;
                  default:
                     _loc5_.push((_loc8_ <= 0 ? "" : this.api.lang.getText("ITEM_OR") + " ") + _loc12_ + " " + _loc10_ + " " + _loc13_);
               }
            }
         }
         _loc6_ = _loc6_ + 1;
      }
      return _loc5_;
   }
   function get mood()
   {
      return this._nMood;
   }
   function get skin()
   {
      return this._nSkin;
   }
   function set skin(§\x1e\x1d\n§)
   {
      this._nSkin = _loc2_;
   }
   function get params()
   {
      if(!this.isLeavingItem)
      {
         return undefined;
      }
      var _loc3_ = this.skin;
      if(_loc3_ == undefined || _global.isNaN(_loc3_))
      {
         _loc3_ = 0;
      }
      switch(this.mood)
      {
         case 1:
            var _loc2_ = "H";
            break;
         case 2:
         case 0:
            _loc2_ = "U";
            break;
         default:
            _loc2_ = "H";
      }
      return {frame:_loc2_ + _loc3_,forceReload:this.isLeavingItem};
   }
   function get skineable()
   {
      return this._bIsSkineable;
   }
   function get isAssociate()
   {
      return this.skineable && this.realType != 113;
   }
   function get realUnicId()
   {
      if(this._nRealUnicId)
      {
         return this._nRealUnicId;
      }
      return this._nUnicID;
   }
   function get maxSkin()
   {
      var _loc2_ = 1;
      while(_loc2_ < dofus.datacenter["\f\f"].LEVEL_STEP.length)
      {
         if(this._nLivingXp < dofus.datacenter["\f\f"].LEVEL_STEP[_loc2_])
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return dofus.datacenter["\f\f"].LEVEL_STEP.length;
   }
   function get currentLivingXp()
   {
      return this._nLivingXp;
   }
   function get currentLivingLevelXpMax()
   {
      var _loc2_ = 1;
      while(_loc2_ < dofus.datacenter["\f\f"].LEVEL_STEP.length)
      {
         if(this._nLivingXp < dofus.datacenter["\f\f"].LEVEL_STEP[_loc2_])
         {
            return dofus.datacenter["\f\f"].LEVEL_STEP[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return -1;
   }
   function get currentLivingLevelXpMin()
   {
      var _loc2_ = 1;
      while(_loc2_ < dofus.datacenter["\f\f"].LEVEL_STEP.length)
      {
         if(this._nLivingXp < dofus.datacenter["\f\f"].LEVEL_STEP[_loc2_])
         {
            return dofus.datacenter["\f\f"].LEVEL_STEP[_loc2_ - 1];
         }
         _loc2_ = _loc2_ + 1;
      }
      return -1;
   }
   function get isSpeakingItem()
   {
      return this.isAssociate || this.realType == 113;
   }
   function get isLeavingItem()
   {
      return this.isAssociate || this.realType == 113;
   }
   function get canBeExchange()
   {
      return this._bCanBeExchange;
   }
   function initialize(§\x04\x12§, §\x1e\x1b\x10§, §\x01\x01§, §\x01\n§, §\x1e\x12\x1a§, §\x01\x07§, §\x1e\x1d\n§, §\x02\n§)
   {
      this.api = _global.API;
      this._itemDateId = dofus.datacenter["\f\f"].DATE_ID--;
      this._nID = _loc2_;
      this._nUnicID = _loc3_;
      this._nQuantity = _loc4_ != undefined ? _loc4_ : 1;
      this._nPosition = _loc5_ != undefined ? _loc5_ : -1;
      if(_loc7_ != undefined)
      {
         this._nPrice = _loc7_;
      }
      this._bCanBeExchange = true;
      this._oUnicInfos = this.api.lang.getItemUnicText(_loc3_);
      this.setEffects(_loc6_);
      this._bIsSkineable = false;
      this.updateDataFromEffect();
      var _loc10_ = this.typeText.z;
      var _loc11_ = _loc10_.split("");
      this._aEffectZones = new Array();
      var _loc12_ = 0;
      while(_loc12_ < _loc11_.length)
      {
         this._aEffectZones.push({shape:_loc11_[_loc12_],size:ank["\x1e\n\x07"]["\x12\r"].decode64(_loc11_[_loc12_ + 1])});
         _loc12_ += 2;
      }
      this._itemLevel = this.level;
      this._itemType = this.type;
      this._itemPrice = this.price;
      this._itemName = this.name;
      this._itemWeight = this.weight;
      if(_loc8_ != undefined)
      {
         this._nSkin = _loc8_;
      }
      if(_loc9_ != undefined)
      {
         this._nMood = _loc9_;
      }
   }
   function hasCustomGfx()
   {
      return this._sCustomFullGfx != undefined;
   }
   function setEffects(§\x12\x0f§)
   {
      this._sEffects = _loc2_;
      this._aEffects = new Array();
      var _loc3_ = _loc2_.split(",");
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc4_].split("#");
         _loc5_[0] = _global.parseInt(_loc5_[0],16);
         _loc5_[1] = !(_loc5_[1] == "" || _loc5_[1] == "0") ? _global.parseInt(_loc5_[1],16) : undefined;
         _loc5_[2] = !(_loc5_[2] == "" || _loc5_[2] == "0") ? _global.parseInt(_loc5_[2],16) : undefined;
         _loc5_[3] = !(_loc5_[3] == "" || _loc5_[3] == "0") ? _global.parseInt(_loc5_[3],16) : undefined;
         _loc5_[4] = _loc5_[4];
         this._aEffects.push(_loc5_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function clone()
   {
      return new dofus.datacenter["\f\f"](this._nID,this._nUnicID,this._nQuantity,this._nPosition,this._sEffects);
   }
   function equals(§\f\x0b§)
   {
      return this.unicID == _loc2_.unicID;
   }
   function showStatsTooltip(§\n\x1d§, §\x1e\r\b§)
   {
      var _loc4_ = -20;
      var _loc5_ = this.name + " (" + this.api.lang.getText("LEVEL_SMALL") + " " + this.level + ")";
      var _loc6_ = true;
      for(var s in this.effects)
      {
         var _loc7_ = this.effects[s];
         if(_loc7_.description.length > 0)
         {
            if(_loc6_)
            {
               _loc5_ += "\n";
               _loc4_ -= 10;
               _loc6_ = false;
            }
            _loc5_ = _loc5_ + "\n" + _loc7_.description;
            _loc4_ -= 12;
         }
      }
      this.api.ui.showTooltip(_loc5_,_loc2_,_loc4_,undefined,_loc3_ + "ToolTip");
   }
   function getItemFightEffectsText(§\x01\x05§)
   {
      return this._oUnicInfos.e[_loc2_];
   }
   function updateDataFromEffect()
   {
      for(var k in this._aEffects)
      {
         var _loc2_ = this._aEffects[k];
         switch(_loc2_[0])
         {
            case 974:
               this._nLivingXp = !_loc2_[3] ? 0 : _loc2_[3];
               break;
            case 973:
               this._nRealType = !_loc2_[3] ? 0 : _loc2_[3];
               break;
            case 972:
               this._nSkin = !_loc2_[3] ? 0 : _global.parseInt(_loc2_[3]) - 1;
               this._bIsSkineable = true;
               break;
            case 971:
               this._nMood = !_loc2_[3] ? 0 : _loc2_[3];
               break;
            case 969:
               var _loc3_ = this.api.lang.getItemUnicText(!_loc2_[3] ? 0 : _loc2_[3]).g;
               this._sCustomFullGfx = _loc3_;
               break;
            case 970:
               this._sRealGfx = this._oUnicInfos.g;
               this._sGfx = this.api.lang.getItemUnicText(!_loc2_[3] ? 0 : _loc2_[3]).g;
               this._nRealUnicId = _loc2_[3];
               break;
            case 983:
               this._bCanBeExchange = false;
         }
      }
   }
   static function getItemDescriptionEffects(§\x1e\x1c§, §\x13\x19§)
   {
      var _loc4_ = new Array();
      var _loc5_ = _loc2_.length;
      if(typeof _loc2_ == "object")
      {
         var _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            var _loc7_ = _loc2_[_loc6_];
            var _loc8_ = _loc7_[0];
            var _loc9_ = new Array();
            if(_loc8_ == dofus.datacenter["\f\f"].OBJECT_ACTION_SUMMON)
            {
               var _loc10_ = _loc7_[4].split(dofus.aks.Items.EFFECT_APPEND_CHAR);
               var _loc11_ = 0;
               while(_loc11_ < _loc10_.length)
               {
                  var _loc12_ = _global.parseInt(_loc10_[_loc11_],dofus.aks.Items.COMPRESSION_RADIX);
                  var _loc13_ = new dofus.datacenter["\x0f\r"](undefined,_loc8_,undefined,undefined,_loc12_);
                  _loc9_.push(_loc13_);
                  _loc11_ = _loc11_ + 1;
               }
            }
            else
            {
               var _loc14_ = new dofus.datacenter["\x0f\r"](undefined,_loc8_,_loc7_[1],_loc7_[2],_loc7_[3],_loc7_[4]);
               _loc9_.push(_loc14_);
            }
            var _loc15_ = 0;
            while(_loc15_ < _loc9_.length)
            {
               var _loc16_ = _loc9_[_loc15_];
               if(_loc16_.description != undefined)
               {
                  if(_loc3_ == true)
                  {
                     if(_loc16_.showInTooltip)
                     {
                        _loc4_.push(_loc16_);
                     }
                  }
                  else
                  {
                     _loc4_.push(_loc16_);
                  }
               }
               _loc15_ = _loc15_ + 1;
            }
            _loc6_ = _loc6_ + 1;
         }
         return _loc4_;
      }
      return null;
   }
}
