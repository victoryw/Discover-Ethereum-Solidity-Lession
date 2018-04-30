pragma solidity ^0.4.22;

contract Rent {
    address public landlord;
    uint public rental;
    uint public deposit;
    bool private forRent;

    function Rent()
        public {
            landlord = msg.sender;
            forRent = false;
    }

    event Release(address indexed _landlord, uint _rental);

    function release(
        uint _rental)
        public
        payable {
        require(msg.value == 50, "should with the deposit of 50");
        require(msg.sender == landlord, "should do by the landlord");
        rental = _rental;
        deposit = msg.value;
        forRent = true;
        Release(landlord, rental);
    }

    function getForRent() public view returns(bool) {
        return forRent;
    }
}