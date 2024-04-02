// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract NFT is ERC721Enumerable, Ownable {

    uint256 private currentId = 0;

    constructor(address initialOwner, string memory name, string memory symbol) ERC721(name, symbol) Ownable(initialOwner) {}

    function mint(address to) public onlyOwner {
        _mint(to, currentId++);
    }
}