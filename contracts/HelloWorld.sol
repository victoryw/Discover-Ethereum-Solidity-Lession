pragma solidity ^0.4.0;

contract HelloWorld {
    string myName = "Tristan";

    function getMyName() public view returns(string) {
        return myName;
    }

    function changeMyName(string _newName) public {
        myName = _newName;
    }
}