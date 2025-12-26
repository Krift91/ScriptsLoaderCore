class dofus.§\r\x14§.battlefield.§\r\f§ extends dofus.§\r\x14§.battlefield.§\x14§
{
   var _txtTitle;
   var _txtGuildName;
   var _txtSpriteName;
   function §\r\f§(§\x1e\f\x12§, §\x1e\r\r§, §\x1e\x19\x10§, §\x1e\x12\x0b§, §\x04\x1d§, §\x01\x04§, §\x1e\n\x1d§)
   {
      super();
      this.initialize(_loc9_ != undefined);
      this.draw(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
   }
   function initialize(§\x10\x1c§)
   {
      super.initialize();
      this.createTextField("_txtGuildName",30,0,-2 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER,0,0);
      this.createTextField("_txtSpriteName",40,0,13 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER,0,0);
      if(_loc3_)
      {
         this.createTextField("_txtTitle",31,0,-2 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER,0,0);
         this._txtTitle.embedFonts = true;
      }
   }
   function draw(§\x1e\x11\x18§, §\x1e\r\r§, §\x1e\x19\x10§, §\x1e\x12\x0b§, §\x04\x1d§, §\x01\x04§, §\x1e\n\x1d§)
   {
      var _loc9_ = _loc5_ != undefined && _loc6_ != undefined;
      if(_loc7_ == undefined)
      {
         _loc7_ = 0;
      }
      this._txtGuildName.embedFonts = true;
      this._txtGuildName.autoSize = "left";
      this._txtGuildName.text = _loc2_;
      this._txtGuildName.selectable = false;
      this._txtGuildName.setTextFormat(dofus["\r\x14"].battlefield["\x14"].TEXT_SMALL_FORMAT);
      this._txtSpriteName.embedFonts = true;
      this._txtSpriteName.autoSize = "left";
      this._txtSpriteName.text = _loc3_;
      this._txtSpriteName.selectable = false;
      this._txtSpriteName.setTextFormat(dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT);
      var _loc12_ = 0;
      if(_loc8_)
      {
         this._txtTitle.autoSize = "center";
         this._txtTitle.text = _loc8_.text;
         this._txtTitle.selectable = false;
         this._txtTitle.setTextFormat(dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT2);
         if(_loc8_.color != undefined)
         {
            this._txtTitle.textColor = _loc8_.color;
         }
         var _loc10_ = Math.ceil(30 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER * 3 + this._txtTitle.textHeight);
         var _loc13_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth) + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER * 4) + 30;
         var _loc11_ = Math.ceil(Math.max(_loc13_,this._txtTitle.textWidth + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER * 2));
         _loc12_ = dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER + this._txtTitle.textHeight;
         this._txtGuildName._x = this._txtSpriteName._x = (- _loc11_) / 2 + 30 + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER * 2;
         this._txtTitle._y = 27 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER * 2;
      }
      else
      {
         _loc10_ = Math.ceil(30 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER * 2);
         _loc11_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth) + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER * 4) + 30;
         this._txtGuildName._x = this._txtSpriteName._x = (- _loc11_) / 2 + 30 + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER * 2;
      }
      this.drawBackground(_loc11_,_loc10_,dofus["\r\x14"].battlefield["\x14"].BACKGROUND_COLOR);
      this.attachMovie("Emblem","_eEmblem",100,{_x:Math.ceil((- _loc11_) / 2) + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER,_y:dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER,_height:30,_width:30,data:_loc4_,shadow:true});
      if(_loc9_)
      {
         this.drawGfx(_loc5_,_loc6_);
         this.addPvpGfxEffect(_loc7_,_loc6_);
      }
   }
}
