pragma solidity ^0.7.5;

contract Wallet{
    address[] public owners;
    uint limit;

    constructor (address[] memory _owners, uint _limit){
        owners=_owners;
        limit=_limit;
    }
    modifier onlyOwners() {
        bool owner =false;
        for (uint i=0;i<owners.length;i++){
            if (owners[i]==msg.sender){
                owner=true;
            }
        }
        require(owner==true);
        _;
    }
    function deposit() public payable{}

    struct Transfer{
        uint amount;
        address payable receiver;
        uint approval;
        bool hasBeenSent;
        uint id;
    }

    Transfer[] transferRequests;

    function createTransfer(uint _amount, address payable _receiver) public onlyOwners{
        transferRequests.push(Transfer(_amount,_receiver,0,false,transferRequests.length));
    }
}