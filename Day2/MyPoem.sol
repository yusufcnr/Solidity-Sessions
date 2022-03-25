//SPDX-License-Identifier:MIT
pragma solidity^0.8.4;

contract MyPoem {

string poem = "I will look at this code and see what five 5 years later :)";
string poet = "Yusuf Cinar";

function getDetails() public view returns(string memory, string memory) {

    return (poem, poet);
}

}
