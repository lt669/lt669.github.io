//Patch to calulate the file number to load for the surrounding RIRs
inlets = 2;
outlets = 12;

var numberOfMeters, top, bottom;

function msg_int(input){
	if(inlet == 1){
		numberOfMeters = input;
	}else if (inlet == 0){
	
		//Top row
		l1 = input - numberOfMeters-1;
		c1 = input - numberOfMeters;
		r1 = input - numberOfMeters + 1;
	
		//Middle Row
		l2 = input - 1;
		c2 = input;
		r2 = input + 1;
		
		//Bottom Row
		l3 = input + (numberOfMeters-1);
		c3 = input + numberOfMeters;
		r3 = input + numberOfMeters + 1;
		
		z = c2 % (numberOfMeters);
		//Prevent far right numbers from wrapping round grid
		if(z == 0){ //If center is on far right, don't load new RIRs
			r1 = r2 = r3 = 0;
		}
		if(z == 1){ //If on far left, don't load RIRs
			l1 = l2 = l3 = 0;
		}
		
		//Detect when top and bottom are out of bounds
		if(c1 < 1){
			top = 0;//Out of bounds
		}else{
			top = 1;
		}
		if(c3 > numberOfMeters*(numberOfMeters+1)){
			bottom = 0;//Out of bounds
		}else{
			bottom = 1;
		}
		
		//Print Grid
		post("\n ----");
		post("\n "+l1+" "+c1+" "+r1);
		post("\n "+l2+" "+c2+" "+r2);
		post("\n "+l3+" "+c3+" "+r3);
		
		//Send state of far left or far right position
		outlet(0,z);
		outlet(1,top);
		outlet(2,bottom);
		
		//Send numbers to outlets
		outlet(3,l1);
		outlet(4,c1);
		outlet(5,r1);
		outlet(6,l2);
		outlet(7,c2);
		outlet(8,r2);
		outlet(9,l3);
		outlet(10,c3);
		outlet(11,r3);
	}
}