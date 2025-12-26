var _loc1 = _global.dofus.datacenter.TemporisInfos.prototype;
_loc1.__get__temporisName = function()
{
   return this._sTemporisName;
};
_loc1.__get__temporisVersion = function()
{
   return this._nTemporisVersion;
};
_loc1.__get__temporisUIComponents = function()
{
   return this._aTemporisUIComponents;
};
_loc1.__get__currentTempokens = function()
{
   return this._nCurrentTempokens;
};
_loc1.__get__maxTempokens = function()
{
   return this._nMaxTempokens;
};
_loc1.initialize = function(bUpdate, nMaxTempokens)
{
   this._nMaxTempokens = nMaxTempokens;
   this._nTemporisVersion = this.api.lang.getConfigText("TEMPORIS_CURRENT_VERSION");
   this._sTemporisName = this.api.lang.getText("TEMPORIS_" + this._nTemporisVersion + "_NAME");
   this._aTemporisUIComponents = this.api.lang.getConfigText("TEMPORIS_" + this._nTemporisVersion + "_UI_COMPONENTS");
   this._nCurrentTempokens = this.api.datacenter.Player.Inventory.findFirstItem("unicID",12001).item.Quantity;
   if(bUpdate)
   {
      this.dispatchEvent({type:"modelChanged",eventName:"infosUpdate"});
   }
};
_loc1.addProperty("maxTempokens",_loc1.__get__maxTempokens,function()
{
}
);
_loc1.addProperty("currentTempokens",_loc1.__get__currentTempokens,function()
{
}
);
_loc1.addProperty("temporisName",_loc1.__get__temporisName,function()
{
}
);
_loc1.addProperty("temporisUIComponents",_loc1.__get__temporisUIComponents,function()
{
}
);
_loc1.addProperty("temporisVersion",_loc1.__get__temporisVersion,function()
{
}
);
ASSetPropFlags(_loc1,null,1);
