pragma solidity ^0.6.0;
/*
__  __
|  \/  |
| \  / | ___  _ __   ___ _ __ ___
| |\/| |/ _ \| '_ \ / _ \ '__/ _ \
| |  | | (_) | | | |  __/ | | (_) |
|_|__|_|\___/|_| |_|\___|_|  \___/
|  ____| | | |
| |__  | |_| |__   ___ _ __ ___ _   _ _ __ ___
|  __| | __| '_ \ / _ \ '__/ _ \ | | | '_ ` _ \
| |____| |_| | | |  __/ | |  __/ |_| | | | | | |
|______|\__|_| |_|\___|_|  \___|\__,_|_|_|_| |_|
   /\  | |                (_)       / ____|
  /  \ | |_ ___  _ __ ___  _  ___  | (_____      ____ _ _ __
 / /\ \| __/ _ \| '_ ` _ \| |/ __|  \___ \ \ /\ / / _` | '_ \
/ ____ \ || (_) | | | | | | | (__   ____) \ V  V / (_| | |_) |
/_/    \_\__\___/|_| |_| |_|_|\___| |_____/ \_/\_/ \__,_| .__/
                                                       | |
                                                       |_|

https://github.com/Crypt0-Bear/xmr-eth-swap-playground
https://twitter.com/Crypt0_Bear

*/

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
  Counters.Counter private _swapId;

  address public  alice;
  address public  bob;
  bool public locked;
  string public aK;
  //Eventually need to move this to a struct for knowing what hash function was used etc
  string public hashed_aK;
  uint public lockTime;
  uint public startBlock;
  uint public depositBalance;
  event Receive(uint value);
  event Withdraw(string _correct_aK);




  constructor(
    uint public _timeToLock
    )
    public {
      alice = msg.sender
      startBlock = block.number
      lockTime = _timeToLock
      deposit = msg.value
    }

function () payable {
  Receive(msg.value);
  depositBalance += msg.value;
}


function lockContract(string hashed_aK,) public returns (bool){
  bob = msg.sender
  hashed_aK = hashed_aK;
  locked = true;
  return true;
}

//this is interacted by Bob to withdraw his ether from the contract.
/**
TODOs:
Need to make sure that the eth transaction which interacts with this function is
signing the value of aK when submitted. If not I must also include the signatre of aK as part of the
input for the function

**/
function withdraw(string _aK) public returns(bool){
  require (locked == true);
  require ( sha256(string(_ak)) == hashed_aK);
  ak = string(_ak);
  //send eth to the withdrawer
  bob.send(depositBalance);
  //emit event and make it easier for alice to track value of the contract
  emit Withdraw(ak);


}


}
