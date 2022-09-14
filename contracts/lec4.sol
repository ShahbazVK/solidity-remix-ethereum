pragma solidity ^0.7.5;

contract Deployer{
    function getDeployerAccount()public view returns(address){
        address account;
        return account=msg.sender;
    }
}