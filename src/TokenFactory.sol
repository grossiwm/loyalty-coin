
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "./Token.sol";

contract TokenFactory {
    event TokenCreated(address tokenAddress);

    function createToken(string memory name, string memory symbol, uint256 initialSupply) public payable {
        
        require(msg.value >= 0.01 ether, "Insufficient ETH sent");

        Token newToken = new Token(name, symbol, initialSupply, msg.sender);

        emit TokenCreated(address(newToken));
    }
}
