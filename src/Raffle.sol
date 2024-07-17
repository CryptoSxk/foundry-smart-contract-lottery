// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @author  CryptoSxk
 * @title   A sample Raffle Contract
 * @dev     ImplementsChainlink VRFv2
 * @notice  This contract is for creating a sample raffle
 */

contract Raffle {
    error Raffle__NotEnoughtEthSent();
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() external payable {
        if (msg.value <= i_entranceFee) {
            revert Raffle__NotEnoughtEthSent();
        }
    }

    function pickWinner() public {}

    /* Getter Functtion */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
