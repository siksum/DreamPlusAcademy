pragma solidity ^0.5.1;

                                   
 
contract SmartLotto {
    
	
    using SafeMath for uint;
    
    uint private constant day_in_seconds922 = 86400;	
	
	
	struct Member {
		address payable addr;						
		uint ticket;								
		uint8[5] numbers;                           
		uint8 matchNumbers;                         
		uint prize;                                 
	}
	
	
	
	struct Game {
		uint datetime;								
		uint8[5] win_numbers;						
		uint membersCounter;						
		uint totalFund;                             
		uint8 status;                               
		mapping(uint => Member) members;		    
	}
	
	mapping(uint => Game) public games;
	
	uint private CONTRACT_STARTED_DATE = 0;
	uint private constant ticket_price599 = 0.01 ether;	
	uint private constant max_number560 = 36;						            
	
	uint private constant percent_fund_jackpot329 = 15;                        
	uint private constant percent_fund_4857 = 35;                              
	uint private constant percent_fund_3711 = 30;                              
    uint private constant percent_fund_2301 = 20;                              
    
	uint public JACKPOT = 0;
	
	
	uint public GAME_NUM = 0;
	uint private constant return_jackpot_period339 = 25 weeks;	
	uint private start_jackpot_amount = 0;
	
	uint private constant percent_fund_pr529 = 12;                             
	uint private FUND_PR = 0;                                               

	
	address private constant address_service121 = 0x203bF6B46508eD917c085F50F194F36b0a62EB02;	
	address payable private constant address_start_jackpot914 = 0x531d3Bd0400Ae601f26B335EfbD787415Aa5CB81;	
	address payable private constant address_pr641 = 0xCD66911b6f38FaAF5BFeE427b3Ceb7D18Dd09F78;	
	
	
	event NEWMEMBER669(uint _gamenum, uint _ticket, address _addr, uint8 _n1, uint8 _n2, uint8 _n3, uint8 _n4, uint8 _n5);	
	event NEWGAME207(uint _gamenum);	
	event UPDATEFUND729(uint _fund);	
	event UPDATEJACKPOT614(uint _jackpot);	
	event WINNUMBERS784(uint _gamenum, uint8 _n1, uint8 _n2, uint8 _n3, uint8 _n4, uint8 _n5);	
	event WINPRIZE689(uint _gamenum, uint _ticket, uint _prize, uint8 _match);	

	
	function() external payable {
	    
        
		if(msg.sender == address_start_jackpot914) {
			PROCESSSTARTINGJACKPOT113();
		} else {
			if(msg.sender == address_service121) {
				STARTGAME261();
			} else {
				PROCESSUSERTICKET354();
			}
		}
		return;
    }
	
	                                                                                                       
	
	                                                                                                       
	function PROCESSSTARTINGJACKPOT113() private {	
		
		if(msg.value > 0) {
			JACKPOT += msg.value;
			start_jackpot_amount += msg.value;
			emit UPDATEJACKPOT614(JACKPOT);
		
		} else {
			if(start_jackpot_amount > 0){
				_RETURNSTARTJACKPOT9();
			}
		}
		return;
	}
	
	
	function _RETURNSTARTJACKPOT9() private { 	
		
		if(JACKPOT > start_jackpot_amount * 2 || (now - CONTRACT_STARTED_DATE) > return_jackpot_period339) {
			
			if(JACKPOT > start_jackpot_amount) {
				address_start_jackpot914.transfer(start_jackpot_amount);
				JACKPOT = JACKPOT - start_jackpot_amount;
				start_jackpot_amount = 0;
			} else {
				address_start_jackpot914.transfer(JACKPOT);
				start_jackpot_amount = 0;
				JACKPOT = 0;
			}
			emit UPDATEJACKPOT614(JACKPOT);
			
		} 
		return;
	}
	
	
	                                                                                                       
	
	                                                                                                       
	function STARTGAME261() private {	
	    
	    uint8 weekday = GETWEEKDAY406(now);
		uint8 hour = GETHOUR667(now);
	    
		if(GAME_NUM == 0) {
		    GAME_NUM = 1;
		    games[GAME_NUM].datetime = now;
		    games[GAME_NUM].status = 1;
		    CONTRACT_STARTED_DATE = now;
		} else {
		    if(weekday == 3 && hour == 14) {

		        if(games[GAME_NUM].status == 1) {
		            PROCESSGAME192();
		        }

		    } else {
		        games[GAME_NUM].status = 1;
		    }
		    
		}
        return;
	}
	
	function PROCESSGAME192() private {	
	    
	    uint8 mn = 0;
		uint winners5 = 0;
		uint winners4 = 0;
		uint winners3 = 0;
		uint winners2 = 0;

		uint fund4 = 0;
		uint fund3 = 0;
		uint fund2 = 0;
	    
	    
	    for(uint8 i = 0; i < 5; i++) {
	        games[GAME_NUM].win_numbers[i] = RANDOM529(i);
	    }

	    
	    games[GAME_NUM].win_numbers = SORTNUMBERS822(games[GAME_NUM].win_numbers);
	    
	    
	    for(uint8 i = 0; i < 4; i++) {
	        for(uint8 j = i+1; j < 5; j++) {
	            if(games[GAME_NUM].win_numbers[i] == games[GAME_NUM].win_numbers[j]) {
	                games[GAME_NUM].win_numbers[j]++;
	            }
	        }
	    }
	    
	    uint8[5] memory win_numbers;
	    win_numbers = games[GAME_NUM].win_numbers;
	    emit WINNUMBERS784(GAME_NUM, win_numbers[0], win_numbers[1], win_numbers[2], win_numbers[3], win_numbers[4]);
	    
	    if(games[GAME_NUM].membersCounter > 0) {
	    
	        
	        for(uint i = 1; i <= games[GAME_NUM].membersCounter; i++) {
	            
	            mn = FINDMATCH109(games[GAME_NUM].win_numbers, games[GAME_NUM].members[i].numbers);
				games[GAME_NUM].members[i].matchNumbers = mn;
				
				if(mn == 5) {
					winners5++;
				}
				if(mn == 4) {
					winners4++;
				}
				if(mn == 3) {
					winners3++;
				}
				if(mn == 2) {
					winners2++;
				}
				
	        }
	        
	        
	        JACKPOT = JACKPOT + games[GAME_NUM].totalFund * percent_fund_jackpot329 / 100;
			fund4 = games[GAME_NUM].totalFund * percent_fund_4857 / 100;
			fund3 = games[GAME_NUM].totalFund * percent_fund_3711 / 100;
			fund2 = games[GAME_NUM].totalFund * percent_fund_2301 / 100;
			
			if(winners4 == 0) {
			    JACKPOT = JACKPOT + fund4;
			}
			if(winners3 == 0) {
			    JACKPOT = JACKPOT + fund3;
			}
			if(winners2 == 0) {
			    JACKPOT = JACKPOT + fund2;
			}
            
			for(uint i = 1; i <= games[GAME_NUM].membersCounter; i++) {
			    
			    if(games[GAME_NUM].members[i].matchNumbers == 5) {
			        games[GAME_NUM].members[i].prize = JACKPOT / winners5;
			        games[GAME_NUM].members[i].addr.transfer(games[GAME_NUM].members[i].prize);
			        emit WINPRIZE689(GAME_NUM, games[GAME_NUM].members[i].ticket, games[GAME_NUM].members[i].prize, 5);
			    }
			    
			    if(games[GAME_NUM].members[i].matchNumbers == 4) {
			        games[GAME_NUM].members[i].prize = fund4 / winners4;
			        games[GAME_NUM].members[i].addr.transfer(games[GAME_NUM].members[i].prize);
			        emit WINPRIZE689(GAME_NUM, games[GAME_NUM].members[i].ticket, games[GAME_NUM].members[i].prize, 4);
			    }
			    
			    if(games[GAME_NUM].members[i].matchNumbers == 3) {
			        games[GAME_NUM].members[i].prize = fund3 / winners3;
			        games[GAME_NUM].members[i].addr.transfer(games[GAME_NUM].members[i].prize);
			        emit WINPRIZE689(GAME_NUM, games[GAME_NUM].members[i].ticket, games[GAME_NUM].members[i].prize, 3);
			    }
			    
			    if(games[GAME_NUM].members[i].matchNumbers == 2) {
			        games[GAME_NUM].members[i].prize = fund2 / winners2;
			        games[GAME_NUM].members[i].addr.transfer(games[GAME_NUM].members[i].prize);
			        emit WINPRIZE689(GAME_NUM, games[GAME_NUM].members[i].ticket, games[GAME_NUM].members[i].prize, 2);
			    }
			    
			    if(games[GAME_NUM].members[i].matchNumbers == 1) {
			        emit WINPRIZE689(GAME_NUM, games[GAME_NUM].members[i].ticket, games[GAME_NUM].members[i].prize, 1);
			    }
			    
			}
			
			
			if(winners5 != 0) {
			    JACKPOT = 0;
			    start_jackpot_amount = 0;
			}
			
	    }
	    
	    emit UPDATEJACKPOT614(JACKPOT);
	    
	    
	    GAME_NUM++;
	    games[GAME_NUM].datetime = now;
	    games[GAME_NUM].status = 0;
	    emit NEWGAME207(GAME_NUM);
	    
	    
	    address_pr641.transfer(FUND_PR);
	    FUND_PR = 0;
	    
	    return;

	}
	
	
	function FINDMATCH109(uint8[5] memory arr1, uint8[5] memory arr2) private pure returns (uint8) {	
	    
	    uint8 cnt = 0;
	    
	    for(uint8 i = 0; i < 5; i++) {
	        for(uint8 j = 0; j < 5; j++) {
	            if(arr1[i] == arr2[j]) {
	                cnt++;
	                break;
	            }
	        }
	    }
	    
	    return cnt;

	}
	
	                                                                                                       
	
	                                                                                                       
	function PROCESSUSERTICKET354() private {	
		
		uint8 weekday = GETWEEKDAY406(now);
		uint8 hour = GETHOUR667(now);
		
		if( GAME_NUM > 0 && games[GAME_NUM].status == 1 ) {

		    if(msg.value == ticket_price599) {
			    CREATETICKET343();
		    } else {
			    if(msg.value < ticket_price599) {
				    FUND_PR = FUND_PR + msg.value.MUL975(percent_fund_pr529).DIV693(100);
				    games[GAME_NUM].totalFund = games[GAME_NUM].totalFund + msg.value.MUL975(100 - percent_fund_pr529).DIV693(100);
				    emit UPDATEFUND729(games[GAME_NUM].totalFund);
			    } else {
				    msg.sender.transfer(msg.value.SUB540(ticket_price599));
				    CREATETICKET343();
			    }
		    }
		
		} else {
		     msg.sender.transfer(msg.value);
		}
		
	}
	
	function CREATETICKET343() private {	
		
		bool err = false;
		uint8[5] memory numbers;
		
		
		FUND_PR = FUND_PR + ticket_price599.MUL975(percent_fund_pr529).DIV693(100);
		games[GAME_NUM].totalFund = games[GAME_NUM].totalFund + ticket_price599.MUL975(100 - percent_fund_pr529).DIV693(100);
		emit UPDATEFUND729(games[GAME_NUM].totalFund);
		
		
		(err, numbers) = PARSECHECKDATA700();
		
		uint mbrCnt;

		
		if(!err) {
		    numbers = SORTNUMBERS822(numbers);

		    
		    games[GAME_NUM].membersCounter++;
		    mbrCnt = games[GAME_NUM].membersCounter;

		    
		    games[GAME_NUM].members[mbrCnt].addr = msg.sender;
		    games[GAME_NUM].members[mbrCnt].ticket = mbrCnt;
		    games[GAME_NUM].members[mbrCnt].numbers = numbers;
		    games[GAME_NUM].members[mbrCnt].matchNumbers = 0;
		    
		    emit NEWMEMBER669(GAME_NUM, mbrCnt, msg.sender, numbers[0], numbers[1], numbers[2], numbers[3], numbers[4]);
		    
		}

	}
	
	
	
	function PARSECHECKDATA700() private view returns (bool, uint8[5] memory) {	
	    
	    bool err = false;
	    uint8[5] memory numbers;
	    
	    
	    if(msg.data.length == 5) {
	        
	        
		    for(uint8 i = 0; i < msg.data.length; i++) {
		        numbers[i] = uint8(msg.data[i]);
		    }
		    
		    
		    for(uint8 i = 0; i < numbers.length; i++) {
		        if(numbers[i] < 1 || numbers[i] > max_number560) {
		            err = true;
		            break;
		        }
		    }
		    
		    
		    if(!err) {
		    
		        for(uint8 i = 0; i < numbers.length-1; i++) {
		            for(uint8 j = i+1; j < numbers.length; j++) {
		                if(numbers[i] == numbers[j]) {
		                    err = true;
		                    break;
		                }
		            }
		            if(err) {
		                break;
		            }
		        }
		        
		    }
		    
	    } else {
	        err = true;
	    }

	    return (err, numbers);

	}
	
	
	function SORTNUMBERS822(uint8[5] memory arrNumbers) private pure returns (uint8[5] memory) {	
	    
	    uint8 temp;
	    
	    for(uint8 i = 0; i < arrNumbers.length - 1; i++) {
            for(uint j = 0; j < arrNumbers.length - i - 1; j++)
                if (arrNumbers[j] > arrNumbers[j + 1]) {
                    temp = arrNumbers[j];
                    arrNumbers[j] = arrNumbers[j + 1];
                    arrNumbers[j + 1] = temp;
                }    
	    }
        
        return arrNumbers;
        
	}
	
	
    function GETBALANCE117() public view returns(uint) {	
        uint balance = address(this).balance;
		return balance;
	}
	
	
	function RANDOM529(uint8 num) internal view returns (uint8) {	
	    
        return uint8(uint(blockhash(block.number - 1 - num*2)) % max_number560 + 1);
        
    } 
    
    function GETHOUR667(uint timestamp) private pure returns (uint8) {	
        return uint8((timestamp / 60 / 60) % 24);
    }
    
    function GETWEEKDAY406(uint timestamp) private pure returns (uint8) {	
        return uint8((timestamp / day_in_seconds922 + 4) % 7);
    }
	
	
	
	
	
	function GETGAMEINFO238(uint i) public view returns (uint, uint, uint, uint8, uint8, uint8, uint8, uint8, uint8) {	
	    Game memory game = games[i];
	    return (game.datetime, game.totalFund, game.membersCounter, game.win_numbers[0], game.win_numbers[1], game.win_numbers[2], game.win_numbers[3], game.win_numbers[4], game.status);
	}
	
	
	function GETMEMBERINFO473(uint i, uint j) public view returns (address, uint, uint8, uint8, uint8, uint8, uint8, uint8, uint) {	
	    Member memory mbr = games[i].members[j];
	    return (mbr.addr, mbr.ticket, mbr.matchNumbers, mbr.numbers[0], mbr.numbers[1], mbr.numbers[2], mbr.numbers[3], mbr.numbers[4], mbr.prize);
	}

}

                                                                                         
library SafeMath {

    function MUL975(uint256 a, uint256 b) internal pure returns(uint256) {	
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function DIV693(uint256 a, uint256 b) internal pure returns(uint256) {	
        
        uint256 c = a / b;
        
        return c;
    }

    function SUB540(uint256 a, uint256 b) internal pure returns(uint256) {	
        assert(b <= a);
        return a - b;
    }

    function ADD359(uint256 a, uint256 b) internal pure returns(uint256) {	
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }

}