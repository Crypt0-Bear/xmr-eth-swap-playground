# Classic Alice and Bob want to swap eth for xmr
Cross-chain atomic swap protocol between Monero and Ethereum

* 1- Alice:Create Deposit of eth into swap smart contract
* 2- Bob:Fund xmr address and key split priv Key (K) into 2 parts (aK & bK) 
* 3- Bob:Submit adaptor sig to Alice (OffChain) 
* 3- Bob:Submit hash(aK) to contract (OnChain contract interaction)
* 4- Alice:Lock withdraw address to B's + time lock with auto revert on expiry (OnChain contract interaction)
* 5- Bob: claim eth deposit in contract using aK and signing it as part of the tx (OnChain contract interaction)
* 6- Alice: calculates bK from signature and adaptor sig. Is able to spend xmr since they now have K 


*step 4 is needed to prevent front running attacks since only the withdraw address is able to withdraw. Time lock reverts funds to original funder after x amount of time. Financial incentive makes B claim deposit
To further add privacy on the eth side, funds are pooled in the smart contract allowing for an anon set to increase the more atomic swaps that happen. (similar to tornado cash)



Key advantage in this means that no zero-knowledge proofs are needed inside the smart contract as it all happens offchain. This reduces costs significantly and reduces the need for trusted key setups and complexity. The smart contract is basically a simple escrow contract which is locked for a period of time and reverts if nothing happens after x amount of time. 
The contract in a locked state can release funds by the withdrew address interacting with it and providing the Ak key shard as a claim key. The transaction that does this also contains a signature so this enables Alice to then calculate the monero priv key K from the shard received earlier (Ak) and adaptor sig + signature in tx to calculate bK. 


The contract not only time locks to allow enough time for the swap to happen, but it also locks the address. This is done to prevent the potential of a party brute forcing hashes for AK. This lowers the privacy a bit since the address is on chain in the contract but I think it isn't a big deal since it would be public when they withdrew anyways. In the future it could incorporate some zero knowledge proofs in contract but that's a later conversation. 



