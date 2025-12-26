class ank.gapi.controls.§\x1e\x15\x05§ extends ContextMenu
{
   var onSelect;
   function §\x1e\x15\x05§(oAPI, callbackFunction)
   {
      super(callbackFunction);
      this.hideBuiltInItems();
      var proto = ank.gapi.controls["\x1e\x15\x05"].prototype;
      this.onSelect = function()
      {
         proto.onRightClick(oAPI);
      };
   }
   function onRightClick(§\x1d\x1a§)
   {
      _loc2_.ui.hideTooltip();
      var _loc3_ = ank.gapi.controls.PopupMenu.currentPopupMenu;
      if(_loc3_ != undefined)
      {
         _loc3_.onMouseUp();
      }
      _loc2_.mouseClicksMemorizer.storeCurrentMouseClick(true);
      if(_loc2_.gfx.rollOverMcSprite != undefined && !(_loc2_.gfx.rollOverMcSprite.data instanceof dofus.datacenter["\x13\x01"]))
      {
         _loc2_.gfx.onSpriteRelease(_loc2_.gfx.rollOverMcSprite,true);
         return undefined;
      }
      if(_loc2_.gfx.rollOverMcObject != undefined)
      {
         _loc2_.gfx.onObjectRelease(_loc2_.gfx.rollOverMcObject,true);
         return undefined;
      }
      var _loc4_ = 0;
      while(_loc4_ < dofus.Constants.INTERFACES_MANIPULATING_ITEMS.length)
      {
         var _loc5_ = _loc2_.ui.getUIComponent(dofus.Constants.INTERFACES_MANIPULATING_ITEMS[_loc4_]);
         var _loc6_ = _loc5_.currentOverItem;
         if(_loc6_ != undefined)
         {
            _loc5_.itemViewer.createActionPopupMenu(_loc6_);
            return undefined;
         }
         _loc4_ = _loc4_ + 1;
      }
      if(_loc2_.datacenter.Basics.inGame && _loc2_.datacenter.Player.isAuthorized)
      {
         var _loc7_ = _loc2_.kernel.AdminManager.getAdminPopupMenu(_loc2_.datacenter.Player.Name,true);
         _loc7_.addItem("Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + " >>",this,this.printRightClickPopupMenu,[_loc2_]);
         _loc7_.items.unshift(_loc7_.items.pop());
         _loc7_.show(_root._xmouse,_root._ymouse,true);
      }
      else
      {
         this.printRightClickPopupMenu(_loc2_);
      }
   }
   function printRightClickPopupMenu(api)
   {
      var _loc2_ = api.ui.createPopupMenu();
      _loc2_.addStaticItem("DOFUS RETRO Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION);
      _loc2_.addStaticItem("Flash player " + System.capabilities.version);
      var o = new Object();
      var gapi = api.ui;
      o.selectQualities = function()
      {
         var _loc2_ = gapi.createPopupMenu();
         _loc2_.addStaticItem(api.lang.getText("OPTION_DEFAULTQUALITY"));
         _loc2_.addItem(api.lang.getText("QUALITY_LOW"),o,o.setQualityOption,["low"],o.getOption("DefaultQuality") != "low");
         _loc2_.addItem(api.lang.getText("QUALITY_MEDIUM"),o,o.setQualityOption,["medium"],o.getOption("DefaultQuality") != "medium");
         _loc2_.addItem(api.lang.getText("QUALITY_HIGH"),o,o.setQualityOption,["high"],o.getOption("DefaultQuality") != "high");
         _loc2_.addItem(api.lang.getText("QUALITY_BEST"),o,o.setQualityOption,["best"],o.getOption("DefaultQuality") != "best");
         _loc2_.show();
      };
      o.setQualityOption = function(§\x1e\x0e\t§)
      {
         o.setOption("DefaultQuality",_loc2_);
      };
      o.setOption = function(§\x1e\x11\x03§, §\t\x06§)
      {
         api.kernel.OptionsManager.setOption(_loc2_,_loc3_);
      };
      o.getOption = function(§\x1e\x11\x03§)
      {
         return api.kernel.OptionsManager.getOption(_loc2_);
      };
      _loc2_.addItem(api.lang.getText("OPTION_DEFAULTQUALITY") + " >>",o,o.selectQualities);
      _loc2_.addItem(api.lang.getText("OPTIONS"),gapi,gapi.loadUIComponent,["Options","Options",{_y:(gapi.screenHeight != 432 ? 0 : -50)},{bAlwaysOnTop:true}]);
      _loc2_.addItem(api.lang.getText("OPTION_MOVABLEBAR"),o,o.setOption,["MovableBar",!o.getOption("MovableBar")]);
      _loc2_.show(_root._xmouse,_root._ymouse,true);
   }
}
