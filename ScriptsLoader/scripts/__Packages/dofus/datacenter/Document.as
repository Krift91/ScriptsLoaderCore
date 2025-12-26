class dofus.datacenter.Document extends Object
{
   var _sType;
   var _sTitle;
   var _sSubTitle;
   var _sAuthor;
   var _aPages;
   var api;
   var _sCSS;
   var _aChapters;
   static var MAX_CHAPTER_ON_PAGE = 13;
   function Document(§\n\r§)
   {
      super();
      this.initialize(_loc3_);
   }
   function get uiType()
   {
      switch(this._sType)
      {
         case "book":
            return "DocumentBook";
         case "parchment":
            return "DocumentParchment";
         case "roadsignleft":
            return "DocumentRoadSignLeft";
         case "roadsignright":
            return "DocumentRoadSignRight";
         default:
      }
   }
   function get title()
   {
      return this._sTitle;
   }
   function get subtitle()
   {
      return this._sSubTitle;
   }
   function get author()
   {
      return this._sAuthor;
   }
   function get pageCount()
   {
      return this._aPages.length;
   }
   function initialize(§\n\r§)
   {
      this.api = _global.API;
      this._sType = _loc2_.type;
      this._sTitle = _loc2_.title;
      this._sSubTitle = _loc2_.subtitle;
      this._sAuthor = _loc2_.author;
      this._sCSS = dofus.Constants.STYLES_PATH + _loc2_.style + ".css";
      this._aChapters = _loc2_.chapters;
      this._aPages = new ank["\x1e\n\x07"]["\x0f\x01"]();
      switch(this._sType)
      {
         case "book":
            var _loc3_ = 1;
            if(this._sTitle != undefined)
            {
               this._aPages.push({type:"blank"});
               this._aPages.push({type:"title",num:_loc3_++,title:this._sTitle,subtitle:this._sSubTitle,author:this._sAuthor});
            }
            var _loc4_ = new Object();
            var _loc5_ = this._aChapters.length;
            if(_loc5_ != 0 && this._aChapters != undefined)
            {
               this._aPages.push({type:"blank",num:_loc3_++});
               var _loc6_ = 0;
               var _loc7_ = 0;
               while(_loc6_ < _loc5_)
               {
                  var _loc8_ = this._aChapters.slice(_loc6_,_loc6_ + dofus.datacenter.Document.MAX_CHAPTER_ON_PAGE);
                  this._aPages.push({type:"index",num:_loc3_++,chapters:_loc8_});
                  _loc6_ += dofus.datacenter.Document.MAX_CHAPTER_ON_PAGE;
                  _loc7_ = _loc7_ + 1;
               }
               if(_loc7_ % 2 == 0)
               {
                  this._aPages.push({type:"blank",num:_loc3_++});
               }
               for(var k in this._aChapters)
               {
                  _loc4_[this._aChapters[k][1]] = this._aChapters[k];
               }
            }
            var _loc9_ = _loc2_.pages;
            var _loc10_ = _loc9_.length;
            if(_loc10_ != 0)
            {
               this._aPages.push({type:"blank",num:_loc3_++});
               var _loc11_ = this.api.kernel.DocumentsServersManager.getCurrentServer() + "#1/#2.#1";
               var _loc12_ = 0;
               while(_loc12_ < _loc10_)
               {
                  var _loc13_ = new String();
                  if(_loc4_[_loc12_] != undefined)
                  {
                     if(_loc4_[_loc12_][2] && _loc3_ % 2 == 0)
                     {
                        this._aPages.push({type:"blank",num:_loc3_++});
                     }
                     _loc4_[_loc12_][4] = _loc3_;
                     if(_loc4_[_loc12_][3])
                     {
                        _loc13_ = "<br/><p class=\'chapter\'>" + _loc4_[_loc12_][0] + "</p><br/>";
                     }
                  }
                  _loc9_[_loc12_] = ank["\x1e\n\x07"]["\x1e\x16\x19"].replace(_loc9_[_loc12_],_loc11_);
                  this._aPages.push({type:"text",num:_loc3_++,text:_loc13_ + _loc9_[_loc12_],cssFile:this._sCSS});
                  _loc12_ = _loc12_ + 1;
               }
            }
            break;
         case "parchment":
         case "roadsignleft":
         case "roadsignright":
            var _loc14_ = _loc2_.pages[0];
            var _loc15_ = this.api.kernel.DocumentsServersManager.getCurrentServer() + "#1/#2.#1";
            _loc14_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].replace(_loc14_,_loc15_);
            this._aPages.push({text:_loc14_,cssFile:this._sCSS});
      }
   }
   function getPage(§\x01\x1a§)
   {
      return this._aPages[_loc2_];
   }
}
