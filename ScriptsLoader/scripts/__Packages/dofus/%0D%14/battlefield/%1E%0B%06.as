class dofus.§\r\x14§.battlefield.§\x1e\x0b\x06§ extends dofus.§\r\x14§.battlefield.§\x14§
{
   var _txtTitle;
   var _txtText;
   function §\x1e\x0b\x06§(§\x1e\f\x12§, §\x1e\x12\x0b§, §\x06\x1d§, §\x04\x1d§, §\x01\x04§, §\x1e\n\x1d§)
   {
      super();
      this.initialize(_loc8_ != undefined);
      this.draw(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
   }
   function initialize(§\x10\x1c§)
   {
      super.initialize();
      this.createTextField("_txtText",30,0,-3 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER,0,0);
      if(_loc3_)
      {
         this.createTextField("_txtTitle",31,0,-3 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER,0,0);
         this._txtTitle.embedFonts = true;
      }
      this._txtText.embedFonts = true;
   }
   function draw(§\x1e\f\x12§, §\x1e\x12\x0b§, §\x06\x1d§, §\x04\x1d§, §\x01\x04§, §\x1e\n\x1d§)
   {
      var _loc8_ = _loc3_ != undefined && _loc5_ != undefined;
      if(_loc6_ == undefined)
      {
         _loc6_ = 0;
      }
      this._txtText.autoSize = "center";
      this._txtText.text = _loc2_;
      this._txtText.selectable = false;
      this._txtText.setTextFormat(dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT);
      if(_loc4_ != undefined)
      {
         this._txtText.textColor = _loc4_;
      }
      if(_loc7_)
      {
         this._txtTitle.autoSize = "center";
         this._txtTitle.text = _loc7_.text;
         this._txtTitle.selectable = false;
         this._txtTitle.setTextFormat(dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT2);
         if(_loc7_.color != undefined)
         {
            this._txtTitle.textColor = _loc7_.color;
         }
         this._txtTitle._y = this._txtText._y + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER + this._txtText.textHeight;
         var _loc9_ = Math.ceil(this._txtText.textHeight + this._txtTitle.textHeight + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER * 3);
         var _loc10_ = Math.ceil(Math.max(this._txtText.textWidth,this._txtTitle.textWidth) + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER * 2);
      }
      else
      {
         _loc9_ = Math.ceil(this._txtText.textHeight + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER * 2);
         _loc10_ = Math.ceil(this._txtText.textWidth + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER * 2);
      }
      this.drawBackground(_loc10_,_loc9_,dofus["\r\x14"].battlefield["\x14"].BACKGROUND_COLOR);
      if(_loc8_)
      {
         this.drawGfx(_loc3_,_loc5_);
         this.addPvpGfxEffect(_loc6_,_loc5_);
      }
   }
}
