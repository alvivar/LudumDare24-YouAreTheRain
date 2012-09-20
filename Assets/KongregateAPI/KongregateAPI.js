var debugmode = true;
var isKongregate = false;
var userId = 0;
static var username = "Guest";
var gameAuthToken = "";
var stat = "stat";
var statValue = 0; 

function OnKongregateAPILoaded(userInfoString) {
    isKongregate = true;
    var params = userInfoString.Split("|"[0]);
    userId = parseInt(params[0]);
    username = params[1];
    gameAuthToken = params[2];
} 

function Awake() {
    DontDestroyOnLoad (this);
    Application.ExternalEval(
    "if(typeof(kongregateUnitySupport) != 'undefined'){" +
    "    kongregateUnitySupport.initAPI('KongregateAPI', 'OnKongregateAPILoaded');" +
    "}"
    );
}

function OnGUI() {
	GUI.Label (Rect (10, 10, 100, 20), "Ratz? " + isKongregate);
}