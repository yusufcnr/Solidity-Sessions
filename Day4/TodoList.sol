//SPDX-License-Identifier:MIT
pragma solidity^0.8.4;


//msg.sender and delete keyword

contract Todos {

    mapping (address => string[]) public todos;

    function addTodo (string memory itemtodo) public {

        todos[msg.sender].push(itemtodo);
    } 



function getTodos () public view returns (string[] memory){
    return todos[msg.sender];


}

function getTodoLength() public view returns (uint) {
    return todos[msg.sender].length;
}

function deleteTodo(uint _index) public {

require(_index < todos[msg.sender].length, "error" );
todos[msg.sender][_index] = todos[msg.sender][getTodoLength()-1];
todos[msg.sender].pop();

}

}

contract ExtraTopics { //topics to know for todo list app

    uint public number = 25;
    string public message = "Hello";
    bool public isPaused = true;
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function getMsgSender () public view returns (address) {
        return msg.sender;

    }

    function reset() public {

        delete number;
        delete message;
        delete isPaused;
        delete myAddress; 
    }
}

