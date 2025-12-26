if(!dofus.aks.Items)
{
   if(!dofus)
   {
      _global.dofus = new Object();
   }
   if(!dofus.aks)
   {
      _global.dofus.aks = new Object();
   }
   dofus.aks.Items = function(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   } extends dofus.aks.Handler;
   var _loc1_ = dofus.aks.Items = function(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }.prototype;
   _loc1_.movement = function movement(§\x04\x12§, §\x01\n§, §\x01\x01§)
   {
      if(_loc3_ > 0)
      {
         this.api.kernel.GameManager.setAsModified(_loc3_);
      }
      this.aks.send("OM" + _loc2_ + "|" + _loc3_ + (!_global.isNaN(_loc4_) ? "|" + _loc4_ : ""),true);
   };
   _loc1_.drop = function drop(§\x04\x12§, §\x01\x01§)
   {
      this.aks.send("OD" + _loc2_ + "|" + _loc3_,false);
   };
   _loc1_.associateMimibiote = function associateMimibiote(§\x04\r§, §\x04\f§)
   {
      this.aks.send("AEi1|" + _loc2_ + "|" + _loc3_);
   };
   _loc1_.destroyMimibiote = function destroyMimibiote(§\x04\x12§)
   {
      this.aks.send("AEi0|" + _loc2_);
   };
   _loc1_.destroy = function destroy(§\x04\x12§, §\x01\x01§)
   {
      this.aks.send("Od" + _loc2_ + "|" + _loc3_,false);
   };
   _loc1_.use = function use(§\x04\x12§, §\x1e\r\x0e§, §\x07\x11§, §\x1b\r§)
   {
      this.aks.send("O" + (!_loc5_ ? "U" : "u") + _loc2_ + (!(_loc3_ != undefined && !_global.isNaN(Number(_loc3_))) ? "|" : "|" + _loc3_) + (_loc4_ == undefined ? "" : "|" + _loc4_),true);
   };
   _loc1_.dissociate = function dissociate(§\x04\x12§, §\x01\n§)
   {
      this.aks.send("Ox" + _loc2_ + "|" + _loc3_,false);
   };
   _loc1_.setSkin = function setSkin(§\x04\x12§, §\x01\n§, §\x1e\x1d\n§)
   {
      this.aks.send("Os" + _loc2_ + "|" + _loc3_ + "|" + _loc4_,false);
   };
   _loc1_.feed = function feed(§\x04\x12§, §\x01\n§, §\x05\n§)
   {
      this.aks.send("Of" + _loc2_ + "|" + _loc3_ + "|" + _loc4_,false);
   };
   _loc1_.onAccessories = function onAccessories(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = _loc3_[0];
      var _loc5_ = _loc3_[1].split(",");
      var _loc6_ = new Array();
      var _loc7_ = 0;
      while(_loc7_ < _loc5_.length)
      {
         if(_loc5_[_loc7_].indexOf("~") != -1)
         {
            var _loc11_ = _loc5_[_loc7_].split("~");
            var _loc8_ = _global.parseInt(_loc11_[0],16);
            var _loc10_ = _global.parseInt(_loc11_[1]);
            var _loc9_ = _global.parseInt(_loc11_[2]) - 1;
            if(_loc9_ < 0)
            {
               _loc9_ = 0;
            }
         }
         else
         {
            _loc8_ = _global.parseInt(_loc5_[_loc7_],16);
            _loc10_ = undefined;
            _loc9_ = undefined;
         }
         if(!_global.isNaN(_loc8_))
         {
            var _loc12_ = new dofus.datacenter["\x11"](_loc8_,_loc10_,_loc9_);
            _loc6_[_loc7_] = _loc12_;
         }
         _loc7_ = _loc7_ + 1;
      }
      var _loc13_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
      _loc13_.accessories = _loc6_;
      this.api.gfx.setForcedSpriteAnim(_loc4_,"static");
      if(_loc4_ == this.api.datacenter.Player.ID)
      {
         this.api.datacenter.Player.updateCloseCombat();
      }
   };
   _loc1_.onDrop = function onDrop(§\x14\x16§, §\x1e\x12\r§)
   {
      if(!_loc2_)
      {
         switch(_loc3_)
         {
            case "F":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("DROP_FULL"),"ERROR_BOX",{name:"DropFull"});
               break;
            case "E":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DROP_ITEM"),"ERROR_BOX");
         }
      }
   };
   _loc1_.onAdd = function onAdd(§\x14\x16§, §\x1e\x12\r§)
   {
      if(!_loc2_)
      {
         switch(_loc3_)
         {
            case "F":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("INVENTORY_FULL"),"ERROR_BOX",{name:"Full"});
               break;
            case "L":
               §§push({name:"LowLevel"});
               §§push("ERROR_BOX");
               §§push(this.api.lang.getText("TOO_LOW_LEVEL_FOR_ITEM"));
               §§push(undefined);
               §§push(4);
               §§push(this.api);
               §§push("kernel");
            default:
               §§pop()[§§pop()].showMessage();
               break;
            case "A":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("ALREADY_EQUIPED"),"ERROR_BOX",{name:"Already"});
         }
      }
      else
      {
         var _loc4_ = _loc3_.split("*");
         var _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            var _loc6_ = _loc4_[_loc5_];
            var _loc7_ = _loc6_.charAt(0);
            _loc6_ = _loc6_.substr(1);
            switch(_loc7_)
            {
               case "G":
                  break;
               case "O":
                  var _loc8_ = _loc6_.split(";");
                  var _loc9_ = 0;
                  while(_loc9_ < _loc8_.length)
                  {
                     var _loc10_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc8_[_loc9_]);
                     if(_loc10_ != undefined)
                     {
                        this.api.datacenter.Player.addItem(_loc10_);
                     }
                     _loc9_ = _loc9_ + 1;
                  }
                  break;
               default:
                  ank["\x1e\n\x07"]["\x0b\f"].err("Ajout d\'un type obj inconnu");
            }
            _loc5_ = _loc5_ + 1;
         }
      }
   };
   _loc1_.onChange = function onChange(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("*");
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc4_];
         var _loc6_ = _loc5_.split(";");
         var _loc7_ = 0;
         while(_loc7_ < _loc6_.length)
         {
            var _loc8_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc6_[_loc7_]);
            if(_loc8_ != undefined)
            {
               this.api.datacenter.Player.updateItem(_loc8_);
            }
            _loc7_ = _loc7_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
   };
   _loc1_.onRemove = function onRemove(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      this.api.datacenter.Player.dropItem(_loc3_);
   };
   _loc1_.onQuantity = function onQuantity(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = Number(_loc3_[1]);
      this.api.datacenter.Player.updateItemQuantity(_loc4_,_loc5_);
   };
   _loc1_.onMovement = function onMovement(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = !_global.isNaN(Number(_loc3_[1])) ? Number(_loc3_[1]) : -1;
      this.api.datacenter.Player.updateItemPosition(_loc4_,_loc5_);
   };
   _loc1_.onTool = function onTool(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      if(_global.isNaN(_loc3_))
      {
         this.api.datacenter.Player.currentJobID = undefined;
      }
      else
      {
         this.api.datacenter.Player.currentJobID = _loc3_;
      }
   };
   _loc1_.onWeight = function onWeight(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = Number(_loc3_[1]);
      this.api.datacenter.Player.maxWeight = _loc5_;
      this.api.datacenter.Player.currentWeight = _loc4_;
   };
   _loc1_.onItemSet = function onItemSet(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.charAt(0) == "+";
      var _loc4_ = _loc2_.substr(1).split("|");
      var _loc5_ = Number(_loc4_[0]);
      var _loc6_ = String(_loc4_[1]).split(";");
      var _loc7_ = _loc4_[2];
      if(_loc3_)
      {
         var _loc8_ = new dofus.datacenter.ItemSet(_loc5_,_loc7_,_loc6_);
         this.api.datacenter.Player.ItemSets.addItemAt(_loc5_,_loc8_);
      }
      else
      {
         this.api.datacenter.Player.ItemSets.removeItemAt(_loc5_);
      }
   };
   _loc1_.onItemUseCondition = function onItemUseCondition(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.charAt(0);
      switch(_loc3_)
      {
         case "G":
            var _loc4_ = _loc2_.substr(1).split("|");
            var _loc5_ = !_global.isNaN(Number(_loc4_[0])) ? Number(_loc4_[0]) : 0;
            var _loc6_ = !_global.isNaN(Number(_loc4_[1])) ? Number(_loc4_[1]) : undefined;
            var _loc7_ = !_global.isNaN(Number(_loc4_[2])) ? Number(_loc4_[2]) : undefined;
            var _loc8_ = !_global.isNaN(Number(_loc4_[3])) ? Number(_loc4_[3]) : undefined;
            var _loc9_ = {name:"UseItemGold",listener:this,params:{objectID:_loc5_,spriteID:_loc6_,cellID:_loc7_}};
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ITEM_USE_CONDITION_GOLD",[_loc8_]),"CAUTION_YESNO",_loc9_);
            break;
         case "U":
            var _loc10_ = _loc2_.substr(1).split("|");
            var _loc11_ = !_global.isNaN(Number(_loc10_[0])) ? Number(_loc10_[0]) : 0;
            var _loc12_ = !_global.isNaN(Number(_loc10_[1])) ? Number(_loc10_[1]) : undefined;
            var _loc13_ = !_global.isNaN(Number(_loc10_[2])) ? Number(_loc10_[2]) : undefined;
            var _loc14_ = !_global.isNaN(Number(_loc10_[3])) ? Number(_loc10_[3]) : undefined;
            var _loc15_ = {name:"UseItem",listener:this,params:{objectID:_loc11_,spriteID:_loc12_,cellID:_loc13_}};
            var _loc16_ = new dofus.datacenter["\f\f"](-1,_loc14_,1,0,"",0);
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ITEM_USE_CONFIRMATION",[_loc16_.name]),"CAUTION_YESNO",_loc15_);
      }
   };
   _loc1_.onItemFound = function onItemFound(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split("|");
      var _loc4_ = !_global.isNaN(Number(_loc3_[0])) ? Number(_loc3_[0]) : 0;
      var _loc5_ = !_global.isNaN(Number(_loc3_[2])) ? Number(_loc3_[2]) : 0;
      var _loc6_ = _loc3_[1].split("~");
      var _loc7_ = !_global.isNaN(Number(_loc6_[0])) ? Number(_loc6_[0]) : 0;
      var _loc8_ = !_global.isNaN(Number(_loc6_[1])) ? Number(_loc6_[1]) : 0;
      if(_loc4_ == 1)
      {
         if(_loc7_ == 0)
         {
            var _loc9_ = {iconFile:"KamaSymbol"};
         }
         else
         {
            _loc9_ = new dofus.datacenter["\f\f"](0,_loc7_,_loc8_);
         }
         this.api.gfx.addSpriteOverHeadItem(this.api.datacenter.Player.ID,"itemFound",dofus["\r\x14"].battlefield["\x11\x1b"],[true,_loc9_],2000);
      }
   };
   _loc1_.yes = function yes(§\x1e\x19\x0e§)
   {
      switch(_loc2_[§§constant(128)][§§constant(129)])
      {
         case §§constant(130):
            this[§§constant(26)](_loc2_[§§constant(110)][§§constant(111)],_loc2_[§§constant(110)][§§constant(112)],_loc2_[§§constant(110)][§§constant(113)],true);
            break;
         case §§constant(131):
            this[§§constant(26)](_loc2_[§§constant(110)][§§constant(111)],_loc2_[§§constant(110)][§§constant(112)],_loc2_[§§constant(110)][§§constant(113)],true);
      }
   };
   §§constant(132)(_loc1_,null,1);
   dofus.aks.Items = function(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }[§§constant(133)] = §§constant(134);
   dofus.aks.Items = function(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }[§§constant(135)] = 16;
}
