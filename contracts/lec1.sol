pragma solidity ^0.7.5;

contract Helloworld{
    string name="Shahbaz";
    function hello()public view returns(string memory){
        return name;
    }
}