// WARNING ! THIS PROJECT IS UNDER DEVELOPMENT. DO NOT USE THIS CODE FOR PRODUCTION READY ON THE ETHEREUM NETWORK !
pragma solidity ^0.5.0;

import "/library.sol";

/** 
 * @title Hangman game 
 * @dev Base Contract for the game functionalities
 */
contract HangMan {

    address private payable owner;
    address private payable player;
    uint private deposit;
    uint private guesses ;
    uint private attempt = 11;
    
    /**
     * @dev Guess word must be stored as a bytes array
     * since SOlidity does not supported string arrays
     * @url https://stackoverflow.com/questions/42716858/string-array-in-solidity
     */
    string private guessWord;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner {
        require( owner == msg.sender );
        _;
    }

    modifier validValue {
        assert(msg.value <= owner.balance);
        _;
    }

    event SenderLogger(address);
    event ValueLogger(uint);

    // Fallback
    function () external payable isOwner validValue {
        SenderLogger(msg.sender);
        ValueLogger(msg.value);

        // Uncomment below to prevent invalid calls
        /* require(msg.data.length == 0); */
    }

    /** @dev Start the game by an initial deposit.
      * @param uint value.
      * @return bool true.
      */
    function deposit(uint deposit) public payable validValue returns (bool) {
        deposit = 0.1;
        require (owner.balance >= deposit);
        owner.transfer(deposit);
        return true;

    }

    /** @dev Start the game by an initial deposit.
      * @param uint value.
      * @return bool true.
      */
    function SubmitWord (string memory guessWord) public pure returns (bytes32) {
        // Ask for user input?
        return returnHash(guessWord);
    }

    function guessWord(uint counter, string str) public payable returns (bool){
        // Require un certain period of time to enter input
        // 11 attempts maximum
        require (counter < attempt);
        i = 0;
        assert( bytes(str).length = i );
        guessWord = str;
        // Check if the letter is contained in the word 
        returns true;
    }

    function win() payable {
        // transfer money if the guesser win
        
    }
}
