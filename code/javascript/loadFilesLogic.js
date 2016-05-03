inlets = 5;
outlets = 1;

//Create arrays to store previous positions
var xArray = new Array(2);
var yArray = new Array(2);

var windowSize = new Array(2);

//Variables to use for file searching
var fileX, fileY, search;

//Defines how to split up the grid
var numberOfMeters;

//Loads appropriate files given users finger coordinates
function msg_int(input){
	if(inlet == 0){
		xPos = input; 
	} else if (inlet == 1){
		yPos = input;//Add off set to start at (0,1)
	} else if (inlet == 2){
		windowSize [0] = input;
	} else if (inlet == 3){
		windowSize [1] = input;
	} else if(inlet==4){
		numberOfMeters = input;
	}
	
	//Split into sections
	if(numberOfMeters == 3 || numberOfMeters == 5){
		//Even grid for 3m and 5m
		xPosition = (xPos/windowSize[0])*(numberOfMeters);
		yPosition = (yPos/windowSize[1])*(numberOfMeters);
	} else if (numberOfMeters == 4 || numberOfMeters == 8){
		//4m separation requires different x,y coordinate scaling
		xPosition = (xPos/windowSize[0])*(numberOfMeters-1);
		yPosition = (yPos/windowSize[1])*(numberOfMeters);
	} else{
		//Extra row for others
		xPosition = (xPos/windowSize[0])*(numberOfMeters); 
		yPosition = (yPos/windowSize[1])*(numberOfMeters+1);
	}	
	
	//Round to nearest value
	xSection = Math.round(xPosition);
	ySection = Math.round(yPosition); 
	
	//Start the lcd grid sections from column 1 row 1 instead of column 0 row 0
	if(xSection == 0){
		xSection = 1; 
	}
	if(ySection == 0){
		ySection = 1;
	}
	
	//Store current location
	xArray[0] = xSection;
	yArray[0] = ySection;
	
	//If either coordinate is changed search for new files
	if(xArray[0] != xArray[1] || yArray[0] != yArray[1]){
		
		if(xArray[0] != xArray[1]){
			//Store previous value
			xArray[1] = xArray[0];
			X = xArray[0];
		}
		
		if(yArray[0] != yArray[1]){
			yArray[1] = yArray[0];
			Y = yArray[0]
		}
		
		//Output user location within grid
		if(numberOfMeters == 4 || numberOfMeters == 8){
			fileNumber = X + ((numberOfMeters-1)*(Y-1)); //Requires different algorithm for 2m and 4m due to different grid shape
		} else {
			fileNumber = X + ((numberOfMeters)*(Y-1));
		}	
		outlet(1,fileNumber);
	}
}