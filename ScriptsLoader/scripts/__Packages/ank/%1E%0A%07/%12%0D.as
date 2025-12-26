class ank.§\x1e\n\x07§.§\x12\r§
{
   var _hashCodes;
   static var ZIPKEY = new Array("_a","_b","_c","_d","_e","_f","_g","_h","_i","_j","_k","_l","_m","_n","_o","_p","_q","_r","_s","_t","_u","_v","_w","_x","_y","_z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9","-","_");
   static var ZKARRAY = new Array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9","-","_");
   static var _self = new ank["\x1e\n\x07"]["\x12\r"]();
   function §\x12\r§()
   {
      this.initialize();
   }
   function initialize()
   {
      var _loc2_ = ank["\x1e\n\x07"]["\x12\r"].ZKARRAY.length - 1;
      this._hashCodes = new Object();
      while(_loc2_ >= 0)
      {
         this._hashCodes[ank["\x1e\n\x07"]["\x12\r"].ZKARRAY[_loc2_]] = _loc2_;
         _loc2_ = _loc2_ - 1;
      }
   }
   static function decode64(§\x12\x16§)
   {
      return ank["\x1e\n\x07"]["\x12\r"]._self._hashCodes[_loc2_];
   }
   static function encode64(§\x1e\n\x02§)
   {
      return ank["\x1e\n\x07"]["\x12\r"].ZKARRAY[_loc2_];
   }
}
