class ank.gapi.controls.TextInput extends ank.gapi.controls.Label
{
   var _tText;
   static var CLASS_NAME = "TextInput";
   var _sTextfiledType = "input";
   var _sRestrict = "none";
   var _nMaxChars = -1;
   function TextInput()
   {
      super();
   }
   function set restrict(§\x1e\x0e\x02§)
   {
      this._sRestrict = _loc2_ != "none" ? _loc2_ : null;
      if(this._tText != undefined)
      {
         this.setRestrict();
      }
   }
   function get restrict()
   {
      return this._tText.restrict;
   }
   function set maxChars(§\x03\x05§)
   {
      this._nMaxChars = _loc2_ != -1 ? _loc2_ : null;
      if(this._tText != undefined)
      {
         this.setMaxChars();
      }
   }
   function get maxChars()
   {
      return this._tText.maxChars;
   }
   function get focused()
   {
      return eval(Selection.getFocus()) == this._tText;
   }
   function set tabIndex(§\x1e\x1c\f§)
   {
      this._tText.tabIndex = _loc2_;
   }
   function get tabIndex()
   {
      return this._tText.tabIndex;
   }
   function set tabEnabled(§\x1a\r§)
   {
      this._tText.tabEnabled = _loc2_;
   }
   function get tabEnabled()
   {
      return this._tText.tabEnabled;
   }
   function set password(§\x16\x10§)
   {
      this._tText.password = _loc2_;
   }
   function get password()
   {
      return this._tText.password;
   }
   function setFocus()
   {
      if(this._tText == undefined)
      {
         this.addToQueue({object:this,method:function()
         {
            Selection.setFocus(this._tText);
         }});
      }
      else
      {
         Selection.setFocus(this._tText);
      }
   }
   function createChildren()
   {
      super.createChildren();
      this.setRestrict();
      this.setMaxChars();
   }
   function setEnabled()
   {
      if(this._bEnabled)
      {
         this._tText.type = "input";
      }
      else
      {
         this._tText.type = "dynamic";
      }
   }
   function setRestrict()
   {
      this._tText.restrict = this._sRestrict;
   }
   function setMaxChars()
   {
      this._tText.maxChars = this._nMaxChars;
   }
}
