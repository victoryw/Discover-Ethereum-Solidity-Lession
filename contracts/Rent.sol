pragma solidity 0.4.23;


contract Rent {
    address public landlord;
    uint private rental;
    uint public deposit;
    bool private forRent;

    function Rent()
        public {
            landlord = msg.sender;
            forRent = false;
        }

    event ReleaseEvent(address indexed _landlord, uint _rental);

    function release(
        uint _rental)
        public
        payable {
            require(msg.value == 50, "should with the deposit of 50");
            require(msg.sender == landlord, "should do by the landlord");
            rental = _rental;
            deposit = msg.value;
            forRent = true;
            ReleaseEvent(landlord, rental);
        }

    function getForRent() public view returns(bool) {
        return forRent;
    }

    function getRental() public view returns(uint) {
        return rental;
    }
}