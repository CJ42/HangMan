// WARNING ! THIS IS UNDERDEVELOPMENT. DO NOT USE THIS CODE 

pragma solidity ^0.4.0;

library Hashing {

    function returnHash(string str) internal returns (bytes32) {
        hash = keccak256(str);
        returns hash;
    }
}
