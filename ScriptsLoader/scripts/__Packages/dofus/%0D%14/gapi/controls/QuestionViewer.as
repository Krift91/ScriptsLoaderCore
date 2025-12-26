class dofus.§\r\x14§.gapi.controls.QuestionViewer extends ank.gapi.core.§\x1e\n\f§
{
   var _oQuestion;
   var _bFirstQuestion;
   var _lstResponses;
   var _txtQuestion;
   var dispatchEvent;
   static var CLASS_NAME = "QuestionViewer";
   static var RESPONSE_HEIGHT = 30;
   static var QUESTION_RESPONSE_SPACE = 20;
   function QuestionViewer()
   {
      super();
   }
   function set question(§\x1e\x18\x07§)
   {
      this._oQuestion = _loc2_;
      this.addToQueue({object:this,method:this.layoutContent});
   }
   function set isFirstQuestion(§\x1a\x03§)
   {
      this._bFirstQuestion = _loc2_;
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls.QuestionViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this._lstResponses._visible = false;
      this.addToQueue({object:this,method:this.addListeners});
   }
   function draw()
   {
      var _loc2_ = this.getStyle();
   }
   function layoutContent()
   {
      if(this._bFirstQuestion)
      {
         var _loc2_ = this._oQuestion.responses;
      }
      else if(this._oQuestion.responses.length == 0)
      {
         var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc3_.push({label:this._parent.api.lang.getText("CONTINUE_TO_SPEAK"),id:-1});
         _loc2_ = _loc3_;
      }
      else
      {
         _loc2_ = this._oQuestion.responses;
      }
      var _loc4_ = _loc2_.length;
      this._lstResponses.removeAll();
      this._lstResponses.setSize(undefined,dofus["\r\x14"].gapi.controls.QuestionViewer.RESPONSE_HEIGHT * _loc4_);
      this.addToQueue({object:this,method:this.addResponses,params:[_loc2_]});
      this._txtQuestion.text = this._oQuestion.label;
   }
   function addListeners()
   {
      this._lstResponses.addEventListener("itemSelected",this);
      this._txtQuestion.addEventListener("change",this);
   }
   function addResponses(§\x0f\x17§)
   {
      this._lstResponses.dataProvider = _loc2_;
   }
   function change(§\x1e\x19\x0e§)
   {
      this._lstResponses._y = this._txtQuestion._y + dofus["\r\x14"].gapi.controls.QuestionViewer.QUESTION_RESPONSE_SPACE + this._txtQuestion.height;
      this._lstResponses._visible = true;
      this.setSize(undefined,this._lstResponses._y + this._lstResponses.height);
      this.dispatchEvent({type:"resize"});
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      this.dispatchEvent({type:"response",response:_loc2_.row.item});
   }
}
