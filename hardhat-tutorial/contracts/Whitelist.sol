//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted address allowed
    uint8 public maxWhitelistedAddress;

    // Create a mapping of a whitelisted address to a bool
    // If an address is whitelisted, we will set it to true.
    // If not, we will set it to false. The default is false.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressWhitelisted would be used to keep track of how many addresses have been whitelisted.
    uint8 public numAddressesWhitelisted;

    // Setting the max number of whitelisted addresses
    // User will put the value at the time of deployment.
    constructor(uint8 _maxWhitelistedAddress) {
        maxWhitelistedAddress = _maxWhitelistedAddress;
    }

    // addAddressToWhitelist will add an address of the sender to the whitelist
    function addAddressToWhitelist() public {
        // Check if the user has already been whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        // Check if the numAddressWhitelisted < maxWhitelistedAddress, otherwise, throw an error
        require(
            numAddressesWhitelisted < maxWhitelistedAddress,
            "You have reached the maximum number of whitelisted addresses"
        );
        // Add the address which called the function to the whitelisted array
        whitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted++;
    }
}
