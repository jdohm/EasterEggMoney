// SPDX-License-Identifier: MIT
pragma solidity 0.8.3;

contract EasterEggMoney{
    bytes32 passHash;
    uint public findersCount = 0;
    
    constructor(string memory _passphrase) payable {
        passHash = keccak256(bytes(_passphrase));
    }
    
    //function to add new funds to EasterEggMoney pool for new finders to be rewarded
    function topup() public payable {}
    //function to recieve funds send to adress of contract
    receive() payable external {}
    
    //function which takes adress and passphrase, sends all available funds to the given adress if passphrase matches
    function find(address payable _address, string memory _passphrase) public returns(uint findersNR, uint balance) {
        if(keccak256(bytes(_passphrase)) == passHash){
        findersCount ++;
        //attach 
        
        // if(funds-fees > 0 && adress == valid??) send available funds to adress
        _address.transfer(address(this).balance);
        }
        return (findersCount, address(this).balance);
    }
    
    //function which takes only a passphrase, sends all available funds to the sender if passphrase matches
    function find(string memory _passphrase) public returns(uint findersNR, uint balance) {
        if(keccak256(bytes(_passphrase)) == passHash){
        findersCount ++;
        //attach 
        
        // if(funds-fees > 0 && adress == valid??) send available funds to adress
        //address payable addrSender = address(msg.sender);
        payable(msg.sender).transfer(address(this).balance);
        }
        return (findersCount, address(this).balance);
    }
}