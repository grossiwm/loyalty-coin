// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./NFT.sol";
import "./Token.sol";

contract NFTFactory {
    Token public token;
    MyNFT public nft;

    constructor(address tokenAddress, address nftAddress) {
        token = Token(tokenAddress);
        nft = MyNFT(nftAddress);
    }

    function mintNFT(uint256 amount, uint256 tokenId) public {
        require(token.balanceOf(msg.sender) >= amount, "Not enough tokens to burn");
        token.burnFrom(msg.sender, amount); // Assume 'burnFrom' is a function in the ERC20 token that allows this contract to burn tokens
        nft.mint(msg.sender, tokenId);
    }
}
