// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Cryptera Network
 * @dev A decentralized token management system for basic transfers and balances.
 */
contract Project {
    string public name = "Cryptera Token";
    string public symbol = "CRYP";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed owner, address indexed spender, uint256 amount);

    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * 10**uint256(decimals);
        balances[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    /// @notice Get the balance of any user
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    /// @notice Transfer tokens to another address
    function transfer(address to, uint256 amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(to != address(0), "Invalid address");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
        return true;
    }

    /// @notice Approve another address to spend tokens on your behalf
    function approve(address spender, uint256 amount) public returns (bool) {
        require(spender != address(0), "Invalid spender address");
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
}
