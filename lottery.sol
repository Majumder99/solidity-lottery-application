// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lottery{
    address public manager;
    address payable[] public participants;

    constructor(){
        //give authority to managerf
        //creates the manager
        manager = msg.sender;
    }

    //if anyone transact ether he/she will automatically added in participant list
    receive() external payable{
        require(msg.value == 1 ether); 
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        require(msg.sender == manager );
        return address(this).balance;
    }
    function random() public view returns(uint){
        //generates random number
        //you can encode with one string also
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants.length)));
    }
}