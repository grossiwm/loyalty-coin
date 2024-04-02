// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TokenFactory} from "../src/TokenFactory.sol";
import {Token} from "../src/Token.sol";
import {NFT} from "../src/NFT.sol";


contract TokenFactoryTest is Test {
    TokenFactory public factory;

    function setUp() public {
        factory = new TokenFactory();
    }

    function test_CreateToken() public {
        vm.deal(address(this), 1 ether);
        vm.startPrank(address(this));

        string memory name = "TestToken";
        string memory symbol = "TTK";
        uint256 initialSupply = 1000;

        uint256 valueToSend = 0.01 ether;

        (bool success, bytes memory data) = address(factory).call{value: valueToSend}(
            abi.encodeWithSignature("createToken(string,string,uint256)", name, symbol, initialSupply)
        );

        require(success, "Call to createToken failed");

        address returnedAddress = abi.decode(data, (address));

        assertTrue(returnedAddress != address(0), "Token address should not be 0");

        Token newToken = Token(returnedAddress);

        assertEq(newToken.name(), name);
        assertEq(newToken.symbol(), symbol);
        assertEq(newToken.totalSupply(), initialSupply);

        address nftAddress = newToken.nftAddress();

        NFT nft = NFT(nftAddress);

        assertEq(nft.name(), string.concat(name, "NFT"));
        assertEq(nft.symbol(), string.concat(symbol, "NFT"));

        vm.stopPrank();

    }

}
