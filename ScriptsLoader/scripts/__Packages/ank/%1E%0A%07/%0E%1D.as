class ank.§\x1e\n\x07§.§\x0e\x1d§ extends Object
{
   var _items;
   var _count;
   var dispatchEvent;
   function §\x0e\x1d§()
   {
      super();
      this.initialize();
   }
   function initialize(§\x1e\t\x1c§)
   {
      this.clear();
      eval("\t\x04").events["\x0f\x03"].initialize(this);
   }
   function clear(§\x1e\t\x1c§)
   {
      this._items = new Object();
      this._count = 0;
      this.dispatchEvent({type:"modelChanged"});
   }
   function addItemAt(§\f\x03§, §\f\x0b§)
   {
      if(this._items[_loc2_] == undefined)
      {
         this._count++;
      }
      this._items[_loc2_] = _loc3_;
      this.dispatchEvent({type:"modelChanged"});
   }
   function removeItemAt(§\f\x03§)
   {
      var _loc3_ = this._items[_loc2_];
      delete this._items[_loc2_];
      this._count--;
      this.dispatchEvent({type:"modelChanged"});
      return _loc3_;
   }
   function removeAll(§\x1e\t\x1c§)
   {
      this.clear();
   }
   function removeAllExcept(§\f\x03§)
   {
      for(var k in this._items)
      {
         if(k != _loc2_)
         {
            delete this._items[k];
         }
      }
      this._count = 1;
      this.dispatchEvent({type:"modelChanged"});
   }
   function replaceItemAt(§\f\x03§, §\f\x0b§)
   {
      if(this._items[_loc2_] == undefined)
      {
         return undefined;
      }
      this._items[_loc2_] = _loc3_;
      this.dispatchEvent({type:"modelChanged"});
   }
   function getLength(§\x1e\t\x1c§)
   {
      return this._count;
   }
   function getItemAt(§\f\x03§)
   {
      return this._items[_loc2_];
   }
   function getItems(§\x1e\t\x1c§)
   {
      return this._items;
   }
   function getKeys()
   {
      var _loc2_ = new Array();
      for(var k in this._items)
      {
         _loc2_.push(k);
      }
      return _loc2_;
   }
   function getPropertyValues(§\x1e\x0e\x0b§)
   {
      var _loc3_ = new Array();
      for(var k in this._items)
      {
         _loc3_.push(this._items[k][_loc2_]);
      }
      return _loc3_;
   }
}
