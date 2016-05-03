/*
	Description
	Java script used to prevent the 3rd convolution
	patch from fading in when the first patch has
	faded in for the first time.
	
	Author: Lewis Thresh
*/
inlets = 1;
outlets = 1;

function msg_int(input){
	if(input < 2){
		//Dont send doneLoad2 through
	}else{
		outlet(0,1);
	}
}	