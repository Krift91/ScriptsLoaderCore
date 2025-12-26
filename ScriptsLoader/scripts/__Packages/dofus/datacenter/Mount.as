class dofus.datacenter.Mount extends Object
{
   var newBorn;
   var modelID;
   var _lang;
   var gfxFile;
   var _sName;
   var dispatchEvent;
   var _nPods;
   var _nChevauchorGfxID;
   var chevauchorGfxFile;
   var capacities;
   var customColor1;
   var customColor2;
   var customColor3;
   var maturity;
   var maturityMax;
   var _aEffects;
   var _sEffects;
   var level;
   var sex;
   var mountable;
   var wild;
   var fecondation;
   var fecondable;
   var useCustomColor = false;
   function Mount(nModelID, nChevauchorGfxID, bNewBorn)
   {
      super();
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this.newBorn = bNewBorn;
      this.modelID = nModelID;
      this._lang = _global.API.lang.getMountText(this.modelID);
      this.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + this._lang.g + ".swf";
      this.chevauchorGfxID = nChevauchorGfxID;
   }
   function set name(§\x1e\n\x02§)
   {
      this._sName = _loc2_;
      this.dispatchEvent({type:"nameChanged",name:_loc2_});
   }
   function get name()
   {
      return this._sName;
   }
   function set pods(§\x1e\n\x02§)
   {
      this._nPods = _loc2_;
      this.dispatchEvent({type:"podsChanged",pods:_loc2_});
   }
   function get pods()
   {
      return this._nPods;
   }
   function get label()
   {
      return this._lang.n;
   }
   function get modelName()
   {
      return this._lang.n;
   }
   function get gfxID()
   {
      return this._lang.g;
   }
   function set chevauchorGfxID(§\x04\x12§)
   {
      this._nChevauchorGfxID = _loc2_;
      this.chevauchorGfxFile = dofus.Constants.CHEVAUCHOR_PATH + _loc2_ + ".swf";
   }
   function get chevauchorGfxID()
   {
      return this._nChevauchorGfxID;
   }
   function get isChameleon()
   {
      for(var k in this.capacities)
      {
         var _loc2_ = this.capacities[k].data;
         if(_loc2_ == 9)
         {
            return true;
         }
      }
      return false;
   }
   function get color1()
   {
      if(!_global.isNaN(this.customColor1))
      {
         return this.customColor1;
      }
      return this._lang.c1;
   }
   function get color2()
   {
      if(!_global.isNaN(this.customColor2))
      {
         return this.customColor2;
      }
      return this._lang.c2;
   }
   function get color3()
   {
      if(!_global.isNaN(this.customColor3))
      {
         return this.customColor3;
      }
      return this._lang.c3;
   }
   function get mature()
   {
      return this.maturity == this.maturityMax && (this.maturity != undefined && this.maturityMax != undefined);
   }
   function get effects()
   {
      return dofus.datacenter["\f\f"].getItemDescriptionEffects(this._aEffects);
   }
   function setEffects(§\x12\x0f§)
   {
      this._sEffects = _loc2_;
      this._aEffects = new Array();
      var _loc3_ = _loc2_.split(",");
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc4_].split("#");
         _loc5_[0] = _global.parseInt(_loc5_[0],16);
         _loc5_[1] = _loc5_[1] != "0" ? _global.parseInt(_loc5_[1],16) : undefined;
         _loc5_[2] = _loc5_[2] != "0" ? _global.parseInt(_loc5_[2],16) : undefined;
         _loc5_[3] = _loc5_[3] != "0" ? _global.parseInt(_loc5_[3],16) : undefined;
         _loc5_[4] = _loc5_[4];
         this._aEffects.push(_loc5_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function getToolTip()
   {
      var _loc2_ = this.modelName;
      _loc2_ += "\n" + _global.API.lang.getText("NAME_BIG") + " : " + this.name;
      _loc2_ += "\n" + _global.API.lang.getText("LEVEL") + " : " + this.level;
      _loc2_ += "\n" + _global.API.lang.getText("CREATE_SEX") + " : " + (!this.sex ? _global.API.lang.getText("ANIMAL_MEN") : _global.API.lang.getText("ANIMAL_WOMEN"));
      _loc2_ += "\n" + _global.API.lang.getText("MOUNTABLE") + " : " + (!this.mountable ? _global.API.lang.getText("NO") : _global.API.lang.getText("YES"));
      _loc2_ += "\n" + _global.API.lang.getText("WILD") + " : " + (!this.wild ? _global.API.lang.getText("NO") : _global.API.lang.getText("YES"));
      if(this.fecondation > 0)
      {
         _loc2_ += "\n" + _global.API.lang.getText("PREGNANT_SINCE",[this.fecondation]);
      }
      else if(this.fecondable)
      {
         _loc2_ += "\n" + _global.API.lang.getText("FECONDABLE");
      }
      return _loc2_;
   }
}
