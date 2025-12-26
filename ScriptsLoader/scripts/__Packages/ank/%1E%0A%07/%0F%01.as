class ank.§\x1e\n\x07§.§\x0f\x01§ extends Array
{
   var _bNoEventDispatchs;
   var _nNoEventPeriodTimeout;
   function §\x0f\x01§()
   {
      super();
      this.initialize();
   }
   function removeEventListener()
   {
   }
   function addEventListener()
   {
   }
   function dispatchEvent()
   {
   }
   function dispatchQueue()
   {
   }
   function initialize(§\x1e\t\x1c§)
   {
      eval("\t\x04").events["\x0f\x03"].initialize(this);
   }
   function isInNoEventDispatchsPeriod()
   {
      return this._bNoEventDispatchs;
   }
   function startNoEventDispatchsPeriod(§\x05\x19§)
   {
      this._bNoEventDispatchs = true;
      if(this._nNoEventPeriodTimeout != undefined)
      {
         _global.clearTimeout(this._nNoEventPeriodTimeout);
      }
      var _loc3_ = _global.setTimeout(this,"endNoEventDispatchsPeriod",_loc2_);
      this._nNoEventPeriodTimeout = _loc3_;
   }
   function endNoEventDispatchsPeriod()
   {
      this._bNoEventDispatchs = undefined;
      this._nNoEventPeriodTimeout = undefined;
      this.doDispatchEvent({type:"modelChanged",eventName:"updateAll"});
      var _loc2_ = _global.API;
      _loc2_.ui.getUIComponent("TaxCollectorStorage").refreshGetItemButton();
   }
   function createFromArray(§\x03§)
   {
      this.splice(0,this.length);
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         this.push(_loc2_[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
   }
   function removeAll(§\x1e\t\x1c§)
   {
      this.splice(0,this.length);
      this.doDispatchEvent({type:"modelChanged",eventName:"updateAll"});
   }
   function push(§\x1e\n\x02§)
   {
      var _loc4_ = super.push(_loc3_);
      this.doDispatchEvent({type:"modelChanged",eventName:"addItem"});
      return _loc4_;
   }
   function pop()
   {
      var _loc3_ = super.pop();
      this.doDispatchEvent({type:"modelChanged",eventName:"updateAll"});
      return _loc3_;
   }
   function shift()
   {
      var _loc3_ = super.shift();
      this.doDispatchEvent({type:"modelChanged",eventName:"updateAll"});
      return _loc3_;
   }
   function unshift(§\x1e\n\x02§)
   {
      var _loc4_ = super.unshift(_loc3_);
      this.doDispatchEvent({type:"modelChanged",eventName:"updateAll"});
      return _loc4_;
   }
   function reverse()
   {
      super.reverse();
      this.doDispatchEvent({type:"modelChanged",eventName:"updateAll"});
   }
   function replaceAll(§\x1e\x1c\x1a§, §\x1e\x04§)
   {
      var _loc4_ = [_loc2_,0];
      for(var k in _loc3_)
      {
         _loc4_.push(_loc3_[k]);
      }
      this.splice.apply(this,_loc4_);
      this.doDispatchEvent({type:"modelChanged",eventName:"updateAll"});
   }
   function removeItems(§\x04\n§, §\x11\x04§)
   {
      this.splice(_loc2_,_loc3_);
      this.doDispatchEvent({type:"modelChanged",eventName:"updateAll"});
   }
   function updateItem(§\x04\n§, §\x05\x0e§)
   {
      this.splice(_loc2_,1,_loc3_);
      this.doDispatchEvent({type:"modelChanged",eventName:"updateOne",updateIndex:_loc2_});
   }
   function findFirstItem(§\x1e\x0e\n§, §\x1e\x16\x05§)
   {
      var _loc4_ = 0;
      while(_loc4_ < this.length)
      {
         var _loc5_ = this[_loc4_];
         if(_loc5_[_loc2_] == _loc3_)
         {
            return {index:_loc4_,item:_loc5_};
         }
         _loc4_ = _loc4_ + 1;
      }
      return {index:-1};
   }
   function clone()
   {
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = 0;
      while(_loc3_ < this.length)
      {
         _loc2_.push(this[_loc3_].clone());
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
   function shuffle()
   {
      var _loc2_ = this.clone();
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc4_ = _loc2_[_loc3_];
         var _loc5_ = random(_loc2_.length);
         _loc2_[_loc3_] = _loc2_[_loc5_];
         _loc2_[_loc5_] = _loc4_;
         _loc3_ = _loc3_ + 1;
      }
      return _loc2_;
   }
   function doDispatchEvent(§\x1e\x19\x0e§)
   {
      if(this.isInNoEventDispatchsPeriod())
      {
         return undefined;
      }
      this.dispatchEvent(_loc2_);
   }
   function bubbleSortOn(§\x1e\x16\x07§, §\x0e\x07§)
   {
      if((_loc3_ & Array.ASCENDING) == 0 && (_loc3_ & Array.DESCENDING) == 0)
      {
         _loc3_ |= Array.ASCENDING;
      }
      do
      {
         var _loc4_ = false;
         var _loc5_ = 1;
         while(_loc5_ < this.length)
         {
            if((_loc3_ & Array.ASCENDING) > 0 && this[_loc5_ - 1][_loc2_] > this[_loc5_][_loc2_] || (_loc3_ & Array.DESCENDING) > 0 && this[_loc5_ - 1][_loc2_] < this[_loc5_][_loc2_])
            {
               var _loc6_ = this[_loc5_ - 1];
               this[_loc5_ - 1] = this[_loc5_];
               this[_loc5_] = _loc6_;
               _loc4_ = true;
            }
            _loc5_ = _loc5_ + 1;
         }
      }
      while(_loc4_);
      
   }
   function concat(§\x1e\x1a\n§)
   {
      var _loc4_ = super.concat(_loc3_);
      var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc5_.createFromArray(_loc4_);
      return _loc5_;
   }
}
