// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Burnable.sol";


import "./HasPrizes.sol";
import "./NFT.sol";


contract Token is ERC20, Ownable, ERC20Burnable, HasPrizes {

    constructor(string memory name, string memory symbol, uint256 initialSupply, address initialOwner, address _nftAddress)
    ERC20(name, symbol)
    Ownable(initialOwner)
    {
        _mint(msg.sender, initialSupply);
        nftAddress = _nftAddress;
    }

    address public nftAddress;

    function mintNFTPrize(uint256 prizeId) private {
        Prize memory _prize = getPrize(prizeId);
        require(balanceOf(msg.sender) >= _prize.price, "Not enough tokens to burn");
        burnFrom(msg.sender, _prize.price);
        NFT _nft = NFT(nftAddress);
        _nft.mint(msg.sender);
    }
}
