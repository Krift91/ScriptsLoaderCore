if(!dofus.aks.Mount)
{
   if(!dofus)
   {
      _global.dofus = new Object();
   }
   if(!dofus.aks)
   {
      _global.dofus.aks = new Object();
   }
   dofus.aks.Mount = function(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   } extends dofus.aks.Handler;
   var _loc1_ = dofus.aks.Mount = function(§\x1e\x1a\x0e§, oAPI)
   {
      super.initialize(_loc3_,oAPI);
   }.prototype;
   _loc1_.rename = function rename(§\x1e\x0f\x16§)
   {
      this.aks.send("Rn" + _loc2_,true);
   };
   _loc1_.kill = function kill()
   {
      this.aks.send("Rf");
   };
   _loc1_.setXP = function setXP(§\x1e\x1b\n§)
   {
      this.aks.send("Rx" + _loc2_,true);
   };
   _loc1_.ride = function ride()
   {
      this.aks.send("Rr",false);
   };
   _loc1_.data = function data(§\x02\t§, §\x1e\f\x10§)
   {
      this.aks.send("Rd" + _loc2_ + "|" + _loc3_,true);
   };
   _loc1_.parkMountData = function parkMountData(§\x1e\x1c\x1c§)
   {
      this.aks.send("Rp" + _loc2_,true);
   };
   _loc1_.removeObjectInPark = function removeObjectInPark(§\x07\x11§)
   {
      this.aks.send("Ro" + _loc2_,true);
   };
   _loc1_.mountParkSell = function mountParkSell(§\x01\x07§)
   {
      this.aks.send("Rs" + _loc2_,true);
   };
   _loc1_.mountParkBuy = function mountParkBuy(§\x01\x07§)
   {
      this.aks.send("Rb" + _loc2_,true);
   };
   _loc1_.leave = function leave()
   {
      this.aks.send("Rv");
   };
   _loc1_.castrate = function castrate()
   {
      this.aks.send("Rc");
   };
   _loc1_.onEquip = function onEquip(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.charAt(0);
      switch(_loc3_)
      {
         case "+":
            this.api.datacenter.Player.mount = this.createMount(_loc2_.substr(1));
            break;
         case "-":
            this.unequipMount();
            break;
         case "E":
            this.equipError(_loc2_.charAt(1));
      }
   };
   _loc1_.onXP = function onXP(§\x1e\x12\r§)
   {
      var _loc3_ = Number(_loc2_);
      if(!_global.isNaN(_loc3_))
      {
         this.api.datacenter.Player.mountXPPercent = _loc3_;
      }
   };
   _loc1_.onName = function onName(§\x1e\x12\r§)
   {
      this.api.datacenter.Player.mount.name = _loc2_;
   };
   _loc1_.onData = function onData(§\x1e\x12\r§)
   {
      var _loc3_ = this.createMount(_loc2_);
      this.api.ui.loadUIComponent("MountViewer","MountViewer",{mount:_loc3_});
   };
   _loc1_.onMountPark = function onMountPark(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.split(";");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = Number(_loc3_[1]);
      var _loc6_ = Number(_loc3_[2]);
      var _loc7_ = Number(_loc3_[3]);
      var _loc8_ = _loc3_[4];
      var _loc9_ = _loc3_[5];
      var _loc10_ = this.api.kernel.CharactersManager.createGuildEmblem(_loc9_);
      this.api.datacenter.Map.mountPark = new dofus.datacenter["\t\x1b"](_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc10_);
   };
   _loc1_.onRidingState = function onRidingState(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_.charAt(0);
      switch(_loc3_)
      {
         case "+":
         default:
            this.api.datacenter.Player.isRiding = true;
            break;
         case "-":
            this.api.datacenter.Player.isRiding = false;
      }
   };
   _loc1_.onMountParkBuy = function onMountParkBuy(§\x1e\x12\r§)
   {
      var _loc3_ = _loc2_["{invalid_utf8=150}\x0b"]("\x01");
      this["\b\x03\x1c{invalid_utf8=150}\t"][""]("\x05\x01{invalid_utf8=157}\x02","\x05\x01{invalid_utf8=157}\x02",{§\x04\x01\b2{invalid_utf8=150}\x02§:Number(_loc3_[1])});
   };
   _loc1_[§§constant(68)] = function §\§\§constant(68)§()
   {
      this[§§constant(37)][§§constant(52)][§§constant(69)](§§constant(67));
   };
   _loc1_.equipError = function equipError(§\x0f\x05§)
   {
      switch(_loc2_)
      {
         case "\x14":
            var _loc3_ = this["\b\x03\x1c{invalid_utf8=150}\t"]["\x03)"]["\x02\x01\x07"]("\x01");
            break;
         case "{invalid_utf8=220}\x06+\x1c\x12\x12{invalid_utf8=157}\x02":
            _loc3_ = this["\b\x03\x1c{invalid_utf8=150}\t"]["\x03)"]["\x02\x01\x07"]("\x1e");
            break;
         case "":
            _loc3_ = this["\b\x03\x1c{invalid_utf8=150}\t"]["\x03)"]["\x02\x01\x07"]("{invalid_utf8=150}\x06");
      }
      this["\b\x03\x1c{invalid_utf8=150}\t"]["\b\x1d\x07\x01"]["\x07\x02"](undefined,_loc3_,"\x05\x01\b\x19\x04\x02G{invalid_utf8=150}\t");
   };
   _loc1_["\b\x04@O{invalid_utf8=150}\x02"] = function §\b\x04@O{invalid_utf8=150}\x02§()
   {
      this["\b\x03\x1c{invalid_utf8=150}\t"]["\b"]["\x07"][""] = undefined;
   };
   _loc1_[§§constant(42)] = function §\§\§constant(42)§(§\x1e\x0f\x06§, newBorn)
   {
      var _loc4_ = _loc2_[§§constant(56)](§§constant(78));
      var _loc5_ = Number(_loc4_[1]);
      var _loc6_ = new eval("\x1c_")[§§constant(38)][§§constant(2)](_loc5_,undefined,newBorn);
      _loc6_[§§constant(79)] = _loc4_[0];
      _loc6_[§§constant(80)] = _loc4_[2][§§constant(56)](§§constant(81));
      var _loc7_ = _loc4_[3][§§constant(56)](§§constant(81));
      _loc6_[§§constant(82)] = new eval(§§constant(83))[§§constant(84)][§§constant(85)]();
      var _loc8_ = 0;
      while(_loc8_ < _loc7_[§§constant(86)])
      {
         var _loc9_ = Number(_loc7_[_loc8_]);
         if(_loc9_ != 0 && !eval(§§constant(3))[§§constant(46)](_loc9_))
         {
            _loc6_[§§constant(82)][§§constant(90)]({(§§constant(87)):this[§§constant(37)][§§constant(72)][§§constant(88)](_loc9_)[§§constant(89)],(§§constant(17)):_loc9_});
         }
         _loc8_ = _loc8_ + 1;
      }
      _loc6_[§§constant(49)] = _loc4_[4] != §§constant(91) ? _loc4_[4] : this[§§constant(37)][§§constant(72)][§§constant(73)](§§constant(92));
      _loc6_[§§constant(93)] = Number(_loc4_[5]);
      var _loc10_ = _loc4_[6][§§constant(56)](§§constant(81));
      _loc6_[§§constant(94)] = Number(_loc10_[0]);
      _loc6_[§§constant(95)] = Number(_loc10_[1]);
      _loc6_[§§constant(96)] = Number(_loc10_[2]);
      _loc6_[§§constant(97)] = Number(_loc4_[7]);
      _loc6_[§§constant(98)] = !!Number(_loc4_[8]);
      _loc6_[§§constant(99)] = Number(_loc4_[9]);
      _loc6_[§§constant(100)] = !!Number(_loc4_[10]);
      var _loc11_ = _loc4_[11][§§constant(56)](§§constant(81));
      _loc6_[§§constant(101)] = Number(_loc11_[0]);
      _loc6_[§§constant(102)] = Number(_loc11_[1]);
      var _loc12_ = _loc4_[12][§§constant(56)](§§constant(81));
      _loc6_[§§constant(103)] = Number(_loc12_[0]);
      _loc6_[§§constant(104)] = Number(_loc12_[1]);
      var _loc13_ = _loc4_[13][§§constant(56)](§§constant(81));
      _loc6_[§§constant(105)] = Number(_loc13_[0]);
      _loc6_[§§constant(106)] = Number(_loc13_[1]);
      var _loc14_ = _loc4_[14][§§constant(56)](§§constant(81));
      _loc6_[§§constant(107)] = Number(_loc14_[0]);
      _loc6_[§§constant(108)] = Number(_loc14_[1]);
      _loc6_[§§constant(109)] = Number(_loc14_[2]);
      var _loc15_ = _loc4_[15][§§constant(56)](§§constant(81));
      _loc6_[§§constant(110)] = Number(_loc15_[0]);
      _loc6_[§§constant(111)] = Number(_loc15_[1]);
      _loc6_[§§constant(112)] = Number(_loc4_[16]);
      _loc6_[§§constant(113)] = !!Number(_loc4_[17]);
      _loc6_[§§constant(114)](_loc4_[18]);
      var _loc16_ = _loc4_[19][§§constant(56)](§§constant(81));
      _loc6_[§§constant(115)] = Number(_loc16_[0]);
      _loc6_[§§constant(116)] = Number(_loc16_[1]);
      var _loc17_ = _loc4_[20][§§constant(56)](§§constant(81));
      _loc6_[§§constant(117)] = Number(_loc17_[0]);
      _loc6_[§§constant(118)] = Number(_loc17_[1]);
      return _loc6_;
   };
   "\x04\x01\b\x01N{invalid_utf8=150}\x02"(_loc1_,null,1);
}
