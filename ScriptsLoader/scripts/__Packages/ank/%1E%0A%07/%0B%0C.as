class ank.§\x1e\n\x07§.§\x0b\f§
{
   var _logs;
   var _errors;
   static var LC = new LocalConnection();
   static var MAX_LOG_COUNT = 50;
   static var MAX_LOG_SIZE = 300;
   static var _instance = new ank["\x1e\n\x07"]["\x0b\f"]();
   function §\x0b\f§()
   {
      this._logs = new Array();
      this._errors = new Array();
      ank["\x1e\n\x07"]["\x0b\f"].LC.connect("loggerIn");
      ank["\x1e\n\x07"]["\x0b\f"].LC.getLogs = function()
      {
         ank["\x1e\n\x07"]["\x0b\f"].LC.send("loggerOut","log",ank["\x1e\n\x07"]["\x0b\f"].logs);
      };
      ank["\x1e\n\x07"]["\x0b\f"].LC.getErrors = function()
      {
         ank["\x1e\n\x07"]["\x0b\f"].LC.send("loggerOut","err",ank["\x1e\n\x07"]["\x0b\f"].errors);
      };
   }
   static function log(§\x1e\n\x12§, §\x1e\r\x10§)
   {
      ank["\x1e\n\x07"]["\x0b\f"].LC.send("loggerOut","log",_loc2_);
      if(_loc2_.length < ank["\x1e\n\x07"]["\x0b\f"].MAX_LOG_SIZE)
      {
         ank["\x1e\n\x07"]["\x0b\f"]._instance._logs.push(_loc3_ != undefined ? _loc3_ + " :\n" + _loc2_ : _loc2_);
      }
      if(ank["\x1e\n\x07"]["\x0b\f"]._instance._logs.length > ank["\x1e\n\x07"]["\x0b\f"].MAX_LOG_COUNT)
      {
         ank["\x1e\n\x07"]["\x0b\f"]._instance._logs.shift();
      }
   }
   static function err(§\x1e\n\x12§)
   {
      _loc2_ = "ERROR : " + _loc2_;
      ank["\x1e\n\x07"]["\x0b\f"].LC.send("loggerOut","err",_loc2_);
      ank["\x1e\n\x07"]["\x0b\f"]._instance._errors.push(_loc2_);
   }
   static function get logs()
   {
      return ank["\x1e\n\x07"]["\x0b\f"]._instance._logs.join("\n");
   }
   static function get errors()
   {
      return ank["\x1e\n\x07"]["\x0b\f"]._instance._errors.join("\n");
   }
}
