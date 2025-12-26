class dofus.§\x1e\n\x07§.§\x10\x17§
{
   var _aDataServers;
   var _aLanguages;
   var _aXmlLanguages;
   var _bSkipLanguageVerification;
   var _aCacheAsBitmap;
   var _bIsExpo;
   var _sStreamingMethod;
   var customServersIP;
   var _bIsStreaming = false;
   function §\x10\x17§()
   {
      if(_global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME] == undefined)
      {
         _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME] = ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(dofus.Constants.OPTIONS_SHAREDOBJECT_NAME);
      }
   }
   function set dataServers(§\x1e\x13§)
   {
      this._aDataServers = _loc2_;
   }
   function get dataServers()
   {
      return this._aDataServers;
   }
   function set language(§\x1e\x10\x16§)
   {
      var _loc3_ = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME];
      _loc3_.data.language = _loc2_;
      _loc3_.flush();
   }
   function get language()
   {
      var _loc2_ = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME].data.language;
      if(_loc2_ == undefined || (_loc2_ == "undefined" || _root.htmlLang != undefined))
      {
         if(_root.htmlLang != undefined)
         {
            var _loc3_ = _root.htmlLang;
         }
         else
         {
            _loc3_ = System.capabilities.language;
         }
         switch(_loc3_)
         {
            case "fr":
            case "en":
            case "de":
            case "pt":
            case "ru":
            case "nl":
            case "es":
            case "it":
               return "es";
            default:
               return "es";
         }
      }
      else
      {
         return _loc2_.toLowerCase();
      }
   }
   function set languages(§\x1e\x0e§)
   {
      this._aLanguages = _loc2_;
   }
   function get languages()
   {
      var _loc2_ = new Array();
      if(this._aXmlLanguages != undefined)
      {
         var _loc3_ = 0;
         while(_loc3_ < this._aXmlLanguages.length)
         {
            _loc2_.push(this._aXmlLanguages[_loc3_]);
            _loc3_ = _loc3_ + 1;
         }
      }
      if(this._aLanguages != undefined)
      {
         var _loc4_ = 0;
         while(_loc4_ < this._aLanguages.length)
         {
            var _loc5_ = false;
            var _loc6_ = 0;
            while(_loc6_ < this._aXmlLanguages.length)
            {
               if(this._aXmlLanguages[_loc6_] == this._aLanguages[_loc4_])
               {
                  _loc5_ = true;
               }
               _loc6_ = _loc6_ + 1;
            }
            if(!_loc5_)
            {
               _loc2_.push(this._aLanguages[_loc4_]);
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      return _loc2_;
   }
   function set xmlLanguages(§\x1c§)
   {
      this._aXmlLanguages = _loc2_;
   }
   function get xmlLanguages()
   {
      return this._aXmlLanguages;
   }
   function set skipLanguageVerification(§\x1c\x1d§)
   {
      this._bSkipLanguageVerification = _loc2_;
   }
   function get skipLanguageVerification()
   {
      return this._bSkipLanguageVerification;
   }
   function set cacheAsBitmap(§\x13§)
   {
      this._aCacheAsBitmap = _loc2_;
   }
   function get cacheAsBitmap()
   {
      return this._aCacheAsBitmap;
   }
   function set isExpo(§\x1a\t§)
   {
      this._bIsExpo = _loc2_;
   }
   function get isExpo()
   {
      return this._bIsExpo;
   }
   function set isStreaming(§\x14\x18§)
   {
      this._bIsStreaming = _loc2_;
   }
   function get isStreaming()
   {
      return this._bIsStreaming;
   }
   function set streamingMethod(§\x1e\x0f\x16§)
   {
      this._sStreamingMethod = _loc2_;
   }
   function get streamingMethod()
   {
      return this._sStreamingMethod;
   }
   function get isLinux()
   {
      return String(System.capabilities.version).indexOf("LNX") > -1;
   }
   function get isWindows()
   {
      return String(System.capabilities.version).indexOf("WIN") > -1;
   }
   function get isMac()
   {
      return String(System.capabilities.version).indexOf("MAC") > -1;
   }
   function getCustomIP(§\x1e\x1d\x11§)
   {
      return this.customServersIP[_loc2_];
   }
}
