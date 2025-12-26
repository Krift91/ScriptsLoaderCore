class dofus.§\r\x14§.gapi.ui.§\t\x1a§.MountStorageMountItem extends ank.gapi.core.§\x1e\n\f§
{
   var _lbl;
   var _oItem;
   var _ldrNewMount;
   var _ldrIcon;
   var _mcSexMan;
   var _mcSexWoman;
   var __width;
   var __height;
   function MountStorageMountItem()
   {
      super();
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._lbl.text = _loc4_.name;
         this._oItem = dofus.datacenter.Mount(_loc4_);
         if(this._oItem.newBorn)
         {
            this._ldrNewMount.contentPath = "OeufCasse";
         }
         else
         {
            this._ldrNewMount.contentPath = "";
         }
         this._ldrIcon.contentPath = dofus.Constants.GUILDS_MINI_PATH + _loc4_.gfxID + ".swf";
         this._mcSexMan._visible = !_loc4_.sex;
         this._mcSexWoman._visible = !this._mcSexMan._visible;
      }
      else if(this._lbl.text != undefined)
      {
         this._lbl.text = "";
         this._ldrIcon.contentPath = "";
         this._ldrNewMount.contentPath = "";
         this._mcSexMan._visible = false;
         this._mcSexWoman._visible = false;
      }
   }
   function init()
   {
      super.init(false);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.arrange();
   }
   function addListeners()
   {
      this._ldrIcon.addEventListener("complete",this);
   }
   function size()
   {
      super.size();
      this.addToQueue({object:this,method:this.arrange});
   }
   function arrange()
   {
      this._lbl.setSize(this.__width,this.__height);
   }
   function applyRideColor(§\n\x1d§, §\x1e\t\x03§)
   {
      var _loc4_ = this._oItem["color" + _loc3_];
      if(_loc4_ == -1 || _loc4_ == undefined)
      {
         return undefined;
      }
      var _loc5_ = (_loc4_ & 0xFF0000) >> 16;
      var _loc6_ = (_loc4_ & 0xFF00) >> 8;
      var _loc7_ = _loc4_ & 0xFF;
      var _loc8_ = new Color(_loc2_);
      var _loc9_ = new Object();
      _loc9_ = {ra:0,ga:0,ba:0,rb:_loc5_,gb:_loc6_,bb:_loc7_};
      _loc8_.setTransform(_loc9_);
   }
   function complete(§\x1e\x19\x0e§)
   {
      var ref = this;
      this._ldrIcon.content.applyRideColor = function(§\n\x1d§, §\x1e\t\x07§)
      {
         ref.applyRideColor(_loc2_,_loc3_);
      };
   }
}
