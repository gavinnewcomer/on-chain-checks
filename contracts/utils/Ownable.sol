// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Ownable {
    address public owner;

    constructor() {}

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert("Only the owner can call this function.");
        }
        _;
    }

    function _transferOwnership(address newOwner) internal {
        owner = newOwner;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}
