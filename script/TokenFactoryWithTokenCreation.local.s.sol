// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {TokenFactory} from "../src/TokenFactory.sol";

contract TokenFactoryWithTokenCreationScript is Script {

    TokenFactory factory;

    function setUp() public {}

    function run() public {

        vm.startBroadcast();
        factory = new TokenFactory();
        console2.log("TokenFactory address: ", address(factory));

        string memory name = "LocalToken";
        string memory symbol = "LTK";
        uint256 initialSupply = 1000000000;

        uint256 valueToSend = 0.1 ether;

        (, bytes memory data) = address(factory).call{value: valueToSend}(
            abi.encodeWithSignature("createToken(string,string,uint256)", name, symbol, initialSupply)
        );

        console2.log("Token address: ", abi.decode(data, (address)));

        vm.stopBroadcast();
    }
}
