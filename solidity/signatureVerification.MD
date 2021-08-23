# Verifying signatures on chain in solidity 


     /* 4. Verify signature
    signer = 0xB273216C05A8c0D4F0a4Dd0d7Bae1D2EfFE636dd
    to = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C
    amount = 123
    message = "coffee and donuts"
    nonce = 1
    signature =
        0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b
    */
    function verify(
        address _signer,
        address _to,
        uint _amount,
        string memory _message,
        uint _nonce,
        bytes memory signature
    ) public pure returns (bool) {
        bytes32 messageHash = getMessageHash(_to, _amount, _message, _nonce);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recoverSigner(ethSignedMessageHash, signature) == _signer;
    }





#### Sources :
*https://ethereum.stackexchange.com/questions/49063/check-message-signature-in-solidity?rq=1*

    Yes, notably, Solidity includes a function ecrecover that can recover the account that signed a message.
   
 How to verify offchain signed messages on chain inside of solidy 
https://solidity-by-example.org/signature/
https://programtheblockchain.com/posts/2018/02/17/signing-and-verifying-messages-in-ethereum/.


