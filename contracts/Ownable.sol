pragma solidity ^0.7.5;
contract Ownable{
    address internal owner;
    constructor(){
        owner=msg.sender;
    }
    modifier onlyOwner{
        require(msg.sender==owner,"You are not owner");
        _;
    }
}