import { ethers } from "hardhat";

async function main() {
    const ZombieFactory = await ethers.getContractFactory("Zombie");
    const zombie = await ZombieFactory.deploy();
    await zombie.deployed();
    console.log(`Deployed contract to: ${zombie.address}`);
}

// Account #0: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 (10000 ETH)
// Private Key: 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

main()
.then(() => process.exit(0))
.catch((error) => {
    console.error(error);
    process.exit(1);
})