// contracts/Zafe.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/access/Ownable.sol";

contract Zafe {
    struct ServiceAccount { 
        string user;
        string password;
    }

    struct User {
        bool initialized;
        mapping(string => ServiceAccount) services;
    }

    mapping(address => User) internal _users;


    function createUser() external {
        User storage _user = _users[msg.sender];

        //require(_user.initialized == false, "El usuario ya tiene una cuenta.");

        // User memory newUser = User(true, mapping(
        //     "facebook": 0
        // ));
        // _users[msg.sender] = newUser;
    } 
}
