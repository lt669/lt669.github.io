inlets = 6;
outlets = 2;

var xLocation = [];
var yLocation = [];
var section = [];
var length = 0;
var timer;

function msg_int(input){
	//Add coordinate and sections to the end of each array with every new input
	if(inlet == 0){
		xLocation.push(input); //Store x coordinate
	} else if (inlet == 1){
		yLocation.push(input); //Store y coordinate
	} else if (inlet == 2){
		section.push(input); //Store current section location
	} else if (inlet == 3){ //If timer is done
		if(xLocation.length == 0){
			//Dont output anything
		}else{
			if(section.length > 0){
				findLength(); //Find how many (x,y) locations visited in one section
				outputCounter = 0;
			}
		}	
	} else if(inlet == 4){ //called every 100ms
		timer = input;
		if(section.length >= 1 && outputCounter < length){//Move dot untill all coordinates have been visited
			outputCoords();
		}
	} else { //Clear arrays
		xLocation = [];
		yLocation = [];
		section = [];
		xCount = yCount = sCount = length = outputCounter = 0;
		post("\n Location Arrays Cleared");
		}
}	

//Determines how many different locations were moved to within one section
function findLength(){
	var	previousSection = section[0]; //Store current section number
	for(i=0;i<section.length;i++){
		if(previousSection == section[i]){
			length = i+1;
		} else {
			break;
		}	
	}	
}	

//Output the coordinates for the dot to follow
function outputCoords(){
	if(timer >= (2500/length)){
		//Output coordinates
		outputCounter++;
		outlet(0,xLocation[0]);
		outlet(1,yLocation[0]);
		xLocation.shift(); //Truncate arrays
		yLocation.shift();
		section.shift();
	}
}	
