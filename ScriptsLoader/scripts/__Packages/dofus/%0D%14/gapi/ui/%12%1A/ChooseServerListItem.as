class dofus.§\r\x14§.gapi.ui.§\x12\x1a§.ChooseServerListItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _ldrFlag;
   var _lblName;
   var _lblCommunity;
   var _lblOnline;
   var _lblPopulation;
   var _lblType;
   var _mcHeroic;
   var _mcOver;
   function ChooseServerListItem()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      var _loc5_ = this._mcList._parent._parent.api;
      if(_loc2_)
      {
         this._oItem = _loc4_;
         _loc4_.sortFlag = _loc4_.language;
         _loc4_.sortName = _loc4_.label;
         _loc4_.sortType = _loc4_.type;
         _loc4_.sortOnline = _loc4_.stateStrShort;
         _loc4_.sortCommunity = _loc4_.communityStr;
         _loc4_.sortPopulation = _loc4_.population;
         var _loc6_ = new String();
         switch(_loc4_.community)
         {
            case 0:
               _loc6_ = "fr";
               break;
            case 1:
               _loc6_ = "en";
               break;
            case 3:
               _loc6_ = "de";
               break;
            case 4:
               _loc6_ = "es";
               break;
            case 5:
               _loc6_ = "ru";
               break;
            case 6:
               _loc6_ = "pt";
               break;
            case 7:
               _loc6_ = "nl";
               break;
            case 8:
               _loc6_ = "jp";
               break;
            case 9:
               _loc6_ = "it";
               break;
            case 2:
            default:
               _loc6_ = "us";
         }
         this._ldrFlag.contentPath = "Flag_" + _loc6_;
         this._lblName.text = _loc4_.sortName;
         this._lblCommunity.text = _loc4_.sortCommunity;
         switch(_loc4_.state)
         {
            case dofus.datacenter["\x1e\x12\x12"].SERVER_OFFLINE:
               this._lblOnline.styleName = "RedCenterSmallLabel";
               break;
            case dofus.datacenter["\x1e\x12\x12"].SERVER_ONLINE:
               this._lblOnline.styleName = "GreenCenterSmallLabel";
               break;
            default:
               this._lblOnline.styleName = "BrownCenterSmallLabel";
         }
         this._lblOnline.text = _loc4_.sortOnline;
         switch(_loc4_.sortPopulation)
         {
            case 0:
               this._lblPopulation.styleName = "GreenCenterSmallLabel";
               break;
            case 1:
               this._lblPopulation.styleName = "BlueCenterSmallLabel";
               break;
            case 2:
               this._lblPopulation.styleName = "RedCenterSmallLabel";
               break;
            default:
               this._lblPopulation.styleName = "BrownCenterSmallLabel";
         }
         this._lblPopulation.text = _loc4_.populationStr;
         this._lblType.text = _loc4_.type;
         if(_loc4_.typeNum == dofus.datacenter["\x1e\x12\x12"].SERVER_HARDCORE)
         {
            this._lblName.styleName = "RedLeftSmallLabel";
            this._lblType.styleName = "RedCenterSmallLabel";
            this._mcHeroic._visible = true;
         }
         else
         {
            this._lblName.styleName = "BrownLeftSmallLabel";
            this._lblType.styleName = "BrownCenterSmallLabel";
            this._mcHeroic._visible = false;
         }
      }
      else if(this._lblName.text != undefined)
      {
         this._ldrFlag.contentPath = "";
         this._lblName.text = "";
         this._lblType.text = "";
         this._lblOnline.text = "";
         this._lblCommunity.text = "";
         this._lblPopulation.text = "";
         this._mcHeroic._visible = false;
      }
   }
   function init()
   {
      super.init(false);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
   }
   function over()
   {
      if(!this._oItem.friendCharactersCount)
      {
         return undefined;
      }
      var _loc2_ = this._mcList.gapi.api;
      var _loc3_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(_loc2_.lang.getText("A_POSSESS_CHARACTER",[this._oItem.search,this._oItem.friendCharactersCount]),null,this._oItem.friendCharactersCount == 1);
      _loc2_.ui.showTooltip(_loc3_,this._mcOver,-20);
   }
   function out(§\x1e\x19\x0e§)
   {
      this._mcList.gapi.api.ui.hideTooltip();
   }
}
