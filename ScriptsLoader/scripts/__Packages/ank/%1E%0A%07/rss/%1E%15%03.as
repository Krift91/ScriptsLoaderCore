class ank.§\x1e\n\x07§.rss.§\x1e\x15\x03§
{
   var _sTitle;
   var _sLink;
   var _sPubDate;
   var _dPubDate;
   var sortByDate;
   var _sGuid;
   var _sIcon;
   function §\x1e\x15\x03§()
   {
   }
   function parse(§\x1e\t\x10§)
   {
      this.initialize();
      if(_loc2_.nodeName.toLowerCase() != "item")
      {
         return false;
      }
      var _loc3_ = _loc2_.firstChild;
      while(_loc3_ != null)
      {
         switch(_loc3_.nodeName.toLowerCase())
         {
            case "title":
               this._sTitle = _loc3_.childNodes.join("");
               var _loc4_ = this._sTitle.split("&apos;");
               this._sTitle = _loc4_.join("\'");
               break;
            case "link":
               this._sLink = _loc3_.childNodes.join("");
               break;
            case "pubdate":
               this._sPubDate = _loc3_.childNodes.join("");
               this._dPubDate = eval("\x1e\x18\x01")["\x1e\n\x07"]["\x1e\x11\f"].getDateFromFormat(this._sPubDate.substr(0,25),"E, d MMM yyyy H:m:s");
               if(this._dPubDate == null)
               {
                  this._dPubDate = eval("\x1e\x18\x01")["\x1e\n\x07"]["\x1e\x11\f"].getDateFromFormat(this._sPubDate.substr(0,25),"E,  d MMM yyyy H:m:s");
               }
               this.sortByDate = eval("\x1e\x18\x01")["\x1e\n\x07"]["\x1e\x11\f"].formatDate(this._dPubDate,"yyyyMMdd");
               break;
            case "guid":
               this._sGuid = _loc3_.childNodes.join("");
               break;
            case "icon":
               this._sIcon = _loc3_.childNodes.join("");
         }
         _loc3_ = _loc3_.nextSibling;
      }
      return true;
   }
   function toString()
   {
      return "RSSItem title:" + this._sTitle + "\tlink:" + this._sLink + "\tpubdate:" + this._dPubDate + "\tguid:" + this._sGuid;
   }
   function getTitle()
   {
      return this._sTitle;
   }
   function getLink()
   {
      return this._sLink;
   }
   function getPubDate()
   {
      return this._dPubDate;
   }
   function getPubDateStr(§\x1e\x12\x04§, §\x1e\x10\x16§)
   {
      return this._dPubDate != null ? eval("\x1e\x18\x01")["\x1e\n\x07"]["\x1e\x11\f"].formatDate(this._dPubDate,_loc2_,_loc3_) : this._sPubDate;
   }
   function getGuid()
   {
      return this._sGuid;
   }
   function getIcon()
   {
      return this._sIcon;
   }
   function initialize()
   {
      this._sTitle = "";
      this._sLink = "";
      this._dPubDate = null;
      this._sGuid = "";
   }
}
