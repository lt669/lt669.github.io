inlets = 1;
outlets = 2;
function msg_int(input){
	
	if (input == 0){
		outlet(1,1);
	}else if (input == 1){
		outlet(0,1);
	}
}