// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {Bot} from "../src/Bot.sol";
import {Test, console} from "forge-std/Test.sol";

contract BotTest is Test {
    Bot public bot;

    function setUp() public {
        vm.createSelectFork(vm.envString("RPC_URL"), 123_456);
        bot = new Bot();
        bot.setNumber(0);
    }

    function test_Increment() public {
        bot.increment();
        console.log(bot.number());
        assertEq(bot.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        bot.setNumber(x);
        assertEq(bot.number(), x);
    }
}
