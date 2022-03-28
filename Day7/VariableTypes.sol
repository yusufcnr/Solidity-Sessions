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


function encodeDecode(string memory str, uint num) public view returns (string memory, uint) {

    (str, num)= abi.decode(abi.encodePacked(str, num), (string, uint));

    return (str, num);

}

struct Person {
    string name;
    uint age;
    uint yearOfBirth;
}

enum Step {
    stepZero,
    stepOne,
    stepTwo,
    step3
}

Step steps;
Person [] public people;
mapping (address => Person) public peopleMapping;


function encode () internal view returns (bytes memory) {
    return abi.encodePacked(number, greeeting);
}


function getHash () public view returns (bytes32) {
    return keccak256(encode());
}

function deCode() public view returns (uint number, string memory greeeting)  {
bytes memory data = encode();
(number, greeeting) = abi.decode(data, (uint256,string));
}

mapping(address => uint) public balances;

function deposit () public payable {
 balances[msg.sender]+= msg.value;
}

event Transfer(address indexed from, address indexed to, uint amount); 

function transfer (address payable _to) public payable {
    (bool success, ) = _to.call{value: msg.value}("");
    require(success, "Cannot send ehter!");
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
