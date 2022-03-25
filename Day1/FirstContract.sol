//SPDX-License-Identifier: MIT

pragma solidity^ 0.8.1;

contract MoodDiary {

string mood;

//function to write the mood to smart contract

function setMood(string memory _mood) public {

    mood = _mood;
}


//function to read mood from the samrt contract

function getMood() public view returns (string memory ) {

    return mood;

}

}
