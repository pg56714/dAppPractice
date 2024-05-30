// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract MemeToken is ERC20, Ownable {
    constructor() ERC20("MemeToken", "MEME") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(balanceOf(msg.sender) >= amount, "ERC20: transfer amount exceeds balance");

        console.log(
            "Transferring from %s to %s %s tokens",
            msg.sender,
            to,
            amount
        );

        _transfer(msg.sender, to, amount);

        return true;
    }
}
