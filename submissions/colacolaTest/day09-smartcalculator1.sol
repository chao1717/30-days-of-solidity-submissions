//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./day09-ScientificCalculator.sol";

contract Calculator{

    address public owner;
    address public scientificCalculatorAddress;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can do this action");
         _; 
    }

    function setScientificCalculator(address _address)public onlyOwner{
        scientificCalculatorAddress = _address;
        }

    function add(uint256 a, uint256 b)public pure returns(uint256){
       return (a+b);
    }

    function subtract(uint256 a, uint256 b)public pure returns(uint256){
         return (a-b);
    }

    function multiply(uint256 a, uint256 b)public pure returns(uint256){
        return (a*b);
    }

    function divide(uint256 a, uint256 b)public pure returns(uint256){
        require(b!= 0, "Cannot divide by zero");
        return (a/b);
    }

    function calculatePower(uint256 base, uint256 exponent)public view returns(uint256){
        ScientificCalculator scientificCalc = ScientificCalculator(scientificCalculatorAddress);
        uint256 result = scientificCalc.power(base, exponent);
        return result;
   }

    function calculateSquareRoot(uint256 number)public returns (uint256){

        bytes memory data = abi.encodeWithSignature("squareRoot(uint256)", number);
        (bool success, bytes memory returnData) = scientificCalculatorAddress.call(data);
        require(success, "External call failed");
        uint256 result = abi.decode(returnData, (uint256));
        return result;
    }  
}
