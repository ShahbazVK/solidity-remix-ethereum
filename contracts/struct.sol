pragma solidity ^0.7.5;

contract Struct{
    Player[] public players;
    struct Player{
        string firstname;
        string lastname;
        uint age;
    }
    function addPlayer(string memory firstname, string memory lastname, uint age) public{
        players.push(Player(firstname,lastname,age));
    }
}