pragma solidity ^0.5.0;
// WARNING ! THIS PROJECT IS UNDER DEVELOPMENT. DO NOT USE THIS CODE ON THE ETHEREUM NETWORK !

library Hashing {

    function returnHash(string str) internal returns (bytes32) {
        hash = keccak256(abi.encode(str));
        returns hash;
    }
}
