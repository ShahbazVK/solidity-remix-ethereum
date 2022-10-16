pragma solidity ^0.7.5;

contract CrowdFunding{
    mapping(address=>uint) contributors;
    mapping(address=>uint) allRequests;
    mapping(address=>uint) allRequestsProceedings;


    function fundingRequest(uint targetAmount) public {
        allRequests[msg.sender]=targetAmount;
        allRequestsProceedings[msg.sender]=targetAmount;
    }
    function addBalance(address recipient) public payable {
        require(allRequestsProceedings[recipient]>=msg.value,"This much amount not left to fulfil");
        contributors[recipient]+=msg.value;
        allRequestsProceedings[recipient]-=msg.value;
    }
    function getBalance() public view returns(uint) {
        return contributors[msg.sender];
    }
    function getRemainingTarget() public view returns(uint) {
        return allRequestsProceedings[msg.sender];
    }
    function getContribution() public view returns(uint) {
        return contributors[msg.sender];
    }
}