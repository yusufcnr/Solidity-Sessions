//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract Lottery {

address owner;
uint startTime;
uint endTime;

address [] allAddresses;

constructor() {
    owner = msg.sender;
}

function startLottery (uint lotteryPeriod) public {

    require(msg.sender == owner, "you do not have permission to start the lottery!");
    startTime = block.timestamp;
    endTime= startTime + lotteryPeriod;
}

function buyTicket() public payable {
    require(block.timestamp < endTime, "Lottery has already ended!");
    require(msg.value == 1 ether , "Tickets are sold for 1 Ether Each!" );
    allAddresses.push(msg.sender);
}

function contractBalance () public view returns(uint) {
    return address(this).balance;

}

function endLottery () public payable {
    require(msg.sender == owner, "you cannot end lottery");
    require(block.timestamp>endTime, "lottery is still on!");
    uint indexOfWinner = uint (keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)))% allAddresses.length;
    address winner = allAddresses[indexOfWinner];
    (bool sent, ) =winner.call(value: address)
    }
}
