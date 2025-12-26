class dofus.datacenter.§\x1e\x0b\x01§
{
   var api;
   var _id;
   var _text;
   var _color;
   function §\x1e\x0b\x01§(§\f\x1c§, param)
   {
      this.api = _global.API;
      this._id = _loc2_;
      switch(this.api.lang.getTitle(_loc2_).pt)
      {
         case 1:
            var _loc4_ = this.api.lang.getTitle(_loc2_).t.split("%1").join(this.api.lang.getMonsters()[_global.parseInt(param)].n);
            break;
         case 0:
         default:
            _loc4_ = this.api.lang.getTitle(_loc2_).t.split("%1").join(param);
      }
      this._text = "« " + _loc4_ + " »";
      this._color = this.api.lang.getTitle(_loc2_).c;
   }
   function get color()
   {
      return this._color;
   }
   function get text()
   {
      return this._text;
   }
}
