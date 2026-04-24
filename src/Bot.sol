// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IERC4626} from "@openzeppelin/contracts/interfaces/IERC4626.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Bot is Ownable {
    using SafeERC20 for IERC20;

    uint256 public number;

    constructor() Ownable(msg.sender) {}

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function depositToVault(address vault, address asset, uint256 amount) public {
        IERC20(asset).forceApprove(vault, amount);
        IERC4626(vault).deposit(amount, address(this));
    }
}
