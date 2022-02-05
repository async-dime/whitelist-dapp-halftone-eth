const { ethers } = require('hardhat');

const main = async () => {
  const whitelistContract = await ethers.getContractFactory('Whitelist');

  // deploy the contract with a maximum of 10 whitelist addresses allowed
  const deployedWhitelistContract = await whitelistContract.deploy(20);

  await deployedWhitelistContract.deployed();

  // get the address of the deployed contract
  const whitelistAddress = deployedWhitelistContract.address;
  console.log(`Whitelist contract address: ${whitelistAddress}`);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (err) {
    console.error('Error deploying a whitelisted contract address', err);
    process.exit(1);
  }
};

runMain();
