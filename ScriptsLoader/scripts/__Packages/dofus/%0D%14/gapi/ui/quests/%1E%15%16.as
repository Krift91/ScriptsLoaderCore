class dofus.§\r\x14§.gapi.ui.quests.§\x1e\x15\x16§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _oItem;
   var _txtDescription;
   var _mcCheckFinished;
   var _mcCompass;
   function §\x1e\x15\x16§()
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
         this._txtDescription.text = _loc4_.description;
         this._txtDescription.styleName = !_loc4_.isFinished ? "BrownLeftSmallTextArea" : "GreyLeftSmallTextArea";
         this._mcCheckFinished._visible = _loc4_.isFinished;
         this._mcCompass._visible = _loc4_.x != undefined && _loc4_.y != undefined && !_loc4_.isFinished;
      }
      else if(this._txtDescription.text != undefined)
      {
         this._txtDescription.text = "";
         this._mcCheckFinished._visible = false;
         this._mcCompass._visible = false;
      }
   }
   function init()
   {
      super.init(false);
      this._mcCheckFinished._visible = false;
      this._mcCompass._visible = false;
   }
}
