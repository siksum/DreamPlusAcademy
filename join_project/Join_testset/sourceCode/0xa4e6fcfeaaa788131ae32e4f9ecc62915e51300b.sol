/**
 *Submitted for verification at Etherscan.io on 2020-11-19
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

contract CDFData {
    // duration -> [sigmas 0%, 5%, 10%, 15%, 20%.... 200%]
    mapping (uint => uint32[]) public CDF;
    uint32[] public Durations = [300,900,1800,3600,86400,1209600,2592000,5184000,7776000,15552000];
    uint public constant Amplifier = 1e9;
    
    uint32[] private _cdf300=[0,61522,123045,184568,246091,307614,369137,430660,492183,553706,615229,676752,738275,799798,861321,922844,984367,1045890,1107413,1168936,1230459,1291982,1353505,1415027,1476550,1538073,1599596,1661119,1722642,1784165,1845687,1907210,1968733,2030256,2091779,2153301,2214824,2276347,2337870,2399392,2460915];
    uint32[] private _cdf900=[0,106560,213121,319682,426243,532804,639365,745926,852487,959048,1065609,1172169,1278730,1385291,1491852,1598412,1704973,1811534,1918094,2024655,2131216,2237776,2344337,2450897,2557458,2664018,2770578,2877139,2983699,3090259,3196819,3303379,3409939,3516499,3623059,3729619,3836178,3942738,4049298,4155857,4262417];
    uint32[] private _cdf1800=[0,150699,301399,452099,602799,753499,904199,1054899,1205598,1356298,1506998,1657697,1808397,1959096,2109796,2260495,2411195,2561894,2712593,2863292,3013991,3164690,3315388,3466087,3616785,3767483,3918182,4068880,4219578,4370275,4520973,4671670,4822368,4973065,5123762,5274458,5425155,5575851,5726547,5877243,6027939];
    uint32[] private _cdf3600=[0,213121,426243,639365,852487,1065609,1278730,1491852,1704973,1918094,2131216,2344337,2557458,2770578,2983699,3196819,3409939,3623059,3836178,4049298,4262417,4475535,4688654,4901772,5114889,5328007,5541124,5754240,5967356,6180472,6393587,6606702,6819816,7032930,7246043,7459156,7672269,7885380,8098491,8311602,8524712];
    uint32[] private _cdf86400=[0,1044079,2088156,3132230,4176299,5220361,6264413,7308455,8352484,9396499,10440498,11484479,12528441,13572381,14616297,15660189,16704054,17747890,18791696,19835470,20879209,21922913,22966580,24010207,25053793,26097336,27140835,28184287,29227690,30271044,31314346,32357595,33400788,34443923,35487000,36530016,37572970,38615859,39658683,40701438,41744124];
    uint32[] private _cdf1209600=[0,3906572,7813051,11719343,15625354,19530991,23436159,27340765,31244717,35147920,39050281,42951706,46852103,50751378,54649437,58546189,62441540,66335397,70227668,74118259,78007079,81894034,85779034,89661985,93542795,97421373,101297628,105171467,109042800,112911535,116777582,120640849,124501246,128358683,132213070,136064316,139912332,143757029,147598317,151436108,155270312];
    uint32[] private _cdf2592000=[0,5718610,11436928,17154657,22871506,28587180,34301386,40013831,45724223,51432268,57137675,62840151,68539407,74235150,79927091,85614940,91298407,96977206,102651047,108319644,113982712,119639964,125291117,130935886,136573991,142205148,147829079,153445503,159054143,164654721,170246962,175830592,181405337,186970925,192527087,198073553,203610056,209136330,214652110,220157133,225651139];
    uint32[] private _cdf5184000=[0,8087267,16173704,24258480,32340764,40419727,48494542,56564380,64628417,72685828,80735793,88777491,96810107,104832825,112844836,120845330,128833505,136808560,144769697,152716126,160647058,168561711,176459306,184339070,192200237,200042044,207863735,215664561,223443778,231200649,238934443,246644437,254329914,261990166,269624490,277232194,284812590,292365001,299888758,307383198,314847670];
    uint32[] private _cdf7776000=[0,9904755,19807983,29708160,39603761,49493264,59375149,69247902,79110010,88959966,98796271,108617429,118421952,128208361,137975183,147720956,157444227,167143552,176817500,186464650,196083594,205672937,215231296,224757304,234249607,243706866,253127760,262510982,271855242,281159268,290421807,299641621,308817495,317948229,327032646,336069589,345057920,353996522,362884302,371720187,380503125];
    uint32[] private _cdf15552000=[0,14007079,28009841,42003975,55985175,69949149,83891621,97808333,111695052,125547573,139361722,153133360,166858386,180532744,194152421,207713457,221211943,234644026,248005915,261293879,274504257,287633454,300677947,313634289,326499110,339269120,351941112,364511963,376978637,389338187,401587758,413724588,425746008,437649447,449432429,461092581,472627625,484035389,495313800,506460888,517474787];
    
    constructor() public{
        CDF[300]=_cdf300;
        CDF[900]=_cdf900;
        CDF[1800]=_cdf1800;
        CDF[3600]=_cdf3600;
        CDF[86400]=_cdf86400;
        CDF[1209600]=_cdf1209600;
        CDF[2592000]=_cdf2592000;
        CDF[5184000]=_cdf5184000;
        CDF[7776000]=_cdf7776000;
        CDF[15552000]=_cdf15552000;
    }
    
    function numDurations() external view returns (uint) {
        return Durations.length;
    }
}