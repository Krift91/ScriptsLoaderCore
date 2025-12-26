class dofus.§\r\x14§.gapi.controls.§\f\x06§.JobViewerSkillItem extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _mcArrow;
   var _lblSkill;
   var _lblSource;
   var __height;
   var _lblQuantity;
   var _ctrIcon;
   function JobViewerSkillItem()
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
         this._mcArrow._visible = true;
         this._lblSkill.text = _loc4_.description;
         this._lblSource.text = _loc4_.interactiveObject != undefined ? _loc4_.interactiveObject : "";
         this._lblSkill.setSize(this._lblSource.width - this._lblSource.textWidth - 15,this.__height);
         if(_loc4_.item != undefined)
         {
            if(_loc4_.param1 == _loc4_.param2)
            {
               var _loc5_ = "(#4s)  #1";
            }
            else
            {
               _loc5_ = "(#4s)  #1{~2 " + this._mcList.gapi.api.lang.getText("TO_RANGE") + " }#2";
            }
            this._lblQuantity.text = ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(_loc5_,new Array(_loc4_.param1,_loc4_.param2,_loc4_.param3,Math.round(_loc4_.param4 / 100) / 10));
            this._ctrIcon.contentData = _loc4_.item;
         }
         else
         {
            var _loc6_ = this._parent._parent._parent._parent;
            var _loc7_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this._mcList.gapi.api.lang.getText("SLOT"),"n",_loc4_.param1 < 2);
            var _loc8_ = "#1 " + _loc7_ + " (#2%)";
            this._lblQuantity.text = ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(_loc8_,new Array(_loc4_.param1,_loc4_.param4));
            this._ctrIcon.contentData = undefined;
         }
      }
      else if(this._lblSource.text != undefined)
      {
         this._mcArrow._visible = false;
         this._lblSource.text = "";
         this._lblSkill.text = "";
         this._lblQuantity.text = "";
         this._ctrIcon.contentData = undefined;
      }
   }
   function init()
   {
      super.init(false);
      this._mcArrow._visible = false;
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._ctrIcon.addEventListener("over",this);
      this._ctrIcon.addEventListener("out",this);
   }
   function over(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.contentData;
      this._mcList._parent._parent.gapi.showTooltip(_loc3_.name,_loc2_.target,-20);
   }
   function out(§\x1e\x19\x0e§)
   {
      this._mcList._parent._parent.gapi.hideTooltip();
   }
}
