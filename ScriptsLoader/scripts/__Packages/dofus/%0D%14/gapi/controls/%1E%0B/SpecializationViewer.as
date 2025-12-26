class dofus.§\r\x14§.gapi.controls.§\x1e\x0b§.SpecializationViewer extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _lblFeats;
   var _lblNoSpecialization;
   var _lstFeats;
   var _mcTree;
   var _mcOrder;
   var _mcTreePlacer;
   var _mcOrderPlacer;
   static var CLASS_NAME = "SpecializationViewer";
   function SpecializationViewer()
   {
      super();
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.controls["\x1e\x0b"].SpecializationViewer.CLASS_NAME);
   }
   function createChildren()
   {
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
   }
   function initTexts()
   {
      this._lblFeats.text = this.api.lang.getText("FEATS");
      this._lblNoSpecialization.text = this.api.lang.getText("NO_SPECIALIZATION");
   }
   function addListeners()
   {
      this.api.datacenter.Player.addEventListener("specializationChanged",this);
   }
   function initData()
   {
      this.specializationChanged({specialization:this.api.datacenter.Player.specialization});
   }
   function setFeatsFromSpecialization(§\x1e\x17\x18§)
   {
      if(_loc2_ != undefined)
      {
         this._lblFeats.text = this.api.lang.getText("FEATS") + " (" + _loc2_.name + ")";
         this._lstFeats.dataProvider = _loc2_.feats;
      }
      else
      {
         this._lblFeats.text = this.api.lang.getText("FEATS");
         this._lstFeats.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
      }
   }
   function specializationChanged(§\x1e\x19\x0e§)
   {
      this._mcTree.removeMovieClip();
      this._mcOrder.removeMovieClip();
      var _loc3_ = _loc2_.specialization;
      if(_loc3_ != undefined)
      {
         this._lblNoSpecialization._visible = false;
         this._lblFeats._visible = true;
         this._lstFeats._visible = true;
         this.attachMovie("AlignmentViewerTree","_mcTree",this.getNextHighestDepth(),{_x:this._mcTreePlacer._x,_y:this._mcTreePlacer._y});
         this._mcTree.addEventListener("specializationSelected",this);
         this._mcTree.addEventListener("orderSelected",this);
         this.specializationSelected();
      }
      else
      {
         this._lblNoSpecialization._visible = true;
         this._lblFeats._visible = false;
         this._lstFeats._visible = false;
      }
   }
   function specializationSelected(§\x1e\x19\x0e§)
   {
      this._mcOrder.removeMovieClip();
      this.setFeatsFromSpecialization(_loc2_.specialization);
   }
   function orderSelected(§\x1e\x19\x0e§)
   {
      this._mcOrder.removeMovieClip();
      this.attachMovie("AlignmentViewerOrder","_mcOrder",this.getNextHighestDepth(),{_x:this._mcOrderPlacer._x,_y:this._mcOrderPlacer._y,specialization:this.api.datacenter.Player.specialization});
   }
}
