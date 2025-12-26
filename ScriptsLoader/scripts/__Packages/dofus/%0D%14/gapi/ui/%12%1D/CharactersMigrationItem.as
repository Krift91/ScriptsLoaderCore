class dofus.§\r\x14§.gapi.ui.§\x12\x1d§.CharactersMigrationItem extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _mcList;
   var _lblName;
   var _oItem;
   var _ldrFace;
   var _mcInputNickname;
   var _lblLevel;
   static var CLASS_NAME = "CharactersMigrationItem";
   function CharactersMigrationItem()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function updatePlayerName(§\x1e\x0f\x16§)
   {
      this._lblName.text = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._oItem = _loc4_;
         this._ldrFace._visible = true;
         this._mcInputNickname._visible = true;
         this._lblName._visible = true;
         this._lblLevel._visible = true;
         this._lblLevel.text = _loc4_.level;
         this._lblName.text = _loc4_.newPlayerName;
         this.list = _loc4_.list;
         this._ldrFace.contentPath = dofus.Constants.GUILDS_MINI_PATH + _loc4_.gfxID + ".swf";
         this._oItem.ref = this;
      }
      else
      {
         this._ldrFace._visible = false;
         this._mcInputNickname._visible = false;
         this._lblName._visible = false;
         this._lblLevel._visible = false;
      }
   }
   function getValue()
   {
      return this._oItem;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui["\x12\x1d"].CharactersMigrationItem.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initTexts});
   }
   function addListeners()
   {
   }
   function initTexts()
   {
   }
   function click(§\x1e\x19\x0e§)
   {
   }
}
