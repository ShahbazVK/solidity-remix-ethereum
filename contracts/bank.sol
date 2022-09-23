pragma solidity ^0.7.5;
import './Ownable.sol';
import './Destroyable.sol';

interface GovernmentInterface{
    function addTransaction(address _from, address _to, uint _amount) external;
}

contract Bank is Ownable,Destroyable{

    GovernmentInterface governmentInstance=GovernmentInterface(0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3);


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

    function getOwner() public view returns (address){
        return owner;
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

        governmentInstance.addTransaction(msg.sender,recipient,amount);
    }
}