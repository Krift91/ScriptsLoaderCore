class dofus.§\r\x14§.gapi.ui.§\x0e\x03§.§\x0e\x02§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _lblName;
   var _lblLevel;
   var _mcFight;
   var _ldrGuild;
   var _ldrAlignement;
   var _btnRemove;
   function §\x0e\x02§()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._oItem = _loc4_;
         if(_loc4_.account != undefined && !this._mcList._parent._parent.api.config.isStreaming)
         {
            this._lblName.text = _loc4_.account + " (" + _loc4_.name + ")";
         }
         else
         {
            this._lblName.text = _loc4_.name;
         }
         if(_loc4_.level != undefined)
         {
            this._lblLevel.text = _loc4_.level;
         }
         else
         {
            this._lblLevel.text = "";
         }
         this._mcFight._visible = _loc4_.state == "IN_MULTI";
         this._ldrGuild.contentPath = dofus.Constants.GUILDS_MINI_PATH + _loc4_.gfxID + ".swf";
         if(_loc4_.alignement != -1)
         {
            this._ldrAlignement.contentPath = dofus.Constants.ALIGNMENTS_MINI_PATH + _loc4_.alignement + ".swf";
         }
         else
         {
            this._ldrAlignement.contentPath = "";
         }
         this._btnRemove._visible = true;
      }
      else if(this._lblName.text != undefined)
      {
         this._lblName.text = "";
         this._lblLevel.text = "";
         this._ldrAlignement.contentPath = "";
         this._mcFight._visible = false;
         this._ldrGuild.contentPath = "";
         this._btnRemove._visible = false;
      }
   }
   function init()
   {
      super.init(false);
      this._mcFight._visible = false;
      this._btnRemove._visible = false;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._btnRemove.addEventListener("click",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      if(this._oItem.account != undefined)
      {
         this._mcList._parent._parent.removeFriend("*" + this._oItem.account);
      }
      else
      {
         this._mcList._parent._parent.removeFriend(this._oItem.name);
      }
   }
}
