pragma solidity ^0.4.22;

contract rent {
    address public landlord;
    uint public rental;
    uint public deposit;

    function rent(
        uint _rental,
        address _landlord)
        public {
            require(msg.value == 50);
            rental = _rental;
            landlord = msg.value;
    }
}