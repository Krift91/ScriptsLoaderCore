class dofus.§\r\x14§.battlefield.EffectIcon extends MovieClip
{
   var _sOperator;
   var _nQte;
   var _mcbackground;
   static var COLOR_PLUS = 255;
   static var COLOR_MINUS = 16711680;
   static var COLOR_FACTOR = 65280;
   function EffectIcon()
   {
      super();
      _global.subtrace("yahoo");
      this.initialize(this._sOperator,this._nQte);
   }
   function set operator(§\x1e\x0f\x0b§)
   {
      this._sOperator = _loc2_;
   }
   function set qte(§\x01\x03§)
   {
      this._nQte = _loc2_;
   }
   function initialize(§\x1e\x0f\x0b§, §\x01\x03§)
   {
      switch(_loc2_)
      {
         case "-":
            this.attachMovie("Icon-","_mcOp",10,{_x:1,_y:1});
            var _loc4_ = new Color(this._mcbackground);
            _loc4_.setRGB(dofus["\r\x14"].battlefield.EffectIcon.COLOR_MINUS);
            break;
         case "+":
            this.attachMovie("Icon+","_mcOp",10,{_x:1,_y:1});
            var _loc5_ = new Color(this._mcbackground);
            _loc5_.setRGB(dofus["\r\x14"].battlefield.EffectIcon.COLOR_PLUS);
            break;
         case "*":
            this.attachMovie("Icon*","_mcOp",10,{_x:1,_y:1});
            var _loc6_ = new Color(this._mcbackground);
            _loc6_.setRGB(dofus["\r\x14"].battlefield.EffectIcon.COLOR_FACTOR);
      }
   }
}
