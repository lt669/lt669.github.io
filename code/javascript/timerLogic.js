/*//////////////////////////////////////////////////////
	Description
	Timer: Outputs a signal ever 2.5 seconds

	Author: Lewis Thresh
*///////////////////////////////////////////////////////
inlets = 1;
outlets = 2;
function msg_int(input){
	if (input > 2500){
		outlet(0,1);
		outlet(1,1);
	} else {
		outlet(0,0);
	}	
}	