inlets = 1;
outlets = 3;
function msg_int(input){
	if(input == 1){
		outlet(1,0);
		outlet(2,1);
		}
	else if(input == 2){
		outlet(2,0);
		outlet(0,1);
		}
	else if(input == 3){
		outlet(0,0);
		outlet(1,1);
	}
	
}	