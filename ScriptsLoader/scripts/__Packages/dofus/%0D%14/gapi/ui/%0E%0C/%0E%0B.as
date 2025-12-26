class dofus.§\r\x14§.gapi.ui.§\x0e\f§.§\x0e\x0b§ extends ank.gapi.core.§\x1e\n\f§
{
   var _mcList;
   var _ldrIconTeam1;
   var _lblTeam1Count;
   var _ldrIconTeam2;
   var _lblTeam2Count;
   var _lblTime;
   var _mcArrows;
   function §\x0e\x0b§()
   {
      super();
   }
   function set list(§\n\x15§)
   {
      this._mcList = _loc2_;
   }
   function setValue(§\x14\x04§, §\x1e\r\x04§, §\x1e\x19\x03§)
   {
      if(_loc2_)
      {
         this._ldrIconTeam1.contentPath = _loc4_.team1IconFile;
         this._lblTeam1Count.text = _loc4_.team1Count;
         this._ldrIconTeam2.contentPath = _loc4_.team2IconFile;
         this._lblTeam2Count.text = _loc4_.team2Count;
         this._lblTime.text = _loc4_.durationString;
         this._mcArrows._visible = true;
      }
      else if(this._lblTeam1Count.text != undefined)
      {
         this._ldrIconTeam1.contentPath = "";
         this._lblTeam1Count.text = "";
         this._ldrIconTeam2.contentPath = "";
         this._lblTeam2Count.text = "";
         this._lblTime.text = "";
         this._mcArrows._visible = false;
      }
   }
   function init()
   {
      super.init(false);
      this._mcArrows._visible = false;
      this._mcList.gapi.api.colors.addSprite(this._ldrIconTeam1,{color1:dofus.Constants.TEAMS_COLOR[0]});
      this._mcList.gapi.api.colors.addSprite(this._ldrIconTeam2,{color1:dofus.Constants.TEAMS_COLOR[1]});
   }
}
