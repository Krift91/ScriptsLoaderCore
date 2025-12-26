var _loc1 = dofus.aks.Exchange.prototype;
_loc1.transfertItems = function(_loc2_, _loc3_)
{
   this.aks.send("EMA" + _loc2_ + _loc3_,true);
};
_loc1.movementOgrine = function(_loc2_)
{
   this.aks.send("EMS" + _loc2_,true);
};
_loc1.getItemActualPriceInBigStore = function(_loc2_)
{
   this.aks.send(_loc2_);
};
_loc1.repeatCraft = function(nHowManyTimes)
{
   if(Number(nHowManyTimes) == 1)
   {
      this.aks.send("EMR1",false);
   }
   else
   {
      this._nItemsToCraft = nHowManyTimes - 1;
      this.aks.send("EMR" + nHowManyTimes,false);
      this.api.datacenter.Basics.isCraftLooping = true;
   }
};
_loc1.onLocalMovement = function(bSuccess, sExtraData)
{
   this.modifyLocal(sExtraData,this.api.datacenter.Exchange.localGarbage,"localKama","localOgrine");
};
_loc1.modifyLocal = function(sExtraData, ea, sKamaLocation, sOgrineLocation)
{
   var _loc16_ = sExtraData.charAt(0);
   var _loc3_ = this.api.datacenter.Exchange;
   switch(_loc16_)
   {
      case "O":
         var _loc17_ = sExtraData.charAt(1) == "+";
         var _loc8_ = sExtraData.substr(2).split("|");
         var _loc5_ = Number(_loc8_[0]);
         var _loc10_ = Number(_loc8_[1]);
         var _loc9_ = this.api.datacenter.Player.Inventory.findFirstItem("ID",_loc5_);
         var _loc2_ = _loc3_.inventory.findFirstItem("ID",_loc5_);
         var _loc4_ = ea.findFirstItem("ID",_loc5_);
         if(_loc17_)
         {
            var _loc11_ = _loc2_.item;
            var _loc12_ = new dofus.datacenter["\f\f"](_loc5_,_loc11_.unicID,_loc10_,-2,_loc11_.compressedEffects);
            var _loc15_ = -1;
            var _loc13_ = _loc9_.item.Quantity - _loc10_;
            if(_loc13_ == 0)
            {
               _loc15_ = -3;
            }
            _loc2_.item.Quantity = _loc13_;
            _loc2_.item.position = _loc15_;
            _loc3_.inventory.updateItem(_loc2_.index,_loc2_.item);
            if(_loc4_.index != -1)
            {
               ea.updateItem(_loc4_.index,_loc12_);
            }
            else
            {
               ea.push(_loc12_);
            }
         }
         else if(_loc4_.index != -1)
         {
            _loc2_.item.position = -1;
            _loc2_.item.Quantity = _loc9_.item.Quantity;
            _loc3_.inventory.updateItem(_loc2_.index,_loc2_.item);
            ea.removeItems(_loc4_.index,1);
         }
         break;
      case "G":
         var _loc6_ = Number(sExtraData.substr(1));
         _loc3_[sKamaLocation] = _loc6_;
         break;
      case "S":
         _loc6_ = Number(sExtraData.substr(1));
         _loc3_[sOgrineLocation] = _loc6_;
   }
};
_loc1.modifyDistant = function(sExtraData, ea, sKamaLocation, bForceModifyInventory, sOgrineLocation)
{
   var _loc16_ = sExtraData.charAt(0);
   var _loc3_ = this.api.datacenter.Exchange;
   switch(_loc16_)
   {
      case "O":
         var _loc15_ = sExtraData.charAt(1) == "+";
         var _loc7_ = sExtraData.substr(2).split("|");
         var _loc8_ = Number(_loc7_[0]);
         var _loc9_ = Number(_loc7_[1]);
         var _loc14_ = Number(_loc7_[2]);
         var _loc13_ = _loc7_[3];
         var _loc6_ = ea.findFirstItem("ID",_loc8_);
         if(_loc15_)
         {
            var _loc5_ = new dofus.datacenter["\f\f"](_loc8_,_loc14_,_loc9_,-1,_loc13_);
            var _loc17_ = bForceModifyInventory == undefined ? _loc3_.distantPlayerID == undefined : bForceModifyInventory;
            if(_loc6_.index != -1)
            {
               ea.updateItem(_loc6_.index,_loc5_);
            }
            else
            {
               ea.push(_loc5_);
            }
            if(_loc17_)
            {
               var _loc4_ = _loc3_.inventory.findFirstItem("ID",_loc8_);
               if(_loc4_.index != -1)
               {
                  _loc4_.item.position = -1;
                  if(this.api.datacenter.Basics.aks_exchange_isForgemagus)
                  {
                     _loc4_.item.Quantity = Number(_loc9_);
                     this.api.ui.getUIComponent("Craft").updateDistantData();
                  }
                  else
                  {
                     _loc4_.item.Quantity = Number(_loc4_.item.Quantity) + Number(_loc9_);
                  }
                  _loc3_.inventory.updateItem(_loc4_.index,_loc5_);
               }
               else
               {
                  _loc3_.inventory.push(_loc5_);
                  _global.API.ui.getUIComponent("Craft").updateForgemagusResult(_loc5_);
               }
            }
         }
         else if(_loc6_.index != -1)
         {
            ea.removeItems(_loc6_.index,1);
         }
         break;
      case "G":
         var _loc10_ = Number(sExtraData.substr(1));
         _loc3_[sKamaLocation] = _loc10_;
         break;
      case "S":
         _loc10_ = Number(sExtraData.substr(1));
         _loc3_[sOgrineLocation] = _loc10_;
   }
};
_loc1.onDistantMovement = function(bSuccess, sExtraData)
{
   switch(this.api.datacenter.Basics.aks_exchange_echangeType)
   {
      case 1:
      case 2:
      case 3:
      case 9:
      case 12:
      case 13:
         this.modifyDistant(sExtraData,this.api.datacenter.Exchange.distantGarbage,"distantKama",undefined,"distantOgrine");
         break;
      case 10:
         var _loc10_ = sExtraData.charAt(0) == "+";
         var _loc2_ = sExtraData.substr(1).split("|");
         var _loc7_ = Number(_loc2_[0]);
         var _loc9_ = Number(_loc2_[1]);
         var _loc13_ = Number(_loc2_[2]);
         var _loc8_ = _loc2_[3];
         var _loc11_ = Number(_loc2_[4]);
         var _loc12_ = Number(_loc2_[5]);
         var _loc3_ = this.api.datacenter.Temporary.Shop;
         var _loc4_ = _loc3_.inventory.findFirstItem("ID",_loc7_);
         if(_loc10_)
         {
            var _loc5_ = new dofus.datacenter["\f\f"](_loc7_,_loc13_,_loc9_,-1,_loc8_,_loc11_);
            _loc5_.remainingHours = _loc12_;
            if(_loc4_.index != -1)
            {
               _loc3_.inventory.updateItem(_loc4_.index,_loc5_);
            }
            else
            {
               _loc3_.inventory.push(_loc5_);
            }
         }
         else if(_loc4_.index != -1)
         {
            _loc3_.inventory.removeItems(_loc4_.index,1);
         }
         else
         {
            ank.utils.Logger.err("[onDistantMovement] cet objet n\'existe pas id=" + _loc7_);
         }
         var _loc6_ = this.api.ui.getUIComponent("BigStoreSell");
         if(_loc6_ != undefined)
         {
            _loc6_.updateItemCount();
            _loc6_.refreshRemoveButton();
            break;
         }
   }
};
_loc1.onBigStoreItemsList = function(_loc2_)
{
   var _loc10_ = _loc2_.split("|");
   var _loc16_ = Number(_loc10_[0]);
   _loc10_.shift();
   var _loc17_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   for(var _loc18_ in _loc10_)
   {
      var _loc2_ = _loc10_[_loc18_].split(";");
      var _loc3_ = Number(_loc2_[0]);
      var _loc9_ = _loc2_[1];
      var _loc5_ = Number(_loc2_[2]);
      var _loc7_ = Number(_loc2_[3]);
      var _loc8_ = Number(_loc2_[4]);
      var _loc6_ = new dofus.datacenter["\f\f"](_loc3_,_loc16_,0,-1,_loc9_,0);
      var _loc4_ = {id:_loc3_,item:_loc6_,priceSet1:_loc5_,priceSet2:_loc7_,priceSet3:_loc8_};
      if(this.api.ui.getUIComponent("BigStoreSell") != null)
      {
         this.api.ui.getUIComponent("BigStoreSell").setItemStats(_loc4_);
         return undefined;
      }
      _loc17_.push(_loc4_);
   }
   this.api.datacenter.Temporary.Shop.inventory2 = _loc17_;
   this.api.ui.getUIComponent("BigStoreBuy").setItem(_loc16_);
};
_loc1.onList = function(sExtraData)
{
   switch(this.api.datacenter.Basics.aks_exchange_echangeType)
   {
      case 0:
      case 20:
         var _loc27_ = sExtraData.split("|");
         var _loc30_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(var _loc34_ in _loc27_)
         {
            var _loc2_ = _loc27_[_loc34_].split(";");
            var _loc17_ = Number(_loc2_[0]);
            var _loc23_ = _loc2_[1];
            var _loc8_ = _loc2_[2];
            var _loc3_ = new dofus.datacenter["\f\f"](0,_loc17_,undefined,undefined,_loc23_,_loc8_);
            _loc3_.priceMultiplicator = this.api.lang.getConfigText("BUY_PRICE_MULTIPLICATOR");
            _loc3_.itemPago = _loc2_[3] != undefined ? Number(_loc2_[3]) : 0;
            _loc3_.chapa = _loc2_[4] != undefined ? Number(_loc2_[4]) : 0;
            _loc30_.push(_loc3_);
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc30_;
         break;
      case 5:
      case 15:
      case 8:
         var _loc11_ = sExtraData.split(";");
         _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc11_)
         {
            var _loc6_ = _loc11_[_loc34_];
            var _loc9_ = _loc6_.charAt(0);
            var _loc7_ = _loc6_.substr(1);
            switch(_loc9_)
            {
               case "O":
                  var _loc10_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc7_);
                  _loc8_.push(_loc10_);
                  break;
               case "G":
                  this.onStorageKama(_loc7_);
            }
         }
         this.api.datacenter.Temporary.Storage.inventory = _loc8_;
         if(dofus["\x12\x03"].SAVING_THE_WORLD)
         {
            dofus["\x1e\x14\x10"].getInstance().newItems(sExtraData);
            dofus["\x1e\x14\x10"].getInstance().nextAction();
         }
         break;
      case 4:
      case 6:
         var _loc28_ = sExtraData.split("|");
         var _loc31_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc28_)
         {
            var _loc5_ = _loc28_[_loc34_].split(";");
            var _loc13_ = Number(_loc5_[0]);
            var _loc15_ = Number(_loc5_[1]);
            var _loc25_ = Number(_loc5_[2]);
            var _loc21_ = _loc5_[3];
            var _loc22_ = Number(_loc5_[4]);
            var _loc19_ = new dofus.datacenter["\f\f"](_loc13_,_loc25_,_loc15_,-1,_loc21_,_loc22_);
            _loc3_.itemPago = _loc2_[5] != undefined ? Number(_loc2_[5]) : 0;
            _loc31_.push(_loc19_);
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc31_;
         break;
      case 10:
         var _loc29_ = sExtraData.split("|");
         var _loc32_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         if(sExtraData.length != 0)
         {
            for(_loc34_ in _loc29_)
            {
               var _loc4_ = _loc29_[_loc34_].split(";");
               var _loc24_ = Number(_loc4_[0]);
               var _loc14_ = Number(_loc4_[1]);
               var _loc20_ = Number(_loc4_[2]);
               var _loc26_ = _loc4_[3];
               var _loc16_ = Number(_loc4_[4]);
               var _loc18_ = Number(_loc4_[5]);
               var _loc12_ = new dofus.datacenter["\f\f"](_loc24_,_loc20_,_loc14_,-1,_loc26_,_loc16_);
               _loc3_.itemPago = _loc2_[6] != undefined ? Number(_loc2_[6]) : 0;
               _loc12_.remainingHours = _loc18_;
               _loc32_.push(_loc12_);
            }
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc32_;
         break;
      case 30:
         _loc11_ = sExtraData.split(";");
         _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc11_)
         {
            _loc6_ = _loc11_[_loc34_];
            _loc9_ = _loc6_.charAt(0);
            _loc7_ = _loc6_.substr(1);
            var _loc0_ = null;
            if((_loc0_ = _loc9_) === "O")
            {
               _loc10_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc7_);
               _loc8_.push(_loc10_);
            }
         }
         this.api.datacenter.Player.Bank = _loc8_;
   }
};
_loc1.transfertToExchange = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO+" + _loc2_);
   a += 1;
};
_loc1.transfertToNoExchange = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO-" + _loc2_);
   a += 1;
};
_loc1.onCreate = function(_loc2_, _loc3_)
{
   if(!_loc2_)
   {
      return undefined;
   }
   this._lastMovedItemId = -1;
   var _loc7_ = _loc3_.split("|");
   var _loc19_ = Number(_loc7_[0]);
   var _loc15_ = _loc7_[1];
   this.api.datacenter.Basics.aks_exchange_echangeType = _loc19_;
   var _loc5_ = this.api.datacenter.Temporary;
   var _loc24_ = undefined;
   if(this.api.datacenter.Player.ID != this.api.datacenter.PlayerReal.ID)
   {
      _loc24_ = this.api.datacenter.Player.ID;
   }
   switch(_loc19_)
   {
      case 0:
      case 4:
         _loc5_.Shop = new dofus.datacenter.Shop();
         var _loc14_ = this.api.datacenter.Sprites.getItemAt(_loc15_);
         _loc5_.Shop.id = _loc14_.id;
         _loc5_.Shop.name = _loc14_.name;
         _loc5_.Shop.gfx = _loc14_.gfxID;
         var _loc20_ = new Array();
         _loc20_[1] = _loc14_.color1 == undefined ? -1 : _loc14_.color1;
         _loc20_[2] = _loc14_.color2 == undefined ? -1 : _loc14_.color2;
         _loc20_[3] = _loc14_.color3 == undefined ? -1 : _loc14_.color3;
         if(_loc19_ == 0)
         {
            this.api.ui.loadUIComponent("NpcShop","NpcShop",{data:_loc5_.Shop,colors:_loc20_});
         }
         else if(_loc19_ == 4)
         {
            this.api.ui.loadUIComponent("PlayerShop","PlayerShop",{data:_loc5_.Shop,colors:_loc20_});
         }
         break;
      case 1:
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
         this.api.ui.unloadUIComponent("AskCancelExchange");
         this.api.ui.loadUIComponent("Exchange","Exchange");
         break;
      case 2:
      case 9:
      case 17:
      case 18:
      case 3:
         if(_loc19_ == 3)
         {
            this.api.datacenter.Exchange = new dofus.datacenter.Exchange();
         }
         else
         {
            this.api.datacenter.Exchange = new dofus.datacenter.Exchange(Number(_loc15_));
         }
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         if(_loc19_ == 3)
         {
            _loc7_ = _loc15_.split(";");
            var _loc26_ = Number(_loc7_[0]);
            var _loc23_ = Number(_loc7_[1]);
            if(_global.API.lang.getSkillForgemagus(_loc23_) > 0)
            {
               this.api.ui.loadUIComponent("ForgemagusCraft","Craft",{skillId:_loc23_,maxItem:_loc26_});
            }
            else
            {
               this.api.ui.loadUIComponent("Craft","Craft",{skillId:_loc23_,maxItem:_loc26_});
            }
         }
         else
         {
            this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
            this.api.ui.unloadUIComponent("AskCancelExchange");
            this.api.ui.loadUIComponent("Exchange","Exchange");
         }
         break;
      case 5:
         _loc5_.Storage = new dofus.datacenter.Storage();
         this.api.ui.loadUIComponent("Storage","Storage",{data:_loc5_.Storage,heroID:_loc24_});
         break;
      case 8:
         _loc5_.Storage = new dofus.datacenter.TaxCollectorStorage();
         var _loc25_ = this.api.datacenter.Sprites.getItemAt(_loc15_);
         _loc5_.Storage.name = _loc25_.name;
         _loc5_.Storage.gfx = _loc25_.gfxID;
         this.api.ui.loadUIComponent("TaxCollectorStorage","TaxCollectorStorage",{data:_loc5_.Storage});
         break;
      case 6:
         _loc5_.Shop = new dofus.datacenter.Shop();
         this.api.ui.loadUIComponent("PlayerShopModifier","PlayerShopModifier",{data:_loc5_.Shop});
         break;
      case 10:
         _loc5_.Shop = new dofus.datacenter["\x19\x01"]();
         _loc7_ = _loc15_.split(";");
         var _loc22_ = _loc7_[0].split(",");
         _loc5_.Shop.quantity1 = Number(_loc22_[0]);
         _loc5_.Shop.quantity2 = Number(_loc22_[1]);
         _loc5_.Shop.quantity3 = Number(_loc22_[2]);
         _loc5_.Shop.types = _loc7_[1].split(",");
         _loc5_.Shop.tax = Number(_loc7_[2]);
         _loc5_.Shop.maxLevel = Number(_loc7_[3]);
         _loc5_.Shop.maxItemCount = Number(_loc7_[4]);
         _loc5_.Shop.npcID = Number(_loc7_[5]);
         _loc5_.Shop.maxSellTime = Number(_loc7_[6]);
         this.api.ui.loadUIComponent("BigStoreSell","BigStoreSell",{data:_loc5_.Shop});
         break;
      case 11:
         _loc5_.Shop = new dofus.datacenter["\x19\x01"]();
         _loc7_ = _loc15_.split(";");
         var _loc21_ = _loc7_[0].split(",");
         _loc5_.Shop.quantity1 = Number(_loc21_[0]);
         _loc5_.Shop.quantity2 = Number(_loc21_[1]);
         _loc5_.Shop.quantity3 = Number(_loc21_[2]);
         _loc5_.Shop.types = _loc7_[1].split(",");
         _loc5_.Shop.tax = Number(_loc7_[2]);
         _loc5_.Shop.maxLevel = Number(_loc7_[3]);
         _loc5_.Shop.maxItemCount = Number(_loc7_[4]);
         _loc5_.Shop.npcID = Number(_loc7_[5]);
         _loc5_.Shop.maxSellTime = Number(_loc7_[6]);
         this.api.ui.loadUIComponent("BigStoreBuy","BigStoreBuy",{data:_loc5_.Shop});
         break;
      case 12:
      case 13:
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         _loc7_ = _loc15_.split(";");
         var _loc28_ = Number(_loc7_[0]);
         var _loc27_ = Number(_loc7_[1]);
         this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
         this.api.ui.unloadUIComponent("AskCancelExchange");
         this.api.ui.loadUIComponent("SecureCraft","SecureCraft",{skillId:_loc27_,maxItem:_loc28_});
         break;
      case 14:
         var _loc16_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         var _loc11_ = _loc15_.split(";");
         var _loc6_ = 0;
         while(_loc6_ < _loc11_.length)
         {
            var _loc8_ = Number(_loc11_[_loc6_]);
            _loc16_.push({label:this.api.lang.getJobText(_loc8_).n,id:_loc8_});
            _loc6_ += 1;
         }
         this.api.ui.loadUIComponent("CrafterList","CrafterList",{crafters:new ank["\x1e\n\x07"]["\x0f\x01"](),jobs:_loc16_});
         break;
      case 15:
         this.api.ui.unloadUIComponent("Mount");
         _loc5_.Storage = new dofus.datacenter.Storage();
         this.api.ui.loadUIComponent("Storage","Storage",{isMount:true,data:_loc5_.Storage,heroID:_loc24_});
         break;
      case 16:
         var _loc18_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         var _loc17_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc7_ = _loc15_.split("~");
         var _loc9_ = _loc7_[0].split(";");
         var _loc10_ = _loc7_[1].split(";");
         if(_loc9_ != undefined)
         {
            var _loc3_ = 0;
            while(_loc3_ < _loc9_.length)
            {
               if(_loc9_[_loc3_] != "")
               {
                  _loc18_.push(this.api.network.Mount.createMount(_loc9_[_loc3_]));
               }
               _loc3_ += 1;
            }
         }
         if(_loc10_ != undefined)
         {
            var _loc4_ = 0;
            while(_loc4_ < _loc10_.length)
            {
               if(_loc10_[_loc4_] != "")
               {
                  _loc17_.push(this.api.network.Mount.createMount(_loc10_[_loc4_]));
               }
               _loc4_ += 1;
            }
         }
         this.api.ui.loadUIComponent("MountStorage","MountStorage",{mounts:_loc18_,parkMounts:_loc17_});
   }
};
