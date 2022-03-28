//SPDX-License-Identifier:MIT
pragma solidity^0.8.0;

contract VariableTypes {
uint public number = 222;
string public greeeting = "Hello";
uint public time = block.timestamp;
//seconds, minutes, hours, days, weeks;
//msg.sender : account calling the contract 
//msg.value : amount of you say to someone
uint public time2 = time + 1 seconds;
uint public oneEther = 1 ether;
uint public oneWei = oneWei = 1 wei;
uint public oneGwei = 1 gwei;
uint public currentBlockNumber = block.number;
mapping (address => uint) public balances;

function encode () public view returns (bytes memory) {
    return abi.encodePacked(number, greeeting);
}

function deCode() public view returns (string memory greeeting, uint number)  {
bytes memory data = encode();
(number, greeeting) = abi.decode(data, (string, uint256));

}
function deposit () public payable returns (uint) {
    return balances[msg.sender];
}

function getHash () public view returns (bytes32) {
    bytes data = keccak256(number, memory greeeting);
}

event Transfer(address indexed from, address indexed to, uint amoun) 

function transfer (address payable _to) public payable {
    (bool success, ) = _to.call(value:msg.value)("");
    require(success, "error");
    emit Transfer(msg.sender, _to, msg.value);

}
function getNumber () public view returns (uint){

return number ; //More gas used

}

function getBlockNumber () public view returns (uint) {
    return block.number;
}

function getAnotherNumber () public pure returns (uint) {
    uint anotherNumber = 100;
    return anotherNumber; // save some gas, use less gas
}

function confirmOneWei () public view returns (bool) {
    return oneEther == 1e18;
}


}
