/*//////////////////////////////////////////////////////
	Description
	Patch used to store the list of files names that
	still need to be loaded into the convolution patches.

	Author: Lewis Thresh
*///////////////////////////////////////////////////////

inlets = 3;
outlets = 2;

var locationsArray = [];

function msg_int(input){
	if(inlet == 0){	//Stores all incoming positions in array
		locationsArray.push(input); //Add to the end of the array
	}else if (inlet == 1){	//Outputs new position to load when timer is done and deletes it from array
		if(input == 1){
			if(locationsArray.length == 0){ //Signal array is empty or not
				outlet(1,1);
			}else{
				outlet(0,locationsArray[0]);
				outlet(1,0);
				}
			locationsArray.shift(); //Remove sent data from array
		}else{
			//Don't output until both timer is done and file is loaded
			 }
	}else{
		locationsArray = []; //Clear the array
		post(locationsArray);
		post("\n Array Length: ",locationsArray.length);
		
	}
}