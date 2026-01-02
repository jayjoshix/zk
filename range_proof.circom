pragma circom 2.0.0;

include "comparators.circom";

template RangeProof() {
    signal input value;  // Private: the number to prove is in range
    signal input min;    // Public: minimum value
    signal input max;    // Public: maximum value

    // Constrain that min <= value <= max
    component geMin = LessThan(32);  // value >= min if LessThan(value, min) == 0
    geMin.in[0] <== value;
    geMin.in[1] <== min;
    geMin.out === 0;

    component leMax = LessThan(32);  // value <= max if LessThan(max, value) == 0
    leMax.in[0] <== max;
    leMax.in[1] <== value;
    leMax.out === 0;
}

component main {public [min, max]} = RangeProof();