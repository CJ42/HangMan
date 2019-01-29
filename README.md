# HangMan
A simple implementation of a Guessing Game (HangMan) into a SmartContract written Solidity. (This is a learning project).

# Rules (so far)

* 2 players: 
  - one think and commit a hidden word (**Alice**)
  - one guess the word (**Bob**)
* **Alice** must deposit ether. If **Bob** guesses the word, he wins the deposit.
* A maximum of 11 attempts is set as a limit for the game


# Technical implementation

The guess word will be hidden through ```Keccak256(guessWord)``` hashing function. In fact, Keccak256 (SHA-3) is cheaper in gas consumption compared to other built-in cryptographic functions:


| Hash Function            | Returns     | Gas Cost                                     |
| -------------------------|:-----------:| --------------------------------------------:|
| sha3(...) or keccak(256) |  bytes32    | 30 gas + 6 gas for each word (rounded up)    |
| sha256(...)              |  bytes32    | 60 gas + 12 gas for each word (rounded up)   |
| ripemd160(...)           |  bytes20    | 600 gas + 120 gas for each word (rounded up) |




# Good Resources + Research

* (HangMan - Wikipedia)[https://en.wikipedia.org/wiki/Hangman_(game)]
* (HangMan Strategy: a solution to beat the game)[http://datagenetics.com/blog/april12012/index.html]


# Technical Resources

* (EVM Opcodes)[https://ethervm.io/]
* (EVM Opcodes + Gas Consumption based on PUSH / POP Stack operations)[https://github.com/djrtwo/evm-opcode-gas-costs/blob/master/opcode-gas-costs_EIP-150_revision-1e18248_2017-04-12.csv]
* (Ethereum YellowPaper)[http://gavwood.com/paper.pdf]
