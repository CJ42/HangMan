// WARNING ! THIS PROJECT IS UNDER DEVELOPMENT. DO NOT USE THIS CODE FOR PRODUCTION READY ON THE ETHEREUM NETWORK !
pragma solidity ^0.5.0;

library Hashing {

    function returnHash(string str) internal returns (bytes32) {
        hash = keccak256(str);
        returns hash;
    }
}