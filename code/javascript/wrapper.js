inlets = 1;
outlets = 1;
function msg_float(input){
	if(input >360){
		input = input - 360;
	}else if(input < 0){
		input = input + 360;
		}
		
		outlet(0,input);
	
}