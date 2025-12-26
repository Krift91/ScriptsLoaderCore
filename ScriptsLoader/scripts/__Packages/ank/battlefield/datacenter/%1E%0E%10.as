class ank.battlefield.datacenter.§\x1e\x0e\x10§ extends Object
{
   var id;
   var clipClass;
   var _sGfxFile;
   var _nCellNum;
   var _nDirection;
   var _oSequencer;
   var _bInMove;
   var _bVisible;
   var _bClear;
   var _eoLinkedChilds;
   var _sGfxFileName;
   var _oLinkedParent;
   var _oCarriedChild;
   var _oCarriedParent;
   var dispatchEvent;
   var _nStartAnimationTimer;
   var mc;
   var _sMoveSpeedType;
   var _sMoveAnimation;
   var _nColor1;
   var _nColor2;
   var _nColor3;
   var _aAccessories;
   var _oMount;
   var allowGhostMode = true;
   var bAnimLoop = false;
   var _nChildIndex = -1;
   var _nFutureCellNum = -1;
   var _sDefaultAnimation = "static";
   var _sStartAnimation = "static";
   var _nSpeedModerator = 1;
   var _bHidden = false;
   var _bAllDirections = true;
   var _bForceWalk = false;
   var _bForceRun = false;
   var _bNoFlip = false;
   var _bIsPendingClearing = false;
   var _bUncarryingSprite = false;
   var bInCreaturesMode = false;
   function §\x1e\x0e\x10§(§\x04\x12§, §\x0e\x14§, §\x1e\x11\x1c§, §\x07\x11§, §\x06\x07§)
   {
      super();
      this.initialize(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
   }
   function initialize(sID, §\x0e\x14§, §\x1e\x11\x1c§, §\x07\x11§, §\x06\x07§)
   {
      this.id = sID;
      this.clipClass = _loc3_;
      this._sGfxFile = _loc4_;
      this.refreshGfxFileName();
      this._nCellNum = Number(_loc5_);
      this._nDirection = _loc6_ != undefined ? Number(_loc6_) : 1;
      this._oSequencer = new ank["\x1e\n\x07"]["\x1e\x12\x14"](1000);
      this._bInMove = false;
      this._bVisible = true;
      this._bClear = false;
      this._eoLinkedChilds = new ank["\x1e\n\x07"]["\x0e\x1d"]();
      eval("\t\x04").events["\x0f\x03"].initialize(this);
   }
   function refreshGfxFileName()
   {
      var _loc2_ = this._sGfxFile.split(".")[0].split("/");
      this._sGfxFileName = _loc2_[_loc2_.length - 1];
   }
   function set uncarryingSprite(§\x14\n§)
   {
      this._bUncarryingSprite = _loc2_;
   }
   function get uncarryingSprite()
   {
      return this._bUncarryingSprite;
   }
   function get hasChilds()
   {
      return this._eoLinkedChilds.getLength() != 0;
   }
   function get hasParent()
   {
      return this.linkedParent != undefined;
   }
   function get childIndex()
   {
      return this._nChildIndex;
   }
   function set childIndex(§\x07\x03§)
   {
      this._nChildIndex = _loc2_;
   }
   function get linkedChilds()
   {
      return this._eoLinkedChilds;
   }
   function get linkedParent()
   {
      return this._oLinkedParent;
   }
   function set linkedParent(§\x1e\x18\x1a§)
   {
      this._oLinkedParent = _loc2_;
   }
   function hasCarriedChild()
   {
      return this._oCarriedChild != undefined;
   }
   function hasCarriedParent()
   {
      return this._oCarriedParent != undefined;
   }
   function get carriedChild()
   {
      return this._oCarriedChild;
   }
   function set carriedChild(§\x1e\x1a\x10§)
   {
      this._oCarriedChild = _loc2_;
   }
   function get carriedParent()
   {
      return this._oCarriedParent;
   }
   function set carriedParent(§\x1e\x1a\x10§)
   {
      this._oCarriedParent = _loc2_;
   }
   function get gfxFile()
   {
      return this._sGfxFile;
   }
   function set gfxFile(§\x1e\x11\x1c§)
   {
      this.dispatchEvent({type:"gfxFileChanged",value:_loc2_});
      this._sGfxFile = _loc2_;
      this.refreshGfxFileName();
   }
   function get gfxFileName()
   {
      return this._sGfxFileName;
   }
   function get defaultAnimation()
   {
      return this._sDefaultAnimation;
   }
   function set defaultAnimation(§\x1e\n\x02§)
   {
      this._sDefaultAnimation = _loc2_;
   }
   function get startAnimation()
   {
      return this._sStartAnimation;
   }
   function set startAnimation(§\x1e\n\x02§)
   {
      this._sStartAnimation = _loc2_;
   }
   function get startAnimationTimer()
   {
      return this._nStartAnimationTimer;
   }
   function set startAnimationTimer(§\x1e\n\x02§)
   {
      this._nStartAnimationTimer = _loc2_;
   }
   function get speedModerator()
   {
      return this._nSpeedModerator;
   }
   function set speedModerator(§\x1e\n\x02§)
   {
      this._nSpeedModerator = Number(_loc2_);
   }
   function get isVisible()
   {
      return this._bVisible;
   }
   function set isVisible(§\x1e\n\x02§)
   {
      this._bVisible = _loc2_;
   }
   function get isHidden(§\x1e\t\x1c§)
   {
      return this._bHidden;
   }
   function set isHidden(§\x1e\n\x02§)
   {
      this.mc.isHidden = this._bHidden = _loc2_;
   }
   function get isInMove()
   {
      return this._bInMove;
   }
   function set isInMove(§\x1e\n\x02§)
   {
      if(!_loc2_)
      {
         this._nFutureCellNum = -1;
         this._sMoveSpeedType = undefined;
         this._sMoveAnimation = undefined;
      }
      this._bInMove = _loc2_;
      if(this.hasCarriedChild())
      {
         this.carriedChild.isInMove = _loc2_;
      }
   }
   function get moveSpeedType()
   {
      return this._sMoveSpeedType;
   }
   function set moveSpeedType(§\x1e\x0f\x18§)
   {
      this._sMoveSpeedType = _loc2_;
   }
   function get moveAnimation()
   {
      return this._sMoveAnimation;
   }
   function set moveAnimation(§\x1e\x0f\x19§)
   {
      this._sMoveAnimation = _loc2_;
   }
   function get isClear()
   {
      return this._bClear;
   }
   function set isClear(§\x1e\n\x02§)
   {
      this._bClear = _loc2_;
   }
   function get cellNum()
   {
      return this._nCellNum;
   }
   function set cellNum(§\x1e\n\x02§)
   {
      this._nCellNum = Number(_loc2_);
   }
   function get futureCellNum()
   {
      return this._nFutureCellNum;
   }
   function set futureCellNum(§\x04\x1c§)
   {
      this._nFutureCellNum = _loc2_;
   }
   function get direction()
   {
      return this._nDirection;
   }
   function set direction(§\x1e\n\x02§)
   {
      this._nDirection = Number(_loc2_);
   }
   function get color1()
   {
      return this._nColor1;
   }
   function set color1(§\x1e\n\x02§)
   {
      this._nColor1 = Number(_loc2_);
   }
   function get color2()
   {
      return this._nColor2;
   }
   function set color2(§\x1e\n\x02§)
   {
      this._nColor2 = Number(_loc2_);
   }
   function get color3()
   {
      return this._nColor3;
   }
   function set color3(§\x1e\n\x02§)
   {
      this._nColor3 = Number(_loc2_);
   }
   function get accessories()
   {
      return this._aAccessories;
   }
   function set accessories(§\x1e\n\x02§)
   {
      this.dispatchEvent({type:"accessoriesChanged",value:_loc2_});
      this._aAccessories = _loc2_;
   }
   function get sequencer()
   {
      return this._oSequencer;
   }
   function set sequencer(§\x1e\n\x02§)
   {
      this._oSequencer = _loc2_;
   }
   function get allDirections()
   {
      return this._bAllDirections;
   }
   function set allDirections(§\x1c\x12§)
   {
      this._bAllDirections = _loc2_;
   }
   function get forceWalk()
   {
      return this._bForceWalk;
   }
   function set forceWalk(§\x19\r§)
   {
      this._bForceWalk = _loc2_;
   }
   function get forceRun()
   {
      return this._bForceRun;
   }
   function set forceRun(§\x19\x11§)
   {
      this._bForceRun = _loc2_;
   }
   function get noFlip()
   {
      return this._bNoFlip;
   }
   function set noFlip(§\x17\t§)
   {
      this._bNoFlip = _loc2_;
   }
   function get mount()
   {
      return this._oMount;
   }
   function set mount(§\x1e\n\x06§)
   {
      this._oMount = _loc2_;
   }
   function get isMounting()
   {
      return this._oMount != undefined;
   }
   function get isPendingClearing()
   {
      return this._bIsPendingClearing;
   }
   function set isPendingClearing(§\x18\x0b§)
   {
      this._bIsPendingClearing = _loc2_;
   }
}
