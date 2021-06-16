// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Library {

    

    struct Title {
        string title;
        uint256 total;
        uint256 numloanedout;
        mapping(address => uint256) loaners;
    }
    
    
    

    // uint256 public numtitles = 0;
    mapping(string  => Title) public titles;
    string[]  public catalogue ;

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
        catalogue.push(title);
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
        require(titles[title].numloanedout < titles[title].total , 'This title is currently unavailable' );
        
        titles[title].loaners[msg.sender]++;
        titles[title].numloanedout++ ;
 
    }



    function returnBook(string memory title) public {
        require(titles[title].loaners[msg.sender] > 0 , 'You have not borrowed this title');
        titles[title].loaners[msg.sender]--;
        titles[title].numloanedout--;
    }


    function returnCatalogue() public view returns (string[] memory) {
        
        return catalogue;
    }



}
