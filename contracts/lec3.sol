pragma solidity ^0.7.5;

contract Counter{
    uint public count=0;
    function increment()public{
        count+=1;
    }
    function decrement()public{
        count-=1;
    }
}