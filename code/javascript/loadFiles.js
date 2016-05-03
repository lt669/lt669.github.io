inlets = 3;
outlets = 4;

var folderNumber; //Which folder to find files depending on number of RIR required
var filename1, filename2, filename3, filename4;
var sampleRate;

// Audio Lab: /Users/audiolab/Desktop/VSS\ Patch\ Single\ RIR/Data/Trimmed/

// Mac: /Users/Lewis/Uni\ Work/4th\ Year/Project/VSS\ Patch\ Audio\ Lab/Data/

//External HD: /Volumes/lt669 =)/MEng/VSS Patch Single RIR/Data/Bulk/Trimmed/TrimmedNew

//var path = "/Users/audiolab/Desktop/VSS\ Patch\ Single\ RIR/Data/Bulk/TrimmedNew/"
//var path = "/Users/Lewis/Uni\ Work/4th\ Year/Project/VSS\ Patch\ Audio\ Lab/Data/"
var path = "/Volumes/lt669 =)/MEng/Global\ Data\ File!/Bulk/TrimmedNew/"

function msg_int(input){
	
	if(inlet == 0){
	fileNumber = ("000" + input).slice(-3);
	
	//Set file search information
	filename1 = "" + path + "" + sampleRate + "/" + folderNumber + "/0/" + fileNumber + "_0.Wav";
	filename2 = "" + path + "" + sampleRate + "/"+ folderNumber + "/90/" + fileNumber + "_90.Wav";
	filename3 = "" + path + "" + sampleRate + "/"+ folderNumber + "/180/" + fileNumber + "_180.Wav";
	filename4 = "" + path + "" + sampleRate + "/" + folderNumber + "/270/" + fileNumber + "_270.Wav";
	outlet(0, "open",filename1);
	outlet(1, "open",filename2);
	outlet(2, "open",filename3);
	outlet(3, "open",filename4);
	}else if(inlet == 1){
		folderNumber = input;
	} else if(inlet == 2){
		sampleRate = input;
	}
}	