inlets = 2;
outlets = 4;
var z = 0;
var thru = 0;
function msg_int(input){
z = z + 1;

thru = thru + 1;
	if(inlet == 0){
		data = input;
		outlet(3,thru);
		if(thru == 1){
			outlet(0,data);
		} else if(thru == 2){
			outlet(1,data);
		} else if (thru == 3){
			outlet(2,data);
			thru = 0;
		}	
	}	
	if(inlet == 1){
		thru = -1;
	}	
	post("Thru: ",thru);
}	