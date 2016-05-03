inlets = 3;
outlets = 4;

var folderNumber; //Which folder to find files depending on number of RIR required\
var filename1, filename2, filename3, filename4;
var sampleRate;
var folder;
var extension;
var fileNumber //grid location number

//HD
var path = "/Volumes/lt669 =)/MEng/Global\ Data\ File!/Test1"
var pathBulk = "/Volumes/lt669 =)/MEng/Global\ Data\ File!/Bulk/TrimmedNew/44/1"

//Laptop
//var path = "/Users/Lewis/Uni Work/4th Year/Project/Max/VSS Patch Single RIR/Data/Test1"
//var path = "/Users/Lewis/Uni Work/4th Year/Project/Max/VSS Patch Single RIR/Data/Bulk/TrimmedNew/44/1"

//Audio Lab
// var path = "/Users/audiolab/Desktop/VSS Patch Single RIR/Data/Test1"
// var pathBulk = "/Users/audiolab/Desktop/VSS Patch Single RIR/Data/Bulk/TrimmedNew/44/1"

function msg_int(input){
	
	if(inlet == 0){
	if(input ==1){
		filename1 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_2_0"+extension;
		filename2 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_2_90"+extension;
		filename3 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_2_180"+extension;
		filename4 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_2_270"+extension;
	}else if (input == 2){
		filename1 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_4_0"+extension;
		filename2 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_4_90"+extension;
		filename3 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_4_180"+extension;
		filename4 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_4_270"+extension;
	}else if (input == 3){
		filename1 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_9_0"+extension;
		filename2 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_9_90"+extension;
		filename3 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_9_180"+extension;
		filename4 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_9_9_270"+extension;
	}else if (input == 4){
		filename1 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_Desk_0"+extension;
		filename2 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_Desk_90"+extension;
		filename3 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_Desk_180"+extension;
		filename4 = ""+path+"/"+folder+"/Trimmed/"+type+"Trimmed_Desk_270"+extension;
	}	
	outlet(0, "open",filename1);
	outlet(1, "open",filename2);
	outlet(2, "open",filename3);
	outlet(3, "open",filename4);
	}
	else if(inlet == 1){
	if(input == 0){
		folder = "Real";
		extension = "_RIR_V4.wav";
		type = "Calibrated/Cal_";
	} else if (input == 1){
		folder = "Odeon";
		extension = ".wav";
		type = "44/"
	}	
	} else if (inlet == 2){
		if(input == 1){
			fileNumber = "128"
		} else if (input == 2){
			fileNumber = "127"
		} else if (input == 3){
			fileNumber = "126"
		} else if (input == 4){
			fileNumber = "125"
		} else if (input == 5){
			fileNumber = "124"
		} else if (input == 6){
			fileNumber = "123"
		} else if (input == 7){
			fileNumber = "122"
		} else if (input == 8){
			fileNumber = "121"
		}
		
		filename1 = ""+pathBulk+"/0/"+fileNumber+"_0.Wav";
		filename2 = ""+pathBulk+"/90/"+fileNumber+"_90.Wav";
		filename3 = ""+pathBulk+"/180/"+fileNumber+"_180.Wav";
		filename4 = ""+pathBulk+"/270/"+fileNumber+"_270.Wav";
		outlet(0, "open",filename1);
		outlet(1, "open",filename2);
		outlet(2, "open",filename3);
		outlet(3, "open",filename4);
	}	
}