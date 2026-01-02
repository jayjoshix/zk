pragma circom 2.0.0;

include "poseidon.circom";

template HashVerifier() {
    signal input preimage;  // Private: the secret preimage
    signal input hash;      // Public: the expected hash

    // Compute Poseidon hash of preimage
    component poseidon = Poseidon(1);
    poseidon.inputs[0] <== preimage;

    // Constrain that computed hash equals input hash
    poseidon.out === hash;
}

component main {public [hash]} = HashVerifier();