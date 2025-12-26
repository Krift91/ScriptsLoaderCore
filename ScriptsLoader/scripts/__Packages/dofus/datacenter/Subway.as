class dofus.datacenter.Subway extends dofus.datacenter.§\r\x05§
{
   var _nCost;
   var fieldToSort;
   function Subway(§\x11\x0e§, cost)
   {
      super(_loc3_);
      this._nCost = cost;
      this.fieldToSort = this.name + this.mapID;
   }
   function get cost()
   {
      return this._nCost;
   }
}
