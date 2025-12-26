class dofus.§\r\x14§.gapi.ui.shortcuts.§\x1e\x11\x11§ extends ank.gapi.core.§\x1e\n\f§
{
   var _btnMain;
   var _btnAlt;
   var _rctCatBg;
   var _lblDescription;
   var _sShortcut;
   function §\x1e\x11\x11§()
   {
      super();
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         if(_loc4_.c)
         {
            this._btnMain._visible = false;
            this._btnAlt._visible = false;
            this._rctCatBg._visible = true;
            this._lblDescription.styleName = "GrayLeftSmallBoldLabel";
            this._lblDescription.text = _loc4_.d;
         }
         else
         {
            var _loc5_ = _global.API;
            this._btnMain._visible = true;
            this._btnAlt._visible = true;
            this._rctCatBg._visible = false;
            this._lblDescription.styleName = "BrownLeftSmallLabel";
            this._lblDescription.text = "    " + _loc4_.d;
            if(_loc4_.s.k != undefined)
            {
               if(_loc4_.s.d == undefined || (_loc4_.s.d == "" || new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.s.d).trim().toString() == ""))
               {
                  this._btnMain.label = _loc5_.lang.getControlKeyString(_loc4_.s.c) + _loc5_.lang.getKeyStringFromKeyCode(_loc4_.s.k);
               }
               else
               {
                  this._btnMain.label = _loc4_.s.d;
               }
            }
            else
            {
               this._btnMain.label = _loc5_.lang.getText("KEY_UNDEFINED");
            }
            if(_loc4_.s.k2 != undefined)
            {
               if(_loc4_.s.d2 == undefined || (_loc4_.s.d2 == "" || new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.s.d2).trim().toString() == ""))
               {
                  this._btnAlt.label = _loc5_.lang.getControlKeyString(_loc4_.s.c2) + _loc5_.lang.getKeyStringFromKeyCode(_loc4_.s.k2);
               }
               else
               {
                  this._btnAlt.label = _loc4_.s.d2;
               }
            }
            else
            {
               this._btnAlt.label = _loc5_.lang.getText("KEY_UNDEFINED");
            }
            this._btnMain.enabled = this._btnAlt.enabled = !_loc4_.l;
         }
         this._sShortcut = _loc4_.k;
      }
      else if(this._lblDescription.text != undefined)
      {
         this._lblDescription.styleName = "BrownLeftSmallLabel";
         this._lblDescription.text = "";
         this._rctCatBg._visible = false;
         this._btnMain._visible = false;
         this._btnMain.label = "";
         this._btnAlt._visible = false;
         this._btnAlt.label = "";
         this._sShortcut = undefined;
      }
   }
   function init()
   {
      super.init(false);
      this._rctCatBg._visible = false;
      this._btnMain._visible = false;
      this._btnAlt._visible = false;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
   }
   function addListeners()
   {
      this._btnMain.addEventListener("click",this);
      this._btnAlt.addEventListener("click",this);
   }
   function click(§\x1e\x19\x0e§)
   {
      if(this._sShortcut == undefined)
      {
         return undefined;
      }
      var _loc3_ = _global.API;
      switch(_loc2_.target._name)
      {
         case "_btnMain":
            _loc3_.kernel.KeyManager.askCustomShortcut(this._sShortcut,false);
            break;
         case "_btnAlt":
            _loc3_.kernel.KeyManager.askCustomShortcut(this._sShortcut,true);
      }
   }
}
