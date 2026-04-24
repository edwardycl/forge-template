// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {Bot} from "../src/Bot.sol";
import {Script, console} from "forge-std/Script.sol";

contract BotScript is Script {
    Bot public bot;

    function setUp() public {}

    function run() public {
        vm.createSelectFork(vm.envString("RPC_URL"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        bot = new Bot();
        console.log("Bot deployed at:", address(bot));
        console.log("Bot owner:", bot.owner());

        vm.stopBroadcast();
    }
}

