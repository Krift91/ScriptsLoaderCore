_loc1 = _global.dofus.datacenter["\x11\r"].prototype;
_loc1.initialize = function(oAPI)
{
   trace("DATACENTER INITIALIZE");
   this._oAPI = oAPI;
   this.Player = new dofus.datacenter["\x0b\r"](oAPI);
   this.Basics = new dofus.datacenter.Basics();
   this.Challenges = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Sprites = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Houses = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Storages = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Game = new dofus.datacenter.Game();
   this.Conquest = new dofus.datacenter.Conquest();
   this.Subareas = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Map = new dofus.datacenter["\x10\x15"]();
   this.Temporary = new Object();
   this.PlayerReal = this.Player;
   this.Heroes = new Object();
};
_loc1.clear = function()
{
   trace("DATACENTER CLEAR");
   this.Player = new dofus.datacenter["\x0b\r"](this._oAPI);
   this.Basics.initialize();
   this.Challenges = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Sprites = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Houses = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Storages = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Game = new dofus.datacenter.Game();
   this.Conquest = new dofus.datacenter.Conquest();
   this.Subareas = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Map = new dofus.datacenter["\x10\x15"]();
   this.Temporary = new Object();
   delete this.Exchange;
   this.PlayerReal = this.Player;
   this.Heroes = new Object();
};
_loc1.setPlayerReal = function(id)
{
   if(this.Heroes[id] == undefined)
   {
      return undefined;
   }
   this.PlayerReal = this.Heroes[id];
   this.Player = this.PlayerReal;
};
_loc1.refresh = function()
{
   this.Player = this.PlayerReal;
};
_loc1.change = function(id)
{
   if(id == undefined || this.Player.ID == id)
   {
      return false;
   }
   this.Player = this.getHero(id);
   return true;
};
_loc1.getHero = function(id)
{
   if(id == undefined)
   {
      return this.Player;
   }
   if(this.Heroes[id] == undefined)
   {
      this.Heroes[id] = new dofus.datacenter["\x0b\r"](this._oAPI);
   }
   return this.Heroes[id];
};
