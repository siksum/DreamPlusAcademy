pragma solidity 0.5.15;

contract IAugur {
    function CREATECHILDUNIVERSE663(bytes32 _parentPayoutDistributionHash, uint256[] memory _parentPayoutNumerators) public returns (IUniverse);	
    function ISKNOWNUNIVERSE600(IUniverse _universe) public view returns (bool);	
    function TRUSTEDCASHTRANSFER681(address _from, address _to, uint256 _amount) public returns (bool);	
    function ISTRUSTEDSENDER341(address _address) public returns (bool);	
    function ONCATEGORICALMARKETCREATED596(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, bytes32[] memory _outcomes) public returns (bool);	
    function ONYESNOMARKETCREATED747(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash) public returns (bool);	
    function ONSCALARMARKETCREATED165(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, int256[] memory _prices, uint256 _numTicks)  public returns (bool);	
    function LOGINITIALREPORTSUBMITTED615(IUniverse _universe, address _reporter, address _market, address _initialReporter, uint256 _amountStaked, bool _isDesignatedReporter, uint256[] memory _payoutNumerators, string memory _description, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime) public returns (bool);	
    function DISPUTECROWDSOURCERCREATED947(IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] memory _payoutNumerators, uint256 _size, uint256 _disputeRound) public returns (bool);	
    function LOGDISPUTECROWDSOURCERCONTRIBUTION546(IUniverse _universe, address _reporter, address _market, address _disputeCrowdsourcer, uint256 _amountStaked, string memory description, uint256[] memory _payoutNumerators, uint256 _currentStake, uint256 _stakeRemaining, uint256 _disputeRound) public returns (bool);	
    function LOGDISPUTECROWDSOURCERCOMPLETED581(IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] memory _payoutNumerators, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime, bool _pacingOn, uint256 _totalRepStakedInPayout, uint256 _totalRepStakedInMarket, uint256 _disputeRound) public returns (bool);	
    function LOGINITIALREPORTERREDEEMED688(IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] memory _payoutNumerators) public returns (bool);	
    function LOGDISPUTECROWDSOURCERREDEEMED708(IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] memory _payoutNumerators) public returns (bool);	
    function LOGMARKETFINALIZED262(IUniverse _universe, uint256[] memory _winningPayoutNumerators) public returns (bool);	
    function LOGMARKETMIGRATED144(IMarket _market, IUniverse _originalUniverse) public returns (bool);	
    function LOGREPORTINGPARTICIPANTDISAVOWED205(IUniverse _universe, IMarket _market) public returns (bool);	
    function LOGMARKETPARTICIPANTSDISAVOWED402(IUniverse _universe) public returns (bool);	
    function LOGCOMPLETESETSPURCHASED275(IUniverse _universe, IMarket _market, address _account, uint256 _numCompleteSets) public returns (bool);	
    function LOGCOMPLETESETSSOLD624(IUniverse _universe, IMarket _market, address _account, uint256 _numCompleteSets, uint256 _fees) public returns (bool);	
    function LOGMARKETOICHANGED759(IUniverse _universe, IMarket _market) public returns (bool);	
    function LOGTRADINGPROCEEDSCLAIMED598(IUniverse _universe, address _sender, address _market, uint256 _outcome, uint256 _numShares, uint256 _numPayoutTokens, uint256 _fees) public returns (bool);	
    function LOGUNIVERSEFORKED808(IMarket _forkingMarket) public returns (bool);	
    function LOGREPUTATIONTOKENSTRANSFERRED918(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool);	
    function LOGREPUTATIONTOKENSBURNED780(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	
    function LOGREPUTATIONTOKENSMINTED763(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	
    function LOGSHARETOKENSBALANCECHANGED79(address _account, IMarket _market, uint256 _outcome, uint256 _balance) public returns (bool);	
    function LOGDISPUTECROWDSOURCERTOKENSTRANSFERRED482(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool);	
    function LOGDISPUTECROWDSOURCERTOKENSBURNED741(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	
    function LOGDISPUTECROWDSOURCERTOKENSMINTED334(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	
    function LOGDISPUTEWINDOWCREATED337(IDisputeWindow _disputeWindow, uint256 _id, bool _initial) public returns (bool);	
    function LOGPARTICIPATIONTOKENSREDEEMED851(IUniverse universe, address _sender, uint256 _attoParticipationTokens, uint256 _feePayoutShare) public returns (bool);	
    function LOGTIMESTAMPSET643(uint256 _newTimestamp) public returns (bool);	
    function LOGINITIALREPORTERTRANSFERRED282(IUniverse _universe, IMarket _market, address _from, address _to) public returns (bool);	
    function LOGMARKETTRANSFERRED539(IUniverse _universe, address _from, address _to) public returns (bool);	
    function LOGPARTICIPATIONTOKENSTRANSFERRED786(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool);	
    function LOGPARTICIPATIONTOKENSBURNED18(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	
    function LOGPARTICIPATIONTOKENSMINTED244(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	
    function LOGMARKETREPBONDTRANSFERRED373(address _universe, address _from, address _to) public returns (bool);	
    function LOGWARPSYNCDATAUPDATED864(address _universe, uint256 _warpSyncHash, uint256 _marketEndTime) public returns (bool);	
    function ISKNOWNFEESENDER700(address _feeSender) public view returns (bool);	
    function LOOKUP941(bytes32 _key) public view returns (address);	
    function GETTIMESTAMP310() public view returns (uint256);	
    function GETMAXIMUMMARKETENDDATE328() public returns (uint256);	
    function ISKNOWNMARKET306(IMarket _market) public view returns (bool);	
    function DERIVEPAYOUTDISTRIBUTIONHASH222(uint256[] memory _payoutNumerators, uint256 _numTicks, uint256 numOutcomes) public view returns (bytes32);	
    function LOGVALIDITYBONDCHANGED68(uint256 _validityBond) public returns (bool);	
    function LOGDESIGNATEDREPORTSTAKECHANGED225(uint256 _designatedReportStake) public returns (bool);	
    function LOGNOSHOWBONDCHANGED177(uint256 _noShowBond) public returns (bool);	
    function LOGREPORTINGFEECHANGED718(uint256 _reportingFee) public returns (bool);	
    function GETUNIVERSEFORKINDEX419(IUniverse _universe) public view returns (uint256);	
}

contract IOwnable {
    function GETOWNER978() public view returns (address);	
    function TRANSFEROWNERSHIP128(address _newOwner) public returns (bool);	
}

contract ITyped {
    function GETTYPENAME211() public view returns (bytes32);	
}

contract Initializable {
    bool private initialized = false;

    modifier BEFOREINITIALIZED879 {	
        require(!initialized);
        _;
    }

    function ENDINITIALIZATION940() internal BEFOREINITIALIZED879 {	
        initialized = true;
    }

    function GETINITIALIZED853() public view returns (bool) {	
        return initialized;
    }
}

library SafeMathInt256 {
    
    int256 private constant int256_min934 = -2**(255);	
    int256 private constant int256_max539 = (2**(255) - 1);	

    function MUL470(int256 a, int256 b) internal pure returns (int256) {	
        int256 c = a * b;
        require(a == 0 || c / a == b);
        return c;
    }

    function DIV109(int256 a, int256 b) internal pure returns (int256) {	
        
        int256 c = a / b;
        return c;
    }

    function SUB183(int256 a, int256 b) internal pure returns (int256) {	
        require(((a >= 0) && (b >= a - int256_max539)) || ((a < 0) && (b <= a - int256_min934)));
        return a - b;
    }

    function ADD848(int256 a, int256 b) internal pure returns (int256) {	
        require(((a >= 0) && (b <= int256_max539 - a)) || ((a < 0) && (b >= int256_min934 - a)));
        return a + b;
    }

    function MIN36(int256 a, int256 b) internal pure returns (int256) {	
        if (a <= b) {
            return a;
        } else {
            return b;
        }
    }

    function MAX60(int256 a, int256 b) internal pure returns (int256) {	
        if (a >= b) {
            return a;
        } else {
            return b;
        }
    }

    function ABS724(int256 a) internal pure returns (int256) {	
        if (a < 0) {
            return -a;
        }
        return a;
    }

    function GETINT256MIN589() internal pure returns (int256) {	
        return int256_min934;
    }

    function GETINT256MAX43() internal pure returns (int256) {	
        return int256_max539;
    }

    
    function FXPMUL293(int256 a, int256 b, int256 base) internal pure returns (int256) {	
        return DIV109(MUL470(a, b), base);
    }

    function FXPDIV734(int256 a, int256 b, int256 base) internal pure returns (int256) {	
        return DIV109(MUL470(a, base), b);
    }
}

library SafeMathUint256 {
    function MUL470(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function DIV109(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        uint256 c = a / b;
        
        return c;
    }

    function SUB183(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b <= a);
        return a - b;
    }

    function ADD848(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a);
        return c;
    }

    function MIN36(uint256 a, uint256 b) internal pure returns (uint256) {	
        if (a <= b) {
            return a;
        } else {
            return b;
        }
    }

    function MAX60(uint256 a, uint256 b) internal pure returns (uint256) {	
        if (a >= b) {
            return a;
        } else {
            return b;
        }
    }

    function SQRT201(uint256 y) internal pure returns (uint256 z) {	
        if (y > 3) {
            uint256 x = (y + 1) / 2;
            z = y;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }

    function GETUINT256MIN911() internal pure returns (uint256) {	
        return 0;
    }

    function GETUINT256MAX237() internal pure returns (uint256) {	
        
        return 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }

    function ISMULTIPLEOF419(uint256 a, uint256 b) internal pure returns (bool) {	
        return a % b == 0;
    }

    
    function FXPMUL293(uint256 a, uint256 b, uint256 base) internal pure returns (uint256) {	
        return DIV109(MUL470(a, b), base);
    }

    function FXPDIV734(uint256 a, uint256 b, uint256 base) internal pure returns (uint256) {	
        return DIV109(MUL470(a, base), b);
    }
}

interface IERC1155 {

                                                                                          
                                                                          
                                           
                                                                      
                                                                           
                                                                                                 
                                                                                                      
                                                                                                       
                                                                   
    event TRANSFERSINGLE518(	
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256 id,
        uint256 value
    );

                                                                                          
                                                                          
                                          
                                                                      
                                                                           
                                                                                                 
                                                                                                      
                                                                                                      
                                                                   
    event TRANSFERBATCH979(	
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256[] ids,
        uint256[] values
    );

                                                   
    event APPROVALFORALL690(	
        address indexed owner,
        address indexed operator,
        bool approved
    );

                                                              
                                     
                                                                                            
    event URI934(	
        string value,
        uint256 indexed id
    );

                                                                                                     
                                                       
                                                                                            
                                                
                                                                                        
                                      
                                                                                                         
                                                                                       
                                                                                               
                                     
                                     
                                           
                                      
                                                                                      
    function SAFETRANSFERFROM329(	
        address from,
        address to,
        uint256 id,
        uint256 value,
        bytes calldata data
    )
        external;

                                                                                                  
                                                      
                                                                                            
                                                
                                                                              
                                                                                                                 
                                      
                                                                                                         
                                                                                            
                                                                                                        
                                       
                                       
                                             
                                                      
                                                                                      
    function SAFEBATCHTRANSFERFROM641(	
        address from,
        address to,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    )
        external;

                                                                                                               
                                                           
                                                                          
                                                                                   
    function SETAPPROVALFORALL117(address operator, bool approved) external;	

                                                                             
                                                
                                                       
                                                                        
    function ISAPPROVEDFORALL535(address owner, address operator) external view returns (bool);	

                                                       
                                                     
                                     
                                                                       
    function BALANCEOF710(address owner, uint256 id) external view returns (uint256);	

                                                
                                     
                                                                   
    function TOTALSUPPLY904(uint256 id) external view returns (uint256);	

                                                               
                                                        
                                      
                                                                        
    function BALANCEOFBATCH233(	
        address[] calldata owners,
        uint256[] calldata ids
    )
        external
        view
        returns (uint256[] memory balances_);
}

contract IERC20 {
    function TOTALSUPPLY904() external view returns (uint256);	
    function BALANCEOF710(address owner) public view returns (uint256);	
    function TRANSFER771(address to, uint256 amount) public returns (bool);	
    function TRANSFERFROM678(address from, address to, uint256 amount) public returns (bool);	
    function APPROVE443(address spender, uint256 amount) public returns (bool);	
    function ALLOWANCE985(address owner, address spender) public view returns (uint256);	

    
    event TRANSFER995(address indexed from, address indexed to, uint256 value);	
    event APPROVAL400(address indexed owner, address indexed spender, uint256 value);	
}

contract ICash is IERC20 {
}

contract IAffiliateValidator {
    function VALIDATEREFERENCE673(address _account, address _referrer) external view returns (bool);	
}

contract IDisputeWindow is ITyped, IERC20 {
    function INVALIDMARKETSTOTAL396() external view returns (uint256);	
    function VALIDITYBONDTOTAL604() external view returns (uint256);	

    function INCORRECTDESIGNATEDREPORTTOTAL271() external view returns (uint256);	
    function INITIALREPORTBONDTOTAL738() external view returns (uint256);	

    function DESIGNATEDREPORTNOSHOWSTOTAL123() external view returns (uint256);	
    function DESIGNATEDREPORTERNOSHOWBONDTOTAL228() external view returns (uint256);	

    function INITIALIZE114(IAugur _augur, IUniverse _universe, uint256 _disputeWindowId, bool _participationTokensEnabled, uint256 _duration, uint256 _startTime) public;	
    function TRUSTEDBUY219(address _buyer, uint256 _attotokens) public returns (bool);	
    function GETUNIVERSE510() public view returns (IUniverse);	
    function GETREPUTATIONTOKEN369() public view returns (IReputationToken);	
    function GETSTARTTIME153() public view returns (uint256);	
    function GETENDTIME355() public view returns (uint256);	
    function GETWINDOWID173() public view returns (uint256);	
    function ISACTIVE809() public view returns (bool);	
    function ISOVER318() public view returns (bool);	
    function ONMARKETFINALIZED946() public;	
    function REDEEM305(address _account) public returns (bool);	
}

contract IMarket is IOwnable {
    enum MarketType {
        YES_NO,
        CATEGORICAL,
        SCALAR
    }

    function INITIALIZE114(IAugur _augur, IUniverse _universe, uint256 _endTime, uint256 _feePerCashInAttoCash, IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, address _creator, uint256 _numOutcomes, uint256 _numTicks) public;	
    function DERIVEPAYOUTDISTRIBUTIONHASH222(uint256[] memory _payoutNumerators) public view returns (bytes32);	
    function DOINITIALREPORT223(uint256[] memory _payoutNumerators, string memory _description, uint256 _additionalStake) public returns (bool);	
    function GETUNIVERSE510() public view returns (IUniverse);	
    function GETDISPUTEWINDOW156() public view returns (IDisputeWindow);	
    function GETNUMBEROFOUTCOMES136() public view returns (uint256);	
    function GETNUMTICKS319() public view returns (uint256);	
    function GETMARKETCREATORSETTLEMENTFEEDIVISOR747() public view returns (uint256);	
    function GETFORKINGMARKET389() public view returns (IMarket _market);	
    function GETENDTIME355() public view returns (uint256);	
    function GETWINNINGPAYOUTDISTRIBUTIONHASH340() public view returns (bytes32);	
    function GETWINNINGPAYOUTNUMERATOR151(uint256 _outcome) public view returns (uint256);	
    function GETWINNINGREPORTINGPARTICIPANT725() public view returns (IReportingParticipant);	
    function GETREPUTATIONTOKEN369() public view returns (IV2ReputationToken);	
    function GETFINALIZATIONTIME169() public view returns (uint256);	
    function GETINITIALREPORTER776() public view returns (IInitialReporter);	
    function GETDESIGNATEDREPORTINGENDTIME946() public view returns (uint256);	
    function GETVALIDITYBONDATTOCASH887() public view returns (uint256);	
    function AFFILIATEFEEDIVISOR425() external view returns (uint256);	
    function GETNUMPARTICIPANTS217() public view returns (uint256);	
    function GETDISPUTEPACINGON363() public view returns (bool);	
    function DERIVEMARKETCREATORFEEAMOUNT992(uint256 _amount) public view returns (uint256);	
    function RECORDMARKETCREATORFEES656(uint256 _marketCreatorFees, address _sourceAccount, bytes32 _fingerprint) public returns (bool);	
    function ISCONTAINERFORREPORTINGPARTICIPANT428(IReportingParticipant _reportingParticipant) public view returns (bool);	
    function ISFINALIZEDASINVALID513() public view returns (bool);	
    function FINALIZE653() public returns (bool);	
    function ISFINALIZED778() public view returns (bool);	
    function GETOPENINTEREST666() public view returns (uint256);	
}

contract IReportingParticipant {
    function GETSTAKE989() public view returns (uint256);	
    function GETPAYOUTDISTRIBUTIONHASH208() public view returns (bytes32);	
    function LIQUIDATELOSING191() public;	
    function REDEEM305(address _redeemer) public returns (bool);	
    function ISDISAVOWED976() public view returns (bool);	
    function GETPAYOUTNUMERATOR599(uint256 _outcome) public view returns (uint256);	
    function GETPAYOUTNUMERATORS165() public view returns (uint256[] memory);	
    function GETMARKET653() public view returns (IMarket);	
    function GETSIZE720() public view returns (uint256);	
}

contract IInitialReporter is IReportingParticipant, IOwnable {
    function INITIALIZE114(IAugur _augur, IMarket _market, address _designatedReporter) public;	
    function REPORT231(address _reporter, bytes32 _payoutDistributionHash, uint256[] memory _payoutNumerators, uint256 _initialReportStake) public;	
    function DESIGNATEDREPORTERSHOWED715() public view returns (bool);	
    function INITIALREPORTERWASCORRECT59() public view returns (bool);	
    function GETDESIGNATEDREPORTER904() public view returns (address);	
    function GETREPORTTIMESTAMP947() public view returns (uint256);	
    function MIGRATETONEWUNIVERSE23(address _designatedReporter) public;	
    function RETURNREPFROMDISAVOW182() public;	
}

contract IReputationToken is IERC20 {
    function MIGRATEOUTBYPAYOUT845(uint256[] memory _payoutNumerators, uint256 _attotokens) public returns (bool);	
    function MIGRATEIN51(address _reporter, uint256 _attotokens) public returns (bool);	
    function TRUSTEDREPORTINGPARTICIPANTTRANSFER723(address _source, address _destination, uint256 _attotokens) public returns (bool);	
    function TRUSTEDMARKETTRANSFER665(address _source, address _destination, uint256 _attotokens) public returns (bool);	
    function TRUSTEDUNIVERSETRANSFER831(address _source, address _destination, uint256 _attotokens) public returns (bool);	
    function TRUSTEDDISPUTEWINDOWTRANSFER313(address _source, address _destination, uint256 _attotokens) public returns (bool);	
    function GETUNIVERSE510() public view returns (IUniverse);	
    function GETTOTALMIGRATED518() public view returns (uint256);	
    function GETTOTALTHEORETICALSUPPLY576() public view returns (uint256);	
    function MINTFORREPORTINGPARTICIPANT902(uint256 _amountMigrated) public returns (bool);	
}

contract IShareToken is ITyped, IERC1155 {
    function INITIALIZE114(IAugur _augur) external;	
    function INITIALIZEMARKET529(IMarket _market, uint256 _numOutcomes, uint256 _numTicks) public;	
    function UNSAFETRANSFERFROM232(address _from, address _to, uint256 _id, uint256 _value) public;	
    function UNSAFEBATCHTRANSFERFROM139(address _from, address _to, uint256[] memory _ids, uint256[] memory _values) public;	
    function CLAIMTRADINGPROCEEDS156(IMarket _market, address _shareHolder, bytes32 _fingerprint) external returns (uint256[] memory _outcomeFees);	
    function GETMARKET653(uint256 _tokenId) external view returns (IMarket);	
    function GETOUTCOME936(uint256 _tokenId) external view returns (uint256);	
    function GETTOKENID27(IMarket _market, uint256 _outcome) public pure returns (uint256 _tokenId);	
    function GETTOKENIDS633(IMarket _market, uint256[] memory _outcomes) public pure returns (uint256[] memory _tokenIds);	
    function BUYCOMPLETESETS578(IMarket _market, address _account, uint256 _amount) external returns (bool);	
    function BUYCOMPLETESETSFORTRADE291(IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient) external returns (bool);	
    function SELLCOMPLETESETS722(IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint) external returns (uint256 _creatorFee, uint256 _reportingFee);	
    function SELLCOMPLETESETSFORTRADE291(IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint) external returns (uint256 _creatorFee, uint256 _reportingFee);	
    function TOTALSUPPLYFORMARKETOUTCOME745(IMarket _market, uint256 _outcome) public view returns (uint256);	
    function BALANCEOFMARKETOUTCOME535(IMarket _market, uint256 _outcome, address _account) public view returns (uint256);	
    function LOWESTBALANCEOFMARKETOUTCOMES608(IMarket _market, uint256[] memory _outcomes, address _account) public view returns (uint256);	
}

contract IUniverse {
    function CREATIONTIME654() external view returns (uint256);	
    function MARKETBALANCE126(address) external view returns (uint256);	

    function FORK66() public returns (bool);	
    function UPDATEFORKVALUES823() public returns (bool);	
    function GETPARENTUNIVERSE529() public view returns (IUniverse);	
    function CREATECHILDUNIVERSE663(uint256[] memory _parentPayoutNumerators) public returns (IUniverse);	
    function GETCHILDUNIVERSE88(bytes32 _parentPayoutDistributionHash) public view returns (IUniverse);	
    function GETREPUTATIONTOKEN369() public view returns (IV2ReputationToken);	
    function GETFORKINGMARKET389() public view returns (IMarket);	
    function GETFORKENDTIME855() public view returns (uint256);	
    function GETFORKREPUTATIONGOAL5() public view returns (uint256);	
    function GETPARENTPAYOUTDISTRIBUTIONHASH405() public view returns (bytes32);	
    function GETDISPUTEROUNDDURATIONINSECONDS108(bool _initial) public view returns (uint256);	
    function GETORCREATEDISPUTEWINDOWBYTIMESTAMP983(uint256 _timestamp, bool _initial) public returns (IDisputeWindow);	
    function GETORCREATECURRENTDISPUTEWINDOW297(bool _initial) public returns (IDisputeWindow);	
    function GETORCREATENEXTDISPUTEWINDOW121(bool _initial) public returns (IDisputeWindow);	
    function GETORCREATEPREVIOUSDISPUTEWINDOW492(bool _initial) public returns (IDisputeWindow);	
    function GETOPENINTERESTINATTOCASH35() public view returns (uint256);	
    function GETTARGETREPMARKETCAPINATTOCASH84() public view returns (uint256);	
    function GETORCACHEVALIDITYBOND295() public returns (uint256);	
    function GETORCACHEDESIGNATEDREPORTSTAKE657() public returns (uint256);	
    function GETORCACHEDESIGNATEDREPORTNOSHOWBOND471() public returns (uint256);	
    function GETORCACHEMARKETREPBOND935() public returns (uint256);	
    function GETORCACHEREPORTINGFEEDIVISOR675() public returns (uint256);	
    function GETDISPUTETHRESHOLDFORFORK531() public view returns (uint256);	
    function GETDISPUTETHRESHOLDFORDISPUTEPACING379() public view returns (uint256);	
    function GETINITIALREPORTMINVALUE313() public view returns (uint256);	
    function GETPAYOUTNUMERATORS165() public view returns (uint256[] memory);	
    function GETREPORTINGFEEDIVISOR525() public view returns (uint256);	
    function GETPAYOUTNUMERATOR599(uint256 _outcome) public view returns (uint256);	
    function GETWINNINGCHILDPAYOUTNUMERATOR188(uint256 _outcome) public view returns (uint256);	
    function ISOPENINTERESTCASH149(address) public view returns (bool);	
    function ISFORKINGMARKET145() public view returns (bool);	
    function GETCURRENTDISPUTEWINDOW958(bool _initial) public view returns (IDisputeWindow);	
    function GETDISPUTEWINDOWSTARTTIMEANDDURATION827(uint256 _timestamp, bool _initial) public view returns (uint256, uint256);	
    function ISPARENTOF416(IUniverse _shadyChild) public view returns (bool);	
    function UPDATETENTATIVEWINNINGCHILDUNIVERSE681(bytes32 _parentPayoutDistributionHash) public returns (bool);	
    function ISCONTAINERFORDISPUTEWINDOW507(IDisputeWindow _shadyTarget) public view returns (bool);	
    function ISCONTAINERFORMARKET144(IMarket _shadyTarget) public view returns (bool);	
    function ISCONTAINERFORREPORTINGPARTICIPANT428(IReportingParticipant _reportingParticipant) public view returns (bool);	
    function MIGRATEMARKETOUT464(IUniverse _destinationUniverse) public returns (bool);	
    function MIGRATEMARKETIN615(IMarket _market, uint256 _cashBalance, uint256 _marketOI) public returns (bool);	
    function DECREMENTOPENINTEREST785(uint256 _amount) public returns (bool);	
    function DECREMENTOPENINTERESTFROMMARKET194(IMarket _market) public returns (bool);	
    function INCREMENTOPENINTEREST184(uint256 _amount) public returns (bool);	
    function GETWINNINGCHILDUNIVERSE328() public view returns (IUniverse);	
    function ISFORKING892() public view returns (bool);	
    function DEPOSIT490(address _sender, uint256 _amount, address _market) public returns (bool);	
    function WITHDRAW371(address _recipient, uint256 _amount, address _market) public returns (bool);	
    function CREATESCALARMARKET907(uint256 _endTime, uint256 _feePerCashInAttoCash, IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, int256[] memory _prices, uint256 _numTicks, string memory _extraInfo) public returns (IMarket _newMarket);	
}

contract IV2ReputationToken is IReputationToken {
    function PARENTUNIVERSE872() external returns (IUniverse);	
    function BURNFORMARKET156(uint256 _amountToBurn) public returns (bool);	
    function MINTFORWARPSYNC133(uint256 _amountToMint, address _target) public returns (bool);	
}

contract IAugurTrading {
    function LOOKUP941(bytes32 _key) public view returns (address);	
    function LOGPROFITLOSSCHANGED491(IMarket _market, address _account, uint256 _outcome, int256 _netPosition, uint256 _avgPrice, int256 _realizedProfit, int256 _frozenFunds, int256 _realizedCost) public returns (bool);	
    function LOGORDERCREATED278(IUniverse _universe, bytes32 _orderId, bytes32 _tradeGroupId) public returns (bool);	
    function LOGORDERCANCELED166(IUniverse _universe, IMarket _market, address _creator, uint256 _tokenRefund, uint256 _sharesRefund, bytes32 _orderId) public returns (bool);	
    function LOGORDERFILLED867(IUniverse _universe, address _creator, address _filler, uint256 _price, uint256 _fees, uint256 _amountFilled, bytes32 _orderId, bytes32 _tradeGroupId) public returns (bool);	
    function LOGMARKETVOLUMECHANGED431(IUniverse _universe, address _market, uint256 _volume, uint256[] memory _outcomeVolumes, uint256 _totalTrades) public returns (bool);	
    function LOGZEROXORDERFILLED452(IUniverse _universe, IMarket _market, bytes32 _orderHash, bytes32 _tradeGroupId, uint8 _orderType, address[] memory _addressData, uint256[] memory _uint256Data) public returns (bool);	
    function LOGZEROXORDERCANCELED847(address _universe, address _market, address _account, uint256 _outcome, uint256 _price, uint256 _amount, uint8 _type, bytes32 _orderHash) public;	
}

contract IOrders {
    function SAVEORDER546(uint256[] calldata _uints, bytes32[] calldata _bytes32s, Order.Types _type, IMarket _market, address _sender) external returns (bytes32 _orderId);	
    function REMOVEORDER59(bytes32 _orderId) external returns (bool);	
    function GETMARKET653(bytes32 _orderId) public view returns (IMarket);	
    function GETORDERTYPE316(bytes32 _orderId) public view returns (Order.Types);	
    function GETOUTCOME936(bytes32 _orderId) public view returns (uint256);	
    function GETAMOUNT559(bytes32 _orderId) public view returns (uint256);	
    function GETPRICE880(bytes32 _orderId) public view returns (uint256);	
    function GETORDERCREATOR400(bytes32 _orderId) public view returns (address);	
    function GETORDERSHARESESCROWED136(bytes32 _orderId) public view returns (uint256);	
    function GETORDERMONEYESCROWED193(bytes32 _orderId) public view returns (uint256);	
    function GETORDERDATAFORCANCEL870(bytes32 _orderId) public view returns (uint256, uint256, Order.Types, IMarket, uint256, address);	
    function GETORDERDATAFORLOGS491(bytes32 _orderId) public view returns (Order.Types, address[] memory _addressData, uint256[] memory _uint256Data);	
    function GETBETTERORDERID530(bytes32 _orderId) public view returns (bytes32);	
    function GETWORSEORDERID77(bytes32 _orderId) public view returns (bytes32);	
    function GETBESTORDERID327(Order.Types _type, IMarket _market, uint256 _outcome) public view returns (bytes32);	
    function GETWORSTORDERID723(Order.Types _type, IMarket _market, uint256 _outcome) public view returns (bytes32);	
    function GETLASTOUTCOMEPRICE594(IMarket _market, uint256 _outcome) public view returns (uint256);	
    function GETORDERID99(Order.Types _type, IMarket _market, uint256 _amount, uint256 _price, address _sender, uint256 _blockNumber, uint256 _outcome, uint256 _moneyEscrowed, uint256 _sharesEscrowed) public pure returns (bytes32);	
    function GETTOTALESCROWED484(IMarket _market) public view returns (uint256);	
    function ISBETTERPRICE953(Order.Types _type, uint256 _price, bytes32 _orderId) public view returns (bool);	
    function ISWORSEPRICE374(Order.Types _type, uint256 _price, bytes32 _orderId) public view returns (bool);	
    function ASSERTISNOTBETTERPRICE437(Order.Types _type, uint256 _price, bytes32 _betterOrderId) public view returns (bool);	
    function ASSERTISNOTWORSEPRICE95(Order.Types _type, uint256 _price, bytes32 _worseOrderId) public returns (bool);	
    function RECORDFILLORDER941(bytes32 _orderId, uint256 _sharesFilled, uint256 _tokensFilled, uint256 _fill) external returns (bool);	
    function SETPRICE216(IMarket _market, uint256 _outcome, uint256 _price) external returns (bool);	
}

library Order {
    using SafeMathUint256 for uint256;

    enum Types {
        Bid, Ask
    }

    enum TradeDirections {
        Long, Short
    }

    struct Data {
        
        IMarket market;
        IAugur augur;
        IAugurTrading augurTrading;
        IShareToken shareToken;
        ICash cash;

        
        bytes32 id;
        address creator;
        uint256 outcome;
        Order.Types orderType;
        uint256 amount;
        uint256 price;
        uint256 sharesEscrowed;
        uint256 moneyEscrowed;
        bytes32 betterOrderId;
        bytes32 worseOrderId;
    }

    function CREATE149(IAugur _augur, IAugurTrading _augurTrading, address _creator, uint256 _outcome, Order.Types _type, uint256 _attoshares, uint256 _price, IMarket _market, bytes32 _betterOrderId, bytes32 _worseOrderId) internal view returns (Data memory) {	
        require(_outcome < _market.GETNUMBEROFOUTCOMES136(), "Order.create: Outcome is not within market range");
        require(_price != 0, "Order.create: Price may not be 0");
        require(_price < _market.GETNUMTICKS319(), "Order.create: Price is outside of market range");
        require(_attoshares > 0, "Order.create: Cannot use amount of 0");
        require(_creator != address(0), "Order.create: Creator is 0x0");

        IShareToken _shareToken = IShareToken(_augur.LOOKUP941("ShareToken"));

        return Data({
            market: _market,
            augur: _augur,
            augurTrading: _augurTrading,
            shareToken: _shareToken,
            cash: ICash(_augur.LOOKUP941("Cash")),
            id: 0,
            creator: _creator,
            outcome: _outcome,
            orderType: _type,
            amount: _attoshares,
            price: _price,
            sharesEscrowed: 0,
            moneyEscrowed: 0,
            betterOrderId: _betterOrderId,
            worseOrderId: _worseOrderId
        });
    }

    
    
    

    function GETORDERID99(Order.Data memory _orderData, IOrders _orders) internal view returns (bytes32) {	
        if (_orderData.id == bytes32(0)) {
            bytes32 _orderId = CALCULATEORDERID218(_orderData.orderType, _orderData.market, _orderData.amount, _orderData.price, _orderData.creator, block.number, _orderData.outcome, _orderData.moneyEscrowed, _orderData.sharesEscrowed);
            require(_orders.GETAMOUNT559(_orderId) == 0, "Order.getOrderId: New order had amount. This should not be possible");
            _orderData.id = _orderId;
        }
        return _orderData.id;
    }

    function CALCULATEORDERID218(Order.Types _type, IMarket _market, uint256 _amount, uint256 _price, address _sender, uint256 _blockNumber, uint256 _outcome, uint256 _moneyEscrowed, uint256 _sharesEscrowed) internal pure returns (bytes32) {	
        return sha256(abi.encodePacked(_type, _market, _amount, _price, _sender, _blockNumber, _outcome, _moneyEscrowed, _sharesEscrowed));
    }

    function GETORDERTRADINGTYPEFROMMAKERDIRECTION74(Order.TradeDirections _creatorDirection) internal pure returns (Order.Types) {	
        return (_creatorDirection == Order.TradeDirections.Long) ? Order.Types.Bid : Order.Types.Ask;
    }

    function GETORDERTRADINGTYPEFROMFILLERDIRECTION460(Order.TradeDirections _fillerDirection) internal pure returns (Order.Types) {	
        return (_fillerDirection == Order.TradeDirections.Long) ? Order.Types.Ask : Order.Types.Bid;
    }

    function SAVEORDER546(Order.Data memory _orderData, bytes32 _tradeGroupId, IOrders _orders) internal returns (bytes32) {	
        GETORDERID99(_orderData, _orders);
        uint256[] memory _uints = new uint256[](5);
        _uints[0] = _orderData.amount;
        _uints[1] = _orderData.price;
        _uints[2] = _orderData.outcome;
        _uints[3] = _orderData.moneyEscrowed;
        _uints[4] = _orderData.sharesEscrowed;
        bytes32[] memory _bytes32s = new bytes32[](4);
        _bytes32s[0] = _orderData.betterOrderId;
        _bytes32s[1] = _orderData.worseOrderId;
        _bytes32s[2] = _tradeGroupId;
        _bytes32s[3] = _orderData.id;
        return _orders.SAVEORDER546(_uints, _bytes32s, _orderData.orderType, _orderData.market, _orderData.creator);
    }
}

interface IUniswapV2Pair {
    event APPROVAL400(address indexed owner, address indexed spender, uint value);	
    event TRANSFER995(address indexed from, address indexed to, uint value);	

    function NAME959() external pure returns (string memory);	
    function SYMBOL825() external pure returns (string memory);	
    function DECIMALS189() external pure returns (uint8);	
    function TOTALSUPPLY904() external view returns (uint);	
    function BALANCEOF710(address owner) external view returns (uint);	
    function ALLOWANCE985(address owner, address spender) external view returns (uint);	

    function APPROVE443(address spender, uint value) external returns (bool);	
    function TRANSFER771(address to, uint value) external returns (bool);	
    function TRANSFERFROM678(address from, address to, uint value) external returns (bool);	

    function DOMAIN_SEPARATOR845() external view returns (bytes32);	
    function PERMIT_TYPEHASH656() external pure returns (bytes32);	
    function NONCES110(address owner) external view returns (uint);	

    function PERMIT42(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;	

    event MINT282(address indexed sender, uint amount0, uint amount1);	
    event BURN700(address indexed sender, uint amount0, uint amount1, address indexed to);	
    event SWAP345(	
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event SYNC123(uint112 reserve0, uint112 reserve1);	

    function MINIMUM_LIQUIDITY79() external pure returns (uint);	
    function FACTORY818() external view returns (address);	
    function TOKEN0905() external view returns (address);	
    function TOKEN1591() external view returns (address);	
    function GETRESERVES798() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);	
    function PRICE0CUMULATIVELAST41() external view returns (uint);	
    function PRICE1CUMULATIVELAST762() external view returns (uint);	
    function KLAST975() external view returns (uint);	

    function MINT478(address to) external returns (uint liquidity);	
    function BURN339(address to) external returns (uint amount0, uint amount1);	
    function SWAP7(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;	
    function SKIM694(address to) external;	
    function SYNC229() external;	

    function INITIALIZE114(address, address) external;	
}

contract ProfitLoss is Initializable {
    using SafeMathUint256 for uint256;
    using SafeMathInt256 for int256;

    IAugur public augur;
    IAugurTrading public augurTrading;
    IOrders public orders;
    address public shareToken;
    address public createOrder;
    address public cancelOrder;
    address public fillOrder;

    struct OutcomeData {
        int256 netPosition;
        int256 avgPrice; 
        int256 realizedProfit;
        int256 frozenFunds;
        int256 realizedCost; 
    }

    
    mapping (address => mapping(address => mapping(uint256 => OutcomeData))) private profitLossData;

    function INITIALIZE114(IAugur _augur, IAugurTrading _augurTrading) public BEFOREINITIALIZED879 {	
        ENDINITIALIZATION940();
        shareToken = _augur.LOOKUP941("ShareToken");
        require(shareToken != address(0));

        augur = _augur;
        augurTrading = _augurTrading;
        createOrder = _augurTrading.LOOKUP941("CreateOrder");
        cancelOrder = _augurTrading.LOOKUP941("CancelOrder");
        fillOrder = _augurTrading.LOOKUP941("FillOrder");
        orders = IOrders(_augurTrading.LOOKUP941("Orders"));
        require(createOrder != address(0));
        require(fillOrder != address(0));
        require(cancelOrder != address(0));
        require(orders != IOrders(0));
    }

    function RECORDFROZENFUNDCHANGE367(IUniverse _universe, IMarket _market, address _account, uint256 _outcome, int256 _frozenFundDelta) external returns (bool) {	
        require(msg.sender == createOrder || msg.sender == cancelOrder || msg.sender == address(orders) || msg.sender == fillOrder);
        OutcomeData storage _outcomeData = profitLossData[_account][address(_market)][_outcome];
        _outcomeData.frozenFunds += _frozenFundDelta.MUL470(10**18);
        augurTrading.LOGPROFITLOSSCHANGED491(_market, _account, _outcome, _outcomeData.netPosition, uint256(_outcomeData.avgPrice), _outcomeData.realizedProfit, _outcomeData.frozenFunds,  _outcomeData.realizedCost);
        return true;
    }

    function ADJUSTTRADERPROFITFORFEES847(IMarket _market, address _trader, uint256 _outcome, uint256 _fees) external returns (bool) {	
        require(msg.sender == fillOrder);
        profitLossData[_trader][address(_market)][_outcome].realizedProfit -= int256(_fees.MUL470(10**18));
        return true;
    }

    function RECORDTRADE474(IUniverse _universe, IMarket _market, address _longAddress, address _shortAddress, uint256 _outcome, int256 _amount, int256 _price, uint256 _numLongTokens, uint256 _numShortTokens, uint256 _numLongShares, uint256 _numShortShares) external returns (bool) {	
        require(msg.sender == fillOrder);
        int256 _numTicks = int256(_market.GETNUMTICKS319()).MUL470(10**18);
        _price = _price.MUL470(10**18);
        {
            int256  _shortFrozenTokenDelta = int256(_numShortTokens * 10**18).SUB183(int256(_numShortShares).MUL470(_price));
            ADJUSTFORTRADER580(_universe, _market, _numTicks, _shortAddress, _outcome, -_amount, _price, _shortFrozenTokenDelta);
        }
        int256  _longFrozenTokenDelta = int256(_numLongTokens * 10**18).SUB183(int256(_numLongShares).MUL470(_numTicks.SUB183(_price)));
        ADJUSTFORTRADER580(_universe, _market, _numTicks, _longAddress, _outcome, _amount, _price, _longFrozenTokenDelta);
        return true;
    }

    function ADJUSTFORTRADER580(IUniverse _universe, IMarket _market, int256 _adjustedNumTicks, address _address, uint256 _outcome, int256 _amount, int256 _price, int256 _frozenTokenDelta) internal returns (bool) {	
        OutcomeData storage _outcomeData = profitLossData[_address][address(_market)][_outcome];
        OutcomeData memory _tmpOutcomeData = profitLossData[_address][address(_market)][_outcome];

        bool _sold = _tmpOutcomeData.netPosition < 0 &&  _amount > 0 || _tmpOutcomeData.netPosition > 0 &&  _amount < 0;
        if (_tmpOutcomeData.netPosition != 0 && _sold) {
            int256 _amountSold = _tmpOutcomeData.netPosition.ABS724().MIN36(_amount.ABS724());
            int256 _profit = (_tmpOutcomeData.netPosition < 0 ? _tmpOutcomeData.avgPrice.SUB183(_price) : _price.SUB183(_tmpOutcomeData.avgPrice)).MUL470(_amountSold);
            _tmpOutcomeData.realizedProfit += _profit;
            _tmpOutcomeData.realizedCost += (_tmpOutcomeData.netPosition < 0 ? _adjustedNumTicks.SUB183(_tmpOutcomeData.avgPrice) : _tmpOutcomeData.avgPrice).MUL470(_amountSold);
            _tmpOutcomeData.frozenFunds += _profit + _frozenTokenDelta;

            _outcomeData.realizedProfit = _tmpOutcomeData.realizedProfit;
            _outcomeData.realizedCost = _tmpOutcomeData.realizedCost;
            _outcomeData.frozenFunds = _tmpOutcomeData.frozenFunds;
        } else {
            _tmpOutcomeData.frozenFunds += _frozenTokenDelta;
            _outcomeData.frozenFunds = _tmpOutcomeData.frozenFunds;
        }

        int256 _newNetPosition = _tmpOutcomeData.netPosition.ADD848(_amount);
        bool _reversed = _tmpOutcomeData.netPosition < 0 && _newNetPosition > 0 || _tmpOutcomeData.netPosition > 0 && _newNetPosition < 0;
        if (_newNetPosition == 0) {
            _tmpOutcomeData.avgPrice = 0;
            _outcomeData.avgPrice = _tmpOutcomeData.avgPrice;
        } else if (_reversed) {
            _tmpOutcomeData.avgPrice = _price;
            _outcomeData.avgPrice = _tmpOutcomeData.avgPrice;
        } else if (!_sold) {
            _tmpOutcomeData.avgPrice = _tmpOutcomeData.netPosition.ABS724().MUL470(_tmpOutcomeData.avgPrice).ADD848(_amount.ABS724().MUL470(_price)).DIV109(_newNetPosition.ABS724());
            _outcomeData.avgPrice = _tmpOutcomeData.avgPrice;
        }

        _outcomeData.netPosition = _newNetPosition;
        augurTrading.LOGPROFITLOSSCHANGED491(_market, _address, _outcome, _outcomeData.netPosition, uint256(_tmpOutcomeData.avgPrice), _tmpOutcomeData.realizedProfit, _tmpOutcomeData.frozenFunds,  _tmpOutcomeData.realizedCost);
        return true;
    }

    function RECORDCLAIM40(IMarket _market, address _account, uint256[] memory _outcomeFees) public returns (bool) {	
        require(msg.sender == address(augurTrading));
        uint256 _numOutcomes = _market.GETNUMBEROFOUTCOMES136();
        IUniverse _universe = _market.GETUNIVERSE510();
        for (uint256 _outcome = 0; _outcome < _numOutcomes; _outcome++) {
            OutcomeData storage _outcomeData = profitLossData[_account][address(_market)][_outcome];
            if (_outcomeData.netPosition == 0) {
                continue;
            }
            int256 _salePrice = int256(_market.GETWINNINGPAYOUTNUMERATOR151(_outcome).MUL470(10**18));
            int256 _amount = _outcomeData.netPosition.ABS724();
            _outcomeData.realizedProfit += (_outcomeData.netPosition < 0 ? _outcomeData.avgPrice.SUB183(_salePrice) : _salePrice.SUB183(_outcomeData.avgPrice)).MUL470(_amount);
            _outcomeData.realizedProfit -= int256(_outcomeFees[_outcome]);
            _outcomeData.realizedCost += (_outcomeData.netPosition < 0 ? int256(_market.GETNUMTICKS319()).SUB183(_outcomeData.avgPrice) : _outcomeData.avgPrice).MUL470(_amount);
            _outcomeData.avgPrice = 0;
            _outcomeData.frozenFunds = 0;
            _outcomeData.netPosition = 0;
            augurTrading.LOGPROFITLOSSCHANGED491(_market, _account, _outcome, 0, 0, _outcomeData.realizedProfit, 0, _outcomeData.realizedCost);
        }
        return true;
    }

    function GETNETPOSITION947(address _market, address _account, uint256 _outcome) external view returns (int256) {	
        return profitLossData[_account][_market][_outcome].netPosition;
    }

    function GETAVGPRICE192(address _market, address _account, uint256 _outcome) external view returns (int256) {	
        return profitLossData[_account][_market][_outcome].avgPrice;
    }

    function GETREALIZEDPROFIT552(address _market, address _account, uint256 _outcome) external view returns (int256) {	
        return profitLossData[_account][_market][_outcome].realizedProfit;
    }

    function GETFROZENFUNDS181(address _market, address _account, uint256 _outcome) external view returns (int256) {	
        return profitLossData[_account][_market][_outcome].frozenFunds;
    }

    function GETREALIZEDCOST221(address _market, address _account, uint256 _outcome) external view returns (int256) {	
        return profitLossData[_account][_market][_outcome].realizedCost;
    }
}