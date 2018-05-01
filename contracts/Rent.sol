pragma solidity 0.4.23;


contract Rent {
    address public landlord;
    uint private rental;
    uint public deposit;
    bool private forRent;
    address private renter;
    mapping (address => uint) private balances;

    function Rent()
        public {
            landlord = msg.sender;
            forRent = false;
        }

    event ReleaseEvent(address indexed _landlord, uint _rental);
    event RentEvent(address indexed _renter);

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

    function rent()
        public
        payable {
            require(msg.value == rental, "should the pay equal to the required rental of landlord");
            balances[msg.sender] = msg.value;
            forRent = false;
            renter = msg.sender;
            RentEvent(renter);
        }

    function getForRent() public view returns(bool) {
        return forRent;
    }

    function getRental() public view returns(uint) {
        return rental;
    }

    function getRenter() public view returns(address) {
        return renter;
    }

    function getLandlord() public view returns(address) {
        return landlord;
    }
}