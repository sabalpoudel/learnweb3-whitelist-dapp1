//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    // max no of whitelisted address allowed
    uint8 public maxWAddresses;

    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping(address => bool) public wAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment

    constructor(uint8 _maxWAddresses) {
        maxWAddresses = _maxWAddresses;
    }

    /** addAddressToWhitelist - adds the address of the sender to the whitelist */
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(!wAddresses[msg.sender], "Sender already whitelisted");
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numAddressesWhitelisted < maxWAddresses, "Limit reached");
        // Add the address which called the function to the whitelistedAddress array
        wAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted++;
    }
}
