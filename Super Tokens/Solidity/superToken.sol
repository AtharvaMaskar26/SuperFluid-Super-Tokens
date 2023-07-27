// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.18;

// Importing Libraries 

// Imports Supertokens from SuperFluid
import { ISuperToken, IERC20 } from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperToken.sol";
// Imports Interface 
import { IFakeDAI } from "./IFakeDAI.sol";

contract SuperToken {
    // Initialize the SuperToken
    // address internal  superTokenAddress = 0x5D8B4C2554aeB7e86F387B4d6c00Ac33499Ed01f; // SuperToken address
    ISuperToken public fDAIx = ISuperToken(0x5D8B4C2554aeB7e86F387B4d6c00Ac33499Ed01f); // Add the super token address


    // Gain FDAIx
    function gainfDAIx() external {
        // 1. Get fDAI Address from corresponding fDAIx
        // fDAI is just the address of fDAI
        IFakeDAI fDAI = IFakeDAI(fDAIx.getUnderlyingToken());

        // 2. Mint 10,000 fDAI - defined in the interface
        // address(this) defines the address of the smart contract
        fDAI.mint(address(this), 10000e18);

        // 3. Wrapping Part 1 - Apporve fdaix contract address to spend fDAIx
        // Approve contract to spend 20,000 fDAI
        // You can make mistake here - Wrote address(this) instead of address(fDAIx)
        fDAI.approve(address(fDAIx), 20000e18);

        // 4. Wrap fDAI to fDAIx
        fDAIx.upgrade(10000e18);
    }

    // Downgrade fDAIx (Unwrap) 
    function losefDAIx(uint256 amount) external {
        // unwrap the fDAIx to fDAI 
        fDAIx.downgrade(amount);
    }

    // Get balance of fDAI 
    function getBalancefDAI () external view returns (uint256) {
        IFakeDAI fDAI = IFakeDAI(fDAIx.getUnderlyingToken());
        return fDAI.balanceOf(address(this));
    }

    // Get balance of fDAIx
    function getBalancefDAIx () external view returns (uint256) {
        return fDAIx.balanceOf(address(this));
    }
}