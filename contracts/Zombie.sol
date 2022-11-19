//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Zombie {

    // declare our event here
    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct ZombieMarkup {
        string name;
        uint dna;
    }

    ZombieMarkup[] public zombies;

    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(ZombieMarkup(_name, _dna));
        // and fire it here
        uint id = zombies.length - 1; 
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
