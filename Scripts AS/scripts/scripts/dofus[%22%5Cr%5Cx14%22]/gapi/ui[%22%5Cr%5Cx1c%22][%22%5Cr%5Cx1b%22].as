var _loc1 = dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].prototype;
dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].MAX_DROPS_DISPLAYED = 10;
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   this._oItems = oItem;
   if(bUsed)
   {
      switch(oItem.type)
      {
         case "monster":
         case "taxcollector":
         case "player":
            this._lblName.text = oItem.name;
            if(_global.isNaN(oItem.xp) || _global.isNaN(oItem.winxp))
            {
               this._pbXP._visible = false;
            }
            else
            {
               this._pbXP._visible = true;
               var _loc12_ = null;
               this._pbXP.uberMinimum = _loc12_ = oItem.minxp;
               this._pbXP.minimum = _loc12_;
               this._pbXP.uberMaximum = _loc12_ = oItem.level == 200 ? -1 : oItem.maxxp;
               this._pbXP.maximum = _loc12_;
               this._pbXP.value = oItem.xp;
               this._pbXP.uberValue = oItem.xp - (!!_global.isNaN(oItem.winxp) ? 0 : oItem.winxp);
            }
            this._lblWinXP.text = !!_global.isNaN(oItem.winxp) ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.winxp).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblGuildXP.text = !!_global.isNaN(oItem.guildxp) ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.guildxp).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblMountXP.text = !!_global.isNaN(oItem.mountxp) ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.mountxp).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblKama.text = !!_global.isNaN(oItem.kama) ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.kama).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblLevel.text = oItem.level;
            if(oItem.bDead)
            {
               this._ldrGuild.contentPath = "";
               this._mcDeadHead._visible = true;
            }
            else
            {
               this._ldrGuild.contentPath = dofus.Constants.GUILDS_MINI_PATH + oItem.gfx + ".swf";
               this._mcDeadHead._visible = false;
            }
            this.createEmptyMovieClip("_mcItems",10);
            var _loc5_ = false;
            var _loc6_ = oItem.items.length;
            while((_loc6_ -= 1) >= 0)
            {
               var _loc8_ = this._mcItemPlacer._x + 24 * _loc6_;
               if(_loc8_ < this._mcItemPlacer._x + this._mcItemPlacer._width)
               {
                  var _loc9_ = oItem.items[_loc6_];
                  var _loc3_ = this._mcItems.attachMovie("Container","_ctrItem" + _loc6_,_loc6_,{_x:_loc8_,_y:this._mcItemPlacer._y + 1});
                  _loc3_.setSize(18,18);
                  _loc3_.addEventListener("over",this);
                  _loc3_.addEventListener("out",this);
                  _loc3_.addEventListener("click",this);
                  _loc3_.enabled = true;
                  _loc3_.margin = 0;
                  _loc3_.contentData = _loc9_;
               }
               else
               {
                  _loc5_ = true;
               }
            }
            _loc5_ = 0;
            var _loc13_ = oItem.items.length;
            while(_loc5_ < dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].MAX_DROPS_DISPLAYED)
            {
               var _loc7_ = this["_ctr" + _loc5_];
               _loc7_.contentData = oItem.items[_loc5_];
               _loc7_._visible = _loc7_.contentData != undefined;
               _loc5_ += 1;
            }
            this._ldrAllDrop._visible = _loc13_ > dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].MAX_DROPS_DISPLAYED;
      }
   }
   else if(this._lblName.text != undefined)
   {
      this._pbXP._visible = false;
      this._lblName.text = "";
      this._pbXP.minimum = 0;
      this._pbXP.maximum = 100;
      this._pbXP.value = 0;
      this._pbXP.uberValue = 0;
      this._lblWinXP.text = "";
      this._lblKama.text = "";
      this._mcDeadHead._visible = false;
      this._mcItems.removeMovieClip();
      this._ldrAllDrop._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcDeadHead._visible = false;
   this._ldrXP._visible = false;
   this._ldrGuild._visible = false;
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   var _loc4_ = this;
   this._ldrAllDrop.addEventListener("over",this);
   this._ldrAllDrop.addEventListener("out",this);
   this._pbXP.enabled = true;
   this._pbXP.addEventListener("over",this);
   this._pbXP.addEventListener("out",this);
   this._ldrXP.addEventListener("over",this);
   this._ldrXP.addEventListener("out",this);
   var _loc2_ = 0;
   while(_loc2_ < dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].MAX_DROPS_DISPLAYED)
   {
      var _loc3_ = this["_ctr" + _loc2_];
      _loc3_.addEventListener("over",this);
      _loc3_.addEventListener("out",this);
      _loc2_ += 1;
   }
};
