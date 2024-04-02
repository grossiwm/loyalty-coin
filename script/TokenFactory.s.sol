// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {TokenFactory} from "../src/TokenFactory.sol";

contract TokenFactoryScript is Script {

    TokenFactory factory;

    function setUp() public {}

    function run() public {

        vm.startBroadcast();
        factory = new TokenFactory();
        console2.log("TokenFactory address: ", address(factory));
        vm.stopBroadcast();
    }
}
