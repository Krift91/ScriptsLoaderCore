class dofus.datacenter.Basics extends dofus.§\x1e\n\x07§.§\x1d\x19§
{
   var _sLogin;
   var _aks_infos_highlightCoords;
   var _banner_targetCoords;
   var connexionKey;
   var lastPingTimer;
   var gfx_lastActionTime;
   var gfx_canLaunch;
   var gfx_lastArea;
   var lastDateUpdate;
   var aks_server_will_disconnect;
   var aks_gifts_stack;
   var aks_chat_lastActionTime;
   var chat_type_visible;
   var aks_emote_lastActionTime;
   var aks_exchange_echangeType;
   var aks_infos_lifeRestoreInterval;
   var aks_ticket;
   var aks_gameserver_ip;
   var aks_gameserver_port;
   var aks_rescue_count;
   var aks_servers;
   var aks_current_server;
   var aks_identity;
   var aks_a_logs;
   var aks_a_prompt;
   var aks_debug_command_line;
   var spellManager_errorMsg;
   var interactionsManager_path;
   var inventory_filter;
   var payzone_isFirst;
   var quests_lastID;
   var craftViewer_filter;
   var mapExplorer_filter;
   var mapExplorer_zoom;
   var mapExplorer_coord;
   var mapExplorer_grid;
   var isLogged;
   var inGame;
   var serverMessageID;
   var createCharacter;
   var chatParams;
   var aks_current_team;
   var aks_team1_starts;
   var aks_team2_starts;
   var inactivity_signaled;
   var first_connection_from_miniclip;
   var first_movement;
   var canUseSeeAllSpell;
   var aks_current_regional_version = Number.POSITIVE_INFINITY;
   function Basics()
   {
      super();
      this.initialize();
   }
   function set login(§\x1e\x10\x0b§)
   {
      this._sLogin = _loc2_.toLowerCase();
   }
   function get login()
   {
      return this._sLogin;
   }
   function get aks_infos_highlightCoords()
   {
      return this._aks_infos_highlightCoords;
   }
   function set aks_infos_highlightCoords(§\b§)
   {
      this._aks_infos_highlightCoords = _loc2_;
      this.api.ui.getUIComponent("Banner").illustration.updateFlags();
   }
   function set banner_targetCoords(§\b§)
   {
      this._banner_targetCoords = _loc2_;
      this.api.ui.getUIComponent("Banner").illustration.updateFlags();
   }
   function get banner_targetCoords()
   {
      return this._banner_targetCoords;
   }
   function team(§\x1e\x1c\x04§)
   {
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = this.api.datacenter.Sprites.getItems();
      for(var i in _loc4_)
      {
         if(this.api.datacenter.Sprites.getItemAt(i).Team == _loc2_)
         {
            _loc3_.push(this.api.datacenter.Sprites.getItemAt(i));
         }
      }
      return _loc3_;
   }
   function initialize()
   {
      delete this.connexionKey;
      delete this.lastPingTimer;
      delete this.gfx_lastActionTime;
      delete this.gfx_canLaunch;
      delete this.gfx_lastArea;
      this.lastDateUpdate = -1000000;
      this.aks_server_will_disconnect = false;
      this.aks_gifts_stack = new Array();
      delete this.aks_chat_lastActionTime;
      this.chat_type_visible = new Object();
      delete this.aks_emote_lastActionTime;
      delete this.aks_exchange_echangeType;
      _global.clearInterval(this.aks_infos_lifeRestoreInterval);
      delete this.aks_infos_lifeRestoreInterval;
      delete this.aks_infos_highlightCoords;
      delete this.aks_ticket;
      delete this.aks_gameserver_ip;
      delete this.aks_gameserver_port;
      this.aks_rescue_count = -1;
      this.aks_servers = new ank["\x1e\n\x07"]["\x0f\x01"]();
      delete this.aks_current_server;
      delete this.aks_identity;
      if(this.aks_a_logs == undefined)
      {
         this.aks_a_logs = "";
      }
      this.aks_a_prompt = "";
      this.aks_debug_command_line = "";
      delete this.spellManager_errorMsg;
      delete this.interactionsManager_path;
      delete this.inventory_filter;
      delete this.banner_targetCoords;
      this.payzone_isFirst = true;
      delete this.quests_lastID;
      this.craftViewer_filter = [true,true,true,true,true,true,true,true];
      this.mapExplorer_filter = [false,false,true,false,true];
      this.mapExplorer_zoom = 50;
      this.mapExplorer_coord = undefined;
      this.mapExplorer_grid = false;
      this.isLogged = false;
      this.inGame = false;
      this.serverMessageID = -1;
      this.createCharacter = false;
      this.chatParams = new Object();
      this.aks_current_team = -1;
      this.aks_team1_starts = null;
      this.aks_team2_starts = null;
      this.inactivity_signaled = 0;
      this.first_connection_from_miniclip = false;
      this.first_movement = false;
      this.canUseSeeAllSpell = true;
      _global.API.kernel.SpellsBoostsManager.clear();
   }
   function aks_infos_highlightCoords_clear(§\x05\x01§)
   {
      if(_global.isNaN(_loc2_))
      {
         this._aks_infos_highlightCoords = new Array();
      }
      else
      {
         var _loc3_ = new Array();
         var _loc4_ = 0;
         while(_loc4_ < this._aks_infos_highlightCoords.length)
         {
            if(this._aks_infos_highlightCoords[_loc4_].type != _loc2_)
            {
               _loc3_.push(this._aks_infos_highlightCoords[_loc4_]);
            }
            _loc4_ = _loc4_ + 1;
         }
         this._aks_infos_highlightCoords = _loc3_;
      }
      this.api.ui.getUIComponent("Banner").illustration.updateFlags();
   }
}
