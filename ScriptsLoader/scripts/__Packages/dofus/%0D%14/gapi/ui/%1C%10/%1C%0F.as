class dofus.§\r\x14§.gapi.ui.§\x1c\x10§.§\x1c\x0f§
{
   function §\x1c\x0f§()
   {
   }
   static function showGaugeMode(§\n\x1c§)
   {
      if(_loc2_.api.datacenter.Player.XP == undefined || _loc2_.api.datacenter.Game.isFight)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.api.kernel.OptionsManager.getOption("BannerGaugeMode");
      if(_loc2_._mcCurrentXtraMask == _loc2_._mcCircleXtraMaskBig || _loc3_ == "none")
      {
         _loc2_.setXtraFightMask(false);
         return undefined;
      }
      _loc2_.setXtraFightMask(true);
      switch(_loc3_)
      {
         case "xp":
            var _loc4_ = Math.floor((_loc2_.api.datacenter.Player.XP - _loc2_.api.datacenter.Player.XPlow) / (_loc2_.api.datacenter.Player.XPhigh - _loc2_.api.datacenter.Player.XPlow) * 100);
            var _loc5_ = 8298148;
            break;
         case "xpmount":
            if(_loc2_.api.datacenter.Player.mount == undefined)
            {
               _loc4_ = 0;
            }
            else
            {
               _loc4_ = Math.floor((_loc2_.api.datacenter.Player.mount.xp - _loc2_.api.datacenter.Player.mount.xpMin) / (_loc2_.api.datacenter.Player.mount.xpMax - _loc2_.api.datacenter.Player.mount.xpMin) * 100);
            }
            _loc5_ = 8298148;
            break;
         case "pods":
            _loc4_ = Math.floor(_loc2_.api.datacenter.Player.currentWeight / _loc2_.api.datacenter.Player.maxWeight * 100);
            _loc5_ = 6340148;
            break;
         case "energy":
            if(_loc2_.api.datacenter.Player.EnergyMax == -1)
            {
               _loc4_ = 0;
            }
            else
            {
               _loc4_ = Math.floor(_loc2_.api.datacenter.Player.Energy / _loc2_.api.datacenter.Player.EnergyMax * 100);
            }
            _loc5_ = 10994717;
            break;
         case "xpcurrentjob":
            var _loc6_ = _loc2_.api.datacenter.Player.currentJobID;
            if(_loc6_ != undefined)
            {
               var _loc7_ = _loc2_.api.datacenter.Player.Jobs.findFirstItem("id",_loc6_).item;
               if(_loc7_.xpMax != -1)
               {
                  _loc4_ = Math.floor((_loc7_.xp - _loc7_.xpMin) / (_loc7_.xpMax - _loc7_.xpMin) * 100);
               }
               else
               {
                  _loc4_ = 0;
               }
            }
            else
            {
               _loc4_ = 0;
            }
            _loc5_ = 10441125;
      }
      if(!_global.isNaN(_loc5_))
      {
         if(_global.isNaN(_loc4_))
         {
            _loc4_ = 0;
         }
         _loc2_._ccChrono._visible = true;
         _loc2_._ccChrono.setGaugeChrono(_loc4_,_loc5_);
      }
   }
   static function setGaugeMode(§\n\x1c§, §\x1e\x12\x01§)
   {
      _loc2_._mcCurrentXtraMask = _loc3_ != "none" ? _loc2_._mcCircleXtraMask : _loc2_._mcCircleXtraMaskBig;
      var _loc4_ = _loc2_.api.kernel.OptionsManager.getOption("BannerGaugeMode");
      switch(_loc4_)
      {
         case "xp":
            _loc2_.api.datacenter.Player.removeEventListener("xpChanged",_loc2_);
            break;
         case "xpmount":
            _loc2_.api.datacenter.Player.removeEventListener("mountChanged",_loc2_);
            break;
         case "pods":
            _loc2_.api.datacenter.Player.removeEventListener("currentWeightChanged",_loc2_);
            break;
         case "energy":
            _loc2_.api.datacenter.Player.removeEventListener("energyChanged",_loc2_);
            break;
         case "xpcurrentjob":
            _loc2_.api.datacenter.Player.removeEventListener("currentJobChanged",_loc2_);
      }
      _loc2_.api.kernel.OptionsManager.setOption("BannerGaugeMode",_loc3_);
      switch(_loc3_)
      {
         case "xp":
            _loc2_.api.datacenter.Player.addEventListener("xpChanged",_loc2_);
            break;
         case "xpmount":
            _loc2_.api.datacenter.Player.addEventListener("mountChanged",_loc2_);
            break;
         case "pods":
            _loc2_.api.datacenter.Player.addEventListener("currentWeightChanged",_loc2_);
            break;
         case "energy":
            _loc2_.api.datacenter.Player.addEventListener("energyChanged",_loc2_);
            break;
         case "xpcurrentjob":
            _loc2_.api.datacenter.Player.addEventListener("currentJobChanged",_loc2_);
      }
      dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(_loc2_);
   }
   static function showGaugeModeSelectMenu(§\n\x1c§)
   {
      var _loc3_ = _loc2_.api.kernel.OptionsManager.getOption("BannerGaugeMode");
      var _loc4_ = _loc2_.api.ui.createPopupMenu();
      _loc4_.addItem(_loc2_.api.lang.getText("DISABLE"),dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"],dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].setGaugeMode,[_loc2_,"none"],_loc3_ != "none");
      _loc4_.addItem(_loc2_.api.lang.getText("WORD_XP"),dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"],dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].setGaugeMode,[_loc2_,"xp"],_loc3_ != "xp");
      _loc4_.addItem(_loc2_.api.lang.getText("WORD_XP") + " " + _loc2_.api.lang.getText("JOB"),dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"],dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].setGaugeMode,[_loc2_,"xpcurrentjob"],_loc3_ != "xpcurrentjob");
      _loc4_.addItem(_loc2_.api.lang.getText("WORD_XP") + " " + _loc2_.api.lang.getText("MOUNT"),dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"],dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].setGaugeMode,[_loc2_,"xpmount"],_loc3_ != "xpmount");
      _loc4_.addItem(_loc2_.api.lang.getText("WEIGHT"),dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"],dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].setGaugeMode,[_loc2_,"pods"],_loc3_ != "pods");
      _loc4_.addItem(_loc2_.api.lang.getText("ENERGY"),dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"],dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].setGaugeMode,[_loc2_,"energy"],_loc3_ != "energy");
      _loc4_.show(_root._xmouse,_root._ymouse,true);
   }
}
