// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
contract Gym{
    address public gymowner;
    string public gymname;
    uint public membershipfee1month;
    uint public membershipfee6month;
    uint public feesrecieved;
    uint public totalearning;
    bool public gymclosed;
    constructor (string memory _gymname,uint _membershipfee1month,uint _membershipfee6month , uint _feesrecieved){
        gymowner=msg.sender;
        gymname=_gymname;
        membershipfee1month=_membershipfee1month;
        membershipfee6month=_membershipfee6month;
        feesrecieved=_feesrecieved;
        
    }
    modifier gymaccount{
        require(gymowner==msg.sender);
        _;
    }
    mapping(address=>uint) public accountfor1monthfees;
    mapping(address=>uint) public accountfor6monthfees;
    

    

    function feefor1month() public payable{
        require(feesrecieved>=membershipfee1month,"You are eligible for 1 month Membership Of Gym");  
        if (feesrecieved<membershipfee1month){
            revert("You are not eligible for 1 Month Membership of Gym");
        }
        accountfor1monthfees[msg.sender]+=feesrecieved;
       

    }
    function feefor6month() public payable{
         
        require(feesrecieved>=membershipfee6month,"You are eligible for 6 month Membership Of Gym");  
        if (feesrecieved<membershipfee6month){
            revert("You are not eligible for 6 Month Membership of Gym");
        }
        accountfor6monthfees[msg.sender]+=feesrecieved;
       }
    
    function totalfeesrecieved() public payable{
        totalearning =accountfor1monthfees[msg.sender]+accountfor6monthfees[msg.sender];

        gymclosed=true;
    }
    function withdraw() public gymaccount{
        require (gymclosed=true,"The Gym is Closed");
        assert(totalearning<2000);

         totalearning = 0;
         } 
}
