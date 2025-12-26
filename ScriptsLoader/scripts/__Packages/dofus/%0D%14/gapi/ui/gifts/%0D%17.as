class dofus.§\r\x14§.gapi.ui.gifts.§\r\x17§ extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oData;
   var _mcSelect;
   var _ldrSprite;
   var _btnBack;
   var _lblName;
   var _lblLevel;
   var dispatchEvent;
   static var CLASS_NAME = "Gifts";
   function §\r\x17§()
   {
      super();
   }
   function set data(§\x1e\x19\x15§)
   {
      this._oData = _loc2_;
      if(this.initialized)
      {
         this.addToQueue({object:this,method:this.updateData});
      }
   }
   function get data()
   {
      return this._oData;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.gifts["\r\x17"].CLASS_NAME);
   }
   function createChildren()
   {
      this._mcSelect._visible = false;
      this._mcSelect.stop();
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._ldrSprite.addEventListener("initialization",this);
      this._btnBack.addEventListener("click",this);
      this._btnBack.addEventListener("over",this);
      this._btnBack.addEventListener("out",this);
   }
   function updateData()
   {
      if(this._oData != undefined)
      {
         this._lblName.text = this._oData.name;
         this._lblLevel.text = this.api.lang.getText("LEVEL") + " " + this._oData.Level;
         this._ldrSprite.contentPath = this._oData.gfxFile;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._ldrSprite.contentPath = "";
      }
   }
   function initialization(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.clip;
      this.gapi.api.colors.addSprite(_loc3_,this._oData);
      _loc3_.attachMovie("staticF","mcAnim",10);
   }
   function click(§\x1e\x19\x0e§)
   {
      if(this._bEnabled)
      {
         this.dispatchEvent({type:"onSpriteSelected",data:this._oData});
      }
   }
   function over(§\x1e\x19\x0e§)
   {
      if(this._bEnabled)
      {
         this._mcSelect._visible = true;
         this._mcSelect.play();
      }
   }
   function out(§\x1e\x19\x0e§)
   {
      if(this._bEnabled)
      {
         this._mcSelect._visible = false;
         this._mcSelect.stop();
      }
   }
}
