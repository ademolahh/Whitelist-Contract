// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
/*Kindly note, the use of Merkle Tree is recommended as
 *it reduces the consumption of gas
 */

contract Whitelist is Ownable{
    // It keeps track of the address whitelist status
    mapping(address => bool) isWhitelisted;

    //This modifier can be use in the contract to confirm if the address is whitelisted
    modifier whitelisted(address _addr){
        require(isWhitelisted[_addr], 'You are not whitelisted');
        _;
    }

    //This is address will be added to the whitelist
    function addAddress(address _addr) external onlyOwner{
        isWhitelisted[_addr] = true;
    }

    //To add an array of address to be whitelisted
    function addAddressArray(address [] memory _addresses) external onlyOwner{
        for(uint i =0; i<_addresses.length; i++){
            isWhitelisted[_addresses[i]] = true;
        }
    }

    //This function will be used to remove an address from the whitelist
    function removeAddress(address _addy) external onlyOwner{
        isWhitelisted[_addy] = false;
    }

    // Verify if the address is whitelisted
    function verifyUser(address _addy) public view returns(string memory){
        if(isWhitelisted[_addy]){
            return 'You are whitelisted';
        }else{
            return 'You are not whitelisted';
        }
        
    }

}
