class dofus.§\r\x14§.gapi.ui.MonsterAndLookSelector extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _bMonster;
   var _winBg;
   var _lblType;
   var _btnCancel;
   var _btnSelect;
   var _btnSearch;
   var _tiSearch;
   var _btnClose;
   var _cbType;
   var _cbAnim;
   var _cg;
   var _cciSprite;
   var _eaTypes;
   var firstChild;
   var dispatchEvent;
   var _lblNumber;
   static var CLASS_NAME = "MonsterAndLookSelector";
   static var ANIM_LIST = ["static","walk","run","hit","bonus","anim0","anim1","anim2","anim3","anim4","anim5","anim6","anim7","anim8","anim9","anim10","anim11","anim12","anim12","anim13","anim14","anim15","anim16","anim17","anim18","anim111","anim112","anim113","anim114","anim115","anim116","anim117","emote1","emote2","emote3","emote4","emote5","emote6","emote7","emote8","emote9","emote10","emote11","emote12","emote13","emote14","emote15","emote16","emote17","emote18","emote19","emote20","emote21","emoteStatic1","emoteStatic14","emoteStatic15","emoteStatic16","emoteStatic19","emoteStatic20","emoteStatic21","die"];
   function MonsterAndLookSelector()
   {
      super();
   }
   function set monster(§\x17\x16§)
   {
      this._bMonster = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.MonsterAndLookSelector.CLASS_NAME);
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initAnimList});
      if(this._bMonster)
      {
         this.addToQueue({object:this,method:this.loadMonsters});
      }
      else
      {
         this.addToQueue({object:this,method:this.loadLooks});
      }
   }
   function initTexts()
   {
      if(this._bMonster)
      {
         this._winBg.title = "Liste des monstres";
      }
      else
      {
         this._winBg.title = "Liste des look";
      }
      this._lblType.text = this.api.lang.getText("TYPE");
      this._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
      this._btnSelect.label = this.api.lang.getText("SELECT");
      this._btnSearch.label = this.api.lang.getText("OK");
      this._tiSearch.text = !this._tiSearch.text.length ? "Recherche..." : this._tiSearch.text;
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnCancel.addEventListener("click",this);
      this._btnSelect.addEventListener("click",this);
      this._cbType.addEventListener("itemSelected",this);
      this._cbAnim.addEventListener("itemSelected",this);
      this._cg.addEventListener("selectItem",this);
      this._cg.addEventListener("overItem",this);
      this._cg.addEventListener("outItem",this);
      this._cg.addEventListener("dblClickItem",this);
      this._cg.multipleContainerSelectionEnabled = false;
      this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
      this._btnSearch.addEventListener("click",this);
      var ref = this;
      var _loc2_ = new Object();
      _loc2_.onSetFocus = function(§\x1e\x18\x1b§, §\x05\x11§)
      {
         if(eval(Selection.getFocus())._parent == ref._tiSearch)
         {
            if(ref._tiSearch.text == "Recherche...")
            {
               ref._tiSearch.text = "";
            }
         }
         else if(ref._tiSearch.text == "")
         {
            ref._tiSearch.text = "Recherche...";
         }
      };
      Selection.addListener(_loc2_);
   }
   function initAnimList(§\x0f\x0e§)
   {
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc4_ = 0;
      while(_loc4_ < dofus["\r\x14"].gapi.ui.MonsterAndLookSelector.ANIM_LIST.length)
      {
         _loc3_.push({label:dofus["\r\x14"].gapi.ui.MonsterAndLookSelector.ANIM_LIST[_loc4_]});
         _loc4_ = _loc4_ + 1;
      }
      this._cbAnim.dataProvider = _loc3_;
   }
   function initData(§\x0f\x0e§)
   {
      this._cciSprite.deleteButton = false;
      this._eaTypes = _loc2_;
      _loc2_.sortOn("label");
      this._cbType.dataProvider = _loc2_;
      this._cbType.selectedIndex = 0;
      this.filterResult("");
   }
   function loadLooks()
   {
      var ui = this;
      var _loc2_ = new XML();
      _loc2_.ignoreWhite = true;
      _loc2_.onLoad = function()
      {
         var _loc2_ = dofus.Constants.ARTWORKS_BIG_PATH;
         var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         var _loc5_ = this.firstChild.firstChild;
         while(_loc5_ != undefined)
         {
            var _loc6_ = _loc5_.attributes.name;
            var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
            var _loc8_ = _loc5_.firstChild;
            while(_loc8_ != undefined)
            {
               var _loc9_ = _loc8_.attributes.id;
               var _loc10_ = _loc8_.attributes.name;
               var _loc11_ = {iconFile:_loc2_ + _loc9_ + ".swf",name:_loc10_,id:_loc9_,gfxId:_loc9_};
               _loc7_.push(_loc11_);
               _loc4_.push(_loc11_);
               _loc8_ = _loc8_.nextSibling;
            }
            _loc3_.push({label:_loc6_,data:_loc7_});
            _loc5_ = _loc5_.nextSibling;
         }
         _loc3_.push({label:"-- ALL --",data:_loc4_});
         ui.initData(_loc3_);
      };
      _loc2_.load(dofus.Constants.XML_SPRITE_LIST);
   }
   function loadMonsters(§\x1e\x12\b§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = "";
      }
      var _loc3_ = this.api.lang.getMonsters();
      var _loc4_ = dofus.Constants.ARTWORKS_BIG_PATH;
      var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc7_ = new Object();
      for(var a in _loc3_)
      {
         var _loc8_ = _loc3_[a];
         var _loc9_ = _loc8_.b;
         var _loc10_ = _loc7_[_loc9_];
         if(_loc10_ == undefined)
         {
            _loc10_ = {label:this.api.lang.getMonstersRaceText(_loc9_).n,data:new ank["\x1e\n\x07"]["\x0f\x01"]()};
            _loc7_[_loc9_] = _loc10_;
            _loc5_.push(_loc10_);
         }
         var _loc11_ = a;
         var _loc12_ = _loc8_.n;
         var _loc13_ = _loc8_.g;
         var _loc14_ = {iconFile:_loc4_ + _loc13_ + ".swf",name:_loc12_,id:_loc11_,gfxId:_loc13_};
         _loc6_.push(_loc14_);
         _loc10_.data.push(_loc14_);
      }
      _loc5_.push({label:"-- ALL --",data:_loc6_});
      this.initData(_loc5_);
   }
   function select(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.contentData;
      if(_loc3_ != undefined)
      {
         if(this._bMonster)
         {
            this.dispatchEvent({type:"select",ui:"MonsterSelector",monsterId:_loc3_.id});
         }
         else
         {
            this.dispatchEvent({type:"select",ui:"LookSelector",lookId:_loc3_.id});
         }
         this.callClose();
      }
   }
   function filterResult(§\x1e\x12\b§)
   {
      var _loc3_ = this._cbType.selectedItem.data;
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         var _loc6_ = _loc3_[_loc5_].name;
         if(!(_loc2_.length && (_loc2_ != "Recherche..." && (_loc2_.length && _loc6_.toUpperCase().indexOf(_loc2_.toUpperCase()) == -1))))
         {
            _loc4_.push(_loc3_[_loc5_]);
         }
         _loc5_ = _loc5_ + 1;
      }
      this._cg.dataProvider = _loc4_;
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
         case "_btnCancel":
            this.dispatchEvent({type:"cancel"});
            this.callClose();
         case "_btnSelect":
            this.select({target:this._cg.selectedItem});
            break;
         case "_btnSearch":
            this._cbType.selectedIndex = 0;
            this.filterResult(this._tiSearch.text);
      }
   }
   function dblClickItem(§\x1e\x19\x0e§)
   {
      this.select(_loc2_);
   }
   function selectItem(§\x1e\x19\x0e§)
   {
      var _loc3_ = _loc2_.target.contentData;
      if(_loc3_ != undefined)
      {
         this._cciSprite.data = {name:_loc3_.name,gfxFile:dofus.Constants.CLIPS_PERSOS_PATH + _loc3_.gfxId + ".swf",title:_loc3_.id};
         this._cciSprite.enabled = true;
      }
      else
      {
         this._cciSprite.data = undefined;
         this._cciSprite.enabled = false;
      }
   }
   function overItem(§\x1e\x19\x0e§)
   {
      if(_loc2_.target.contentData != undefined)
      {
         this.gapi.showTooltip(_loc2_.target.contentData.name + " (" + _loc2_.target.contentData.id + ", GFX: " + _loc2_.target.contentData.gfxId + ")",_loc2_.target,-20);
      }
   }
   function outItem(§\x1e\x19\x0e§)
   {
      this.gapi.hideTooltip();
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this._cbType:
            var _loc3_ = this._cbType.selectedItem.data;
            this._cg.dataProvider = _loc3_;
            this._lblNumber.text = _loc3_.length + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText(!this._bMonster ? "LOOK" : "MONSTER"),"m",_loc3_.length < 2);
            break;
         case this._cbAnim:
            this._cciSprite.setAnim(this._cbAnim.selectedItem.label,true);
      }
   }
   function onShortcut(§\x1e\r\x14§)
   {
      if(_loc2_ == "ACCEPT_CURRENT_DIALOG" && this._tiSearch.focused)
      {
         this.click({target:this._btnSearch});
         return false;
      }
      return true;
   }
}
