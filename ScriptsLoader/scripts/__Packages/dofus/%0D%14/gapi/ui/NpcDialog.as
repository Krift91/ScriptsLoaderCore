class dofus.§\r\x14§.gapi.ui.NpcDialog extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _nNpcID;
   var _sName;
   var _sGfx;
   var _nCustomArtwork;
   var _aColors;
   var _mcPic;
   var _ldrArtwork;
   var _winBackgroundUp;
   var _winBackground;
   var _qvQuestionViewer;
   var _oQuestion;
   var _mcQuestionViewer;
   static var CLASS_NAME = "NpcDialog";
   var _bFirstQuestion = true;
   function NpcDialog()
   {
      super();
   }
   function set id(§\x02\x06§)
   {
      this._nNpcID = _loc2_;
   }
   function set name(§\x1e\x0f\x16§)
   {
      this._sName = _loc2_;
   }
   function set gfx(§\x1e\x11\x1d§)
   {
      this._sGfx = _loc2_;
   }
   function set customArtwork(§\x04\x1a§)
   {
      this._nCustomArtwork = _loc2_;
   }
   function set colors(§\f§)
   {
      this._aColors = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.NpcDialog.CLASS_NAME);
   }
   function callClose()
   {
      this.api.network.Dialog.leave();
      return true;
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.setNpcCharacteristics});
      this.gapi.unloadLastUIAutoHideComponent();
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
   }
   function setNpcCharacteristics()
   {
      this._mcPic._visible = false;
      this._ldrArtwork.addEventListener("initialization",this);
      this._ldrArtwork.addEventListener("complete",this);
      if(this._nCustomArtwork != undefined && (!_global.isNaN(this._nCustomArtwork) && this._nCustomArtwork > 0))
      {
         this._ldrArtwork.contentPath = dofus.Constants.ARTWORKS_BIG_PATH + this._nCustomArtwork + ".swf";
      }
      else
      {
         this._ldrArtwork.contentPath = dofus.Constants.ARTWORKS_BIG_PATH + this._sGfx + ".swf";
      }
      this._winBackgroundUp.title = this._sName;
   }
   function setPause()
   {
      this.showElements(false);
   }
   function showElements(§\x15\x0e§)
   {
      this._ldrArtwork._visible = _loc2_;
      this._mcPic._visible = _loc2_;
      this._winBackground._visible = _loc2_;
      this._winBackgroundUp._visible = _loc2_;
      this._qvQuestionViewer._visible = _loc2_;
   }
   function setQuestion(§\x1e\x18\x07§)
   {
      this._oQuestion = _loc2_;
      if(this._qvQuestionViewer == undefined)
      {
         this.attachMovie("QuestionViewer","_qvQuestionViewer",10,{_x:this._mcQuestionViewer._x,_y:this._mcQuestionViewer._y,question:_loc2_,isFirstQuestion:this._bFirstQuestion});
         this._qvQuestionViewer.addEventListener("response",this);
         this._qvQuestionViewer.addEventListener("resize",this);
      }
      else
      {
         this._qvQuestionViewer.isFirstQuestion = this._bFirstQuestion;
         this._qvQuestionViewer.question = _loc2_;
      }
      this.showElements(true);
   }
   function applyColor(§\n\x1d§, §\x1e\t\x03§)
   {
      var _loc4_ = this._aColors[_loc3_];
      if(_loc4_ == -1 || _loc4_ == undefined)
      {
         return undefined;
      }
      var _loc5_ = (_loc4_ & 0xFF0000) >> 16;
      var _loc6_ = (_loc4_ & 0xFF00) >> 8;
      var _loc7_ = _loc4_ & 0xFF;
      var _loc8_ = new Color(_loc2_);
      var _loc9_ = new Object();
      _loc9_ = {ra:0,ga:0,ba:0,rb:_loc5_,gb:_loc6_,bb:_loc7_};
      _loc8_.setTransform(_loc9_);
   }
   function closeDialog()
   {
      this.callClose();
   }
   function response(§\x1e\x19\x0e§)
   {
      if(_loc2_.response.id == -1)
      {
         this.api.network.Dialog.leave();
      }
      else
      {
         this.api.network.Dialog.response(this._oQuestion.id,_loc2_.response.id);
         this._bFirstQuestion = false;
      }
   }
   function complete(§\x1e\x19\x0e§)
   {
      var ref = this;
      this._ldrArtwork.content.stringCourseColor = function(§\n\x1d§, §\x1e\t\x07§)
      {
         ref.applyColor(_loc2_,_loc3_);
      };
   }
   function resize(§\x1e\x19\x0e§)
   {
      this._winBackground.setSize(undefined,_loc2_.target.height + (_loc2_.target._y - this._winBackground._y) + 12);
      this._winBackgroundUp.setSize(undefined,_loc2_.target.height + (_loc2_.target._y - this._winBackground._y) + 10);
   }
   function initialization(§\x1e\x19\x0e§)
   {
      this._mcPic._visible = true;
   }
}
