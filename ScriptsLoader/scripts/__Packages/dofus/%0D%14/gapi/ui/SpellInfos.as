class dofus.§\r\x14§.gapi.ui.SpellInfos extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _oSpell;
   var _bghBackground;
   var _sfivSpellFullInfosViewer;
   static var CLASS_NAME = "SpellInfos";
   function SpellInfos()
   {
      super();
   }
   function set spell(§\x1e\x17\x17§)
   {
      if(_loc2_ == this._oSpell)
      {
         return;
      }
      this.addToQueue({object:this,method:function(§\x1e\x14\x1c§)
      {
         this._oSpell = _loc2_;
         if(this.initialized)
         {
            this.initData();
         }
      },params:[_loc2_]});
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.SpellInfos.CLASS_NAME);
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
   }
   function addListeners()
   {
      this._bghBackground.addEventListener("click",this);
      this._sfivSpellFullInfosViewer.addEventListener("close",this);
   }
   function initData()
   {
      if(this._oSpell != undefined)
      {
         this._sfivSpellFullInfosViewer.spell = this._oSpell;
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      this.unloadThis();
   }
   function close(§\x1e\x19\x0e§)
   {
      this.unloadThis();
   }
}
