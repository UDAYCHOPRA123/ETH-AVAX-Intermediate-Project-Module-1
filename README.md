# ETH+AVAX Intermidiate Course Project 1 Solution 
## Showing `require`, `revert` and `assert` functions of Solidity
This solidity program shows a Gym contract that demonstrates the use of 'require', 'revert' and 'assert' functions. This Contract checks that the user is eligible for 1 month of membership of gym or 6 months of membership or for both or for neither of them based on the fees recieved from the customer.

## Description
The  `Gym` contract includes the following functionalities:
1. Public variables to store information of gym which includes gymowner, gymname, membershipfee1month, membershipfee6month, feesrecieved, totalearning, gymclosed.
2. A constructor in which parameters are passed which are used to take input from the user and used to execute the program.
3. A modifier with the condition that gym owner will equal to msg.sender.
4. Two mapping variables in which address is associated with uint which are named as accountfor1monthfees and accountfor6monthfees respectively.
5. A feefor1month() function which is of payable type which is used to check that the fees recieved from the customer is greater or equal to the membership fee for 1 month. If Yes, then the fees recieved will added to the account of 1 month membership fee. Otherwise it will display the message that You are not eligible for 1 month membership of Gym.
6. A feefor6month() payable function which is same as that of feefor1month() funuction which is used to check that the fees recieved from the customer is greater or equal to the membership fee for 6 months. If Yes, then the fees recieved will added to the account of 6 month membership fee. Otherwise it will display the message that You are not eligible for 6 month membership of Gym.
7. A totalfeesrecieved() functon in which total amount of both the accounts that are accountfor1monthfees and accountfor6monthfees are added and are placed in a single variable named totalearning.
8. A withdraw() function which is withdraw all the earning of day. If our earning is less than 1000 then our earning will Zero.
   
## Getting Started
### Executing program
1. We can use remix- an online solidity compiler to run this Program at [remix](https://remix.ethereum.org/#lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.25+commit.b61c2a91.js)
2. Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension.
3. Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
contract Gym{
    address public gymowner;
    string public gymname;
    uint public membershipfee1month;
    uint public membershipfee6month;
    uint public feesrecieved;
    uint public totalearning;
    bool public gymclosed=false;
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
        require(feesrecieved>=membershipfee1month,"You are not eligible for 1 month Membership Of Gym");  
        if (feesrecieved<membershipfee1month){
            revert();
        }
        accountfor1monthfees[msg.sender]+=feesrecieved;
       

    }
    function feefor6month() public payable{
         
        require(feesrecieved>=membershipfee6month,"You are not eligible for 6 month Membership Of Gym");  
        if (feesrecieved<membershipfee6month){
            revert();
        }
        accountfor6monthfees[msg.sender]+=feesrecieved;
       }
    
    function totalfeesrecieved() public payable{
        require(!gymclosed, "Gym is already closed.");
        totalearning =accountfor1monthfees[msg.sender]+accountfor6monthfees[msg.sender];
        gymclosed=true;
    }
    function withdraw() public  gymaccount{
        require (gymclosed==true,"The Gym is Still Open");
        assert(totalearning<1000);

         totalearning = 0;
        } 
}
```
4. To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.25" (or another compatible version), and then click on the "Compile Gym.sol" button.
5. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the `Gym` contract from the dropdown menu, and then click on the "Deploy" button.
6. Once the contract is deployed, you can interact with it by calling all the functions. Use the interface provided by Remix to input the necessary parameters and execute the functions.

## Help
1. The Solidity compiler version is set correctly.
2. Check your Address Correctly.
## Authors
Metcrafter Uday Chopra


## License

This project is licensed under the MIT License.
