// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract AdminManager {
    address public admin;
    address[] public registeredAddresses = [0x416BED5C07D4C3512019f425a51dd2C8a19faBfd,0x9135AFACE007e45b8875B50E6bE9ec0EE501C073];

    constructor() {
        admin = msg.sender; // Set the deployer of the contract as the admin
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this operation");
        _;
    }
  modifier onlyApproveSatalite() {
        require(  addressExists(msg.sender), "Only Approved Satalites");
        _;
    }
    // Function to add an address to the registry (only admin)
    function addAddress(address _newAddress) public onlyAdmin {
        require(!addressExists(_newAddress), "Address already exists");
        registeredAddresses.push(_newAddress);
    }

    // Function to check if an address already exists in the registry
    function addressExists(address _address) public view returns (bool) {
        for (uint i = 0; i < registeredAddresses.length; i++) {
            if (registeredAddresses[i] == _address) {
                return true;
            }
        }
        return false;
    }

    // Function to remove an address from the registry (only admin)
    function removeAddress(address _address) public onlyAdmin {
        require(addressExists(_address), "Address does not exist");
        
        for (uint i = 0; i < registeredAddresses.length; i++) {
            if (registeredAddresses[i] == _address) {
                delete registeredAddresses[i];
                // Move the last element into the position of the deleted element
                registeredAddresses[i] = registeredAddresses[registeredAddresses.length - 1];
                // Remove the last element
                registeredAddresses.pop();
                break;
            }
        }
    }

    // Function to show all admin addresses
    function showAllAdmins() public view returns (address[] memory) {
        return registeredAddresses;
    }
}
