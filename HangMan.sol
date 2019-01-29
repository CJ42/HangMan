pragma solidity ^0.5.0;
// WARNING ! THIS PROJECT IS UNDER DEVELOPMENT. DO NOT USE THIS CODE FOR PRODUCTION READY ON THE ETHEREUM NETWORK !

import "/library.sol";

/** 
 * @title Hangman game 
 * @dev Base Contract for the game functionalities
 */
contract HangMan {

    address private owner;
    address private player;
    uint private deposit = 0.1;
    uint private guesses ;
    uint private attempt = 11;
    uint internal counter;
    
    /**
     * @dev Guess word must be stored as a bytes array
     * since SOlidity does not supported string arrays
     * @url https://stackoverflow.com/questions/42716858/string-array-in-solidity
     */
    string private guessWord;

    constructor() public {
        owner = msg.sender;
    }

    modifier isOwner {
        require(owner == msg.sender);
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
    function makeDeposit(uint deposit) public payable validValue returns (bool) {
        require (owner.balance >= deposit, "Not enough funds");
        owner.transfer(deposit);
        return true;

    }

    /** @dev Start the game by an initial deposit.
      * @param uint value.
      * @return bool true.
      */
    function SubmitWord (string memory guessWord) public {
        // Ask for user input?
        string memory storedWord = returnHash(guessWord);
    }

    function guessAttempt(string memory str) public payable returns (bool){
        // Require un certain period of time to enter input
        // 11 attempts maximum
        require(counter < attempt, "You have already tried 11 attempts, Sorry !");
        i = 0;
        assert(bytes(str).length = i);
        guessWord = str;
        // Check if the letter is contained in the word 
        return true;
    }

    /**
     * @dev Push a new guess to the game
     * @return uint (Increment the counter)
     */
    function addGuess() public returns (uint) {
        return counter + 1;
    }

    function win(uint deposit) private payable {
        // transfer money if the guesser win
        player.balance += deposit;
    }

    function getResult() public view returns (bool) {
        // Check if the guesses match the guessWord
        return true;
    }
}
