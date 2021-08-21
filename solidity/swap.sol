pragma solidity ^0.6.0;




import "OpenZeppelin/openzeppelin-contracts@3.0.0/contracts/math/SafeMath.sol";
import "OpenZeppelin/openzeppelin-contracts@3.0.0/contracts/utils/Counters.sol";

/**
 A smart contract for ethereum-monero atomic swaps
 This is a proof of concept in the works and should not be used in production
 Security has been ignored and needs to be properly secured to prevent common bugs.

 DO NOT USE IN PRODUCTION, COULD LEAD TO LOSS OF FUNDS.



 **/



contract Swap{

  using SafeMath for uint256;
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  address public  alice;
  address public  bob;
  bool public locked;
  string public aK;
  string public hashed_aK;
  uint public lockTime;
  uint public startBlock;
  uint public deposit;




  constructor(
    uint public _timeToLock
    )
    public {
      alice = msg.sender
      startBlock = block.number
      lockTime = _timeToLock
      deposit = msg.value
    }

function lockContract(string hashed_aK,) public returns (bool){
  bob = msg.sender
  hashed_aK = hashed_aK;
  locked = true;
  return true;
}

function withdraw(string _aK) public returns(bool){
  require (locked == true);
//todo keep goiing zzzzzzz




}


}
