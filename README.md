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


| Hash Function               | Returns   | Gas Cost                                     |
| -------------------------   |-----------| ---------------------------------------------|
| sha3(...) or keccak256(...) |  bytes32  | 30 gas + 6 gas for each word (rounded up)    |
| sha256(...)                 |  bytes32  | 60 gas + 12 gas for each word (rounded up)   |
| ripemd160(...)              |  bytes20  | 600 gas + 120 gas for each word (rounded up) |
source: [*ethereum.stackexchange.com*](https://ethereum.stackexchange.com/questions/3184/what-is-the-cheapest-hash-function-available-in-solidity)

The letters are represented as bytes by their utf-8 encoded character.

## Possible implementation

Maybe the letters can be represented as a mapping. The mapping represent an ASCI table, where :
* key = hex decimal value of the letter (_eg: C = 0x43_). We only take capital letters.
* values = boolean (if the letter appear in the word, has already been checked, etc... need to check that part)

The letters can be hashed individually. Then hashing all the hashes by concatening them for verification.

The nonce can be setup at the beginning of the game. The user submits the nonce to the front-end, which is hashed in the frontend and then stored in the contract storage.

To verify if a word is correct, we could do the following:

```solidity
if (keccak256(abi.encode(nonce, word[3]))) == keccak256(abi.encode(nonce, submittedLetter))) {
    // do something
}
```

## How to prevent from cheating?

We need a way to prevent Alice, who submitted the word to cheat. If Bob makes a correct guess for a letter, we need to prevent Alice to lie, saying that the letter is not in the word, where it is.

- Alice says yes (true) : it's true
- Alice says no (false) : it's true (lying)
- Alice says no (false) : it's false
- Alice says yes (true) : it's false (lying)

**So how does Bob know that Alice is telling the truth?**

- Would Alice have to reveal the nonce at each attemps (she would be incentivized to not lie agains the privacy of her secret)
- How can Bob proove that Alice is telling the truth?
- If Bob could work out if true or not, could he play the game himself?
- How can Zero Knowledge Proof, ZK/SNARKS can be helpful?
- use of a key pair on both sides, sign to verify

## Date and Time

The dates and time (to check how long does the user wait before to play a letter) is calculated using an external contract. Time is represented in UNIX format.
https://ethereum.stackexchange.com/questions/3034/how-to-get-current-time-by-solidity

## Functions to create

* `addGues()` : add a new guess, check the counter and increase it
* `winner()` : transfer funds (between mappings) to player 1 or player 2
* `withdraw()` : withdraw the user balance and transfer to an ethereum address
* `getResult()` : not sure
* `submitWord(word, nonce)`

Modifiers to create:

* only player 2 can make a guess
* check if time did not expired (1min) after last function call from player 2


# Good Resources + Research

* [HangMan - Wikipedia](https://en.wikipedia.org/wiki/Hangman_(game))
* [HangMan Strategy: a solution to beat the game](http://datagenetics.com/blog/april12012/index.html)


# Technical Resources

* [EVM Opcodes](https://ethervm.io/)
* [EVM Opcodes + Gas Consumption based on PUSH / POP Stack operations](https://github.com/djrtwo/evm-opcode-gas-costs/blob/master/opcode-gas-costs_EIP-150_revision-1e18248_2017-04-12.csv)
* [Ethereum YellowPaper](http://gavwood.com/paper.pdf)
