// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherWallet {
    address payable public owner;

constructor() {
    owner =payable(msg.sender);
}
    receive() external payable {}

 mapping(address => uint) public balances;

//function to deposit ether
    function deposit(address payable _addr, uint _amount) public payable {
        balances[msg.sender] += msg.value;
       _addr.transfer(_amount);

    }

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "you are not the owner");
        payable(msg.sender).transfer(_amount);
    }

    //to check balance
    function getBalance() public view returns(uint){ 
        return address(this).balance; 
    }

}
