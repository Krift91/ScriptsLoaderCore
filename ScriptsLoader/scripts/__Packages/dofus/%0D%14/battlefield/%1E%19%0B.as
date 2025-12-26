class dofus.§\r\x14§.battlefield.§\x1e\x19\x0b§ extends dofus.§\r\x14§.battlefield.§\x14§
{
   var _txtSpriteName;
   var _txtGuildName;
   static var BACKGROUND_COLOR = 13421772;
   function §\x1e\x19\x0b§(oSprite)
   {
      super();
      this.initialize();
      this.draw(oSprite);
   }
   function initialize()
   {
      super.initialize();
      this.createTextField("_txtGuildName",30,0,-2 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER,0,0);
      this.createTextField("_txtSpriteName",40,0,13 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER,0,0);
   }
   function draw(oSprite)
   {
      var _loc3_ = oSprite.guildName != undefined && oSprite.guildName.length != 0;
      this._txtSpriteName.embedFonts = true;
      this._txtSpriteName.autoSize = "left";
      this._txtSpriteName.text = oSprite.name;
      this._txtSpriteName.selectable = false;
      this._txtSpriteName.setTextFormat(dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT);
      this._txtSpriteName.textColor = 0;
      if(_loc3_)
      {
         this._txtGuildName.embedFonts = true;
         this._txtGuildName.autoSize = "left";
         this._txtGuildName.text = oSprite.guildName;
         this._txtGuildName.selectable = false;
         this._txtGuildName.setTextFormat(dofus["\r\x14"].battlefield["\x14"].TEXT_SMALL_FORMAT);
         this._txtGuildName.textColor = 0;
      }
      var _loc4_ = Math.ceil(30 + dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER * 2);
      var _loc5_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth) + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER * 4) + 30;
      this._txtGuildName._x = this._txtSpriteName._x = (- _loc5_) / 2 + 30 + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER * 2;
      if(!_loc3_)
      {
         this._txtSpriteName._y = 9;
      }
      this.drawBackground(_loc5_,_loc4_,16777215);
      this.attachMovie("Loader","_ldrIcon",100,{_x:Math.ceil((- _loc5_) / 2) + dofus["\r\x14"].battlefield["\x14"].WIDTH_SPACER,_y:dofus["\r\x14"].battlefield["\x14"].HEIGHT_SPACER,_height:30,_width:30,contentPath:dofus.Constants.EXTRA_PATH + oSprite.offlineType + ".swf",scaleContent:true});
   }
}
