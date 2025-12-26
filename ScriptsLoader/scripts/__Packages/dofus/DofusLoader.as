class dofus.DofusLoader extends ank.§\x1e\n\x07§.§\x1e\x15\x11§
{
   var firstChild;
   var childNodes;
   var _sPrefixURL;
   var _mcContainer;
   var _mcLocalFileList;
   var _bNonCriticalError;
   var _bUpdate;
   var _sStep;
   var _mcModules;
   var _mclLoader;
   var §\x1e\b\x17§;
   var §\x1e\b\x18§;
   var §\x1e\b\x11§;
   var §\x1e\t\x01§;
   var _btnContinue;
   var _btnClearCache;
   var _btnNext;
   var §\x1e\b\x1c§;
   var §\x1e\b\x1d§;
   var §\x1e\b\x16§;
   var §\x1e\b\x15§;
   var LANG_TEXT;
   var ERRORS;
   var _currentLogger;
   var §\x1e\b\x1b§;
   var §\x1e\b\x19§;
   var §\x1e\b\x1a§;
   var §\x1e\b\x12§;
   var _mcWaitBar;
   var §\x1e\b\x13§;
   var _bBannerDisplay;
   var _mcBanner;
   var §\x1e\b\x14§;
   var _nOccurenceId;
   var _aCurrentDataServers;
   var _sDistantFileList;
   var _aCurrentModules;
   var _aCurrentModule;
   var _mcCurrentModule;
   var _timedProgress;
   var _aXtraList;
   var _oCurrentXtraLoadFile;
   var _aCurrentXtra;
   var TABULATION = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
   var _sLogs = "";
   var _sLang = "fr";
   var _bLocalFileListLoaded = false;
   var _bSkipDistantLoad = false;
   var _oXtraCurrentVersion = new Object();
   var _nTotalFile = 0;
   var _aLoadingBannersFiles = new Array();
   var _bLoadingBannersFilesLoaded = false;
   var _nProgressIndex = 0;
   var _nTimerJs = 0;
   var _bJsTimer = true;
   function DofusLoader()
   {
      super();
      _global.TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiZXhwIjoxNzIxODQzMzkwLCJpYXQiOjE2OTAzMDczOTB9.SJah4YWecLRpVBA-imSOrBIP3--uCNUooX8vJt27_9s";
      ank["\x1e\n\x07"]["\x0e\x1b"].addExtensions();
      this.initLoader(_root);
   }
   static function main(§\n\x10§)
   {
      if(_root.dofusPreLoaderMc == undefined)
      {
         return undefined;
      }
      System.security.allowDomain("*");
      fscommand("trapallkeys","true");
      fscommand("CustomerStart","");
      _root = _loc2_;
      dofus.DofusLoader.registerAllClasses();
      _root._quality = "HIGH";
      if(dofus.Constants.DOUBLEFRAMERATE)
      {
         _root.attachMovie("DofusLoader_DoubleFramerate","_loader",_root.getNextHighestDepth());
      }
      else
      {
         _root.attachMovie("DofusLoader","_loader",_root.getNextHighestDepth());
      }
      _root.attachMovie("LoaderBorder","_loaderBorder",_root.getNextHighestDepth(),{_x:-2,_y:-2});
      _root.createEmptyMovieClip("_misc",_root.getNextHighestDepth());
      com.ankamagames["\x1e\n\x1b"]["\x0b\f"].initialize();
   }
   function addLoadingBannersFiles(§\x15\x0e§)
   {
      var xDoc = new XML();
      xDoc.onLoad = function(§\x14\x16§)
      {
         if(_loc2_)
         {
            var _loc3_ = this.firstChild.firstChild;
            if(_loc3_ != null && this.childNodes.length > 0)
            {
               while(_loc3_ != null)
               {
                  if(_loc3_.nodeName == "loadingbanner")
                  {
                     var _loc4_ = _loc3_.attributes.file;
                     xDoc.parent._aLoadingBannersFiles.push(_loc4_);
                  }
                  _loc3_ = _loc3_.nextSibling;
               }
            }
         }
         xDoc.parent._bLoadingBannersFilesLoaded = true;
         xDoc.parent.showBanner(xDoc.bShow);
      };
      xDoc.ignoreWhite = true;
      xDoc.bShow = _loc2_;
      xDoc.parent = this;
      xDoc.load(dofus.Constants.XML_LOADING_BANNERS_PATH);
   }
   function initLoader(§\n\x10§)
   {
      this._sPrefixURL = this._url.substr(0,this._url.lastIndexOf("/") + 1);
      _global.CONFIG = new dofus["\x1e\n\x07"]["\x10\x17"]();
      this.clearlogs();
      this.showMainLogger(false);
      this.showShowLogsButton(false);
      this.showConfigurationChoice(false);
      this.showNextButton(false);
      this.showContinueButton(false);
      this.showClearCacheButton(false);
      this.showCopyLogsButton(false);
      this.showProgressBar(false);
      this._mcContainer = this.createEmptyMovieClip("__ANKDATA__",this.getNextHighestDepth());
      this._mcLocalFileList = this.createEmptyMovieClip("__ANKFILEDATA__",this.getNextHighestDepth());
      _global.CONFIG.isNewAccount = _root.htmlLogin != undefined && (_root.htmlPassword != undefined && (_root.htmlLogin != null && (_root.htmlPassword != null && (_root.htmlLogin != "null" && (_root.htmlPassword != "null" && (_root.htmlLogin != "" && _root.htmlPassword != ""))))));
      this._bNonCriticalError = false;
      this._bUpdate = false;
      this._sStep = null;
      ank.gapi.styles["\x1e\f\b"].loadStylePackage(ank.gapi.styles["\x11\x06"]);
      ank.gapi.styles["\x1e\f\b"].loadStylePackage(dofus["\r\x14"].gapi.styles["\x10\x14"]);
      ank["\x1e\n\x07"]["\x0e\x1b"].addExtensions();
      if(System.capabilities.playerType == "StandAlone")
      {
         Key.addListener(this);
      }
      this._mcModules = _loc2_.createEmptyMovieClip("mcModules",_loc2_.getNextHighestDepth());
      this._mclLoader = new MovieClipLoader();
      this._mclLoader.addListener(this);
      this.addToQueue({object:this,method:this.initTexts});
      this.addToQueue({object:this,method:this.initComponents});
      this.addToQueue({object:this,method:this.showBasicInformations,params:[true]});
   }
   function initComponents()
   {
      this["\x1e\b\x17"].text = this.getText("SERVER");
      this["\x1e\b\x18"].text = this.getText("CONFIGURATION");
      this["\x1e\b\x11"]["\x1e\n\x11"].text = "Loading";
      this["\x1e\t\x01"].label = this.getText("VALID");
      this["\x1e\t\x01"].addEventListener("click",this);
      this._btnContinue.label = this.getText("CONTINUE");
      this._btnContinue.addEventListener("click",this);
      this._btnClearCache.label = this.getText("CLEAR_CACHE");
      this._btnClearCache.addEventListener("click",this);
      this._btnNext.label = this.getText("NEXT");
      this._btnNext.addEventListener("click",this);
      this["\x1e\b\x1c"].label = this.getText("SHOW_LOGS");
      this["\x1e\b\x1c"].addEventListener("click",this);
      this["\x1e\b\x1d"].label = this.getText("COPY_LOGS");
      this["\x1e\b\x1d"].addEventListener("click",this);
      this["\x1e\b\x16"].addEventListener("itemSelected",this);
      this["\x1e\b\x15"].addEventListener("itemSelected",this);
      this.launchBannerAnim(true);
   }
   function initTexts()
   {
      this.LANG_TEXT = new Object();
      this.LANG_TEXT.STARTING = {fr:"Initialisation de DOFUS...",en:"Initializing DOFUS...",es:"Inicializando DOFUS...",de:"Initialisierung von DOFUS im Gange...",pt:"Inicializando DOFUS...",nl:"DOFUS initialiseren...",it:"Inizializzazione DOFUS..."};
      this.LANG_TEXT.SERVER = {fr:"Serveur",en:"\x1e\x12\x12",es:"Servidor",de:"\x1e\x12\x12",pt:"Servidor",nl:"\x1e\x12\x12",it:"\x1e\x12\x12"};
      this.LANG_TEXT.CONFIGURATION = {fr:"Configuration",en:"Configuration",es:"Configuración",de:"Konfiguration",pt:"Configuração",nl:"Configuratie",it:"Configurazione"};
      this.LANG_TEXT.NEXT = {fr:"Continuer",en:"Next",es:"Siguiente",de:"Weiter",pt:"Próximo",nl:"Volgende",it:"Continuare"};
      this.LANG_TEXT.INIT_END = {fr:"Initialisation terminée",en:"Initialization completed",es:"Inicialización terminada",de:"Initialisierung beendet",pt:"Inicialização completada",nl:"Initialiseren voltooid",it:"Inizializzazzione terminata"};
      this.LANG_TEXT.VALID = {fr:"OK",en:"OK",es:"OK",de:"OK",pt:"OK",nl:"OK",it:"OK"};
      this.LANG_TEXT.CLEAR_CACHE = {fr:"Vider le cache",en:"Empty cache memory",es:"Vacía el caché",de:"Den Cache leeren",pt:"Esvaziar memória cache",nl:"Cache geheugen legen",it:"Svuotare la cache"};
      this.LANG_TEXT.COPY_LOGS = {fr:"Copier les logs",en:"Copy logs",es:"Copiar logs",de:"Logs kopieren",pt:"Copiar logs",nl:"Logs kopiëren",it:"Copiare i log"};
      this.LANG_TEXT.SHOW_LOGS = {fr:"Afficher les logs",en:"Display logs",es:"Mostrar logs",de:"Logs anzeigen",pt:"Exibir logs",nl:"Laat de logs zien",it:"Visualizzare i log"};
      this.LANG_TEXT.CONTINUE = {fr:"Continuer",en:"Continue",es:"Continuar",de:"Fortfahren",pt:"Continuar",nl:"Volgende",it:"Continuare"};
      this.LANG_TEXT.ERROR = {fr:"Erreur",en:"Error",es:"Error",de:"Fehler",pt:"Erro",nl:"Fout",it:"Errore"};
      this.LANG_TEXT.WARNING = {fr:"Attention",en:"Warning",es:"Atención",de:"Warnung",pt:"Aviso",nl:"Waarschuwing",it:"Attenzione"};
      this.LANG_TEXT.DEBUG_MODE = {fr:"Mode debug activé",en:"Debug mode activated",es:"Modo debug activado",de:"Debug Modus aktiviert",pt:"Modo de depuração ativado",nl:"Debug modus geactiveerd",it:"Modalità debug attiva"};
      this.LANG_TEXT.UNKNOWN_TYPE_NODE = {fr:"Paramètre inconnu",en:"Unknown parameter",es:"Parámetro desconocido",de:"Unbekannte Parameter",pt:"Parâmetro desconhecido",nl:"Onbekende parameter",it:"Parametro sconosciuto"};
      this.LANG_TEXT.LINK_HELP = {fr:"Cliquez ici pour voir les solutions",en:"Click here to see the solutions",es:"Pincha aquí para ver las soluciones",de:"Hier klicken für Lösungsvorschläge",pt:"Clique aqui para ver as soluções",nl:"Klik hier voor de oplossingen",it:"Clicca qui per vedere le soluzioni"};
      this.LANG_TEXT.LOADING_CONFIG_FILE = {fr:"Chargement du fichier de configuration...",en:"Configuration file downloading...",es:"Descargando el archivo de configuración",de:"Download der Konfigurationsdatei...",pt:"Baixando arquivo de configuração...",nl:"Configuratie bestand aan het downloaden...",it:"Caricamento del file di configurazione..."};
      this.LANG_TEXT.CONFIG_FILE_LOADED = {fr:"Fichier de configuration chargé",en:"Configuration file downloaded",es:"Archivo de configuración descargado",de:"Download der Konfigurationsdatei beendet",pt:"Arquivo de configuração baixado",nl:"Configuratie bestand gedownload",it:"File di configurazione caricato"};
      this.LANG_TEXT.CHOOSE_CONFIGURATION = {fr:"Choix de la configuration...",en:"Configuration choice...",es:"Elección de la configuración...",de:"Auswahl der Konfiguration...",pt:"Escolha de configuração...",nl:"Configuratie keuze...",it:"Scelta della configurazione..."};
      this.LANG_TEXT.LOAD_MODULES = {fr:"Chargement des modules de jeu...",en:"Game modules loading...",es:"Descargando módulos del juego...",de:"Spielmodule werden geladen...",pt:"Carregando módulos de jogo...",nl:"Spel modules aan het laden...",it:"Caricamento dei moduli di gioco..."};
      this.LANG_TEXT.CURRENT_CONFIG = {fr:"Configuration choisie : <b>%1</b>",en:"Chosen Configuration : <b>%1</b>",es:"Configuración elegida: <b>%1</b>",de:"Ausgewählte Konfiguration: <b>%1</b>",pt:"Configuração escolhida : <b>%1</b>",nl:"Gekozen Configuratie : <b>%1</b>",it:"Configurazione scelta : <b>%1</b>"};
      this.LANG_TEXT.CURRENT_SERVER = {fr:"Server de connexion choisi : <b>%1</b>",en:"Chosen Connection Server : <b>%1</b>",es:"Servidor de conexión seleccionado: <b>%1</b>",de:"Ausgewählter Einwahlserver: <b>%1</b>",pt:"Conexão com o servidor escolhida : <b>%1</b>",nl:"Gekozen Verbindings Server : <b>%1</b>",it:"Server di connessione scelto : <b>%1</b>"};
      this.LANG_TEXT.LOAD_LANG_FILE = {fr:"Chargement du fichier de langue...",en:"Language file downloading...",es:"Descargando el archivo de idioma...",de:"Laden der Sprachdateien im Gange...",pt:"Baixando arquivo de idioma...",nl:"Taalbestand aan het downloaden...",it:"Caricamento del file di lingua..."};
      this.LANG_TEXT.CURRENT_LANG_FILE_VERSION = {fr:"Version du fichier de langue en local : <b>%1</b>",en:"Local version of the language file : <b>%1</b>",es:"Versión local del archivo de idioma: <b>%1</b>",de:"Lokale Version der Sprachdatei: <b>%1</b>",pt:"Versão locais do arquivo de idioma : <b>%1</b>",nl:"Locale versie van het taalbestand : <b>%1</b>",it:"Versione del file di lingua in rete locale : <b>%1</b>"};
      this.LANG_TEXT.CHECK_LAST_VERSION = {fr:"Verification des mises à jour...",en:"Checking updates...",es:"Comprobando actualizaciones...",de:"Suchen nach Updates...",pt:"Verificando atualizações...",nl:"Zoeken naar updates...",it:"Verifica degli aggiornamenti..."};
      this.LANG_TEXT.NEW_LANG_FILE_AVAILABLE = {fr:"Mise à jour disponible, téléchargement en cours de la version <b>%1</b>",en:"Update available. Version <b>%1</b> downloading...",es:"Actualización disponible. Descargando versión <b>%1</b>...",de:"Update gefunden. Download von Version <b>%1</b> im Gange...",pt:"Atualização disponível. Baixando versão <b>%1</b>...",nl:"Update beschikbaar/ Versie <b>%1</b> aan het downloaden...",it:"Aggiornamenti disponibili, download della versione in corso <b>%1</b>..."};
      this.LANG_TEXT.NO_NEW_VERSION_AVAILABLE = {fr:"Aucune mise à jour disponible",en:"No update available",es:"Ninguna actualización disponible",de:"Kein Update verfügbar",pt:"Não há atualização disponível",nl:"Geen update beschikbaar",it:"Nessun aggiornamento disponibile"};
      this.LANG_TEXT.IMPOSSIBLE_TO_JOIN_SERVER = {fr:"Impossible de joindre le serveur <b>%1</b>",en:"Server <b>%1</b> can not be reached",es:"Imposible conectar con el servidor <b>%1</b>",de:"Server <b>%1</b> unerreichbar",pt:"Servidor <b>%1</b> não pôde ser alcançado",nl:"Server <b>%1</b> kon niet bereikt worden",it:"Non è possibile collegarsi al server <b>%1</b>"};
      this.LANG_TEXT.LOAD_XTRA_FILES = {fr:"Chargement des fichiers de langue supplémentaires...",en:"Additional language files downloading...",es:"Descargando archivos de idioma adicionales...",de:"Download zusätzlicher Sprachdateien im Gange...",pt:"Baixando arquivos adicionais de idioma...",nl:"Additioneel taalbestand aan het downloaden...",it:"Caricamento del file di lingua supplementari..."};
      this.LANG_TEXT.UPDATE_FILE = {fr:"Mise à jour du fichier <b>%1</b>...",en:"Updating file <b>%1</b>...",es:"Actualizando el archivo <b>%1</b>...",de:"Update der Datei <b>%1</b> im Gange...",pt:"Atualizando arquivo <b>%1</b>...",nl:"Bestand <b>%1</b> aan het updaten...",it:"Aggiornamento del file <b>%1</b>..."};
      this.LANG_TEXT.NO_FILE_IN_LOCAL = {fr:"Fichier <b>%1</b> non présent dans le dossier local <b>%2</b>",en:"File <b>%1</b> can not be found in local folder <b>%2</b>",es:"No se consiguió encontrar el archivo <b>%1</b> en la carpeta <b>%2</b>",de:"Datei <b>%1</b> gefindet sich nicht im lokalen Ordner <b>%2</b>",pt:"Arquivo <b>%1</b> não pôde ser encontrado na pasta local <b>%2</b>",nl:"Bestand <b>%1</b> kan niet in de lokale folder <b>%2</b> worden gevonden",it:"File <b>%1</b>  non presente nella cartella locale <b>%2</b>"};
      this.LANG_TEXT.IMPOSSIBLE_TO_DOWNLOAD_FILE = {fr:"Impossible de télécharger le fichier <b>%1</b> a partir du serveur <b>%2</b>",en:"File <b>%1</b> can not be downloaded from server <b>%2</b>",es:"Ha sido imposible descargar el archivo <b>%1</b> desde el servidor <b>%2</b>",de:"Download der Datei <b>%1</b> vom Server <b>%2</b> fehlgeschlagen",pt:"Arquivo <b>%1</b> não foi baixando do servidor <b>%2</b>",nl:"Bestand <b>%1</b> kan niet van server <b>%2</b> worden gedownload",it:"Non è possibile scaricare il file <b>%1</b> dal server <b>%2</b>"};
      this.LANG_TEXT.UPDATE_FINISH = {fr:"Mise à jour du fichier <b>%1</b> terminée à partir du serveur <b>%2</b>",en:"Update of file <b>%1</b> from server <b>%2</b> completed",es:"Actualización del archivo <b>%1</b> a partir del servidor <b>%2</b>terminada",de:"Update der Datei <b>%1</b> vom Server <b>%2</b> abgeschlossen",pt:"Atualização do arquivo <b>%1</b> do servidor <b>%2</b> completada",nl:"Update van het bestand <b>%1</b> van server <b>%2</b> is voltooid",it:"Aggiornamento del file <b>%1</b>dal server terminato <b>%2</b>"};
      this.LANG_TEXT.MODULE_LOADED = {fr:"Module <b>%1</b> chargé",en:"Module <b>%1</b> downloaded",es:"Módulo <b>%1</b> descargado",de:"Download von Modul <b>%1</b> abgeschlossen",pt:"Módulo <b>%1</b> baixado",nl:"Module <b>%1</b> gedownload",it:"Modulo <b>%1</b> caricato"};
      this.LANG_TEXT.FILE_LOADED = {fr:"Chargement du fichier <b>%1</b> terminé à partir du dossier local <b>%2</b>",en:"File <b>%1</b> from local folder <b>%2</b> downloaded",es:"Archivo <b>%1</b> de la carpeta <b>%2</b> descargado",de:"Download der Datei <b>%1</b> vom lokalen Ordner <b>%2</b> abgeschlossen",pt:"Arquivo <b>%1</b> da pasta local <b>%2</b> baixado",nl:"Bestand <b>%1</b> uit de lokale folder <b>%2</b> is gedownload",it:"Caricamento del file <b>%1</b> dalla cartella locale terminato <b>%2</b>"};
      this.LANG_TEXT.CORRUPT_FILE = {fr:"Fichier <b>%1</b> corrompu téléchargé à partir du serveur <b>%2</b> (Taille : %3)",en:"File <b>%1</b> corrupted. Downloaded from server <b>%2</b> (Size: %3)",es:"El archivo <b>%1</b> está corrupto. Descargado desde el servidor <b>%2</b> (Tamaño: %3)",de:"Datei <b>%1</b> ist korrupt. Heruntergeladen vom Server <b>%2</b> (Größe: %3)",pt:"Arquivo <b>%1</b> corrompido. Baixado do servidor <b>%2</b> (Tamanho: %3)",nl:"Bestand <b>%1</b> is beschadigd. Download van server <b>%2</b> (Grootte: %3)",it:"File <b>%1</b> corrotto scaricato dal server <b>%2</b> (Taglia: %3)"};
      this.ERRORS = new Object();
      var _loc2_ = new Object();
      this.ERRORS.TOO_MANY_OCCURENCES = _loc2_;
      _loc2_.fr = "Vous ne pouvez pas lancer plus de clients DOFUS sur cet ordinateur.";
      _loc2_.en = "You can\'t start anymore DOFUS client on this computer.";
      _loc2_.es = "No puedes abrir más clientes DOFUS en este ordenador.";
      _loc2_.de = "Es kann kein weiterer DOFUS-Client auf diesem Computer gestartet werden.";
      _loc2_.pt = "Você não pode começar o cliente de DOFUS de novo neste computador.";
      _loc2_.nl = "Je kan de DOFUS client niet meer op deze computer opstarten.";
      _loc2_.it = "Non puoi lanciare più client su questo computer.";
      _loc2_.linkfr = "http://www.dofus.com";
      _loc2_.linken = "http://www.dofus.com";
      _loc2_.linkes = "http://www.dofus.com";
      _loc2_.linkde = "http://www.dofus.com";
      _loc2_.linkpt = "http://www.dofus.com";
      _loc2_ = new Object();
      this.ERRORS.BAD_FLASH_PLAYER = _loc2_;
      _loc2_.fr = "Vous devez posséder le lecteur Flash Player version 8 ou supérieure. (Version actuelle : " + System.capabilities.version + ")";
      _loc2_.en = "You have to install the Flash Player version 8 or higher. (Actual version : " + System.capabilities.version + ")";
      _loc2_.es = "Debes instalar el reproductor Flash Player versión 8 o superior. (Versión actual: " + System.capabilities.version + ")";
      _loc2_.de = "Es wird die Version 8 oder höher des Flash Players benötigt. (Aktuelle Version: " + System.capabilities.version + ")";
      _loc2_.pt = "Você precisa instalar a versão 8 ou superior do Flash Player. (Versão atual : " + System.capabilities.version + ")";
      _loc2_.nl = "Je moet Flash Player versie 8 of hoger installeren. (Huidige versie : " + System.capabilities.version + ")";
      _loc2_.it = "Devi avere il lettore Flash Player versione 8 o avanzata (Versione attuale:" + System.capabilities.version + ")";
      _loc2_.linkfr = "http://store.adobe.com/go/getflashplayer";
      _loc2_.linken = "http://store.adobe.com/go/getflashplayer";
      _loc2_.linkes = "http://store.adobe.com/go/getflashplayer";
      _loc2_.linkde = "http://store.adobe.com/go/getflashplayer";
      _loc2_.linkpt = "http://store.adobe.com/go/getflashplayer";
      _loc2_ = new Object();
      this.ERRORS.BAD_FLASH_SANDBOX = _loc2_;
      _loc2_.fr = "Les paramètres de sécurité actuels du lecteur Flash ne permettent pas à DOFUS de s\'executer.";
      _loc2_.en = "You must configure DOFUS as a trusted application on the Flash Player security settings.";
      _loc2_.es = "Los parámetros de seguridad actuales del reproductor Flash no permiten la ejecución de DOFUS.";
      _loc2_.de = "DOFUS muss als vertrauenswürdige Anwendung in den Sicherheitseinstellungen des Flash Players konfiguriert werden.";
      _loc2_.pt = "Você deve configurar DOFUS como uma aplicação confiável nas configurações de segurança do Flash Player.";
      _loc2_.nl = "Je zult DOFUS als een veilige aplicatie moeten instellen bij de beveiligings instellingen van je Flash Player.";
      _loc2_.it = "I parametri di sicurezza attuali del lettore Flash non permettono l\'esecuzione di DOFUS.";
      _loc2_.linkfr = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=984&_gid=1&languageid=2&group=dofusfr";
      _loc2_.linken = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=985&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkes = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=985&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkde = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=985&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkpt = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=985&_gid=1&languageid=1&group=dofusen";
      _loc2_ = new Object();
      this.ERRORS.UPDATE_LANG_IMPOSSIBLE = _loc2_;
      _loc2_.fr = "Impossible de charger le fichier de langue";
      _loc2_.en = "Impossible to download the language file";
      _loc2_.es = "Descarga del archivo de idioma imposible";
      _loc2_.de = "Download der Sprachdatei nicht möglich";
      _loc2_.pt = "Impossível baixar o arquivo de idioma";
      _loc2_.nl = "Onmogelijk om dit taalbestand te downloaden";
      _loc2_.it = "Non è possibile caricare il file di lingua";
      _loc2_.linkfr = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=961&_gid=1&languageid=2&group=dofusfr";
      _loc2_.linken = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=971&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkes = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=971&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkde = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=971&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkpt = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=971&_gid=1&languageid=1&group=dofusen";
      _loc2_ = new Object();
      this.ERRORS.NO_CONFIG_FILE = _loc2_;
      _loc2_.fr = "Impossible de charger le fichier de configuration";
      _loc2_.en = "Impossible to load the configuration file";
      _loc2_.es = "No se puede cargar el archivo de configuración";
      _loc2_.de = "Laden der Konfigurationsdatei nicht möglich";
      _loc2_.pt = "Impossível carregar o arquivo de configuração";
      _loc2_.nl = "Onmogelijk om het configuratie bestand te laden";
      _loc2_.it = "Non è possibile caricare il file di configurazione";
      _loc2_.linkfr = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=957&_gid=1&languageid=2&group=dofusfr";
      _loc2_.linken = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=968&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkes = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=968&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkde = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=968&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkpt = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=968&_gid=1&languageid=1&group=dofusen";
      _loc2_ = new Object();
      this.ERRORS.CORRUPT_CONFIG_FILE = _loc2_;
      _loc2_.fr = "Impossible de lire le fichier de configuration";
      _loc2_.en = "Impossible to read the configuration file";
      _loc2_.es = "No es posible leer el archivo de configuración";
      _loc2_.de = "Unmöglich die Konfigurationsdatei zu lesen";
      _loc2_.pt = "Impossível ler o arquivo de configuração";
      _loc2_.nl = "Onmogelijk om het configuratie bestand te lezen";
      _loc2_.it = "Non è possibile leggere il file di configurazione";
      _loc2_.linkfr = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=957&_gid=1&languageid=2&group=dofusfr";
      _loc2_.linken = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=968&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkes = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=968&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkde = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=968&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkpt = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=968&_gid=1&languageid=1&group=dofusen";
      _loc2_ = new Object();
      this.ERRORS.CHECK_LAST_VERSION_FAILED = _loc2_;
      _loc2_.fr = "Impossible de vérifier les mises à jour";
      _loc2_.en = "Impossible to check updates";
      _loc2_.es = "No es posible comprobar las actualizacones";
      _loc2_.de = "Updateprüfung nicht möglich";
      _loc2_.pt = "Impossível verificar atualizações";
      _loc2_.nl = "Onmogelijk om op updates te controleren";
      _loc2_.it = "Non è possibile verificare gli aggiornamenti";
      _loc2_.linkfr = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=955&_gid=1&languageid=2&group=dofusfr";
      _loc2_.linken = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=967&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkes = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=967&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkde = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=967&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkpt = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=967&_gid=1&languageid=1&group=dofusen";
      _loc2_ = new Object();
      this.ERRORS.IMPOSSIBLE_TO_LOAD_MODULE = _loc2_;
      _loc2_.fr = "Impossible de charger le module <b>%1</b>";
      _loc2_.en = "Impossible to download the module <b>%1</b>";
      _loc2_.es = "No es posible descargar el módulo <b>%1</b>";
      _loc2_.de = "Download des Moduls  <b>%1</b> nicht möglich";
      _loc2_.pt = "Impossível baixar o módulo <b>%1</b>";
      _loc2_.nl = "Onmogelijk om module <b>%1</b> te downloaden";
      _loc2_.it = "Non è possibile caricare il modulo <b>%1</b>";
      _loc2_.linkfr = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=963&_gid=1&languageid=2&group=dofusfr";
      _loc2_.linken = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=976&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkes = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=976&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkde = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=976&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkpt = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=976&_gid=1&languageid=1&group=dofusen";
      _loc2_ = new Object();
      this.ERRORS.WRITE_FAILED = _loc2_;
      _loc2_.fr = "Impossible de sauvegarder le fichier <b>%1</b> en local";
      _loc2_.en = "Impossible to save file <b>%1</b> in local";
      _loc2_.es = "No es posible guardar el archivo <b>%1</b> en local";
      _loc2_.de = "Lokales Speichern der Datei <b>%1</b> nicht möglich";
      _loc2_.pt = "Impossível salvar o arquivo <b>%1</b> localmente";
      _loc2_.nl = "Onmogelijk het bestand <b>%1</b> lokaal te bewaren";
      _loc2_.it = "Non è possibile registrare il file <b>%1</b> su rete locale";
      _loc2_.linkfr = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=965&_gid=1&languageid=2&group=dofusfr";
      _loc2_.linken = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=973&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkes = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=973&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkde = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=973&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkpt = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=973&_gid=1&languageid=1&group=dofusen";
      _loc2_ = new Object();
      this.ERRORS.CANT_UPDATE_FILE = _loc2_;
      _loc2_.fr = "Impossible de mettre a jour le fichier <b>%1</b>";
      _loc2_.en = "Impossible to update file <b>%1</b>";
      _loc2_.es = "No es posible actualizar el archivo <b>%1</b>";
      _loc2_.de = "Update der Datei <b>%1</b> nicht möglich";
      _loc2_.pt = "Impossível atualizar o arquivo <b>%1</b>";
      _loc2_.nl = "Onmogelijk om het bestand <b>%1</b> te updaten";
      _loc2_.it = "Non è possibile aggiornare il file <b>%1</b>";
      _loc2_.linkfr = "http://support.ankama-games.com/index.php?_gid=1&languageid=2&group=dofusfr";
      _loc2_.linken = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=967&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkes = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=967&_gid=1&languageid=1&group=dofusen";
      _loc2_.linken = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=967&_gid=1&languageid=1&group=dofusen";
      _loc2_.linkpt = "http://support.ankama-games.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=967&_gid=1&languageid=1&group=dofusen";
   }
   static function registerAllClasses()
   {
      Object.registerClass("ButtonNormalDown",ank.gapi.controls.button.ButtonBackground);
      Object.registerClass("ButtonNormalUp",ank.gapi.controls.button.ButtonBackground);
      Object.registerClass("ButtonToggleDown",ank.gapi.controls.button.ButtonBackground);
      Object.registerClass("ButtonToggleUp",ank.gapi.controls.button.ButtonBackground);
      Object.registerClass("ButtonSimpleRectangleUpDown",ank.gapi.controls.button.ButtonBackground);
      Object.registerClass("Label",ank.gapi.controls.Label);
      Object.registerClass("Button",ank.gapi.controls.Button);
      Object.registerClass("SelectableRow",ank.gapi.controls.list.SelectableRow);
      Object.registerClass("DefaultCellRenderer",ank.gapi.controls.list.DefaultCellRenderer);
      Object.registerClass("List",ank.gapi.controls.List);
      Object.registerClass("ConsoleLogger",ank.gapi.controls.ConsoleLogger);
      Object.registerClass("DofusLoader",dofus.DofusLoader);
      Object.registerClass("DofusLoader_DoubleFramerate",dofus.DofusLoader);
      Object.registerClass("Loader",ank.gapi.controls.Loader);
   }
   function log(§\x1e\f\x12§, §\x1e\x11\x15§, §\x1e\x10\x12§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = "#CCCCCC";
      }
      if(_loc4_ == undefined)
      {
         _loc4_ = "#666666";
      }
      this._currentLogger.log(_loc2_,_loc3_,_loc4_);
      this.addToSaveLog(_loc2_);
   }
   function addToSaveLog(§\x1e\f\x12§)
   {
      this._sLogs += new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace("&nbsp;"," ") + "\r\n";
   }
   function logTitle(§\x1e\f\x12§)
   {
      this.log("");
      this.log(_loc2_,"#CCCCCC","#CCCCCC");
   }
   function logRed(§\x1e\f\x12§)
   {
      this.log(_loc2_,"#FF0000","#DD0000");
   }
   function logGreen(§\x1e\f\x12§)
   {
      this.log(_loc2_,"#00FF00","#00AA00");
   }
   function logOrange(§\x1e\f\x12§)
   {
      this.log(_loc2_,"#FF9900","#DD7700");
   }
   function logYellow(§\x1e\f\x12§)
   {
      this.log(_loc2_,"#FFFF00","#AAAA00");
   }
   function getText(§\f\x03§, §\x1e\x01§)
   {
      var _loc4_ = this.LANG_TEXT[_loc2_][_global.CONFIG.language];
      if(_loc4_ == undefined || _loc4_.length == 0)
      {
         _loc4_ = _global[dofus.Constants.GLOBAL_SO_LANG_NAME].data[_loc2_];
      }
      if(_loc4_ == undefined || _loc4_.length == 0)
      {
         _loc4_ = this.LANG_TEXT[_loc2_].fr;
      }
      return this.replaceText(_loc4_,_loc3_);
   }
   function replaceText(§\x1e\f\x12§, §\x1e\x01§)
   {
      if(_loc3_ == undefined)
      {
         _loc3_ = new Array();
      }
      var _loc4_ = new Array();
      var _loc5_ = new Array();
      var _loc6_ = 0;
      while(_loc6_ < _loc3_.length)
      {
         _loc4_.push("%" + (_loc6_ + 1));
         _loc5_.push(_loc3_[_loc6_]);
         _loc6_ = _loc6_ + 1;
      }
      return new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_).replace(_loc4_,_loc5_);
   }
   function clearlogs()
   {
      this["\x1e\b\x1b"].clear();
      this["\x1e\b\x19"].clear();
      this["\x1e\b\x1a"].clear();
   }
   function setProgressBarValue(§\x1e\x1b\n§, §\x03\x07§)
   {
      this.showProgressBar(true);
      if(_loc2_ > _loc3_)
      {
         _loc2_ = _loc3_;
      }
      this["\x1e\b\x12"]["\n\x12"]._width = _loc2_ / _loc3_ * 100;
      this["\x1e\b\x12"]["\x1e\n\x10"].text = Math.floor(Number(this["\x1e\b\x12"]["\n\x12"]._width)) + "%";
   }
   function showProgressBar(§\x15\x0e§)
   {
      if(this["\x1e\b\x12"]._visible != _loc2_)
      {
         this["\x1e\b\x12"]._visible = _loc2_;
      }
   }
   function moveProgressBar(nX)
   {
   }
   function showWaitBar(§\x15\x0e§)
   {
      if(_loc2_)
      {
         this._mcWaitBar = this.attachMovie("GrayWaitBar","_mcWaitBar",1000,{_x:this["\x1e\b\x12"]._x + this["\x1e\b\x12"]["\n\x11"]._x,_y:this["\x1e\b\x12"]._y + this["\x1e\b\x12"]["\n\x11"]._y});
         this._mcWaitBar["\x1e\n\x11"].text = "Waiting";
      }
      else
      {
         this._mcWaitBar.removeMovieClip();
      }
      if(_loc2_)
      {
         this.showProgressBar(false);
      }
   }
   function setTotalBarValue(§\x1e\x1b\n§, §\x03\x07§)
   {
      this.showTotalBar(true);
      if(_loc2_ > _loc3_)
      {
         _loc2_ = _loc3_;
      }
      this["\x1e\b\x11"]["\n\x12"]._width = _loc2_ / _loc3_ * 100;
      this["\x1e\b\x11"]["\x1e\n\x10"].text = Math.floor(Number(this["\x1e\b\x11"]["\n\x12"]._width)) + "%";
   }
   function showTotalBar(§\x15\x0e§)
   {
      if(_loc2_)
      {
         var _loc3_ = 10079232;
         var _loc4_ = (_loc3_ & 0xFF0000) >> 16;
         var _loc5_ = (_loc3_ & 0xFF00) >> 8;
         var _loc6_ = _loc3_ & 0xFF;
         var _loc7_ = new Color(this["\x1e\b\x11"]["\n\x12"]);
         var _loc8_ = new Object();
         _loc8_ = {ra:"0",rb:_loc4_,ga:"0",gb:_loc5_,ba:"0",bb:_loc6_,aa:"100",ab:"0"};
         _loc7_.setTransform(_loc8_);
         this["\x1e\b\x13"]._visible = true;
         this["\x1e\b\x11"]._visible = true;
      }
      else
      {
         this["\x1e\b\x11"]._visible = false;
         this["\x1e\b\x13"]._visible = false;
      }
   }
   function showConfigurationChoice(§\x15\x0e§)
   {
      this["\x1e\b\x18"]._visible = _loc2_;
      this["\x1e\b\x16"]._visible = _loc2_;
      this["\x1e\b\x17"]._visible = _loc2_;
      this["\x1e\b\x15"]._visible = _loc2_;
      this["\x1e\t\x01"]._visible = _loc2_;
   }
   function showNextButton(§\x15\x0e§)
   {
      this._btnNext._visible = _loc2_;
   }
   function showShowLogsButton(§\x15\x0e§)
   {
      this["\x1e\b\x1c"]._visible = _loc2_;
   }
   function showContinueButton(§\x15\x0e§)
   {
      this._btnContinue._visible = _loc2_;
   }
   function showClearCacheButton(§\x15\x0e§)
   {
      this._btnClearCache._visible = _loc2_;
   }
   function showCopyLogsButton(§\x15\x0e§)
   {
      this["\x1e\b\x1d"]._visible = _loc2_;
   }
   function showMainLogger(§\x15\x0e§)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = !this["\x1e\b\x1b"]._visible;
      }
      this["\x1e\b\x1b"]._visible = _loc2_;
   }
   function nonCriticalError(§\x1e\x12\x13§, §\x1e\r\x03§)
   {
      this.logOrange(_loc3_ + "<b>" + this.getText("WARNING") + "</b> : " + _loc2_);
      this._bNonCriticalError = true;
   }
   function criticalError(§\x1e\x12\x13§, §\x1e\r\x03§, §\x15\r§, §\x1e\x01§, §\x1e\x12\x02§)
   {
      var _loc7_ = this.ERRORS[_loc2_];
      this.ERRORS.current = _loc2_;
      this.ERRORS.from = _loc6_;
      var _loc8_ = this.replaceText(_loc7_[_global.CONFIG.language],_loc5_);
      if(_loc8_ == undefined || _loc8_.length == 0)
      {
         _loc8_ = this.replaceText(_loc7_.fr,_loc5_);
      }
      this["\x1e\b\x1a"].log("<b>" + this.getText("ERROR") + "</b> : " + _loc8_,"#FF0000","#DD0000");
      var _loc9_ = "<u><a href=\'" + _loc7_["link" + _global.CONFIG.language] + "\' target=\'_blank\'>" + this.getText("LINK_HELP") + "</a></u>";
      this["\x1e\b\x1a"].log(_loc9_,"#FF0000","#DD0000");
      this.addToSaveLog(_loc3_ + "<b>" + this.getText("ERROR") + "</b> : " + _loc8_);
      this.showCopyLogsButton(true);
      this.showShowLogsButton(true);
      this.showContinueButton(true);
      if(_loc4_)
      {
         this.showClearCacheButton(true);
      }
   }
   function getLangSharedObject()
   {
      return ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(dofus.Constants.LANG_SHAREDOBJECT_NAME);
   }
   function getXtraSharedObject()
   {
      return ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(dofus.Constants.XTRA_SHAREDOBJECT_NAME);
   }
   function getOptionsSharedObject()
   {
      return ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(dofus.Constants.GLOBAL_SO_OPTIONS_NAME);
   }
   function getShortcutsSharedObject()
   {
      return ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(dofus.Constants.GLOBAL_SO_SHORTCUTS_NAME);
   }
   function getOccurencesSharedObject()
   {
      return ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(dofus.Constants.GLOBAL_SO_OCCURENCES_NAME);
   }
   function getCacheDateSharedObject()
   {
      return ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(dofus.Constants.GLOBAL_SO_CACHEDATE_NAME);
   }
   function launchBannerAnim(§\x16\x0f§)
   {
      if(!this._bBannerDisplay)
      {
         this.showBanner(true);
      }
      if(_loc2_)
      {
         this._mcBanner.playAll();
      }
      else
      {
         this._mcBanner.stopAll();
      }
   }
   function showBanner(§\x15\x0e§)
   {
      if(!this._bLoadingBannersFilesLoaded)
      {
         this.addLoadingBannersFiles(_loc2_);
      }
      else
      {
         var _loc3_ = _loc2_ != undefined ? _loc2_ : !this._bBannerDisplay;
         if(_loc3_)
         {
            if(this._bBannerDisplay)
            {
               return undefined;
            }
            var _loc4_ = "";
            if(this._aLoadingBannersFiles.length > 0)
            {
               var _loc6_ = Math.floor(Math.random() * (this._aLoadingBannersFiles.length + 1));
               if(_loc6_ < this._aLoadingBannersFiles.length)
               {
                  var _loc7_ = this._aLoadingBannersFiles[_loc6_];
                  var _loc5_ = this.createEmptyMovieClip("_mcBanner",this.getNextHighestDepth());
                  eval("\x1e\x18\x01")["\x1e\n\x07"]["\x18\t"].loadBitmapSmoothed(dofus.Constants.LOADING_BANNERS_PATH + _loc7_,_loc5_);
               }
            }
            var _loc8_ = "";
            if(!_loc5_)
            {
               _loc5_ = this.attachMovie("LoadingBanner_" + _global.CONFIG.language,"_mcBanner",this.getNextHighestDepth(),this["\x1e\b\x14"]);
            }
            if(!_loc5_)
            {
               _loc5_ = this.attachMovie("LoadingBanner_" + _loc8_,"_mcBanner",this.getNextHighestDepth(),this["\x1e\b\x14"]);
            }
            if(!_loc5_)
            {
               _loc5_ = this.attachMovie("LoadingBanner","_mcBanner",this.getNextHighestDepth(),this["\x1e\b\x14"]);
            }
            _loc5_.cacheAsBitmap = true;
            _loc5_.swapDepths(this["\x1e\b\x14"]);
         }
         else
         {
            if(!this._bBannerDisplay)
            {
               return undefined;
            }
            this._mcBanner.swapDepths(this["\x1e\b\x14"]);
            this._mcBanner.removeMovieClip();
         }
         this._bBannerDisplay = _loc3_;
      }
   }
   function copyAndOrganizeDataServerList()
   {
      var _loc2_ = _global.CONFIG.dataServers.slice(0);
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc4_ = _loc2_[_loc3_];
         if(_loc4_.nPriority == undefined || _global.isNaN(_loc4_.nPriority))
         {
            _loc4_.nPriority = 0;
         }
         var _loc5_ = _loc4_.priority;
         _loc4_.rand = random(99999);
         _loc3_ = _loc3_ + 1;
      }
      _loc2_.sortOn(["priority","rand"],Array.DESCENDING);
      var _loc6_ = 0;
      while(_loc6_ < _loc2_.length)
      {
         _loc6_ = _loc6_ + 1;
      }
      return _loc2_;
   }
   function checkOccurences()
   {
      var _loc2_ = _global.API.lang.getConfigText("MAXIMUM_CLIENT_OCCURENCES");
      if(_loc2_ == undefined || (_global.isNaN(_loc2_) || _loc2_ < 1))
      {
         return true;
      }
      var _loc3_ = this.getOccurencesSharedObject().data.occ;
      var _loc4_ = new Array();
      var _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         if(_loc3_[_loc5_].tick + dofus.Constants.MAX_OCCURENCE_DELAY > new Date().getTime())
         {
            _loc4_.push(_loc3_[_loc5_]);
         }
         _loc5_ = _loc5_ + 1;
      }
      var _loc6_ = _loc4_.length;
      if(!_global.API.datacenter.Player.isAuthorized && _loc6_ + 1 > _loc2_)
      {
         this.criticalError("TOO_MANY_OCCURENCES",this.TABULATION,false);
         return false;
      }
      this._nOccurenceId = Math.round(Math.random() * 1000);
      _loc4_.push({id:this._nOccurenceId,tick:new Date().getTime()});
      this.getOccurencesSharedObject().data.occ = _loc4_;
      _global.setInterval(this,"refreshOccurenceTick",dofus.Constants.OCCURENCE_REFRESH);
      return true;
   }
   function refreshOccurenceTick()
   {
      var _loc2_ = this.getOccurencesSharedObject().data.occ;
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(_loc2_[_loc3_].id == this._nOccurenceId)
         {
            _loc2_[_loc3_].tick = new Date().getTime();
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.getOccurencesSharedObject().data.occ = _loc2_;
   }
   function checkFlashPlayer()
   {
      var _loc2_ = System.capabilities.version;
      var _loc3_ = Number(_loc2_.split(" ")[1].split(",")[0]);
      var _loc4_ = System.capabilities.playerType.length != 0 ? " (" + System.capabilities.playerType + ")" : " ";
      this.log(this.TABULATION + "Flash player" + _loc4_ + " <b>" + _loc2_ + "</b>");
      if(_root.electron != undefined)
      {
         var _loc5_ = String(flash.external.ExternalInterface.call("getElectronVersion"));
         var _loc6_ = String(flash.external.ExternalInterface.call("getNodejsVersion"));
         this.log(this.TABULATION + "Electron <b>" + _loc5_ + "</b> (Node.js <b>" + _loc6_ + "</b>)");
      }
      if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         this.getURL("JavaScript:WriteLog(\'checkFlashPlayer;" + _loc3_ + "\')");
         this.getURL("JavaScript:WriteLog(\'versionDate;" + dofus.Constants.VERSIONDATE + "\')");
      }
      if(_loc3_ >= 8)
      {
         var _loc7_ = System.security.sandboxType;
         if(_loc7_ != "localTrusted" && _loc7_ != "remote")
         {
            this.criticalError("BAD_FLASH_SANDBOX",this.TABULATION,false);
            return false;
         }
         return true;
      }
      this.criticalError("BAD_FLASH_PLAYER",this.TABULATION,false);
      this.showBanner(false);
      return false;
   }
   function click(§\x1e\x19\x0e§)
   {
      loop0:
      switch(_loc2_.target)
      {
         case this["\x1e\t\x01"]:
            this.chooseConfiguration(this["\x1e\b\x16"].selectedItem.data,this["\x1e\b\x15"].selectedItem.data,true);
            break;
         case this._btnClearCache:
            this.clearCache();
            this.reboot();
            break;
         case this["\x1e\b\x1d"]:
            System.setClipboard(this._sLogs);
            break;
         case this["\x1e\b\x1c"]:
            this.showBanner(false);
            this.showMainLogger();
            break;
         case this._btnContinue:
            switch(this.ERRORS.current)
            {
               case "CHECK_LAST_VERSION_FAILED":
                  var _loc3_ = new LoadVars();
                  _loc3_.f = "";
                  this.onCheckLanguage(true,_loc3_,"","");
                  break;
               case "CHECK_LAST_VERSION_FAILED":
                  var _loc4_ = new LoadVars();
                  _loc4_.f = "";
                  this.onCheckLanguage(true,_loc4_,"","");
            }
            break;
         case this._btnNext:
            this.showNextButton(false);
            switch(this._sStep)
            {
               case "MODULE":
                  this.initCore(_global.MODULE_CORE);
                  break loop0;
               case "XTRA":
                  this.initAndLoginFinished();
            }
      }
   }
   function itemSelected(§\x1e\x19\x0e§)
   {
      switch(_loc2_.target)
      {
         case this["\x1e\b\x16"]:
            this.selectConfiguration();
            break;
         case this["\x1e\b\x15"]:
            this.selectConnexionServer();
      }
   }
   function onKeyUp()
   {
      if(Key.getCode() == Key.ESCAPE)
      {
         fscommand("quit","");
      }
   }
   function setDisplayStyle(§\x1e\r\x07§)
   {
      if(System.capabilities.playerType == "PlugIn" && (!_global.CONFIG.isStreaming && _root.electron == undefined))
      {
         this.getURL("javascript:setFlashStyle(\'flashid\', \'" + _loc2_ + "\');");
      }
   }
   function closeBrowserWindow()
   {
      if(System.capabilities.playerType == "PlugIn")
      {
         this.getURL("javascript:closeBrowserWindow();");
      }
   }
   function reboot()
   {
      var _loc2_ = 0;
      while(_loc2_ < dofus.Constants.MODULES_LIST.length)
      {
         this._mclLoader.unloadClip(_global["MODULE_" + dofus.Constants.MODULES_LIST[_loc2_][4]]);
         _loc2_ = _loc2_ + 1;
      }
      this.initLoader(_root);
   }
   function clearCache()
   {
      ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(dofus.Constants.LANG_SHAREDOBJECT_NAME).clear();
      ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(dofus.Constants.XTRA_SHAREDOBJECT_NAME).clear();
   }
   function showLoader(§\x15\x0e§, §\x17\x03§)
   {
      this._visible = _loc2_;
   }
   function showBasicInformations(§\x1b\x0b§)
   {
      this._currentLogger = this["\x1e\b\x19"];
      this.logTitle(this.getText("STARTING"));
      this.log(this.TABULATION + "Dofus Retro <b>v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + "</b> " + (dofus.Constants.BETAVERSION <= 0 ? "" : "(<font color=\"#FF0000\"><i><b>BETA " + dofus.Constants.BETAVERSION + "</b></i></font>) ") + "(<b>" + dofus.Constants.VERSIONDATE + "</b>" + (!dofus.Constants.ALPHA ? "" : " <font color=\"#00FF00\"><i><b>ALPHA BUILD</b></i></font>") + ")");
      if(!this.checkFlashPlayer())
      {
         this.showShowLogsButton(false);
         this.showCopyLogsButton(false);
         return undefined;
      }
      this.checkCacheVersion();
      this._currentLogger = this["\x1e\b\x1b"];
      if(_loc2_)
      {
         this.addToQueue({object:this,method:this.loadConfig});
      }
   }
   function loadConfig()
   {
      this.showLoader(true);
      this.moveProgressBar(0);
      this.logTitle(this.getText("LOADING_CONFIG_FILE"));
      var _loc2_ = new XML();
      var loader = this;
      _loc2_.ignoreWhite = true;
      _loc2_.onLoad = function(§\x14\x16§)
      {
         loader.onConfigLoaded(_loc2_,this);
      };
      this.showWaitBar(true);
      _loc2_.load(dofus.Constants.CONFIG_XML_FILE);
   }
   function onConfigLoaded(§\x14\x16§, xDoc)
   {
      this.showWaitBar(false);
      if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         this.getURL("JavaScript:WriteLog(\'onConfigLoaded;" + _loc2_ + "\')");
      }
      if(_loc2_)
      {
         this.setTotalBarValue(50,100);
         var _loc4_ = xDoc.firstChild.firstChild;
         if(xDoc.childNodes.length == 0 || _loc4_ == null)
         {
            this.criticalError("CORRUPT_CONFIG_FILE",this.TABULATION,false);
            return undefined;
         }
         _global.CONFIG.cacheAsBitmap = new Array();
         var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         var _loc6_ = false;
         while(_loc4_ != null)
         {
            switch(_loc4_.nodeName)
            {
               case "delay":
                  _global.CONFIG.delay = _loc4_.attributes.value;
                  break;
               case "rdelay":
                  _global.CONFIG.rdelay = _loc4_.attributes.value;
                  break;
               case "rcount":
                  _global.CONFIG.rcount = _loc4_.attributes.value;
                  break;
               case "hardcore":
                  _global.CONFIG.onlyHardcore = true;
                  break;
               case "streaming":
                  _global.CONFIG.isStreaming = true;
                  if(_loc4_.attributes.method)
                  {
                     _global.CONFIG.streamingMethod = _loc4_.attributes.method;
                  }
                  else
                  {
                     _global.CONFIG.streamingMethod = "compact";
                  }
                  _root._misc.attachMovie("UI_Misc","miniClip",_root._misc.getNextHighestDepth());
                  break;
               case "expo":
                  _global.CONFIG.isExpo = true;
                  break;
               case "conf":
                  var _loc7_ = _loc4_.attributes.name;
                  var _loc8_ = _loc4_.attributes.type;
                  if(_loc7_ != undefined && (dofus.Constants.TEST != true && _loc8_ != "test" || dofus.Constants.TEST == true && _loc8_ == "test"))
                  {
                     var _loc9_ = new Object();
                     _loc9_.name = _loc7_;
                     var _loc10_ = Number(_loc4_.attributes.zaapconnectport);
                     _loc9_.zaapConnectPort = !(_loc10_ == undefined || _global.isNaN(_loc10_)) ? _loc10_ : dofus["\x1e\t\x06"].TCP_DEFAULT_PORT;
                     _loc9_.debug = _loc4_.attributes.boo == "1";
                     _loc9_.debugRequests = _loc4_.attributes.debugrequests == "1" || _loc4_.attributes.debugrequests == "2";
                     _loc9_.logRequests = _loc4_.attributes.debugrequests == "2";
                     _loc9_.connexionServers = new ank["\x1e\n\x07"]["\x0f\x01"]();
                     _loc9_.dataServers = new Array();
                     var _loc11_ = _loc4_.firstChild;
                     while(_loc11_ != null)
                     {
                        switch(_loc11_.nodeName)
                        {
                           case "dataserver":
                              var _loc12_ = _loc11_.attributes.url;
                              var _loc13_ = _loc11_.attributes.type;
                              var _loc14_ = Number(_loc11_.attributes.priority);
                              if(_loc12_ != undefined && _loc12_ != "")
                              {
                                 _loc9_.dataServers.push({url:_loc12_,type:_loc13_,priority:_loc14_});
                                 System.security.allowDomain(_loc12_);
                              }
                              break;
                           case "connserver":
                              var _loc15_ = _loc11_.attributes.name;
                              var _loc16_ = _loc11_.attributes.ip;
                              var _loc17_ = _loc11_.attributes.port;
                              if(_loc15_ != undefined && (_loc16_ != "" && _loc17_ != undefined))
                              {
                                 _loc9_.connexionServers.push({label:_loc15_,data:{name:_loc15_,ip:_loc16_,port:_loc17_}});
                              }
                              break;
                           default:
                              this.nonCriticalError(this.getText("UNKNOWN_TYPE_NODE") + " (" + _loc4_.nodeName + ")",this.TABULATION);
                        }
                        _loc11_ = _loc11_.nextSibling;
                     }
                     if(_loc9_.dataServers.length > 0)
                     {
                        _loc5_.push({label:_loc9_.name,data:_loc9_});
                     }
                  }
                  break;
               case "languages":
                  _global.CONFIG.xmlLanguages = _loc4_.attributes.value.split(",");
                  _global.CONFIG.skipLanguageVerification = _loc4_.attributes.skipcheck == "true" || _loc4_.attributes.skipcheck == "1";
                  break;
               case "cacheasbitmap":
                  var _loc18_ = _loc4_.firstChild;
                  while(_loc18_ != null)
                  {
                     var _loc19_ = _loc18_.attributes.element;
                     var _loc20_ = _loc18_.attributes.value == "true";
                     _global.CONFIG.cacheAsBitmap[_loc19_] = _loc20_;
                     _loc18_ = _loc18_.nextSibling;
                  }
                  break;
               case "servers":
                  var _loc21_ = _loc4_.firstChild;
                  _global.CONFIG.customServersIP = new Array();
                  while(_loc21_ != null)
                  {
                     var _loc22_ = _loc21_.attributes.id;
                     var _loc23_ = _loc21_.attributes.ip;
                     var _loc24_ = _loc21_.attributes.port;
                     _global.CONFIG.customServersIP[_loc22_] = {ip:_loc23_,port:_loc24_};
                     _loc21_ = _loc21_.nextSibling;
                  }
                  break;
               default:
                  this.nonCriticalError(this.getText("UNKNOWN_TYPE_NODE") + " (" + _loc4_.nodeName + ")",this.TABULATION);
            }
            _loc4_ = _loc4_.nextSibling;
         }
         if(_loc5_.length == 0)
         {
            this.criticalError("CORRUPT_CONFIG_FILE",this.TABULATION,false);
            return undefined;
         }
         this.log(this.TABULATION + this.getText("CONFIG_FILE_LOADED"));
         this.askForConfiguration(_loc5_);
      }
      this.criticalError("NO_CONFIG_FILE",this.TABULATION,false);
      return undefined;
   }
   function askForConfiguration(§\x10\x0f§)
   {
      if(_loc2_.length == 1 && _loc2_[0].data.connexionServers.length == 0)
      {
         this.chooseConfiguration(_loc2_[0].data,undefined,false);
      }
      else
      {
         this.logTitle(this.getText("CHOOSE_CONFIGURATION"));
         this["\x1e\b\x16"].dataProvider = _loc2_;
         var _loc3_ = this.getOptionsSharedObject().data.loaderLastConfName;
         if(_loc3_ != undefined)
         {
            var _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               if(_loc2_[_loc4_].data.name == _loc3_)
               {
                  this["\x1e\b\x16"].selectedIndex = _loc4_;
                  break;
               }
               _loc4_ = _loc4_ + 1;
            }
         }
         else
         {
            this["\x1e\b\x16"].selectedIndex = 0;
         }
         this.selectConfiguration();
         this.showConfigurationChoice(true);
      }
   }
   function selectConfiguration()
   {
      var _loc2_ = this["\x1e\b\x16"].selectedItem.data.connexionServers;
      this["\x1e\b\x15"].dataProvider = _loc2_;
      var _loc3_ = this.getOptionsSharedObject();
      var _loc4_ = _loc3_.data.loaderConf[this["\x1e\b\x16"].selectedItem.label];
      if(_loc4_ != undefined)
      {
         var _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            if(_loc2_[_loc5_].data.name == _loc4_)
            {
               this["\x1e\b\x15"].selectedIndex = _loc5_;
               break;
            }
            _loc5_ = _loc5_ + 1;
         }
      }
      else if(_loc2_.length > 0)
      {
         this["\x1e\b\x15"].selectedIndex = 0;
      }
      _loc3_.data.loaderLastConfName = this["\x1e\b\x16"].selectedItem.label;
      _loc3_.flush();
      this.selectConnexionServer();
   }
   function selectConnexionServer()
   {
      var _loc2_ = this.getOptionsSharedObject();
      if(_loc2_.data.loaderConf == undefined)
      {
         _loc2_.data.loaderConf = new Object();
      }
      _loc2_.data.loaderConf[this["\x1e\b\x16"].selectedItem.label] = this["\x1e\b\x15"].selectedItem.label;
      _loc2_.flush();
   }
   function chooseConfiguration(§\x1e\x19\x19§, oServer, §\x17\x1b§)
   {
      this.showConfigurationChoice(false);
      if(_loc4_)
      {
         this.log(this.TABULATION + this.getText("CURRENT_CONFIG",[_loc2_.name]));
         if(oServer != undefined)
         {
            this.log(this.TABULATION + this.getText("CURRENT_SERVER",[oServer.name]));
         }
      }
      _global.CONFIG.dataServers = _loc2_.dataServers;
      _global.CONFIG.connexionServer = oServer;
      _global.CONFIG.zaapConnectPort = _loc2_.zaapConnectPort;
      if(_loc2_.debug)
      {
         dofus.Constants.DEBUG = true;
         this.logYellow(this.TABULATION + this.getText("DEBUG_MODE"));
      }
      if(_loc2_.debugRequests)
      {
         dofus.Constants.DEBUG_DATAS = true;
      }
      if(_loc2_.logRequests)
      {
         dofus.Constants.LOG_DATAS = true;
      }
      dofus["\x1e\t\x06"].newInstance();
      this.loadLocalFileList();
   }
   function startJsTimer()
   {
      this._nTimerJs--;
      if(this._nTimerJs <= 0)
      {
         this._nTimerJs = 20;
         this.getURL("javascript:startTimer()");
      }
      if(this._bJsTimer)
      {
         this.addToQueue({object:this,method:this.startJsTimer});
      }
   }
   function loadLanguage()
   {
      if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         this.getURL("javascript:startTimer()");
         this.startJsTimer();
      }
      this.logTitle(this.getText("LOAD_LANG_FILE"));
      this._sStep = "LANG";
      this._aCurrentDataServers = this.copyAndOrganizeDataServerList();
      var _loc2_ = this.getLangSharedObject().data.VERSIONS.lang;
      _global[dofus.Constants.GLOBAL_SO_LANG_NAME] = this.getLangSharedObject();
      this.log(this.TABULATION + this.getText("CURRENT_LANG_FILE_VERSION",[_loc2_ != undefined ? _loc2_ : "Aucune"]));
      this.log(this.TABULATION + this.getText("CHECK_LAST_VERSION"));
      this._oXtraCurrentVersion.lang = !_global.isNaN(_loc2_) ? Number(_loc2_) : 0;
      this.checkLanguageWithNextHost("lang," + _loc2_);
   }
   function checkLanguageWithNextHost(sFiles)
   {
      if(this._aCurrentDataServers.length < 1)
      {
         if(!this._bLocalFileListLoaded)
         {
            this.criticalError("CHECK_LAST_VERSION_FAILED",this.TABULATION,true,new Array(),"checkXtra");
         }
         else
         {
            this.nonCriticalError("CHECK_LAST_VERSION_FAILED",this.TABULATION,true);
            var _loc2_ = new LoadVars();
            var _loc3_ = new Array();
            var _loc4_ = this._mcLocalFileList.VERSIONS[_global.CONFIG.language];
            for(var i in _loc4_)
            {
               _loc3_.push(i + "," + _global.CONFIG.language + "," + _loc4_[i]);
            }
            _loc2_.f = _loc3_.join("|");
            this.onCheckLanguage(true,_loc2_);
         }
         return undefined;
      }
      var oServer = this._aCurrentDataServers.shift();
      if(oServer.type == "local")
      {
         this.checkLanguageWithNextHost(sFiles);
         return undefined;
      }
      var _loc5_ = oServer.url + "lang/versions_" + _global.CONFIG.language + ".txt" + "?wtf=" + Math.random();
      var _loc6_ = new LoadVars();
      var loader = this;
      _loc6_.onLoad = function(§\x14\x16§)
      {
         loader.onCheckLanguage(_loc2_,this,oServer.url,sFiles);
      };
      this.showWaitBar(true);
      _loc6_.load(_loc5_,this,"GET");
   }
   function onCheckLanguage(§\x14\x16§, §\x0b\n§, §\x1e\r\x18§, §\x1e\x12\t§)
   {
      this.showWaitBar(false);
      if(_loc2_ && _loc3_.f != undefined)
      {
         this.setTotalBarValue(100,100);
         this._sDistantFileList = _loc3_.f;
         var _loc6_ = _loc3_.f.substr(_loc3_.f.indexOf("lang,")).split("|")[0].split(",");
         var _loc7_ = false;
         if(_loc3_.f != "")
         {
            var _loc8_ = _loc6_[2];
            if(_global.CONFIG.language == this.getLangSharedObject().data.LANGUAGE && (this._oXtraCurrentVersion.lang != undefined && _loc8_ == this._oXtraCurrentVersion.lang))
            {
               _loc7_ = true;
            }
            else
            {
               this.log(this.TABULATION + this.getText("NEW_LANG_FILE_AVAILABLE",[_loc6_[2]]));
               if(this._bSkipDistantLoad)
               {
                  if(this._oXtraCurrentVersion.lang == 0)
                  {
                     _loc8_ = this._mcLocalFileList.VERSIONS[_global.CONFIG.language].lang;
                  }
               }
               this.updateLanguage(_loc6_[2]);
            }
         }
         else
         {
            _loc7_ = true;
         }
         if(_loc7_)
         {
            this.log(this.TABULATION + this.getText("NO_NEW_VERSION_AVAILABLE"));
            this.loadModules();
         }
      }
      else
      {
         this.nonCriticalError(this.getText("IMPOSSIBLE_TO_JOIN_SERVER",[_loc4_]),this.TABULATION + this.TABULATION);
         this.checkLanguageWithNextHost(_loc5_);
      }
   }
   function updateLanguage(§\x05\x06§)
   {
      this._bUpdate = true;
      this.showWaitBar(true);
      var _loc3_ = new dofus["\x1e\n\x07"]["\x0b\x1c"]();
      _loc3_.addListener(this);
      _loc3_.load(this.copyAndOrganizeDataServerList(),"lang/swf/lang_" + _global.CONFIG.language + "_" + _loc2_ + ".swf",this._mcContainer,dofus.Constants.LANG_SHAREDOBJECT_NAME,"lang",_global.CONFIG.language);
   }
   function loadModules()
   {
      this.logTitle(this.getText("LOAD_MODULES"));
      this._sStep = "MODULE";
      this._aCurrentModules = dofus.Constants.MODULES_LIST.slice(0);
      this.loadNextModule();
   }
   function loadNextModule()
   {
      if(this._aCurrentModules.length < 1)
      {
         this.logTitle(this.getText("INIT_END"));
         this.onCoreLoaded(_global.MODULE_CORE);
         return undefined;
      }
      this._aCurrentModule = this._aCurrentModules.shift();
      var _loc2_ = this._aCurrentModule[0];
      var _loc3_ = this._aCurrentModule[1];
      var _loc4_ = this._aCurrentModule[2];
      var _loc5_ = this._aCurrentModule[4];
      this._mcCurrentModule = this._mcModules.createEmptyMovieClip("mc" + _loc5_,this._mcModules.getNextHighestDepth());
      this._timedProgress = _global.setInterval(this.onTimedProgress,1000,this,this._mclLoader,this._mcCurrentModule);
      this._mclLoader.loadClip(_loc3_,this._mcCurrentModule);
   }
   function onCoreLoaded(§\n\x17§)
   {
      if(_global.CONFIG.isStreaming)
      {
         this._bJsTimer = false;
         this.getURL("javascript:stopTimer()");
      }
      if((this._bNonCriticalError || this._bUpdate) && (dofus.Constants.DEBUG && dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST == undefined))
      {
         this.showNextButton(true);
         this.showCopyLogsButton(true);
         this.showShowLogsButton(true);
      }
      else
      {
         this.initCore(_loc2_);
      }
   }
   function initCore(§\n\x17§)
   {
      Key.removeListener(this);
      var _loc3_ = null;
      if((_loc3_ = dofus["\x10\x16"].getInstance()) == undefined)
      {
         _loc3_ = new dofus["\x10\x16"](_loc2_);
         if(Key.isDown(Key.SHIFT))
         {
            Stage.scaleMode = "exactFit";
         }
      }
      _loc3_.initStart();
      this._bNonCriticalError = false;
      this._bUpdate = false;
   }
   function loadLocalFileList()
   {
      this.logTitle(this.getText("LOAD_XTRA_FILES"));
      this._aCurrentDataServers = this.copyAndOrganizeDataServerList();
      this.checkLocalFileListWithNextHost(dofus.Constants.LANG_LOCAL_FILE_LIST);
      this.showWaitBar(true);
   }
   function checkLocalFileListWithNextHost(sFiles)
   {
      if(this._aCurrentDataServers.length < 1)
      {
         this.nonCriticalError("CHECK_LAST_VERSION_FAILED",this.TABULATION,true);
         this.loadLanguage();
         return undefined;
      }
      var _loc2_ = this._aCurrentDataServers.shift();
      var sURL = _loc2_.url + sFiles;
      var loader = this;
      var _loc3_ = new MovieClipLoader();
      var _loc4_ = new Object();
      _loc4_.onLoadInit = function(§\n\x1d§)
      {
         loader.loadLanguage();
         loader._bLocalFileListLoaded = true;
      };
      _loc4_.onLoadError = function(§\n\x1d§)
      {
         loader.checkLocalFileListWithNextHost(sFiles);
      };
      _loc3_.addListener(_loc4_);
      _loc3_.loadClip(sURL,this._mcLocalFileList);
   }
   function loadXtra()
   {
      this.clearlogs();
      this.showLoader(true);
      this.showBanner(true);
      this.showMainLogger(false);
      this.showShowLogsButton(false);
      this.showConfigurationChoice(false);
      this.showNextButton(false);
      this.showContinueButton(false);
      this.showClearCacheButton(false);
      this.showCopyLogsButton(false);
      this.showProgressBar(false);
      this.launchBannerAnim(true);
      this.setTotalBarValue(0,100);
      this.showBasicInformations();
      if(!this.checkOccurences())
      {
         this.showShowLogsButton(false);
         this.showCopyLogsButton(false);
         return undefined;
      }
      this.logTitle(this.getText("LOAD_XTRA_FILES"));
      this.log(this.TABULATION + this.getText("CHECK_LAST_VERSION"));
      this._sStep = "XTRA";
      this.moveProgressBar(-60);
      _global[dofus.Constants.GLOBAL_SO_XTRA_NAME] = ank["\x1e\n\x07"]["\x1e\x11\x16"].getLocal(dofus.Constants.XTRA_SHAREDOBJECT_NAME);
      var _loc2_ = dofus["\x1e\n\x07"]["\x1d\x1b"].getInstance();
      if(_loc2_ != undefined)
      {
         _loc2_.lang.clearSOXtraCache();
      }
      this._aCurrentDataServers = this.copyAndOrganizeDataServerList();
      var _loc3_ = this.getXtraSharedObject().data.VERSIONS;
      var _loc4_ = _global.API.lang.getConfigText("XTRA_FILE");
      var _loc5_ = 0;
      while(_loc5_ < _loc4_.length)
      {
         var _loc6_ = _loc4_[_loc5_];
         var _loc7_ = _loc3_[_loc6_] != undefined ? _loc3_[_loc6_] : 0;
         this._oXtraCurrentVersion[_loc6_] = _loc7_;
         _loc5_ = _loc5_ + 1;
      }
      this.showWaitBar(false);
      this._aXtraList = this._sDistantFileList.split("|");
      this._nTotalFile = this._aXtraList.length;
      this.updateNextXtra();
   }
   function updateNextXtra()
   {
      if(this._bSkipDistantLoad && this._oCurrentXtraLoadFile != undefined)
      {
         this._aXtraList.push(this._oCurrentXtraLoadFile);
      }
      if(this._aXtraList.length >= 1)
      {
         while(true)
         {
            if(this._aXtraList.length > 0)
            {
               this.setTotalBarValue(10 + (90 - 90 / this._nTotalFile * (this._aXtraList.length - 1)),100);
               this._aCurrentXtra = this._aXtraList.shift().split(",");
               if(this._aXtraList.length > 0 && this._aCurrentXtra[2])
               {
                  if(!this._bSkipDistantLoad)
                  {
                     this._oCurrentXtraLoadFile = this._aCurrentXtra;
                  }
                  var _loc2_ = this._aCurrentXtra[0];
                  var _loc3_ = this._aCurrentXtra[1];
                  var _loc4_ = this._aCurrentXtra[2];
                  if(_loc2_ != "lang")
                  {
                     this["\x1e\b\x12"]["\x1e\n\x11"].text = _loc2_;
                     if(!(_global.CONFIG.language == this.getLangSharedObject().data.LANGUAGE && Number(_loc4_) == this._oXtraCurrentVersion[_loc2_]))
                     {
                        if(!this._bLocalFileListLoaded)
                        {
                           if(this._bSkipDistantLoad)
                           {
                              return undefined;
                           }
                           break;
                        }
                        if(!this._bSkipDistantLoad)
                        {
                           break;
                        }
                        if(this._oXtraCurrentVersion[_loc2_] == 0)
                        {
                           _loc4_ = this._mcLocalFileList.VERSIONS[_global.CONFIG.language][_loc2_];
                           break;
                        }
                     }
                  }
               }
               continue;
            }
            this.noMoreXtra();
         }
         this._bUpdate = true;
         this._aCurrentXtra[3] = this._aCurrentXtra[0] + "_" + this._aCurrentXtra[1] + "_" + this._aCurrentXtra[2];
         this.log(this.TABULATION + this.getText("UPDATE_FILE",[_loc2_]));
         this.showWaitBar(true);
         var _loc5_ = new dofus["\x1e\n\x07"]["\x0b\x1c"]();
         _loc5_.addListener(this);
         if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
         {
            this.getURL("JavaScript:WriteLog(\'updateNextXtra;" + _loc2_ + "_" + _global.CONFIG.language + "_" + _loc4_ + "\')");
         }
         _loc5_.load(this.copyAndOrganizeDataServerList(),"lang/swf/" + _loc2_ + "_" + _global.CONFIG.language + "_" + _loc4_ + ".swf",this._mcContainer,dofus.Constants.XTRA_SHAREDOBJECT_NAME,_loc2_,_global.CONFIG.language,true);
         return undefined;
      }
      this.noMoreXtra();
   }
   function noMoreXtra()
   {
      this.logTitle(this.getText("INIT_END"));
      if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         this.getURL("JavaScript:WriteLog(\'XtraLangLoadEnd\')");
      }
      if((this._bNonCriticalError || this._bUpdate) && (dofus.Constants.DEBUG && dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST == undefined))
      {
         this.showNextButton(true);
         this.showCopyLogsButton(true);
         this.showShowLogsButton(true);
      }
      else
      {
         this.initAndLoginFinished();
      }
   }
   function initAndLoginFinished()
   {
      this.showLoader(false);
      _global.API.kernel.onInitAndLoginFinished();
      this._bNonCriticalError = false;
      this._bUpdate = false;
      this.launchBannerAnim(false);
      this.showBanner(false);
   }
   function checkCacheVersion()
   {
      var _loc2_ = new Date();
      var _loc3_ = _loc2_.getFullYear() + "-" + (_loc2_.getMonth() + 1) + "-" + _loc2_.getDate();
      if(!this.getCacheDateSharedObject().data.clearDate)
      {
         this.clearCache();
         this.getCacheDateSharedObject().data.clearDate = _loc3_;
         this.getCacheDateSharedObject().flush(100);
         return false;
      }
      if(_global[dofus.Constants.GLOBAL_SO_LANG_NAME] && (_global[dofus.Constants.GLOBAL_SO_LANG_NAME].data.C.CLEAR_DATE && _global[dofus.Constants.GLOBAL_SO_LANG_NAME].data.C.ENABLED_AUTO_CLEARCACHE))
      {
         if(this.getCacheDateSharedObject().data.clearDate < _global[dofus.Constants.GLOBAL_SO_LANG_NAME].data.C.CLEAR_DATE)
         {
            this.clearCache();
            this.getCacheDateSharedObject().data.clearDate = _global[dofus.Constants.GLOBAL_SO_LANG_NAME].data.C.CLEAR_DATE;
            this.getCacheDateSharedObject().flush();
            this.reboot();
            return false;
         }
      }
      return true;
   }
   function onLoadStart(§\n\x1d§)
   {
      this.showWaitBar(false);
      this.setProgressBarValue(0,100);
   }
   function onTimedProgress(§\x1e\x11\x13§, §\x0b\x15§, §\x1e\x0b\x11§)
   {
      var _loc5_ = _loc3_.getProgress(_loc4_);
      _loc2_.setProgressBarValue(Number(_loc5_.bytesLoaded),Number(_loc5_.bytesTotal));
   }
   function onLoadError(§\n\x1d§, §\x0f\x06§, §\r\x03§, oServer)
   {
      _global.clearInterval(this._timedProgress);
      this.showProgressBar(false);
      this.showWaitBar(false);
      switch(this._sStep)
      {
         case "LANG":
            if(oServer.type == "local")
            {
               this.log(this.TABULATION + this.TABULATION + this.getText("NO_FILE_IN_LOCAL",["lang",oServer.url]));
            }
            else
            {
               if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
               {
                  this.getURL("JavaScript:WriteLog(\'onLoadError LANG-" + oServer.url + "lang" + "\')");
               }
               this.nonCriticalError(this.getText("IMPOSSIBLE_TO_DOWNLOAD_FILE",["lang",oServer.url]),this.TABULATION + this.TABULATION);
            }
            break;
         case "MODULE":
            if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
            {
               this.getURL("JavaScript:WriteLog(\'onLoadError MODULE-" + this._aCurrentModule[4] + "\')");
            }
            this.criticalError("IMPOSSIBLE_TO_LOAD_MODULE",this.TABULATION,true,[this._aCurrentModule[4]]);
            break;
         case "XTRA":
            if(oServer.type == "local")
            {
               this.log(this.TABULATION + this.TABULATION + this.getText("NO_FILE_IN_LOCAL",[this._aCurrentXtra[3],oServer.url]));
               break;
            }
            if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
            {
               this.getURL("JavaScript:WriteLog(\'onLoadError XTRA-" + oServer.url + this._aCurrentXtra[3] + "\')");
            }
            this.nonCriticalError(this.getText("IMPOSSIBLE_TO_DOWNLOAD_FILE",[this._aCurrentXtra[3],oServer.url]),this.TABULATION + this.TABULATION);
            break;
      }
   }
   function onLoadComplete(§\n\x1d§)
   {
      _global.clearInterval(this._timedProgress);
      if(this._sStep == "MODULE")
      {
         _global["MODULE_" + this._aCurrentModule[4]] = _loc2_;
      }
   }
   function onLoadInit(§\n\x1d§, oServer)
   {
      this.showProgressBar(false);
      switch(this._sStep)
      {
         case "LANG":
            this.logGreen(this.TABULATION + this.getText("UPDATE_FINISH",["lang",oServer.url]));
            if(!this.checkCacheVersion())
            {
               return undefined;
            }
            this.loadModules();
            break;
         case "MODULE":
            this.log(this.TABULATION + this.getText("MODULE_LOADED",[this._aCurrentModule[4]]));
            if(!this.checkCacheVersion())
            {
               return undefined;
            }
            this.loadNextModule();
            break;
         case "XTRA":
            if(oServer.type == "local")
            {
               this.logGreen(this.TABULATION + this.TABULATION + this.getText("FILE_LOADED",[this._aCurrentXtra[3],oServer.url]));
            }
            else
            {
               this.logGreen(this.TABULATION + this.TABULATION + this.getText("UPDATE_FINISH",[this._aCurrentXtra[3],oServer.url]));
            }
            this._oCurrentXtraLoadFile = undefined;
            this.updateNextXtra();
      }
   }
   function onCorruptFile(§\n\x1d§, §\x1e\n\x1a§, oServer)
   {
      switch(this._sStep)
      {
         case "LANG":
            this.nonCriticalError(this.getText("CORRUPT_FILE",["lang",oServer.url,_loc3_]),this.TABULATION + this.TABULATION);
            break;
         case "XTRA":
            this.nonCriticalError(this.getText("CORRUPT_FILE",[this._aCurrentXtra[3],oServer.url,_loc3_]),this.TABULATION + this.TABULATION);
      }
   }
   function onCantWrite(§\n\x1d§)
   {
      switch(this._sStep)
      {
         case "LANG":
            this.criticalError("WRITE_FAILED",this.TABULATION + this.TABULATION,true,["lang"]);
            break;
         case "XTRA":
            this.criticalError("WRITE_FAILED",this.TABULATION + this.TABULATION,true,[this._aCurrentXtra[3]]);
      }
   }
   function onAllLoadFailed(§\n\x1d§)
   {
      this.showProgressBar(false);
      this.showWaitBar(false);
      if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         this.getURL("JavaScript:WriteLog(\'onAllLoadFailed;" + this._sStep + "\')");
      }
      switch(this._sStep)
      {
         case "LANG":
            if(!this._bSkipDistantLoad)
            {
               this.criticalError("CANT_UPDATE_FILE",this.TABULATION + this.TABULATION,true,["lang"]);
            }
            else
            {
               this.nonCriticalError("CANT_UPDATE_FILE",this.TABULATION + this.TABULATION,true,["lang"]);
            }
            this._bSkipDistantLoad = true;
            break;
         case "XTRA":
            this._bSkipDistantLoad = true;
            this.nonCriticalError("CANT_UPDATE_FILE",this.TABULATION + this.TABULATION,true,[this._aCurrentXtra[3]]);
            this.updateNextXtra();
      }
   }
   function onCoreDisplayed()
   {
      this.launchBannerAnim(false);
      this.showBanner(false);
      this.showLoader(false);
   }
}
