if(!dofus["\r\x14"].gapi.ui.KnownledgeBase)
{
   if(!dofus)
   {
      _global.dofus = new Object();
   }
   if(!dofus["\r\x14"])
   {
      _global.dofus["\r\x14"] = new Object();
   }
   if(!dofus["\r\x14"].gapi)
   {
      _global.dofus["\r\x14"].gapi = new Object();
   }
   if(!dofus["\r\x14"].gapi.ui)
   {
      _global.dofus["\r\x14"].gapi.ui = new Object();
   }
   dofus["\r\x14"].gapi.ui.KnownledgeBase = function()
   {
      super();
      this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES,true);
      this._btnMaximize._visible = false;
   } extends dofus["\r\x14"].gapi.core["\x10\x19"];
   var _loc1_ = dofus["\r\x14"].gapi.ui.KnownledgeBase = function()
   {
      super();
      this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES,true);
      this._btnMaximize._visible = false;
   }.prototype;
   _loc1_.__set__article = function __set__article(§\b\x10§)
   {
      this.addToQueue({object:this,method:this.displayArticle,params:[_loc2_]});
      return this.article;
   };
   _loc1_.init = function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.KnownledgeBase.CLASS_NAME);
   };
   _loc1_.createChildren = function createChildren()
   {
      this.addToQueue({object:this,method:this.initText});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this,method:this.recoverLastState});
   };
   _loc1_.callClose = function callClose()
   {
      this.unloadThis();
      return true;
   };
   _loc1_.initText = function initText()
   {
      this._winBackground.title = this.api.lang.getText("KB_TITLE");
      this._lblSearch.text = this.api.lang.getText("KB_SEARCH");
   };
   _loc1_.addListeners = function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnMaximize.addEventListener("click",this);
      this._btnMaximize.addEventListener("over",this);
      this._btnMaximize.addEventListener("out",this);
      this._btnMinimize.addEventListener("click",this);
      this._btnMinimize.addEventListener("over",this);
      this._btnMinimize.addEventListener("out",this);
      this._lstCategories.addEventListener("itemSelected",this);
      this._lstArticles.addEventListener("itemSelected",this);
      this._lstSearch.addEventListener("itemSelected",this);
      this._taArticle.addEventListener("href",this);
      this._mcBtnCategory.onRelease = function()
      {
         this._parent.click({target:this});
      };
      this._mcBtnArticle.onRelease = function()
      {
         this._parent.click({target:this});
      };
      this._tiSearch.addEventListener("change",this);
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   };
   _loc1_.initData = function initData()
   {
      var _loc2_ = this.api.lang.getKnownledgeBaseCategories();
      _loc2_.sortOn("o",Array.NUMERIC | Array.DESCENDING);
      this._eaCategories = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(_loc2_[_loc3_] != undefined && (this.api.datacenter.Basics.aks_current_regional_version != undefined && _loc2_[_loc3_].ep <= this.api.datacenter.Basics.aks_current_regional_version))
         {
            this._eaCategories.push(_loc2_[_loc3_]);
         }
         _loc3_ = _loc3_ + 1;
      }
      this._lstCategories.dataProvider = this._eaCategories;
      var _loc4_ = this.api.lang.getKnownledgeBaseArticles();
      _loc4_.sortOn("o",Array.NUMERIC | Array.DESCENDING);
      this._eaArticles = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = 0;
      while(_loc5_ < _loc4_.length)
      {
         if(_loc4_[_loc5_] != undefined && (this.api.datacenter.Basics.aks_current_regional_version != undefined && _loc4_[_loc5_].ep <= this.api.datacenter.Basics.aks_current_regional_version))
         {
            this._eaArticles.push(_loc4_[_loc5_]);
         }
         _loc5_ = _loc5_ + 1;
      }
      this.generateIndexes();
   };
   _loc1_.recoverLastState = function recoverLastState()
   {
      switch(this.api.datacenter.Basics.kbDisplayType)
      {
         case dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES:
            this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES);
            break;
         case dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_ARTICLES:
            this.displayArticles(this.api.datacenter.Basics.kbCategory);
            break;
         case dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_ARTICLE:
            this.displayArticle(this.api.datacenter.Basics.kbArticle);
            break;
         case dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_SEARCH:
            this._tiSearch.text = this.api.datacenter.Basics.kbSearch;
      }
   };
   _loc1_.switchToState = function switchToState(§\x1e\x1c\x16§)
   {
      if(this._nCurrentState == _loc2_)
      {
         return undefined;
      }
      var _loc3_ = this.api.ui.getUIComponent("KnownledgeBase");
      switch(_loc2_)
      {
         case dofus["\r\x14"].gapi.ui.KnownledgeBase.STATE_MINIMIZED:
            this._btnMaximize._visible = true;
            this._btnMinimize._visible = false;
            _loc3_._y = 352;
            break;
         case dofus["\r\x14"].gapi.ui.KnownledgeBase.STATE_MAXIMIZED:
            this._btnMaximize._visible = false;
            this._btnMinimize._visible = true;
            _loc3_._y = 0;
      }
      this._nCurrentState = _loc2_;
   };
   _loc1_.switchToDisplay = function switchToDisplay(§\x06\x03§, §\x1a\x16§)
   {
      if(this._nCurrentDisplay == _loc2_)
      {
         return undefined;
      }
      switch(_loc2_)
      {
         case dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES:
            this._lstCategories._visible = true;
            this._lstArticles._visible = false;
            this._lblCategory._visible = false;
            this._mcCategory._visible = false;
            this._mcArrowUp._visible = false;
            this._mcBgCategory._visible = false;
            this._mcBtnCategory._visible = false;
            this._lblArticle._visible = false;
            this._mcArticle._visible = false;
            this._mcBgArticle._visible = false;
            this._mcBtnArticle._visible = false;
            this._taArticle._visible = false;
            this._lstSearch._visible = false;
            this._mcBookComplete._visible = false;
            this._mcArrowUp2._visible = false;
            break;
         case dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_ARTICLES:
            this._lstCategories._visible = false;
            this._lstArticles._visible = true;
            this._lblCategory._visible = true;
            this._mcCategory._visible = true;
            this._mcArrowUp._visible = true;
            this._mcBgCategory._visible = true;
            this._mcBtnCategory._visible = true;
            this._lblArticle._visible = false;
            this._mcArticle._visible = false;
            this._mcBgArticle._visible = false;
            this._mcBtnArticle._visible = false;
            this._taArticle._visible = false;
            this._lstSearch._visible = false;
            this._mcBookComplete._visible = false;
            this._mcArrowUp2._visible = false;
            break;
         case dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_SEARCH:
            this._lstCategories._visible = false;
            this._lstArticles._visible = false;
            this._lblCategory._visible = false;
            this._mcCategory._visible = false;
            this._mcArrowUp._visible = false;
            this._mcBgCategory._visible = false;
            this._mcBtnCategory._visible = false;
            this._lblArticle._visible = false;
            this._mcArticle._visible = false;
            this._mcBgArticle._visible = false;
            this._mcBtnArticle._visible = false;
            this._taArticle._visible = false;
            this._lstSearch._visible = true;
            this._mcBookComplete._visible = false;
            this._mcArrowUp2._visible = false;
            break;
         case dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_ARTICLE:
            this._lstCategories._visible = false;
            this._lstArticles._visible = false;
            this._lblCategory._visible = true;
            this._mcCategory._visible = true;
            this._mcArrowUp._visible = false;
            this._mcBgCategory._visible = true;
            this._mcBtnCategory._visible = false;
            this._lblArticle._visible = true;
            this._mcArticle._visible = true;
            this._mcBgArticle._visible = true;
            this._mcBtnArticle._visible = true;
            this._taArticle._visible = true;
            this._lstSearch._visible = false;
            this._mcBookComplete._visible = true;
            this._mcArrowUp2._visible = true;
      }
      this._nCurrentDisplay = _loc2_;
      if(_loc3_ !== true)
      {
         this.api.datacenter.Basics.kbDisplayType = _loc2_;
      }
   };
   _loc1_.generateIndexes = function generateIndexes()
   {
      this._eaIndexes = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc2_ = 0;
      while(_loc2_ < this._eaArticles.length)
      {
         var _loc3_ = 0;
         while(_loc3_ < this._eaArticles[_loc2_].k.length)
         {
            this._eaIndexes.push({name:this._eaArticles[_loc2_].k[_loc3_].toUpperCase(),i:this._eaArticles[_loc2_].i});
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
   };
   _loc1_.searchTopic = function searchTopic(§\x1e\f\f§)
   {
      var _loc3_ = _loc2_.split(" ");
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc6_ = new Array();
      var _loc7_ = 0;
      var _loc8_ = new Array();
      var _loc9_ = -1;
      var _loc10_ = 0;
      while(_loc10_ < this._eaIndexes.length)
      {
         var _loc11_ = this._eaIndexes[_loc10_];
         var _loc12_ = this.searchWordsInName(_loc3_,_loc11_.name,_loc7_);
         if(_loc12_ != 0)
         {
            _loc6_.push({i:_loc11_.i,w:_loc12_});
            _loc7_ = _loc12_;
         }
         _loc10_ = _loc10_ + 1;
      }
      var _loc13_ = 0;
      while(_loc13_ < _loc6_.length)
      {
         if(!_loc8_[_loc6_[_loc13_].i] && _loc6_[_loc13_].w >= _loc7_)
         {
            var _loc14_ = this._eaArticles.findFirstItem("i",_loc6_[_loc13_].i).item;
            _loc4_.push(_loc14_);
            _loc8_[_loc6_[_loc13_].i] = true;
         }
         _loc13_ = _loc13_ + 1;
      }
      _loc4_.sortOn("c",Array.NUMERIC | Array.DESCENDING);
      var _loc15_ = 0;
      while(_loc15_ < _loc4_.length)
      {
         if(_loc4_[_loc15_].n != "" && _loc4_[_loc15_].n != undefined)
         {
            if(_loc9_ != _loc4_[_loc15_].c)
            {
               _loc5_.push(this.api.lang.getKnownledgeBaseCategory(_loc4_[_loc15_].c));
               _loc9_ = _loc4_[_loc15_].c;
            }
            _loc5_.push(_loc4_[_loc15_]);
         }
         _loc15_ = _loc15_ + 1;
      }
      this._lstSearch.dataProvider = _loc5_;
   };
   _loc1_.searchWordsInName = function searchWordsInName(§\x1d\x01§, §\x1e\x0f\x16§, §\x02\x14§)
   {
      var _loc5_ = 0;
      var _loc6_ = _loc2_.length;
      while(_loc6_ >= 0)
      {
         var _loc7_ = _loc2_[_loc6_];
         if(_loc3_.indexOf(_loc7_) != -1)
         {
            _loc5_ = _loc5_ + 1;
         }
         else if(_loc5_ + _loc6_ < _loc4_)
         {
            return 0;
         }
         _loc6_ = _loc6_ - 1;
      }
      return _loc5_;
   };
   _loc1_.displayArticles = function displayArticles(§\x07\x17§, §\x1a\x1c§)
   {
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = 0;
      while(_loc5_ < this._eaArticles.length)
      {
         if(this._eaArticles[_loc5_].c == _loc2_)
         {
            _loc4_.push(this._eaArticles[_loc5_]);
         }
         _loc5_ = _loc5_ + 1;
      }
      this._lstArticles.dataProvider = _loc4_;
      this._lblCategory.text = this._eaCategories.findFirstItem("i",_loc2_).item.n;
      if(_loc3_ !== true)
      {
         this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_ARTICLES);
      }
      this.api.datacenter.Basics.kbCategory = _loc2_;
   };
   _loc1_.displayArticle = function displayArticle(§\b\x10§)
   {
      var _loc3_ = this._eaArticles.findFirstItem("i",_loc2_).item;
      this._lblArticle.text = _loc3_.n;
      this.displayArticles(_loc3_.c,true);
      this._taArticle.text = "<p class=\'body\'>" + _loc3_.a + "</p>";
      this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_ARTICLE);
      this.api.datacenter.Basics.kbArticle = _loc2_;
   };
   _loc1_.click = function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
            this.callClose();
            break;
         case "_mcBtnCategory":
            this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES);
            break;
         case "_mcBtnArticle":
            this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_ARTICLES);
            break;
         case "_btnMaximize":
            this.switchToState(dofus["\r\x14"].gapi.ui.KnownledgeBase.STATE_MAXIMIZED);
            break;
         case "_btnMinimize":
            this.switchToState(dofus["\r\x14"].gapi.ui.KnownledgeBase.STATE_MINIMIZED);
      }
   };
   _loc1_.over = function over(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnMinimize":
            this.gapi.showTooltip(this.api.lang.getText("WINDOW_MINIMIZE"),_loc2_.target,20);
            break;
         case "_btnMaximize":
            this.gapi.showTooltip(this.api.lang.getText("WINDOW_MAXIMIZE"),_loc2_.target,20);
      }
   };
   _loc1_.out = function out(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   };
   _loc1_.itemSelected = function itemSelected(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_lstCategories":
            this.displayArticles(Number(_loc2_.row.item.i));
            break;
         case "_lstArticles":
            this.displayArticle(Number(_loc2_.row.item.i));
            break;
         case "_lstSearch":
            var _loc3_ = _loc2_.row.item;
            if(_loc3_.c > 0)
            {
               this._lblArticle.text = _loc3_.n;
               this._lblCategory.text = this._eaCategories.findFirstItem("i",_loc3_.c).item.n;
               this._taArticle.text = _loc3_.a;
               this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_ARTICLE);
               break;
            }
            this._lblCategory.text = _loc3_.n;
            var _loc4_ = _loc3_.i;
            §§push(0);
            §§push(ank);
            §§push("\x1e\n\x07");
         default:
            var _loc5_ = new §§pop()[§§pop()]["\x0f\x01"]();
            var _loc6_ = 0;
            while(_loc6_ < this._eaArticles.length)
            {
               if(this._eaArticles[_loc6_].c == _loc4_)
               {
                  _loc5_.push(this._eaArticles[_loc6_]);
               }
               _loc6_ = _loc6_ + 1;
            }
            this._lstArticles.dataProvider = _loc5_;
            this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_ARTICLES);
      }
   };
   _loc1_.change = function change(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_["\x07\x03"]["\x07\x01"]) === "")
      {
         var _loc3_ = this[""][""];
         if(_loc3_["\b{invalid_utf8=128}{invalid_utf8=150}\x02"] > 0)
         {
            this(eval("{invalid_utf8=150}\x02")["\x05"]["\x12{invalid_utf8=157}\x02"]["P${invalid_utf8=136}\x04"]["\x01"]["\b\x02N{invalid_utf8=150}\x02"]);
            this["@N{invalid_utf8=150}\x02"](_loc3_["4{invalid_utf8=157}\x02"]());
         }
         else
         {
            this(eval("{invalid_utf8=150}\x02")["\x05"]["\x12{invalid_utf8=157}\x02"]["P${invalid_utf8=136}\x04"]["\x01"][""]);
         }
         this["{invalid_utf8=162}"]["\x05"]["\x12{invalid_utf8=157}\x02"]["\x04\x01\br{invalid_utf8=150}\x02"] = this[""][""];
      }
   };
   _loc1_[""] = function §§(§\x1e\x19\x0e§)
   {
      this["{invalid_utf8=162}"]["2{invalid_utf8=157}\x02"]["\b"]["\x1c{invalid_utf8=150}\x02"](_loc2_);
   };
   _loc1_["\x06"] = function §\x06§(§\x1e\r\x14§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_) === "\b\x01N{invalid_utf8=150}\x02")
      {
         if(this[""]["\b\x02N{invalid_utf8=150}\x02"])
         {
            this["\x04\x01\b\x02{invalid_utf8=150}\x03"]({§\x07\x03§:this[""]});
         }
      }
   };
   _loc1_["\b\x044P{invalid_utf8=157}\x02"]("\b\x03N{invalid_utf8=150}\x02",function()
   {
   }
   ,_loc1_["\x04\x01\b84{invalid_utf8=157}\x02"]);
   "{invalid_utf8=145}{invalid_utf8=255}i{invalid_utf8=150}\x02"(_loc1_,null,1);
   dofus["\r\x14"].gapi.ui.KnownledgeBase = function()
   {
      super();
      this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES,true);
      this._btnMaximize._visible = false;
   }["\x04\x02\b5N{invalid_utf8=150}\x02"] = "\x01";
   dofus["\r\x14"].gapi.ui.KnownledgeBase = function()
   {
      super();
      this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES,true);
      this._btnMaximize._visible = false;
   }[""] = 1;
   dofus["\r\x14"].gapi.ui.KnownledgeBase = function()
   {
      super();
      this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES,true);
      this._btnMaximize._visible = false;
   }["\x1c{invalid_utf8=150}\x02"] = 2;
   dofus["\r\x14"].gapi.ui.KnownledgeBase = function()
   {
      super();
      this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES,true);
      this._btnMaximize._visible = false;
   }["\b\x02N{invalid_utf8=150}\x02"] = 3;
   dofus["\r\x14"].gapi.ui.KnownledgeBase = function()
   {
      super();
      this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES,true);
      this._btnMaximize._visible = false;
   }.DISPLAY_ARTICLE = 4;
   dofus["\r\x14"].gapi.ui.KnownledgeBase = function()
   {
      super();
      this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES,true);
      this._btnMaximize._visible = false;
   }.STATE_MINIMIZED = 1;
   dofus["\r\x14"].gapi.ui.KnownledgeBase = function()
   {
      super();
      this.switchToDisplay(dofus["\r\x14"].gapi.ui.KnownledgeBase.DISPLAY_CATEGORIES,true);
      this._btnMaximize._visible = false;
   }.STATE_MAXIMIZED = 2;
}
