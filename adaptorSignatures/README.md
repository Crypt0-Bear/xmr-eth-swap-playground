# Adaptor Signatures

I am not an experienced cryptographer and don't have any background in rust. I am heavily relying on existing libraries and reference material to implement a proof of concept.

### References for adaptor signatures
https://www.monerooutreach.org/stories/monero-atomic-swaps.html

https://medium.com/crypto-garage/adaptor-signature-schnorr-signature-and-ecdsa-da0663c2adc4

https://www.youtube.com/watch?v=Jj8rd4WOEy0

https://comit.network/blog/2020/10/06/monero-bitcoin/

Looks like we could use this library for the cross curve proof between xmr and eth
https://github.com/LLFourn/secp256kfun/blob/master/sigma_fun/src/ext/dl_secp256k1_ed25519_eq.rs


### Rust

ecdsa library with a adaptor signature module

https://docs.rs/ecdsa_fun/0.6.2/ecdsa_fun/


The COMMIT network's implementations and supporting libraries are built in rust. They can be found in the following location:

https://github.com/comit-network/xmr-btc-swap

Older implementation based on the draft proposal :
https://github.com/h4sh3d/monero-swap-lib


### Python
I found one implementation of adaptor signatures in python. I need to test the library and see if it works for a proof of concept.
https://github.com/LeoComandini/adaptor-py
