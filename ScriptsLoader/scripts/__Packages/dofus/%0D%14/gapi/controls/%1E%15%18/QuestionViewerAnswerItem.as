class dofus.§\r\x14§.gapi.controls.§\x1e\x15\x18§.QuestionViewerAnswerItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcRound;
   var _txtResponse;
   function QuestionViewerAnswerItem()
   {
      super();
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._mcRound._visible = true;
         var _loc5_ = _loc4_.label;
         if(dofus.Constants.DEBUG)
         {
            _loc5_ = _loc5_ + " (" + _loc4_.id + ")";
         }
         this._txtResponse.text = _loc5_;
      }
      else if(this._txtResponse.text != undefined)
      {
         this._mcRound._visible = false;
         this._txtResponse.text = "";
      }
   }
   function init()
   {
      super.init(false);
      this._mcRound._visible = false;
   }
   function size()
   {
      super.size();
   }
}
