var _loc1 = ank.gapi.controls.Container.prototype;
_loc1.__get__centerContent = function()
{
   return this._bCenterContent;
};
_loc1.__set__centerContent = function(bCenterContent)
{
   this._bCenterContent = bCenterContent;
   return this._bCenterContent;
};
_loc1.__get__scaleContent = function()
{
   return this._bScaleContent;
};
_loc1.__set__scaleContent = function(bScaleContent)
{
   this._bScaleContent = bScaleContent;
   return this._bScaleContent;
};
_loc1.__set__contentData = function(oContentData)
{
   this._oContentData = oContentData;
   if(this._oContentData.forceReloadOnContainer != undefined)
   {
      this._ldrContent.forceReload = this._oContentData.forceReloadOnContainer;
   }
   if(this._oContentData.params != undefined)
   {
      this._ldrContent.contentParams = this._oContentData.params;
   }
   if(this._oContentData.iconFile != undefined)
   {
      this.contentPath = this._oContentData.iconFile;
      if(this._oContentData.style == "LEG")
      {
         this._ldrContent.holder.filters = undefined;
         this._ldrContent.holder.filters = [new flash.filters.GlowFilter(16764672,1,10,10,1,1,true,false)];
      }
      else if(this._oContentData.style == "DIV")
      {
         this._ldrContent.holder.filters = undefined;
         this._ldrContent.holder.filters = [new flash.filters.GlowFilter(16737279,1,10,10,1,1,true,false)];
      }
      else if(this._oContentData.style == "RARE")
      {
         this._ldrContent.holder.filters = undefined;
         this._ldrContent.holder.filters = [new flash.filters.GlowFilter(57087,1,10,10,1,1,true,false)];
      }
      else if(this._oContentData.style == "MYTHIQUE")
      {
         this._ldrContent.holder.filters = undefined;
         this._ldrContent.holder.filters = [new flash.filters.GlowFilter(16711680,1,10,10,1,1,true,false)];
      }
      else
      {
         this._ldrContent.holder.filters = [];
      }
   }
   else
   {
      this.contentPath = "";
   }
   if(this._oContentData.label != undefined)
   {
      if(this.label != this._oContentData.label)
      {
         this.label = this._oContentData.label;
      }
   }
   else
   {
      this.label = "";
   }
};
_loc1.createChildren = function()
{
   if(this._bScaleContent == undefined)
   {
      this._bScalContent = true;
   }
   if(this._bCenterContent == undefined)
   {
      this._bCenterContent = false;
   }
   this.createEmptyMovieClip("_mcInteraction",0);
   this.drawRoundRect(this._mcInteraction,0,0,1,1,0,0,0);
   this._mcInteraction.trackAsMenu = true;
   this.attachMovie("Loader","_ldrContent",20,{scaleContent:this._bScaleContent,centerContent:this._bCenterContent});
   this._ldrContent.move(this._nMargin,this._nMargin);
   this._ldrContent.addEventListener("complete",this);
   this.createEmptyMovieClip("_mcLabelBackground",29);
};
_loc1.addProperty("centerContent",_loc1.__get__centerContent,_loc1.__set__centerContent);
_loc1.addProperty("scaleContent",_loc1.__get__scaleContent,_loc1.__set__scaleContent);
_loc1.addProperty("contentData",_loc1.__get__contentData,_loc1.__set__contentData);
