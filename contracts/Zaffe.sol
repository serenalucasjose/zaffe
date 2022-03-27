// contracts/Zafe.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

// import "@openzeppelin/contracts/access/Ownable.sol";

contract Zafe {
    struct Account {
        string user;
        string password;
    }

    mapping(address => uint[]) internal users;
    Account[] internal accounts;
    mapping(uint => address) accountToUser;


    function createUser() 
        external 
    {
        users[msg.sender] = [];
        // TODO: Emit Event
    }

    function destroyUser()
        external 
    {
        delete users[msg.sender];
        // TODD: Emit Event
    }

    function createAccount(string calldata _user, string calldata _password)
        external
    {
        Account memory _account = Account(_user, _password);
        accounts.push(_account);
        uint accountId = accounts.length - 1;
        users[msg.sender].push(accountId);
    }

    function destroyAccount(uint _accountId) external {
        require(accountToUser[_accountId] == msg.sender);

        accounts.remove(_accountId);

        clearUserAccount(msg.sender, _accountId);
    }
    
    function getAccountsByUser() 
        public
        view
        returns(Account[] memory)
    {
        Account[] response = [];

        for (uint256 i = 0; i < users[msg.sender].length; i++)
        {
            response.push(accounts[users[msg.sender][i]]);  
        }

        return response;
    }

    function clearUserAccount(address _user, uint _accountId)
        internal
    {
        delete accountToUser[_accountId];

        for (uint256 i = 0; i < users[_user].length; i++) {
            if (users[_user][i] == _accountId)
            {
                users[_user].remove(i);
            }
        }
    }
}