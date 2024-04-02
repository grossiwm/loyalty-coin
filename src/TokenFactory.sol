
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "./Token.sol";
import "./NFT.sol";

contract TokenFactory {
    event TokenCreated(address tokenAddress);

    function createToken(string memory name, string memory symbol, uint256 initialSupply) public payable returns (address) {
        
        require(msg.value >= 0.01 ether, "Insufficient ETH sent");

        NFT nft = new NFT(msg.sender, string.concat(name,"NFT"), string.concat(symbol,"NFT"));

        Token newToken = new Token(name, symbol, initialSupply, msg.sender, address(nft));

        emit TokenCreated(address(newToken));

        return address(newToken);
    }
}
