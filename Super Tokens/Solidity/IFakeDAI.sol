// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// 1. Importing IERC20 functionalities
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// 2. Creating an interface for Fake Super Token and inheriting IERC20 funcionalities
interface IFakeDAI is IERC20 {
    // 3. Creating a mint function -> This mint function is a part of IERC20
    function mint(address account, uint256 amount) external;
}