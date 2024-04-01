// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract MyNFT is ERC721Enumerable, Ownable {
    constructor(address initialOwner, string memory name, string memory symbol) ERC721(name, symbol) Ownable(initialOwner) {}

    function mint(address to, uint256 tokenId) public onlyOwner {
        _mint(to, tokenId);
    }
}