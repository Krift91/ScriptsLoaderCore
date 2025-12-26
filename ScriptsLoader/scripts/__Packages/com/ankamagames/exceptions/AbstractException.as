class com.ankamagames.exceptions.AbstractException extends Error
{
   var _className;
   var _methodName;
   var _objectErrorSource;
   function AbstractException(objectErrorSource, className, methodName, §\t\x0e§)
   {
      super(_loc6_);
      this._className = className;
      this._methodName = methodName;
      this._objectErrorSource = objectErrorSource;
   }
   function getSource(§\x1e\t\x1c§)
   {
      return this._objectErrorSource;
   }
   function getMessage(§\x1e\t\x1c§)
   {
      return !!super.message ? super.toString() : null;
   }
   function getExceptionName(§\x1e\t\x1c§)
   {
      return "com.ankamagames.exceptions.AbstractException";
   }
   function getClassName(§\x1e\t\x1c§)
   {
      return this._className;
   }
   function getMethodName(§\x1e\t\x1c§)
   {
      return !!this._methodName ? this._methodName : null;
   }
   function toString(§\x1e\t\x1c§)
   {
      var _loc3_ = this.getExceptionName() + " in " + this.getClassName() + (this.getMethodName() == null ? "" : "." + this.getMethodName());
      var _loc4_ = this.getMessage();
      if(!_loc4_)
      {
         return _loc3_;
      }
      return "[EXCEPTION] " + _loc3_ + " :\r\n\t" + _loc4_;
   }
}
