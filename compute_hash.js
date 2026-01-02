const { buildPoseidon } = require('circomlibjs');

async function main() {
    const poseidon = await buildPoseidon();
    const preimage = 42;
    const hash = poseidon([preimage]);
    console.log('Preimage:', preimage);
    console.log('Hash (decimal):', hash.toString());
    console.log('Hash (hex):', '0x' + hash.toString(16));
}

main();