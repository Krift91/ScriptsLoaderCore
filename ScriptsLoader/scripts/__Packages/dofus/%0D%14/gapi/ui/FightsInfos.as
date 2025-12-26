class dofus.§\r\x14§.gapi.ui.FightsInfos extends dofus.§\r\x14§.gapi.core.§\x10\x19§
{
   var _eaFights;
   var _oSelectedFight;
   var _mcSquare1;
   var _mcSquare2;
   var _btnClose2;
   var _btnJoin;
   var _winBg;
   var _dgFights;
   var _lblPlayers;
   var _txtSelectFight;
   var _lblTeam1Level;
   var _lblTeam2Level;
   var _btnClose;
   var _lstTeam1;
   var _lstTeam2;
   var _mcBackTeam;
   static var CLASS_NAME = "FightsInfos";
   function FightsInfos()
   {
      super();
   }
   function get fights()
   {
      return this._eaFights;
   }
   function addFightTeams(§\x05\t§, §\x0f\x10§, §\x0f\x0f§)
   {
      var _loc6_ = this._eaFights.findFirstItem("id",_loc2_);
      if(_loc6_.index != -1)
      {
         var _loc5_ = _loc6_.item;
      }
      _loc5_.addPlayers(1,_loc3_);
      _loc5_.addPlayers(2,_loc4_);
      this.showTeamInfos(true,this._oSelectedFight);
   }
   function init()
   {
      super.init(false,dofus["\r\x14"].gapi.ui.FightsInfos.CLASS_NAME);
   }
   function callClose()
   {
      this.unloadThis();
      return true;
   }
   function createChildren()
   {
      this._eaFights = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this.showTeamInfos(false);
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.addListeners});
      this.addToQueue({object:this,method:this.initData});
      this.addToQueue({object:this.api.network.Fights,method:this.api.network.Fights.getList});
      this.setMovieClipColor(this._mcSquare1,dofus.Constants.TEAMS_COLOR[0]);
      this.setMovieClipColor(this._mcSquare2,dofus.Constants.TEAMS_COLOR[1]);
   }
   function initTexts()
   {
      this._btnClose2.label = this.api.lang.getText("CLOSE");
      this._btnJoin.label = this.api.lang.getText("JOIN_SMALL");
      this._winBg.title = this.api.lang.getText("CURRENT_FIGTHS");
      this._dgFights.columnsNames = [this.api.lang.getText("FIGHTERS_COUNT"),this.api.lang.getText("DURATION")];
      this._lblPlayers.text = this.api.lang.getText("FIGHTERS");
      this._txtSelectFight.text = this.api.lang.getText("SELECT_FIGHT_FOR_SPECTATOR");
      if(this._lblTeam1Level.text != undefined)
      {
         this._lblTeam1Level.text = "";
      }
      if(this._lblTeam2Level.text != undefined)
      {
         this._lblTeam2Level.text = "";
      }
   }
   function addListeners()
   {
      this._btnClose.addEventListener("click",this);
      this._btnClose2.addEventListener("click",this);
      this._btnJoin.addEventListener("click",this);
      this._dgFights.addEventListener("itemSelected",this);
      this._lstTeam1.addEventListener("itemSelected",this);
      this._lstTeam2.addEventListener("itemSelected",this);
   }
   function initData()
   {
      this._dgFights.dataProvider = this._eaFights;
   }
   function showTeamInfos(§\x15\x0e§, §\x1e\x19\n§)
   {
      this._lblTeam1Level._visible = _loc2_;
      this._lblTeam2Level._visible = _loc2_;
      this._lstTeam1._visible = _loc2_;
      this._lstTeam2._visible = _loc2_;
      this._mcBackTeam._visible = _loc2_;
      this._mcSquare1._visible = _loc2_;
      this._mcSquare2._visible = _loc2_;
      this._txtSelectFight._visible = !_loc2_;
      this._btnJoin.enabled = _loc2_;
      if(_loc2_)
      {
         this._lblTeam1Level.text = this.api.lang.getText("LEVEL") + " " + _loc3_.team1Level;
         this._lblTeam2Level.text = this.api.lang.getText("LEVEL") + " " + _loc3_.team2Level;
         this._lstTeam1.dataProvider = _loc3_.team1Players;
         this._lstTeam2.dataProvider = _loc3_.team2Players;
      }
   }
   function click(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target._name)
      {
         case "_btnClose":
         case "_btnClose2":
            this.callClose();
            break;
         case "_btnJoin":
            this.api.network.GameActions.joinChallenge(this._oSelectedFight.id);
            this.callClose();
      }
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      var _loc0_ = null;
      if((_loc0_ = _loc2_.target._name) !== "_dgFights")
      {
         if(_loc2_.row.item.type == "player")
         {
            var _loc3_ = _loc2_.row.item.name;
            if(this.api.datacenter.Player.isAuthorized && Key.isDown(Key.SHIFT))
            {
               var _loc4_ = "";
               var _loc5_ = false;
               var _loc6_ = 0;
               while(_loc6_ < this._lstTeam1.dataProvider.length)
               {
                  var _loc7_ = this._lstTeam1.dataProvider[_loc6_].name;
                  if(_loc7_ == _loc3_)
                  {
                     _loc5_ = true;
                  }
                  _loc4_ += _loc7_ + ",";
                  _loc6_ = _loc6_ + 1;
               }
               if(!_loc5_)
               {
                  _loc4_ = "";
                  var _loc8_ = 0;
                  while(_loc8_ < this._lstTeam2.dataProvider.length)
                  {
                     var _loc9_ = this._lstTeam2.dataProvider[_loc8_].name;
                     if(_loc9_ == _loc3_)
                     {
                        _loc5_ = true;
                     }
                     _loc4_ += _loc9_ + ",";
                     _loc8_ = _loc8_ + 1;
                  }
               }
               if(_loc5_)
               {
                  _loc4_ = _loc4_.substring(0,_loc4_.length - 1);
                  this.api.kernel.GameManager.showTeamAdminPopupMenu(_loc4_);
               }
            }
            else
            {
               this.api.kernel.GameManager.showPlayerPopupMenu(undefined,_loc3_);
            }
         }
      }
      else
      {
         this._oSelectedFight = _loc2_.row.item;
         if(this._oSelectedFight.hasTeamPlayers)
         {
            this.showTeamInfos(true,this._oSelectedFight);
         }
         else
         {
            this.api.network.Fights.getDetails(this._oSelectedFight.id);
            this.showTeamInfos(false);
         }
      }
   }
}
