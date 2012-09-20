#pragma strict

function Start () {
	var score:int=Random.Range(0,10000);
	
	//It takes about 5 seconds to get the api loaded so lazily wait 10 seconds
	yield WaitForSeconds(10.0);
	Application.ExternalCall("kongregate.stats.submit","highscore",score);
}
