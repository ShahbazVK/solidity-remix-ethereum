pragma solidity ^0.7.5;
import './Ownable.sol';
import './Destroyable.sol';

contract Bank is Ownable,Destroyable{
    mapping(address=>uint) public balance;

    function addBalance() public payable{
        balance[msg.sender]+=msg.value;
        // return balance[msg.sender];
    }

    function getBalance() public view returns (uint){
        // balance[msg.sender]+=toAdd;
        return balance[msg.sender];
    }

    function totalBalance() public view returns (uint){
        return address(this).balance;
    }

    function withdraw(uint amount)public{
        require(balance[msg.sender]>=amount,"You dont have enough money in account");
        payable(msg.sender).transfer(amount);
        balance[msg.sender]-=amount;
    }

    function transfer(address recipient,uint amount) public onlyOwner{
        require(balance[msg.sender]>=amount,"You dont have enough money to send");
        require(msg.sender!=recipient,"You are sender");
        balance[msg.sender]-=amount;
        balance[recipient]+=amount;
    }
}