class dofus.datacenter.Job extends Object
{
   var _oOptions;
   var dispatchEvent;
   var _nID;
   var _oJobText;
   var _eaSkills;
   var _eaCrafts;
   var _nLevel;
   var _nXPmin;
   var _nXP;
   var api;
   var _nXPmax;
   function Job(§\x04\x12§, §\x0f\x15§, options)
   {
      super();
      this.initialize(_loc3_,_loc4_,options);
   }
   function set options(§\x1e\x1a\x10§)
   {
      this._oOptions = _loc2_;
      this.dispatchEvent({type:"optionsChanged",value:_loc2_});
   }
   function get options()
   {
      return this._oOptions;
   }
   function get id()
   {
      return this._nID;
   }
   function get name()
   {
      return this._oJobText.n;
   }
   function get description()
   {
      return this._oJobText.d;
   }
   function get iconFile()
   {
      return dofus.Constants.JOBS_ICONS_PATH + this._oJobText.g + ".swf";
   }
   function get skills()
   {
      return this._eaSkills;
   }
   function get crafts()
   {
      return this._eaCrafts;
   }
   function set level(§\x03\x11§)
   {
      this._nLevel = _loc2_;
   }
   function get level()
   {
      return this._nLevel;
   }
   function set xpMin(§\x1e\x1a\x18§)
   {
      this._nXPmin = _loc2_;
   }
   function get xpMin()
   {
      return this._nXPmin;
   }
   function set xp(§\x1e\x1a\x1d§)
   {
      this._nXP = _loc2_;
      if(this.api.datacenter.Player.currentJobID == this.id)
      {
         var _loc3_ = dofus["\r\x14"].gapi.ui.Banner(this.api.ui.getUIComponent("Banner"));
         if(_loc3_ != undefined && this.api.kernel.OptionsManager.getOption("BannerGaugeMode") == "xpcurrentjob")
         {
            dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(_loc3_);
         }
      }
   }
   function get xp()
   {
      return this._nXP;
   }
   function set xpMax(§\x1e\x1a\x1a§)
   {
      this._nXPmax = _loc2_;
   }
   function get xpMax()
   {
      return this._nXPmax <= Math.pow(10,17) ? this._nXPmax : this._nXP;
   }
   function get specializationOf()
   {
      return this._oJobText.s;
   }
   function initialize(§\x04\x12§, §\x0f\x15§, options)
   {
      eval("\t\x04").events["\x0f\x03"].initialize(this);
      this.api = _global.API;
      this._nID = _loc2_;
      this._eaSkills = _loc3_;
      this._oOptions = options;
      this._oJobText = this.api.lang.getJobText(_loc2_);
      if(!_global.isNaN(_loc3_.length))
      {
         this._eaCrafts = new ank["\x1e\n\x07"]["\x0f\x01"]();
         var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         var _loc6_ = 0;
         while(_loc6_ < _loc3_.length)
         {
            var _loc7_ = _loc5_.findFirstItem("id",_loc3_[_loc6_].id);
            if(_loc7_.index == -1)
            {
               _loc5_.push(_loc3_[_loc6_]);
            }
            else if(_loc7_.item.param1 < _loc3_[_loc6_].param1)
            {
               _loc5_[_loc7_.index] = _loc3_[_loc6_];
            }
            _loc6_ = _loc6_ + 1;
         }
         var _loc8_ = 0;
         while(_loc8_ < _loc5_.length)
         {
            var _loc9_ = _loc5_[_loc8_];
            var _loc10_ = _loc9_.craftsList;
            if(_loc10_ != undefined)
            {
               var _loc11_ = 0;
               while(_loc11_ < _loc10_.length)
               {
                  var _loc12_ = _loc10_[_loc11_];
                  var _loc13_ = new dofus.datacenter.Craft(_loc12_,_loc9_);
                  if(_loc13_.itemsCount <= _loc9_.param1)
                  {
                     this._eaCrafts.push(_loc13_);
                  }
                  _loc11_ = _loc11_ + 1;
               }
            }
            this._eaCrafts.sortOn("name");
            _loc8_ = _loc8_ + 1;
         }
      }
   }
   function getMaxSkillSlot()
   {
      var _loc2_ = -1;
      var _loc3_ = 0;
      while(_loc3_ < this._eaSkills.length)
      {
         var _loc4_ = this._eaSkills[_loc3_];
         if(_loc4_.param1 > _loc2_)
         {
            _loc2_ = _loc4_.param1;
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
}
