class dofus.datacenter.§\x11\r§ extends Object
{
   var _oAPI;
   var Player;
   var Basics;
   var Challenges;
   var Sprites;
   var Houses;
   var Storages;
   var Game;
   var Conquest;
   var Subareas;
   var Map;
   var Temporary;
   var Exchange;
   function §\x11\r§(oAPI)
   {
      super();
      this.initialize(oAPI);
   }
   function initialize(oAPI)
   {
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
   }
   function clear()
   {
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
   }
   function clearGame()
   {
      this.Game = new dofus.datacenter.Game();
   }
}
