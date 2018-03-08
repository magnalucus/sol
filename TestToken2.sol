pragma solidity ^0.4.18;

contract TestToken2 {
    /* Public variables of the token */
    string public name;
    string public symbol;
    uint8 public decimals;

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;

    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function TestToken2() public {
        /* Unless you add other functions these variables will never change */
        balanceOf[msg.sender] = 123456789;
        name = "TestToken";
        symbol = "TST";

        /* If you want a divisible token then add the amount of decimals the base unit has  */
        decimals = 8;
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) public {
        /* If the sender doesn't have enough balance then stop */
        if (balanceOf[msg.sender] < _value) revert();
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();

        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        /* Notify anyone listening that this transfer took place */
        Transfer(msg.sender, _to, _value);
    }
}