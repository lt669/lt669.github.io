/*//////////////////////////////////////////////////////
	Description
	Patch used to route the input signal to revolving
	convolution patches.

	Author: Lewis Thresh
*///////////////////////////////////////////////////////
inlets = 2;
outlets = 3;
var z = 0;
var thru = 0;
function msg_int(input){
z = z + 1;
thru = thru + 1;//Increment each time
	if(inlet == 0){
		data = input;
		if(thru == 1){
			outlet(0,data);
		} else if(thru == 2){
			outlet(1,data);
		} else if (thru == 3){
			outlet(2,data);
			thru = 0; //Wrap around
		}	
	}	
	if(inlet == 1){//Reset
		thru = -1;
	}	
}	