// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Library {

    

    struct Title {
        string title;
        uint256 total;
        uint256 numloanedout;

        mapping(address => bool) loaners;
        
    }

    // uint256 public numtitles = 0;
    mapping(string  => Title) public titles;

    function addbook( uint256 total , string memory title  ) public payable returns (string memory)  {
        // How to require isbn length == 13 ??
        require(total > 0);
        require(msg.value > 0.01 ether , "at least 0.01 ETH is needed to add a Book to this Library ");
        string memory title_key  = title;
        // address loaner = msg.sender;
        Title storage newtitle = titles[title_key];
        newtitle.title = title;
        newtitle.total = total;
        newtitle.numloanedout=uint256(0);

        // titles[TitleID] = newtitle; //commit to state variable
        return title_key;   //return new diceId
    }
    
    
    
    function gettitlestatus ( string memory title )  public view returns ( string memory   )  {

         if (titles[title].numloanedout < titles[title].total ){
             return 'Title available';
         }
         else{
            return 'Title unavailable'; 
         }
         
    }
    
    function getremainingnumofbooks ( string memory title )  public view returns ( uint256   )  {
         
         uint256 remaining = titles[title].total - titles[title].numloanedout ;
         return remaining;
    }
    

    function borrow ( string memory title )  public   {
        require(titles[title].numloanedout < titles[title].total);
        
        titles[title].loaners[msg.sender]  = true;
        //  assert(msg.sender != address(this));
        titles[title].numloanedout++ ;
 
    }


