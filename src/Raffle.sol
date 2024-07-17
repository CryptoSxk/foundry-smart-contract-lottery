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
    address payable[] private s_players;
    /* @dev Duration of the lottery in seconds */
    uint256 private immutable i_interval;

    /* Events */
    event EnteredRaffle(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
    }

    function enterRaffle() external payable {
        if (msg.value <= i_entranceFee) {
            revert Raffle__NotEnoughtEthSent();
        }
        s_players.push(payable(msg.sender));
        emit EnteredRaffle((msg.sender));
    }
    // 1. Get a random number
    // 2. use random numer to pick a player
    // 3. Be automatically called
    function pickWinner() external {}

    /* Getter Functtion */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
