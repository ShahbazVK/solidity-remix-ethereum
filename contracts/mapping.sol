pragma solidity ^0.7.5;

contract Mapping{
    mapping(address=>int) public testMapping;
    function getInfo(address account,int balance) public{
        testMapping[account]=balance;
    }
}